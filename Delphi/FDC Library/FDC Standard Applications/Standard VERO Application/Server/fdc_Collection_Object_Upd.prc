create or replace procedure fdc_Collection_Object_Upd
-- Изменение атрибутов объекта в подборке
	(
  pID  number,                                 -- Идентификатор объекта в подборке      
	pRoleName	varchar2,                          -- Роль объекта в подборке
	pDescript	varchar2                           -- Комментарий к объекту в подборке
	)
is
  pCollectionObject fdc_Collection_Object%rowtype;
begin
    -- Получение старого значения
  begin
    select *
    into pCollectionObject
    from fdc_Collection_Object
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найден объект в подборке ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения объекта в подборке ID='||pID, 1);
  end;

  -- Проверка возможности внесения изменений в подборку
  if Fdc_Object_Is_Updatable(pCollectionObject.Collection_ID, 0) = 0 then
    fdc_Util.Abort('Нет прав на изменение подборки, либо ее состояние не допускает изменений');
  end if;

  -- Изменение записи fdc_Collection_Object
  if nvl(pRoleName, 'No name') <> nvl(pCollectionObject.RoleName, 'No name') or
     nvl(pDescript, 'No name') <> nvl(pCollectionObject.Descript, 'No name') then
    update	fdc_Collection_Object
    set	RoleName = pRoleName,
    	Descript = pDescript
    where	ID = pID;
  end if;  
  
end fdc_Collection_Object_Upd;
/
