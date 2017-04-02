create or replace function fdc_Task_Add
-- ������� ����� ������ � ���������� �� �������������
	(
	  pObject_Type_SysName	varchar2,         -- ��������� ��� ���������� ���� ������
	  pName			            varchar2,         -- ��������
    pSysName              varchar2,         -- ��������� ��� ������
    pShortName		        varchar2 := null, -- �������� ��������
	  pDescript		          varchar2 := null  -- ��������
	)
    return number
is
  pNewID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'Task'
  fdc_Object_Type_Is(pObject_Type_SysName,'Task');

  -- ������� ������ ������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);
 
  -- ���� ����������� ������ ������ ��������������� ����� � ����� ������
  fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);

  -- ������� ������ � ������� fdc_Table
  insert into fdc_Task(ID)
      values(pNewID);

  -- ���������� ������������� ����� ������    
  return pNewID;
end fdc_Task_Add;
/
