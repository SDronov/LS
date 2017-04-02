create or replace procedure fdc_ValueRef_Sys_Set
-- �������� ������ �� ������ ��������� ��������� �� �� ���������� �����
	(
	  pSysName	varchar2,       -- ��������� ���  
    pRef_Object_ID number     -- ��������� �������� �������� 
	)
is
  pRefName varchar(1500);
begin
  -- �������� ��� �������, �� ������� �������� ������
  -- ���� �� �����, �� ����������
  pRefName := fdc_Object_Get_Name(pRef_Object_ID); 

  -- �������� ������� ��������� ��������� ���������
  fdc_Value_Sys_Set(pSysName, pRefName, null, null, pRef_Object_ID);
   
end fdc_ValueRef_Sys_Set;