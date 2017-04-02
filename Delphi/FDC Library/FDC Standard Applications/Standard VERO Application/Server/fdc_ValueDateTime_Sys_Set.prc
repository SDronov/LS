create or replace procedure fdc_ValueDateTime_Sys_Set
-- �������� �������� ��������� ��������� ����-������� �� �� ���������� �����
	(
	  pSysName	varchar2,       -- ��������� ���  
    pDateTimeValue date       -- ��������� �������� ��������
	)
is
  pValName varchar2(1500);
begin
  -- ���� �������� ���� �� ������, �� ����� � ��������� ����������
  if (pDateTimeValue is null) then
	   fdc_util.abort('���������� ������ �������� ����');
  end if;

  -- ������� ��������� ������ ����
  if (trim(pDateTimeValue) <> pDateTimeValue) then
	   pValName := To_Char(pDateTimeValue,'DD.MM.YYYY HH24.MI.SS');
   else	
     pValName := To_Char(pDateTimeValue,'DD.MM.YYYY');
  end if;

  -- �������� ������� ��������� ��������� ���������
  fdc_Value_Sys_Set(pSysName, null, null, pDateTimeValue, null);
   
end fdc_ValueDateTime_Sys_Set;
/
