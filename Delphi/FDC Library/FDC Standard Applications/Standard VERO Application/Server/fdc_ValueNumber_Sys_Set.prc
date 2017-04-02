create or replace procedure fdc_ValueNumber_Sys_Set
-- �������� �������� �������� ��������� ��������� �� �� ���������� �����
	(
	  pSysName	varchar2,      -- ��������� ���  
    pNumValue number         -- �������� �������� ��������
	)
is
begin
  -- ���� �������� �������� �� ������, �� ����� � ��������� ����������
  if (pNumValue is null) then
	   fdc_util.abort('���������� ������ �������� �����');
  end if;

  -- �������� ������� ��������� ��������� ���������
  fdc_Value_Sys_Set(pSysName, pNumValue, pNumValue, null, null);
   
end fdc_ValueNumber_Sys_Set;
/
