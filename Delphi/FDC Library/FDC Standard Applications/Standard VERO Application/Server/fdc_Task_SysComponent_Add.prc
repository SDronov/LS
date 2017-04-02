create or replace procedure fdc_Task_SysComponent_Add
-- Включает системную компоненту (процедуру, вьюху) в задачи. 
-- После этого при перегрантовке на нее будут даваться права пользователям.
	(
	  pTask_ID number,            -- идентификатор задачи
	  pSysComponent_ID number     -- идентификатор системной компоненты
	)
is
  pCnt number;
begin
-- смотрим входит ли уже компоненты в задачу
  select count(*)
    into pCnt
    from fdc_Task_SysComponent
   where Task_ID = pTask_ID and
	       SysComponent_ID = pSysComponent_ID;

  -- если не входит, то включаем       
  if (pCnt = 0) then
	   insert into fdc_Task_SysComponent(Task_ID, SysComponent_ID)
	       values(pTask_ID, pSysComponent_ID);
  end if;
end fdc_Task_SysComponent_Add;
/
