create or replace procedure fdc_Object_Kind_Upd
-- ��������� ��������� � �������� � ������� �������
	(
	  pID	number,              -- ������������� ������� �������
	  pEvidence_ID number,     -- ������������� ��������� 
	  pDescript	varchar2       -- �������� 
	)
is
  pName varchar2(1500);
begin
  -- ������� �������� ������� ������� �� �� ��������������
  -- ���� �� �����, �� ����������
  pName := fdc_Object_Get_Name(pID);

  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, null, pDescript);
  
  -- -- �������� fdc_Object_Kind
  update fdc_Object_Kind
     set Evidence_ID = pEvidence_ID
   where ID = pID;

end fdc_Object_Kind_Upd;
/
