create or replace procedure fdc_Task_SysComponent_Add
-- �������� ��������� ���������� (���������, �����) � ������. 
-- ����� ����� ��� ������������� �� ��� ����� �������� ����� �������������.
	(
	  pTask_ID number,            -- ������������� ������
	  pSysComponent_ID number     -- ������������� ��������� ����������
	)
is
  pCnt number;
begin
-- ������� ������ �� ��� ���������� � ������
  select count(*)
    into pCnt
    from fdc_Task_SysComponent
   where Task_ID = pTask_ID and
	       SysComponent_ID = pSysComponent_ID;

  -- ���� �� ������, �� ��������       
  if (pCnt = 0) then
	   insert into fdc_Task_SysComponent(Task_ID, SysComponent_ID)
	       values(pTask_ID, pSysComponent_ID);
  end if;
end fdc_Task_SysComponent_Add;
/
