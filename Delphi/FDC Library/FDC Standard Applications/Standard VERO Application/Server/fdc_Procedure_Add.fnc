create or replace function fdc_Procedure_Add
-- ������� ����� ��������� � ���������� �� ������������� 
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
  -- ��������, ��� pObject_Type_SysName - ������� 'Procedure'
  fdc_Object_Type_Is(pObject_Type_SysName,'Procedure');

  -- �������� ������� ������� ���������� ��������� ����������
  pNewID := fdc_Server_Component_Add(pObject_Type_SysName, pName, pBase_Type_ID, pSysName, pShortName, pDescript);

  -- ���������� ������ � ������� fdc_Procedure
  insert into fdc_Procedure(ID)
      values(pNewID);

  -- ������������ ��������� � ��������� Del �� ����� ��� ��������� ��������
  -- ��� ��������� �����, ������� ���������� ��������    
  if (upper(pSysName) like '%DEL') then
	   fdc_Procedure_Reg_DelProc(pNewID);
  end if;

  return pNewID;
end fdc_Procedure_Add;
/
