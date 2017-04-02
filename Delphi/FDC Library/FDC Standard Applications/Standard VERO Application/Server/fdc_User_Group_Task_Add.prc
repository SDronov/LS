create or replace procedure fdc_User_Group_Task_Add
-- Назначение задачи заданной группе пользоватей
	(
	  pUser_Group_ID number,    -- идентификатор группы пользователей
	  pTask_ID number,          -- идентификатор задачи
    pDoRaiseDupVal number := 1  -- определяет поднимать ли исключение, если пользователь
                                -- уже входит в данную группу.
                                -- По умолчанию (значение <> 0) поднимать,
                                -- 0 не поднимать  
	)
is
begin
  insert into fdc_User_Group_Task(User_Group_ID, Task_ID)
      values(pUser_Group_ID, pTask_ID);
exception
  when DUP_VAL_ON_INDEX then 
     if (pDoRaiseDupVal <> 0) then
        fdc_util.abort('Данная задача уже дана группе пользователей');   
      else
        return;
     end if;      
  when others then 
     fdc_util.abort('Ошибка добавления задачи группе пользователей', 1);       
end fdc_User_Group_Task_Add;
/
