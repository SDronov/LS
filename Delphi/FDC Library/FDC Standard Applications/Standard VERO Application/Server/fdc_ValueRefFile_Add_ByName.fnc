create or replace function fdc_ValueRefFile_Add_ByName
-- ���������� ��������������� �������� ������ �� ���� ���� �� �������� �����
	(
    pName	varchar2,              -- ��������
    pOwner_Object_ID number,     -- ������������� �������-���������
	  pFileName	varchar2           -- ��� �����
	)
    return number
is
  lName varchar2(1500);
  pFileID number(15);
  pValID number(15);
begin
  lName := NVL(pName, pFileName);

  -- ������� ������ ����� � ����
  pFileID := fdc_File_Add('File', lName, pFileName);                      
  
  -- ��������� �������������� �������-����
  pValID := fdc_ValueRefFile_Add('ValueRefFile', lName, null, 0, pOwner_Object_ID, pFileID);

  -- ���������� ������������� ��������-�����
  return pFileID;
end fdc_ValueRefFile_Add_ByName;
/
