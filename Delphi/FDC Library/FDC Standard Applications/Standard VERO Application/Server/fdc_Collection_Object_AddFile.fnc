create or replace function fdc_Collection_Object_AddFile
-- �������� ����� � ��������. ���������� ������������� ����� � ����
	(
	  pCollection_ID	number,       -- ������������� ��������
  	pFileName 	varchar2,         -- ��� �����
    pRoleName	varchar2 := null,   -- ���� ������� � ��������
	  pDescript	varchar2 := null    -- ����������� � ������� � ��������
	)
    return number
is
  pFileID number(15);
begin
  -- ������� ������ ����� � ����
  pFileID := fdc_File_Add('File', pFileName, pFileName); 

  -- �������� ���� � ��������
  fdc_Collection_Object_Add(pCollection_ID, pFileID, pRoleName, pDescript);

  -- ���������� ������������� �����
  return pFileID;
end fdc_Collection_Object_AddFile;
/
