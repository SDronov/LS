create or replace procedure fdc_User_Del
-- Удаление пользователя
	(
	  pID number,          -- идентификатор пользователя
    pDoLog number := 1   -- Логировать ли событие удаления объекта 
                         -- (создавать ли Event?)
                         -- по умолчанию логировать (значение 1)
                         -- при значении 0 логировать не надо
	)
is
begin
    -- удаление записи из таблицы fdc_User 
    delete from fdc_User
        where ID = pID;

    -- вызов базовой процедуры удаления объекта    
    fdc_Object_Del(pID, PDoLog);
end fdc_User_Del;
/
