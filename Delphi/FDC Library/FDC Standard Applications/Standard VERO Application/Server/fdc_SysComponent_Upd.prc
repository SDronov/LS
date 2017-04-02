create or replace procedure fdc_SysComponent_Upd
-- �������� ��������� ���������� 
	(
	  pID		               number,           -- ������������� ����������
	  pName			           varchar2,         -- ��������            
    pBase_Type_ID		     number,           -- ������� ��������� ��� ��� ������ � ���������
                                           -- �������� ������������� ����������
	  pShortName		       varchar2 := null, -- �������� ��������
	  pDescript	           varchar2 := null  -- ��������
	)
is
begin
  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- ��������� �������� ���� ���������� � fdc_SysComponent
  update fdc_SysComponent
     set Base_Type_ID = pBase_Type_ID
   where ID = pID;
   
end fdc_SysComponent_Upd;
/
