create or replace procedure fdc_User_Group_Grant_Del
-- Отнимает права у группы пользователей на заданный объект
	(
	pUser_Group_ID number,           -- Идентификатор группы, у которой снимаются права
	pObject_ID	number,              -- Идентификатор объекта, на который снимаются права
	pDoNotCheck 	number := 0        -- не равно 0 - не проверять полномочия текущего пользователя на снятие прав на заданный объект
                                   -- 0 - проверять полномочия текущего пользователя (по умолчанию)
	)
is
  pChk1 number := 0;
  pEventID number;
begin
  -- Проверка полномочий текущего пользователя
  if (pDoNotCheck = 0) then
  	pChk1 := fdc_Object_Check_Access_Level(pObject_ID, 3, 1);
  end if;
  
  -- Закрываем доступ
  delete from fdc_User_Group_Grant
    where	User_Group_ID = pUser_Group_ID and
          Object_ID = pObject_ID;
          
  -- Создаем соответствующее событие
  pEventID := fdc_Event_Add('EventAccessUpd',
          'Закрыт специальный доступ к ' || fdc_Object_Get_Name(pObject_ID, 1) || 
          ' для группы ' || fdc_Object_Get_Name(pUser_Group_ID), pObject_ID);        
end fdc_User_Group_Grant_Del;
/
