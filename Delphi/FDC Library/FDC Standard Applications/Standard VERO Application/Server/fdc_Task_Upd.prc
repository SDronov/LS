create or replace procedure fdc_Task_Upd
-- Изменение задачи
	(
	  pID	            number,             -- идентификатор задачи
	  pName           varchar2,           -- название,
    pSysName        varchar2,           -- системное имя
    pShortName	    varchar2,           -- короткое название
	  pDescript       varchar2            -- описание
	)
is
begin
  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- меняем системное имя
  fdc_Object_Upd_SysName(pID, pSysName);
end fdc_Task_Upd;
/
