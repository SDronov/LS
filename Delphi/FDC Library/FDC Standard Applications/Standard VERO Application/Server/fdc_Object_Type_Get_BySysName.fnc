create or replace function fdc_Object_Type_Get_BySysName
-- ��������� �������������� ���� �� ��� ���������� �����
	(
	  pSysName varchar2  --��������� ��� �������
	)
  return number
is
  result number(15);
begin
  select T.ID
    into result
    from fdc_Object_Type T
   where T.SysName = pSysName;

  return result;
exception when others then 
  fdc_Util.Abort('�� ��������� ��� ������� �� ���������� ����� '||pSysName, 1);
end fdc_Object_Type_Get_BySysName;
/
