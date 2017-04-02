create or replace procedure fdc_State_Scheme_Del
-- �������� ����� ���������
	(
	  pID number,           -- ������������� �����
    pDoLog number := 1    -- ���������� �� ������� �������� ������� 
                          -- (��������� �� Event?)
                          -- �� ��������� ���������� (�������� 1)
                          -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_State_Scheme
  delete from fdc_State_Scheme
    where ID = pID;
    
  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);  
end fdc_State_Scheme_Del;
/
