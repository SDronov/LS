create or replace procedure fdc_User_Group_Del
-- Удаление группы пользователей
	(
	  pID number,              -- идентификатор группы
    pDoLog number := 1       -- Логировать ли событие удаления объекта 
                             -- (создавать ли Event?)
                             -- по умолчанию логировать (значение 1)
                             -- при значении 0 логировать не надо
	)
is
begin
  -- удаление из таблицы fdc_User_Group
  delete from fdc_User_Group
       where ID = pID;

  -- вызов базовой процедуры удаления объекта     
  fdc_Object_Del(pID, pDoLog);
end fdc_User_Group_Del;
/
