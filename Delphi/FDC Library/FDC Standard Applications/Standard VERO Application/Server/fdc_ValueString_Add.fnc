create or replace function fdc_ValueString_Add
-- Добавление системной константы или дополнительного атрибута текста
	(
	  pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы  
	  pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pStringValue   varchar2,          -- текстовое значение
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  pNewID number;
begin
  -- Если текстовое значение не задано, то выход с поднятием исключения
  if (pStringValue is null) then
	   fdc_util.abort('Необходимо задать текстовое значение');
  end if;

  -- Проверка, что pObject_Type_SysName - потомок 'ValueString'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueString');

  -- Вызываем базовую функцию
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pStringValue, 
               null, null, null, pShortName, pDescript);

  -- Возвращает идентификатор  
  return pNewID;
end fdc_ValueString_Add;
/
