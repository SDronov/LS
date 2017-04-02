create or replace procedure fdc_ValueDateTime_Upd
-- �������� ��������� ��������� ��� �������������� ������� ����
	(
	  pID	number,                       -- ������������� 
	  pName varchar2,                   -- ��������  
    pSysName  varchar2,               -- ��������� ���  
    pDateTimeValue date,              -- �������� ����
	  pShortName   varchar2,            -- �������� ��������
	  pDescript		varchar2              -- ��������
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

  -- �������� ������� ���������
  fdc_Value_Upd(pID, pName, pSysName, pValName, null, pDateTimeValue, null, pShortName, pDescript);

end fdc_ValueDateTime_Upd;
/
