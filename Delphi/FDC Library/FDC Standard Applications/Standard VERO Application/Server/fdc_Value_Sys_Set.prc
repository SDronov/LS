create or replace procedure fdc_Value_Sys_Set
-- Изменяет значения системной константы по ее системному имени
	(
	  pSysName	varchar2,       -- системное имя  
    pStringValue varchar2,    -- строковое значение атрибута 
    pNumValue number,         -- числовое значение атрибута
    pDateTimeValue date,      -- временное значение атрибута
    pRef_Object_ID number     -- ссылка на объект Веро
	)
is
  pID number(15);
begin
  -- Если все значения не заданы, то выход с поднятием исключения
  if (pStringValue is null) and (pNumValue is null) and (pDateTimeValue is null)
         and (pRef_Object_ID is null) then
	   fdc_util.abort('Необходимо задать системное значение');
  end if;

  -- Ищем системную константу
  begin
    select ID
      into pID
      from fdc_Value_Lst
     where SysName = pSysName
       and IsSystem <> 0;
  exception
    when NO_DATA_FOUND then fdc_util.Abort('Не найдена системная константа по системному имени '||pSysName);
 	  when others then fdc_util.Abort('Ошибка получения системной константы по системному имени '||pSysName, 1);    
  end;
  
  -- Изменяем данные в таблице fdc_Sys_Value 
  update fdc_Value
     set StringValue = pStringValue,
         NumValue = pNumValue,
         DateTimeValue = pDateTimeValue,
         Ref_Object_ID = pRef_Object_ID
   where ID = pID;
   
end fdc_Value_Sys_Set;
/
