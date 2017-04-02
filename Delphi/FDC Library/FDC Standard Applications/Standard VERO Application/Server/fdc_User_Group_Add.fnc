create or replace function fdc_User_Group_Add
-- ����������� ����� ������ ������������� ������� � VERO
-- ���������� �� �������������
	(
	  pObject_Type_SysName varchar2,   -- ��������� ��� ���������� ���� ������ �������������
    pName	varchar2,                  -- �������� ������
	  pSysName varchar2,               -- ��������� ���
    pShortName varchar2 := null,     -- �������� ��������
	  pDescript varchar2 := null       -- �������� 
	)
    return number
is
  pNewID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'UserGroup'
  fdc_Object_Type_Is(pObject_Type_SysName,'UserGroup');

  -- ������� ������ ������ �������������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);

  -- ���� ������� ������ ��������������� �����, �� Ok 
  -- ����� ���� ����������� ������ ������ ��������������� ����� � ����� ������
  if (pSysName <> 'AdminTask') then
     fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);
  end if;   

  -- ������� ������ � ������� fdc_User_Group
  insert into fdc_User_Group(ID)
       values(pNewID);

  -- ���������� ������������� ����� ������ �������������    
  return pNewID;
end fdc_User_Group_Add;
/
