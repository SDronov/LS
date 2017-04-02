create or replace procedure fdc_Object_Merge
-- Слияние экземпляров объектов
-- !! Базовая процедура, непосредственно не вызывается
-- !! вызывается только из процедур слияния соответствующих типов
-- !! в самом конце, ПОСЛЕ всех специфичных для типа обработчиков
-- Присоединяемый объект соединяется (сливается) с целевым
-- Идентификатор объекта, получившегося в результате, 
-- равен идентификатору целевого объекта
-- Экземпляр присоединяемого объекта удаляется
-- в ЭТОЙ процедуре через fdc_Object_Free
	(
	pID	number,               -- Идентификатор целевого объекта
	pSrcID	number            -- Идентификатор присоединяемого объекта
	)
is
  pDst	fdc_Object_Lst%rowtype;
  pSrc	fdc_Object_Lst%rowtype;
  pChk number;
  pEvent_ID number;
  pChkCollectionObject fdc_Collection_Object%rowtype;
  pCollectionObjectDescript varchar2(1500);
begin
  -- Получение целевого объекта
  begin
  select	*
  into	pDst
  from	fdc_Object_Lst
  where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('При слиянии не определен целевой объект по ID = '||pID);
  	when others then fdc_util.Abort('При слиянии ошибка определения целевого объекта по ID = '||pID, 1);
  end;
  
  -- Получение присоединяемого объекта
  begin
  select	*
  into	pSrc
  from	fdc_Object_Lst
  where	ID = pSrcID;
  exception
	  when NO_DATA_FOUND then fdc_Util.Abort('При слиянии не определен присоединяемый объект по ID = '||pID);
  	when others then fdc_util.Abort('При слиянии ошибка определения присоединяемого объекта по ID = '||pID, 1);
  end;
  
  -- Проверка соответствия типов
  if pSrc.Typesysname<>pDst.Typesysname then
    fdc_util.Abort('При слиянии различаются типы объектов');
  end if;
  
  -- Проверка возможности изменения целевого объекта
  begin
    pChk := Fdc_Object_Is_Updatable(pId, 1);
  exception  
    when others then
      fdc_util.Abort('При слиянии нет прав на изменение целевого объекта', 1);
  end;
  
  -- Проверка возможности изменения присоединяемого объекта
  begin
    pChk := Fdc_Object_Is_Updatable(pSrcId, 1);
  exception  
    when others then
      fdc_util.Abort('При слиянии нет прав на изменение присоединяемого объекта', 1);
  end;

  -- Далее по порядку (алфавитному) внешних ключей перестегиваем их на целевой объект
  
  -- Вхождение в подборки  
  for rec in (
    select CO.*
    from fdc_Collection_Object CO
    where Object_ID = pSrcID) loop
    -- Проверяем, есть ли целевой объект в той же подборке с той же ролью
    begin
      select CO.*
      into pChkCollectionObject
      from fdc_Collection_Object CO
      where CO.Object_ID = pID and
            CO.Collection_ID = rec.Collection_ID and
            ((trim(rec.ROLENAME) is null and trim(CO.rolename) is null) or
             (upper(trim(CO.ROLENAME)) = upper(trim(rec.rolename))));
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.Abort('Ошибка получения вхождений объекта ID='||pID||' в подборку ID='||rec.Collection_ID, 1);
    end;
    if pChkCollectionObject.Object_ID is not null then
      -- Целевой объект в подборке найден
      -- Если у присоединяемого объекта в той же подборке был комментарий, 
      -- нужно его подлить к целевому
      if trim(rec.Descript) is not null then
        if trim(pChkCollectionObject.Descript) is null then
          pCollectionObjectDescript := rec.Descript;
        else
          pCollectionObjectDescript := trim(pChkCollectionObject.Descript) || chr(10) ||
                                       '+ автоматически присоединено при слиянии объектов:' || chr(10) ||
                                       rec.Descript;
        end if;
        update Fdc_Collection_Object
        set Descript = pCollectionObjectDescript
        where	ID = pChkCollectionObject.ID;
      end if;
      -- И теперь удаление исходного объекта
      delete from Fdc_Collection_Object
      where ID = rec.ID;
    else 
      -- Целевой объект в подборке не найден
      -- Просто изменяем объект в подборке с присоединяемого на целевой
      update	fdc_Collection_Object
      set	Object_ID = pID
      where	ID = rec.ID;
    end if;
  end loop;  
    
  
  -- Мероприятия
  update fdc_Followup
  set	Object_ID = pID
  where	Object_ID = pSrcID;
  
  -- Перевод всех принадлежащих объектов на нового хозяина
  update fdc_Object O
  set O.OWNER_OBJECT_ID = pID
  where O.Owner_Object_Id = pSrcID;
  
  -- Перевод оснований пометок
  update Fdc_Object_Kind
  set Evidence_ID = pID
  where Evidence_ID = pSrcID;
  
  -- Перевод связок
  update Fdc_Object_Relation
  set Object_ID = pID
  where	Object_ID = pSrcID;

  update Fdc_Object_Relation
  set Rel_Object_ID = pID
  where	Rel_Object_ID = pSrcID;
  
  -- Перевод подписок
  update fdc_subscription S
  set S.OBJECT_ID = pID
  where S.Object_Id = pSrcID;
  
  update fdc_subscription S
  set S.Evidence_Id = pID
  where S.Evidence_Id = pSrcID;
    
  -- Перевод прав пользователей
  update	fdc_User_Grant
  set	Object_ID = pID
  where	Object_ID = pSrcID;
  
  -- Перевод прав групп
  update	fdc_User_Group_Grant
  set	Object_ID = pID
  where	Object_ID = pSrcID;

  -- Перевод всех ссылок на целевого субъекта
  update	fdc_Value
  set	Ref_Object_ID = pID
  where	Ref_Object_ID = pSrcID;
  
  -- Перевод всех событий
  update	fdc_Event
  set	Object_ID = pID
  where	Object_ID = pSrcID;
    
  -- Может быть пригодится комментарий с присоединяемого объекта?
  if pDst.Descript is null and pSrc.Descript is not null then
  	update	fdc_Object
  	set	Descript = pSrc.Descript
  	where	ID = pID;
  end if;
  
  -- Отписать событие слияния
  pEvent_ID := fdc_Event_Add('EventMerge', 
               Fdc_Object_Get_Name(pSrcID, 1, 1)||' (ID='||pSrcID||')'||
               ' присоединен к '||
               Fdc_Object_Get_Name(pID, 1, 1)||' (ID='||pID||')',
               pID);
  
  -- Удалить экземпляр присоединяемого объекта
  fdc_Object_Free(pSrcID, 0);
  
end fdc_Object_Merge;
/
