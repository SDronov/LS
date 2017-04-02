create or replace function fdc_File_Add
-- ������� ����� ������ ����� � VERO � ���������� ��� �������������
	(
	  pObject_Type_SysName varchar2,  -- ��������� ��� ���������� ����
	  pName varchar2,                 -- ��������
	  pSourceName	varchar2,           -- �������� �������� ����� � ��
	  pShortName varchar2 := null,    -- �������� ��������
	  pDescript varchar2 := null      -- ��������
	)
    return number
is
  pNewID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'File'
  fdc_Object_Type_Is(pObject_Type_SysName,'File');

  -- �������� ������� ������� �������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, null, pShortName, pDescript);

  -- ���� ������ ������ ������ � ����
  fdc_Object_Grant_Upd(pNewID, fdc_User_Get, 3, 1);

  -- ��������� ������ � ������� fdc_File
  insert into fdc_File(ID, SourceName, Body)
     values(pNewID, pSourceName, empty_blob());

  -- ���������� �������������   
  return pNewID;
end fdc_File_Add;
/
