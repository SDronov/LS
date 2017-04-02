create or replace function fdc_User_Group_Add
-- Регистрация новой группы пользователей системы в VERO
-- Возвращает ее идентификатор
	(
	  pObject_Type_SysName varchar2,   -- системное имя объектного типа группы пользователей
    pName	varchar2,                  -- название группы
	  pSysName varchar2,               -- системное имя
    pShortName varchar2 := null,     -- короткое название
	  pDescript varchar2 := null       -- описание 
	)
    return number
is
  pNewID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'UserGroup'
  fdc_Object_Type_Is(pObject_Type_SysName,'UserGroup');

  -- Создаем объект группы пользователей
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);

  -- Если создаем группу администраторов задач, то Ok 
  -- Иначе даем специальный полный доступ администраторам задач к новой группе
  if (pSysName <> 'AdminTask') then
     fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);
  end if;   

  -- Заносим запись в таблицу fdc_User_Group
  insert into fdc_User_Group(ID)
       values(pNewID);

  -- Возвращаем идентификатор новой группы пользователей    
  return pNewID;
end fdc_User_Group_Add;
/
