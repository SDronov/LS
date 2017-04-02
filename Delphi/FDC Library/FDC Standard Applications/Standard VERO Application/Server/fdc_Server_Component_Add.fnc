create or replace function fdc_Server_Component_Add
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
  -- ��������, ��� pObject_Type_SysName - ������� 'ServerComponent'
  fdc_Object_Type_Is(pObject_Type_SysName,'ServerComponent');

  -- �������� ������� ������� ���������� ��������� ����������
  pNewID := fdc_SysComponent_Add(pObject_Type_SysName, pName, pBase_Type_ID, pSysName, pShortName, pDescript);

  -- ���������� ������ � ������� fdc_ServerComponent
  insert into fdc_Server_Component(ID)
        values(pNewID);
        
  return pNewID;
end fdc_Server_Component_Add;
/
