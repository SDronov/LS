create or replace procedure fdc_Task_SysComponent_Del
-- ������� ��������� ���������� (���������, �����) �� ������. 
-- ����� ������� ����� �� ��� ���������� �� �����.
	(
	  pTask_ID number,              -- ������������� ������
	  pSysComponent_ID number       -- ������������� ��������� ����������
	)
is
begin
  delete from fdc_Task_SysComponent
       where Task_ID = pTask_ID and
	           SysComponent_ID = pSysComponent_ID;
exception
  when others then 
     fdc_util.abort('������ �������� ��������� ���������� �� ������', 1);                         
end fdc_Task_SysComponent_Del;
/
