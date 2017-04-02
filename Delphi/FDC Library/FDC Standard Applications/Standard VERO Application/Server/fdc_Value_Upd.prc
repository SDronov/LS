create or replace procedure fdc_Value_Upd
-- Изменяет системную константу или дополнительный атрибут
	(
	  pID	number,                       -- идентификатор
	  pName varchar2,                   -- название
    pSysName  varchar2,               -- системное имя
    pStringValue varchar2,            -- строковое значение 
    pNumValue number,                 -- числовое значение
    pDateTimeValue date,              -- временное значение
    pRef_Object_ID number,            -- идентификатор объекта, на который делается ссылка 
	  pShortName varchar2,              -- короткое название
	  pDescript varchar2                -- описание
	)
is
 pOwner_ID number(15);
 pSchID number(15);
 pValName varchar2(1500);
 pLevel number;
 pIsSystem number;
begin
 -- Если все значения не заданы, то выход с поднятием исключения
  if (pStringValue is null) and (pNumValue is null) 
         and (pDateTimeValue is null) and (pRef_Object_ID is null) then
	   fdc_util.abort('Необходимо задать значение атрибута');
  end if;
  
  -- Ищем владельца значения и является ли оно системным
  begin
    select IsSystem, Owner_Object_ID
      into pIsSystem, pOwner_ID
      from fdc_Value_Lst
     where ID = pID;
  exception 
    when NO_DATA_FOUND then
         fdc_util.abort('Не найдено значение по ID = '||pID);
  	when others then 
         fdc_util.abort('Ошибка определения значения по ID = '||pID, 1); 
  end; 

 -- Проверяем, есть ли у пользователя доступ на изменение объекта-владельца
 -- Если нет - исключение
 if (pOwner_ID is not null) then
    pLevel := fdc_Object_Check_Access_Level(pOwner_ID,2,1);
 end if;
 
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
          and V.IsSystem <> 0
          and V.ID <> pID;
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
   else
     -- Если не задан владелец, то выход с поднятием исключения
     if (pOwner_ID is null) then
        fdc_util.abort('Не задан объект-владелец дополнительного атрибута');
     end if;
     
     -- Если название атрибута не задано, то в качестве названия берем его строковое значение 
     pValName := NVL(pName, pStringValue);
  end if;      
 
 -- Вызов базовой процедуры изменения объекта
 fdc_Object_Upd(pID, pValName, pShortName, pDescript);
 
 -- меняем системное имя 
 fdc_Object_Upd_SysName(pID, pSysName);
  
 -- Изменяем данные в таблице fdc_Value 
 update	fdc_Value
    set	StringValue = pStringValue,
        NumValue = pNumValue,
        DateTimeValue = pDateTimeValue,
        Ref_Object_ID = pRef_Object_ID
  where ID = pID;
end fdc_Value_Upd;
/
