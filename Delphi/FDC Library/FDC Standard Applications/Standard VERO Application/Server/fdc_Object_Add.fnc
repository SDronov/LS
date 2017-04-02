create or replace function fdc_Object_Add
-- �������� ������ �������
-- ���������� ��� �������������
	(
	  pObject_Type_SysName  varchar2, -- ��������� ��� ���������� ����
	  pName  varchar2 := null,        -- ��������
	  pAccessLevel number := 2,       -- ������� ������ ������� (0 - ��� �������, 1 - ������ ������, 2 - ���������, 3 - ��������� ���� �������) 
    pOwner_Object_ID number := null,-- ������������� �������-���������        
	  pSysName		varchar2 := null,   -- ��������� ��� �������
    pShortName   varchar2 := null,  -- �������� ��������
	  pDescript		varchar2 := null    -- ��������
	)
  return number
is
  pNewID number(15);
  pObjectTypeID number(15);
  pCnt number(15);
begin
  -- ��������� ��������� �� ������ � ��������� ����
  -- ���� ���, �� ����������
  fdc_Object_Type_Is(pObject_Type_SysName,'Object');

  -- ��������� �������������� ���� �� ��� ���������� �����  
  pObjectTypeID := fdc_Object_Type_Get_BySysName(pObject_Type_SysName);

  -- ��������� ������ �������� ��������������
  pNewID := fdc_Object_Get_NewKey;
  
  -- ��������� ������ � �������
  insert into fdc_Object(ID, Object_Type_ID, Name, ShortName, AccessLevel, SysName, Descript, Owner_Object_Id)
     values(pNewID, pObjectTypeID, trim(pName), trim(pShortName), pAccessLevel, trim(pSysName), trim(pDescript), pOwner_Object_ID);

  return pNewID;
exception
  when others then
    Fdc_Util.Abort('�� ������ ���������� ������� '||pName||':', 1);      
end fdc_Object_Add;
/
