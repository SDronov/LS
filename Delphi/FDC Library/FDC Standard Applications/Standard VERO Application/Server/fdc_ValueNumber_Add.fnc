create or replace function fdc_ValueNumber_Add
-- Добавление системной константы или дополнительного атрибута числа. 
	(
    pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название 
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы   
	  pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pNumValue	 number,                -- значение числа   
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  pNewID number;
begin
  -- Если числовое значение не задано, то выход с поднятием исключения
  if (pNumValue is null) then
	   fdc_util.abort('Необходимо задать значение числа');
  end if;

  -- Проверка, что pObject_Type_SysName - потомок 'ValueNumber'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueNumber');

  -- Вызываем базовую функцию создания
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pNumValue, 
               pNumValue, null, null, pShortName, pDescript);

  -- Возвращает идентификатор             
  return pNewID;
end fdc_ValueNumber_Add;
/
