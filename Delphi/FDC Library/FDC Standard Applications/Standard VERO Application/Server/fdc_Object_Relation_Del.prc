create or replace procedure fdc_Object_Relation_Del
-- ������� ��������� ����� ���������
	(
	  pID number,                -- ������������� ���������
    pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                               -- (��������� �� Event?)
                               -- �� ��������� ���������� (�������� 1)
                               -- ��� �������� 0 ���������� �� ����pID number
	)
is
begin
  -- �������� ������ �� ������� Fdc_Object_Relation
  delete from Fdc_Object_Relation
      where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);

end fdc_Object_Relation_Del;
/
