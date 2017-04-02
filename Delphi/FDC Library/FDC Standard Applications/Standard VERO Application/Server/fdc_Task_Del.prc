create or replace procedure fdc_Task_Del
-- �������� ������
	(
	  pID number,                -- ������������� ������
    pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                               -- (��������� �� Event?)
                               -- �� ��������� ���������� (�������� 1)
                               -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_Task
  delete from fdc_Task
      where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);
end fdc_Task_Del;
/
