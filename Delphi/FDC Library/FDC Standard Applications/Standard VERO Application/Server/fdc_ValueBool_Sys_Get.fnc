create or replace function fdc_ValueBool_Sys_Get
-- ��������� ������������ �������� ��������� ���������
-- ���������� 1 - ������, 0 - ����
	(
  	pSysName varchar2 -- ��������� ��� ���������
	)
  return number
is
begin
  return fdc_ValueNumber_Sys_Get(pSysName);
end fdc_ValueBool_Sys_Get;
/
