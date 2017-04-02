create or replace procedure fdc_Value_Del
-- �������� ��������������� ��������
	(
	  pID number,           -- ������������� ��������
    pDoLog number := 1    -- ���������� �� ������� �������� ������� 
                          -- (��������� �� Event?)
                          -- �� ��������� ���������� (�������� 1)
                          -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_Value
  delete from fdc_Value
      where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);
end fdc_Value_Del;
/
