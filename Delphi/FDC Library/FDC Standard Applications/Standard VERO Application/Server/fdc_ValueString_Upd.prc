create or replace procedure fdc_ValueString_Upd
-- �������� ��������� ��������� ��� �������������� ������� ������
	(
	  pID	number,                       -- �������������
	  pName varchar2,                   -- ��������
    pSysName  varchar2,               -- ��������� ���
    pStringValue varchar2,            -- ��������� ��������  
	  pShortName varchar2,              -- �������� ��������
	  pDescript varchar2                -- ��������
	)
is
begin
  -- ���� ��������� �������� �� ������, �� ����� � ��������� ����������
  if (pStringValue is null) then
	   fdc_util.abort('���������� ������ ��������� ��������');
  end if;
 
  -- �������� ������� ���������
  fdc_Value_Upd(pID, pName, pSysName, pStringValue, null, null, null, pShortName, pDescript);
end fdc_ValueString_Upd;
/
