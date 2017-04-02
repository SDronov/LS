create or replace function fdc_ValueString_Sys_Get
-- ѕолучение строкового значени€ системной константы
	(
  	pSysName varchar2 -- системное им€ константы
	)
  return varchar2
is
  Result varchar2(4000);
begin
  select	StringValue
    into	Result
    from	fdc_Value_Lst
   where	SysName = pSysName
     and  IsSystem <> 0;

  return Result;
exception
  when NO_DATA_FOUND then fdc_util.Abort('Ќе найдено значение системной константы по системному имени '||pSysName);
 	when others then fdc_util.Abort('ќшибка получени€ системной константы по системному имени '||pSysName, 1);  
end fdc_ValueString_Sys_Get;
/
