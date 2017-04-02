create or replace procedure fdc_ValueNumber_Sys_Set
-- Изменяет значения числовой системной константы по ее системному имени
	(
	  pSysName	varchar2,      -- системное имя  
    pNumValue number         -- числовое значение атрибута
	)
is
begin
  -- Если числовое значение не задано, то выход с поднятием исключения
  if (pNumValue is null) then
	   fdc_util.abort('Необходимо задать значение числа');
  end if;

  -- Вызываем базовую процедуру изменения константы
  fdc_Value_Sys_Set(pSysName, pNumValue, pNumValue, null, null);
   
end fdc_ValueNumber_Sys_Set;
/
