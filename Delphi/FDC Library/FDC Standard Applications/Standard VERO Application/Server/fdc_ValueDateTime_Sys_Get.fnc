create or replace function fdc_ValueDateTime_Sys_Get
-- ��������� �������� ���� ��������� ���������
	(
  	pSysName varchar2 -- ��������� ��� ���������
	)
  return date
is
  Result date;
begin
  select	DateTimeValue
    into	Result
    from	fdc_Value_Lst
   where	SysName = pSysName
     and  IsSystem <> 0;
     
  return Result;
exception
  when NO_DATA_FOUND then fdc_util.Abort('�� ������� �������� ��������� ��������� �� ���������� ����� '||pSysName);
 	when others then fdc_util.Abort('������ ��������� ��������� ��������� �� ���������� ����� '||pSysName, 1);    
end fdc_ValueDateTime_Sys_Get;
/
