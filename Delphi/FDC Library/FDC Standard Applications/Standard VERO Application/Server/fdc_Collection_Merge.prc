create or replace procedure fdc_Collection_Merge
-- Слияние подборок
-- Смысл слияния заключается во включении всех объектов исходной подборки в целевую,
-- а исходная удаляется
-- Атрибуты целевой подборки не модифицируются
	(
	pID	number,                        -- Идентификатор целевой подборки
	pSrcID	number,                    -- Идентификатор присоединяемой подборки
  pRoleName	varchar2 := null         -- Роль объекта в подборке
	)
is
  pChkCollectionObject fdc_Collection_Object%rowtype;
  pCollectionObjectDescript varchar2(1500);
begin
  -- Проверка типов
  if Fdc_Object_Is(pID, 'Collection') = 0 or Fdc_Object_Is(pSrcID, 'Collection') = 0 then
    fdc_Util.Abort('Неверные типы объектов при слиянии подборок pID='||pID||', pSrcID='||pSrcID);
  end if;
  
  -- Перенос объектов из исходной подборки в целевую
  for rec in (
    select CO.*
    from fdc_Collection_Object CO
    where Collection_ID = pSrcID) loop
    -- Проверяем, есть ли в целевой подборке тот же объект, что и в исходной и с той же ролью
    begin
      select CO.*
      into pChkCollectionObject
      from fdc_Collection_Object CO
      where CO.Object_ID = rec.Object_ID and
            CO.Collection_ID = pID and
            ((trim(pRoleName) is null and trim(CO.rolename) is null) or
             (upper(trim(CO.ROLENAME)) = upper(trim(pRoleName))));
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.Abort('Ошибка получения вхождений объекта ID='||rec.Object_ID||' в подборку ID='||pID, 1);
    end;
    if pChkCollectionObject.Object_ID is not null then
      -- Объект в целевой подборке найден
      -- Если в исходной подборке у объекта был комментарий, 
      -- нужно его подлить к вхождению в целевую подборку
      if trim(rec.Descript) is not null then
        if trim(pChkCollectionObject.Descript) is null then
          pCollectionObjectDescript := rec.Descript;
        else
          pCollectionObjectDescript := trim(pChkCollectionObject.Descript) || chr(10) ||
                                       '+ автоматически присоединено при слиянии подборок:' || chr(10) ||
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
      -- Объект в целевой подборке не найден
      -- Просто переносим объект из присоединяемой подборки в целевую
      update	fdc_Collection_Object
         set	Collection_ID = pID,
              RoleName = pRoleName
      where	ID = rec.ID;
    end if;
  end loop;  
  
  -- Вызов базовой процедуры слияния 
  fdc_Object_Merge(pID, pSrcID);

end fdc_Collection_Merge;
/
