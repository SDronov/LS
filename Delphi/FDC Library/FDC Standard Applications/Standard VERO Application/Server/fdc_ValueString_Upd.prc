create or replace procedure fdc_ValueString_Upd
-- Изменяет системную константу или дополнительный атрибут текста
	(
	  pID	number,                       -- идентификатор
	  pName varchar2,                   -- название
    pSysName  varchar2,               -- системное имя
    pStringValue varchar2,            -- текстовое значение  
	  pShortName varchar2,              -- короткое название
	  pDescript varchar2                -- описание
	)
is
begin
  -- Если текстовое значение не задано, то выход с поднятием исключения
  if (pStringValue is null) then
	   fdc_util.abort('Необходимо задать текстовое значение');
  end if;
 
  -- Вызываем базовую процедуру
  fdc_Value_Upd(pID, pName, pSysName, pStringValue, null, null, null, pShortName, pDescript);
end fdc_ValueString_Upd;
/
