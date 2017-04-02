create or replace procedure fdc_User_Group_Task_Del
-- Снятие задачи с группы пользователей
	(
	  pUser_Group_ID	number,    -- идентификатор группы пользователей
	  pTask_ID	number           -- идентификатор задачи
	)
is
begin
  delete from fdc_User_Group_Task
     where User_Group_ID = pUser_Group_ID and
	         Task_ID = pTask_ID;
exception
  when others then 
     fdc_util.abort('Ошибка снятия задачи с группы пользователей', 1);            
end fdc_User_Group_Task_Del;
/
