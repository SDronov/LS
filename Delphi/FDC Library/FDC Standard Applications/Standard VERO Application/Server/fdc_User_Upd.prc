create or replace procedure fdc_User_Upd
-- Изменение пользователя VERO
	(
	  pID	number,                    -- идентификатор пользователя
	  pLastName	varchar2,            -- фамилия
	  pFirstName varchar2,           -- имя
	  pMiddleName	varchar2,          -- отчество
    pShortName varchar2,           -- короткое название
    pDescript varchar2             -- описание
	)
is
begin
  -- Вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID,trim(pLastName||' '||pFirstName||' '||pMiddleName), pShortName, pDescript);
  
  -- Изменение данных 
  update fdc_User
     set LastName = pLastName,
	       FirstName = pFirstName,
	       MiddleName = pMiddleName
   where ID = pID;
end fdc_User_Upd;
/
