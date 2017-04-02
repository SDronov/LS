create or replace procedure fdc_ValueBool_Upd
-- Изменяет системную константу или дополнительный атрибут истина-ложь.
	(
	  pID	number,                       -- идентификатор
	  pName			varchar2,               -- название  
    pSysName  varchar2,               -- системное имя 
    pNumValue	 number,                -- буленовское значение (1 - истина, 0 - ложь)  
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
is
  pValName varchar(1500);
begin
  -- Если буленовское значение не задано, то выход с поднятием исключения
  if (pNumValue is null) then
	   fdc_util.abort('Необходимо задать буленовское значение');
  end if;

  -- Генерим текстовое значение, проверяя, что значение 0 или 1
  -- Если нет, то выход с поднятием исключения  
  if (pNumValue = 1) then
	   pValName := 'Да';
  elsif (pNumValue = 0) then
     pValName := 'Нет';
   else
     fdc_util.abort('Значение должно быть 0 или 1');  
  end if;

  -- Вызываем базовую процедуру
  fdc_Value_Upd(pID, pName, pSysName, pValName, pNumValue, null, null, pShortName, pDescript);
  
end fdc_ValueBool_Upd;
/
