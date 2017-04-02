create or replace procedure fdc_ValueBool_Sys_Set
-- �������� �������� ��������� ����������� ��������� �� �� ���������� �����
	(
	  pSysName	varchar2,       -- ��������� ���  
    pNumValue number         -- �������� �������� ��������
	)
is
  pValName varchar(1500);
begin
  -- ���� ����������� �������� �� ������, �� ����� � ��������� ����������
  if (pNumValue is null) then
	   fdc_util.abort('���������� ������ ����������� ��������');
  end if;

  -- ������� ��������� ��������, ��������, ��� �������� 0 ��� 1
  -- ���� ���, �� ����� � ��������� ����������  
  if (pNumValue = 1) then
	   pValName := '��';
  elsif (pNumValue = 0) then
     pValName := '���';
   else
     fdc_util.abort('�������� ������ ���� 0 ��� 1');  
  end if;
  
  -- �������� ������� ��������� ��������� ���������
  fdc_Value_Sys_Set(pSysName, pValName, pNumValue, null, null);
   
end fdc_ValueBool_Sys_Set;
/
