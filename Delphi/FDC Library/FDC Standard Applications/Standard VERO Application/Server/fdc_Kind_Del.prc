create or replace procedure fdc_Kind_Del
-- �������� �������
	(
	  pID number,                -- ������������� �������
    pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                               -- (��������� �� Event?)
                               -- �� ��������� ���������� (�������� 1)
                               -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_Kind
  delete from fdc_Kind
      where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      
end fdc_Kind_Del;
/
