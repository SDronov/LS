create or replace procedure fdc_ValueRef_Upd
-- �������� ��������� ��������� ��� �������������� ������� ������ �� ������
	(
    pID	number,                       -- �������������
	  pName			varchar2,               -- �������� 
    pSysName  varchar2,               -- ��������� ���
    pRef_Object_ID number,            -- ������������� �������, �� ������� �������� ������      
	  pShortName   varchar2,            -- �������� ��������
	  pDescript		varchar2              -- ��������
	)
is
  pRefName varchar(1500);
begin
  -- �������� ��� �������, �� ������� �������� ������
  -- ���� �� �����, �� ����������
  pRefName := fdc_Object_Get_Name(pRef_Object_ID); 

  -- �������� ������� ���������
  fdc_Value_Upd(pID, pName, pSysName, pRefName, null, null, pRef_Object_ID, pShortName, pDescript);

end fdc_ValueRef_Upd;
/
