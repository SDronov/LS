create or replace function fdc_ValueRefFile_Add
-- ���������� ��������� ��������� ��� ��������������� �������� ������ �� ���� VERO. 
	(
    pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- ��������  
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������
	  pOwner_Object_ID	number,         -- ������������� �������-���������
    pFile_ID number,                  -- ������������� ����� � VERO, �� ������� �������� ������      
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  pNewID number;
  pChk number;
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'ValueRefFile'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueRefFile');

  -- ������� �� ������� �����, �� ������� �������� ������
  begin
    select 1
      into pChk
      from fdc_File
     where ID = pFile_ID;
  exception
    when NO_DATA_FOUND then fdc_util.Abort('�� ��������� ���� �� ID = '||pFile_ID);
  	when others then fdc_util.Abort('������ ��������� ����� �� ID = '||pFile_ID, 1); 
  end;

  -- �������� ������� ������� ���������� ������ �� ������
  pNewID := fdc_ValueRef_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pFile_ID, pShortName, pDescript);

  -- ���������� �������� ��������������
  return pNewID;
end fdc_ValueRefFile_Add;
/
