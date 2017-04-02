create or replace procedure fdc_ValueDateTime_Sys_Set
-- Изменяет значения системной константы даты-времени по ее системному имени
	(
	  pSysName	varchar2,       -- системное имя  
    pDateTimeValue date       -- временное значение атрибута
	)
is
  pValName varchar2(1500);
begin
  -- Если значение даты не задано, то выход с поднятием исключения
  if (pDateTimeValue is null) then
	   fdc_util.abort('Необходимо задать значение даты');
  end if;

  -- Генерим строковый аналог даты
  if (trim(pDateTimeValue) <> pDateTimeValue) then
	   pValName := To_Char(pDateTimeValue,'DD.MM.YYYY HH24.MI.SS');
   else	
     pValName := To_Char(pDateTimeValue,'DD.MM.YYYY');
  end if;

  -- Вызываем базовую процедуру изменения константы
  fdc_Value_Sys_Set(pSysName, null, null, pDateTimeValue, null);
   
end fdc_ValueDateTime_Sys_Set;
/
