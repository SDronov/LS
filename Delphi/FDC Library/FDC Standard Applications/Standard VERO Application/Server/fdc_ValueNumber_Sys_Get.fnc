create or replace function fdc_ValueNumber_Sys_Get
-- ѕолучение числового значени€ системной константы
	(
  	pSysName varchar2 -- системное им€ константы
	)
  return number
is
  Result number;
begin
  select	NumValue
    into	Result
    from	fdc_Value_Lst
   where	SysName = pSysName
     and  IsSystem <> 0;

  return Result;
exception
  when NO_DATA_FOUND then fdc_util.Abort('Ќе найдено значение системной константы по системному имени '||pSysName);
 	when others then fdc_util.Abort('ќшибка получени€ системной константы по системному имени '||pSysName, 1);    
end fdc_ValueNumber_Sys_Get;
/
