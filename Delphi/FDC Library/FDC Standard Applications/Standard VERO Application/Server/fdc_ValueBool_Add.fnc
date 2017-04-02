create or replace function fdc_ValueBool_Add
-- Добавление системной константы или дополнительного атрибута истина-ложь 
	(
    pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы   
	  pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pNumValue	 number,                -- буленовское значение (1 - истина, 0 - ложь)  
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  pValName varchar2(1500);
  pNewID number;
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
  
  -- Проверка, что pObject_Type_SysName - потомок 'ValueBool'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueBool');

  -- Вызываем базовую функцию
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pValName, 
               pNumValue, null, null, pShortName, pDescript);

  -- Возвращает идентификатор
  return pNewID;
end fdc_ValueBool_Add;
/
