create or replace procedure fdc_ValueNumber_Upd
-- Изменяет системную константу или дополнительный атрибут числа 
	(
    pID	number,                       -- идентификатор
    pName			varchar2,               -- название 
    pSysName  varchar2,               -- системное имя 
    pNumValue	 number,                -- значение числа   
	  pShortName   varchar2,            -- короткое название
	  pDescript		varchar2              -- описание
	)
is
begin
  -- Если числовое значение не задано, то выход с поднятием исключения
  if (pNumValue is null) then
	   fdc_util.abort('Необходимо задать значение числа');
  end if;

  -- Вызываем базовую процедуру
  fdc_Value_Upd(pID, pName, pSysName, pNumValue, pNumValue, null, null, pShortName, pDescript);
  
end fdc_ValueNumber_Upd;
/
