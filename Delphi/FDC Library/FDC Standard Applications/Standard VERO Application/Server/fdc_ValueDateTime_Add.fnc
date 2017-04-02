create or replace function fdc_ValueDateTime_Add
-- Добавление системной константы или дополнительного атрибута даты. 
	(
    pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название  
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы
	  pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pDateTimeValue date,              -- значение даты
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  pValName varchar2(1500);
  pNewID number;
begin
  -- Если значение даты не задано, то выход с поднятием исключения
  if (pDateTimeValue is null) then
	   fdc_util.abort('Необходимо задать значение даты');
  end if;

  -- Проверка, что pObject_Type_SysName - потомок 'ValueDateTime'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueDateTime');

  -- Генерим строковый аналог даты
  if (trim(pDateTimeValue) <> pDateTimeValue) then
	   pValName := To_Char(pDateTimeValue,'DD.MM.YYYY HH24.MI.SS');
   else	
     pValName := To_Char(pDateTimeValue,'DD.MM.YYYY');
  end if;

  -- Вызываем базовую функцию
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pValName, 
               null, pDateTimeValue, null, pShortName, pDescript);

  -- Возвращает идентификатор            
  return pNewID;
end fdc_ValueDateTime_Add;
/
