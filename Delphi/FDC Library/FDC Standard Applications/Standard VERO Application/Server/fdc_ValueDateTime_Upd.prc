create or replace procedure fdc_ValueDateTime_Upd
-- Изменяет системную константу или дополнительный атрибут даты
	(
	  pID	number,                       -- идентификатор 
	  pName varchar2,                   -- название  
    pSysName  varchar2,               -- системное имя  
    pDateTimeValue date,              -- значение даты
	  pShortName   varchar2,            -- короткое название
	  pDescript		varchar2              -- описание
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

  -- Вызываем базовую процедуру
  fdc_Value_Upd(pID, pName, pSysName, pValName, null, pDateTimeValue, null, pShortName, pDescript);

end fdc_ValueDateTime_Upd;
/
