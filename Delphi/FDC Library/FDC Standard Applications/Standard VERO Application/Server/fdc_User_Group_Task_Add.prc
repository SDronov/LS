create or replace procedure fdc_User_Group_Task_Add
-- ���������� ������ �������� ������ �����������
	(
	  pUser_Group_ID number,    -- ������������� ������ �������������
	  pTask_ID number,          -- ������������� ������
    pDoRaiseDupVal number := 1  -- ���������� ��������� �� ����������, ���� ������������
                                -- ��� ������ � ������ ������.
                                -- �� ��������� (�������� <> 0) ���������,
                                -- 0 �� ���������  
	)
is
begin
  insert into fdc_User_Group_Task(User_Group_ID, Task_ID)
      values(pUser_Group_ID, pTask_ID);
exception
  when DUP_VAL_ON_INDEX then 
     if (pDoRaiseDupVal <> 0) then
        fdc_util.abort('������ ������ ��� ���� ������ �������������');   
      else
        return;
     end if;      
  when others then 
     fdc_util.abort('������ ���������� ������ ������ �������������', 1);       
end fdc_User_Group_Task_Add;
/
