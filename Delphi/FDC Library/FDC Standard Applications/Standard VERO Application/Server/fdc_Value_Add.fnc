create or replace function fdc_Value_Add
-- Добавление системной константы или дополнительного атрибута к объекту.. 
	(
	  pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название  
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы
    pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pStringValue varchar2,            -- строковое значение 
    pNumValue number := null,         -- числовое значение
    pDateTimeValue date := null,      -- временное значение
    pRef_Object_ID number := null,    -- идентификатор объекта, на который делается ссылка 
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  
  pNewID	number(15);
  pSchID number(15);
  pValName varchar2(1500);
  pLevel number;
begin
  -- Если все значения не заданы, то выход с поднятием исключения
  if (pStringValue is null) and (pNumValue is null) 
         and (pDateTimeValue is null) and (pRef_Object_ID is null) then
	   fdc_util.abort('Необходимо задать значение');
  end if;
  
  -- Проверка, что pObject_Type_SysName - потомок 'Value'
  fdc_Object_Type_Is(pObject_Type_SysName,'Value');

  -- системная константа должна иметь название и системное имя, а атрибут объекта-владельца
  if (pIsSystem <> 0) then
     -- Если не задано системное имя, то выход с поднятием исключения
     if (pSysName is null) then
        fdc_util.abort('Не задано системное имя системной константы');
     end if;
     
     -- Если не задано название, то выход с поднятием исключения
     if (pName is null) then
	      fdc_util.abort('Необходимо задать название системного значения');
     end if;
     
     -- Проверка, что не существует системной константы с таким системным именем
     begin
       select V.ID
         into pSchID
         from fdc_Value V, fdc_Object O
        where O.ID = V.ID
          and upper(O.SysName) = upper(pSysName) 
          and V.IsSystem <> 0;
     exception
       when NO_DATA_FOUND then 
         null;
       when others then 
         fdc_util.abort('Ошибка поиска системной константы с системным именем '||pSysName, 1);   
     end;
     
     if (pSchID is not null) then
        fdc_util.abort('Системная константа с системным именем ' || pSysName || ' уже существует.');      
     end if;
     
     pValName := pName;
     
     -- Уровень доступа для константы на чтение
     pLevel := 1;
   else
     -- Если не задан владелец, то выход с поднятием исключения
     if (pOwner_Object_ID is null) then
        fdc_util.abort('Не задан объект-владелец дополнительного атрибута');
     end if;
     
     -- Проверяем имеет ли пользователь доступ на чтение к объекту, к которому добавляется атрибут
     -- Если не имеет, то исключение
      pLevel := fdc_Object_Check_Access_Level(pOwner_Object_ID,1,1);
      
      -- Если название атрибута не задано, то в качестве названия берем его строковое значение 
      pValName := NVL(pName, pStringValue);
      
      -- Уровень доступа для атрибута на чтение-запись
      pLevel := 2;
  end if;      

  -- Создаем новый объект
  pNewID := fdc_Object_Add(pObject_Type_SysName, pValName, pLevel,
                pOwner_Object_ID, pSysName, pShortName, pDescript);

  -- Заносим запись в таблицу fdc_Value               
  insert into fdc_Value(ID, IsSystem, StringValue, NumValue, DateTimeValue, Ref_Object_ID)
           values (pNewID, pIsSystem, pStringValue, pNumValue, pDateTimeValue, pRef_Object_ID);

  -- Возвращаем идентификатор нового атрибута
  return pNewID;
end fdc_Value_Add;
/
