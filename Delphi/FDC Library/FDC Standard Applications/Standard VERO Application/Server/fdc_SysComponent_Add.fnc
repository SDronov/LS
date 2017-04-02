create or replace function fdc_SysComponent_Add
-- ������� ����� ��������� ���������� � ���������� �� ������������� 
	(
	  pObject_Type_SysName varchar2,         -- ��������� ��� ���� ����������
	  pName			           varchar2,         -- ��������            
    pBase_Type_ID		     number,           -- ������� ��������� ��� ��� ������ � ���������
                                           -- �������� ������������� ����������
	  pSysName		         varchar2,         -- ��������� ��� ����������          
	  pShortName		       varchar2 := null, -- �������� ��������
	  pDescript	           varchar2 := null  -- ��������
	)
    return number
is
  pNewID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'SysComponent'
  fdc_Object_Type_Is(pObject_Type_SysName,'SysComponent');

  -- �������� ������� ������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);
  
  -- ���� ������ ����� �� ������ ��� ��������������� ����� (������ AdminTask)
  fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);

  -- ���������� ������ � ������� fdc_SysComponent
  insert into fdc_SysComponent(ID, Base_Type_ID)
      values(pNewID, pBase_Type_ID);

  return pNewID;
end fdc_SysComponent_Add;
/
