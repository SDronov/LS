create or replace procedure fdc_ValueString_Sys_Set
-- Изменяет значения текстовой системной константы по ее системному имени
	(
	  pSysName	varchar2,       -- системное имя  
    pStringValue varchar2     -- строковое значение атрибута 
	)
is
begin
  -- Если текстовое значение не задано, то выход с поднятием исключения
  if (pStringValue is null) then
	   fdc_util.abort('Необходимо задать текстовое значение');
  end if;

  -- Вызываем базовую процедуру изменения константы
  fdc_Value_Sys_Set(pSysName, pStringValue, null, null, null);
   
end fdc_ValueString_Sys_Set;
/
