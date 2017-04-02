create or replace procedure fdc_User_Group_Task_Del
-- ������ ������ � ������ �������������
	(
	  pUser_Group_ID	number,    -- ������������� ������ �������������
	  pTask_ID	number           -- ������������� ������
	)
is
begin
  delete from fdc_User_Group_Task
     where User_Group_ID = pUser_Group_ID and
	         Task_ID = pTask_ID;
exception
  when others then 
     fdc_util.abort('������ ������ ������ � ������ �������������', 1);            
end fdc_User_Group_Task_Del;
/
