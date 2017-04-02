create or replace function fdc_ValueRef_Add
-- ���������� ��������� ��������� ��� ��������������� �������� ������ �� ������ VERO. 
	(
    pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- ��������
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������
	  pOwner_Object_ID	number,         -- ������������� �������-���������
    pRef_Object_ID number,            -- ������������� �������, �� ������� �������� ������      
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  pTypeSysName varchar2(1500);
  pRefName varchar2(1500);
  pNewID number;
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'ValueRef'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueRef');
  
  -- ���� �������� ������ �� ����, �� ��������� ��������������� �������
  if (fdc_Object_Is(pRef_Object_ID,'File') <> 0) then
	   pTypeSysName := 'ValueRefFile';
   else
     pTypeSysName := pObject_Type_SysName;  
  end if;  

  -- �������� ��� �������, �� ������� �������� ������. 
  -- ���� �� �����, �� ����������
  pRefName := fdc_Object_Get_Name(pRef_Object_ID); 

  -- �������� ������� ���������
  pNewID := fdc_Value_Add(pTypeSysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pRefName, null, null, pRef_Object_ID, pShortName, pDescript);

  -- ���������� ���������
  return pNewID;
end fdc_ValueRef_Add;
/
