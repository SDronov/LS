create or replace procedure fdc_ValueString_Sys_Set
-- �������� �������� ��������� ��������� ��������� �� �� ���������� �����
	(
	  pSysName	varchar2,       -- ��������� ���  
    pStringValue varchar2     -- ��������� �������� �������� 
	)
is
begin
  -- ���� ��������� �������� �� ������, �� ����� � ��������� ����������
  if (pStringValue is null) then
	   fdc_util.abort('���������� ������ ��������� ��������');
  end if;

  -- �������� ������� ��������� ��������� ���������
  fdc_Value_Sys_Set(pSysName, pStringValue, null, null, null);
   
end fdc_ValueString_Sys_Set;
/
