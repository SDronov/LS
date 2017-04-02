create or replace function fdc_View_Add
-- ������� ����� ������������� � ���������� ��� ������������� 
  (
	  pObject_Type_SysName varchar2,         -- ��������� ��� ���� ���������
	  pName			           varchar2,         -- ��������            
    pBase_Type_ID		     number,           -- ������� ��������� ��� ��� ������ � ���������
                                           -- �������� ������������� ���������
	  pSysName		         varchar2,         -- ��������� ��� ���������          
	  pShortName		       varchar2 := null, -- �������� ��������
	  pDescript	           varchar2 := null  -- ��������
	)
    return number
is
  pNewID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'View'
  fdc_Object_Type_Is(pObject_Type_SysName,'View');

  -- �������� ������� ������� ���������� ��������� ����������
  pNewID := fdc_Server_Component_Add(pObject_Type_SysName, pName, pBase_Type_ID, pSysName, pShortName, pDescript);

  -- ���������� ������ � ������� fdc_View
  insert into fdc_View(ID)
      values(pNewID);

  return pNewID;
end fdc_View_Add;
/
