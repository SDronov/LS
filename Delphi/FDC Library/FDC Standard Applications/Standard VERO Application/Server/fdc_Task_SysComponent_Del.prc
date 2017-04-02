create or replace procedure fdc_Task_SysComponent_Del
-- Удаляет системную компоненту (процедуру, вьюху) из задачи. 
-- Таким образом права на нее выдаваться не будут.
	(
	  pTask_ID number,              -- идентификатор задачи
	  pSysComponent_ID number       -- идентификатор системной компоненты
	)
is
begin
  delete from fdc_Task_SysComponent
       where Task_ID = pTask_ID and
	           SysComponent_ID = pSysComponent_ID;
exception
  when others then 
     fdc_util.abort('Ошибка удаления системной компоненты из задачи', 1);                         
end fdc_Task_SysComponent_Del;
/
