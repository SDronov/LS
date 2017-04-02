create or replace function fdc_ValueRef_Add
-- Добавление системной константы или дополнительного атрибута ссылки на объект VERO. 
	(
    pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы
	  pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pRef_Object_ID number,            -- идентификатор объекта, на который делается ссылка      
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  pTypeSysName varchar2(1500);
  pRefName varchar2(1500);
  pNewID number;
begin
  -- Проверка, что pObject_Type_SysName - потомок 'ValueRef'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueRef');
  
  -- Если делается ссылка на файл, то добавляем соответствующим образом
  if (fdc_Object_Is(pRef_Object_ID,'File') <> 0) then
	   pTypeSysName := 'ValueRefFile';
   else
     pTypeSysName := pObject_Type_SysName;  
  end if;  

  -- Получаем имя объекта, на который делается ссылка. 
  -- Если не нашли, то исключение
  pRefName := fdc_Object_Get_Name(pRef_Object_ID); 

  -- Вызываем базовую процедуру
  pNewID := fdc_Value_Add(pTypeSysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pRefName, null, null, pRef_Object_ID, pShortName, pDescript);

  -- Возвращаем результат
  return pNewID;
end fdc_ValueRef_Add;
/
