create or replace procedure fdc_ValueNumber_Upd
-- �������� ��������� ��������� ��� �������������� ������� ����� 
	(
    pID	number,                       -- �������������
    pName			varchar2,               -- �������� 
    pSysName  varchar2,               -- ��������� ��� 
    pNumValue	 number,                -- �������� �����   
	  pShortName   varchar2,            -- �������� ��������
	  pDescript		varchar2              -- ��������
	)
is
begin
  -- ���� �������� �������� �� ������, �� ����� � ��������� ����������
  if (pNumValue is null) then
	   fdc_util.abort('���������� ������ �������� �����');
  end if;

  -- �������� ������� ���������
  fdc_Value_Upd(pID, pName, pSysName, pNumValue, pNumValue, null, null, pShortName, pDescript);
  
end fdc_ValueNumber_Upd;
/
