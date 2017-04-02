create or replace function fdc_User_Add
-- Регистрация нового пользователя системы в VERO
-- Возвращает его идентификатор
	(
	  pObject_Type_SysName	varchar2,    -- системное имя объектного типа пользователя
  	pLogin		varchar2,                -- его логин
	  pLastName	varchar2,                -- фамилия
	  pFirstName	varchar2,              -- имя
	  pMiddleName	varchar2,              -- отчество
    pShortName varchar2 := null,       -- короткое название 
    pDescript varchar2 := null         -- комментарий 
	)
    return number
is
  pNewID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'User'
  fdc_Object_Type_Is(pObject_Type_SysName, 'User');   

  -- Создаем объект пользователя
  pNewID := fdc_Object_Add(pObject_Type_SysName, trim(pLastName||' '||pFirstName||' '||pMiddleName), 1,
                     null, null, pShortName, pDescript);
  
  -- Даем специальный полный доступ администраторам задач к новому пользователю
  fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);

  -- Заносим запись в таблицу fdc_User
  insert into fdc_User(ID, Login, LastName, FirstName, MiddleName, AllowGrantOption)
      values(pNewID, upper(pLogin), pLastName, pFirstName, pMiddleName, 0);

  -- Возвращаем идентификатор нового пользователя    
  return pNewID;
end fdc_User_Add;
/
