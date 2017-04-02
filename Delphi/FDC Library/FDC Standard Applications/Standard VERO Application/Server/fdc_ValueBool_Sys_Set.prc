create or replace procedure fdc_ValueBool_Sys_Set
-- Изменяет значения системной буленовской константы по ее системному имени
	(
	  pSysName	varchar2,       -- системное имя  
    pNumValue number         -- числовое значение атрибута
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
  
  -- Вызываем базовую процедуру изменения константы
  fdc_Value_Sys_Set(pSysName, pValName, pNumValue, null, null);
   
end fdc_ValueBool_Sys_Set;
/
