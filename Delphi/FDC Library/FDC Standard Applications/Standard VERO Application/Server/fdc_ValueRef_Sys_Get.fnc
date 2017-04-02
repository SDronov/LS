create or replace function fdc_ValueRef_Sys_Get
-- Получение ссылки на объект системной константы
	(
  	pSysName varchar2 -- системное имя константы
	)
  return number
is
  Result number;
begin
  select	Ref_Object_ID
    into	Result
    from	fdc_Value_Lst
   where	SysName = pSysName
     and  IsSystem <> 0;
     
  return Result;
exception
  when NO_DATA_FOUND then fdc_util.Abort('Не найдена ссылка на объект системной константы по системному имени '||pSysName);
 	when others then fdc_util.Abort('Ошибка получения системной константы по системному имени '||pSysName, 1);    
end fdc_ValueRef_Sys_Get;
/
