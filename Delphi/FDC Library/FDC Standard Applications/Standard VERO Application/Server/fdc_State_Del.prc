create or replace procedure fdc_State_Del
-- �������� ���������
	(
	  pID number,           -- ������������� ���������
    pDoLog number := 1    -- ���������� �� ������� �������� ������� 
                          -- (��������� �� Event?)
                          -- �� ��������� ���������� (�������� 1)
                          -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_State
  delete from fdc_State
     where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);
end fdc_State_Del;
/
