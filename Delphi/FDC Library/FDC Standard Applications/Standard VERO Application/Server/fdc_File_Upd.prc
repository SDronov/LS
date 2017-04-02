create or replace procedure fdc_File_Upd
-- ��������� �����
	(
    pID number,                     -- ������������� �����
	  pName varchar2,                 -- ��������
	  pSourceName	varchar2,           -- �������� �������� ����� � ��
	  pShortName varchar2,            -- �������� ��������
	  pDescript varchar2              -- ��������
	)
is
begin
  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- �������� fdc_File
  update fdc_File
     set SourceName = pSourceName
   where ID = pID;

end fdc_File_Upd;
/
