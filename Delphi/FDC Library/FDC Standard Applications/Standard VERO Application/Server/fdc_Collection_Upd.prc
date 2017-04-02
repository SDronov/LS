create or replace procedure fdc_Collection_Upd
-- Изменение атрибутов подборки
	(
	pID 		number,                               -- Идентификатор подборки
	pName 		varchar2,                           -- Наименование подборки
  pShortName    varchar2,                       -- Краткое наименование подборки
	pUser_ID	number,                             -- Пользователь - владелец подборки
	pDescript	varchar2,                           -- Комментарий к подборке
	pDefCollection	number                        -- Является ли текущей рабочей подборкой
	)
is
  pCollection fdc_Collection%rowtype;
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Collection') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является подборкой');
  end if;

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- Получение старого значения
  begin
    select *
    into pCollection
    from fdc_Collection
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найдена подборка ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений подборки ID='||pID, 1);
  end;

  -- Изменение атрибутов записи fdc_Collection
  if Nvl(pUser_ID, -1) <> Nvl(pCollection.User_ID, -1) or
     Nvl(pDefCollection, -1) <> Nvl(pCollection.DefCollection, -1) then

    -- Если подборка становится рабочей, нужно убрать этот признак с других подборок 
    if pDefCollection = 1 and pCollection.DefCollection = 0 then
    	update	fdc_Collection
    	set	DefCollection = 0
    	where	User_ID = pUser_ID and
            DefCollection = 1;
    end if;
    
    -- Если изменился хозяин подборки, нужно дать новому хозяину права
    if Nvl(pUser_ID, -1) <> Nvl(pCollection.User_ID, -1) then
      fdc_Object_Grant_Upd(pID, pUser_ID, 3, 1);
    end if;  
     
    -- Собственно изменение записи в fdc_Collection 
    update	fdc_Collection
    set	User_ID =	pUser_ID,
    	  DefCollection = pDefCollection
    where	ID = pID;
  end if;   

end fdc_Collection_Upd;
/
