create or replace procedure fdc_Object_Kind_Del
-- �������� ������� �������
	(
	  pID number,            -- ������������� ������� �������
    pDoLog number := 1     -- ���������� �� ������� �������� ������� 
                           -- (��������� �� Event?)
                           -- �� ��������� ���������� (�������� 1)
                           -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_Task
  delete from fdc_Object_Kind
      where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);
end fdc_Object_Kind_Del;
/
