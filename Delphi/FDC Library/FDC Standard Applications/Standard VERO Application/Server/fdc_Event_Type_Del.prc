create or replace procedure fdc_Event_Type_Del
-- �������� ���� �������
	(
	pID number,                     -- ������������� ���� �������
	pDoLog number := 1              -- ���������� �� ������� �������� ������� 
                                  -- (��������� �� Event?)
                                  -- �� ��������� ���������� (�������� 1)
                                  -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ ���� ������� � fdc_Event_Type
  delete from fdc_Event_Type
  where ID = pID;
  
  -- ����� ����� ��������� �������� ���������� ����
  fdc_Object_Type_Del(pID, pDoLog);
  
end fdc_Event_Type_Del;
/
