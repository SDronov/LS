create or replace function fdc_ValueBool_Sys_Get
-- Получение буленовского значения системной константы
-- Возвращает 1 - истина, 0 - ложь
	(
  	pSysName varchar2 -- системное имя константы
	)
  return number
is
begin
  return fdc_ValueNumber_Sys_Get(pSysName);
end fdc_ValueBool_Sys_Get;
/
