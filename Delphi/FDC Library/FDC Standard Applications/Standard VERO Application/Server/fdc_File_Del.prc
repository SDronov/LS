create or replace procedure fdc_File_Del
-- �������� �����
	(
	  pID number,                -- ������������� �������
    pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                               -- (��������� �� Event?)
                               -- �� ��������� ���������� (�������� 1)
                               -- ��� �������� 0 ���������� �� ����pID number
	)
is
begin
  -- �������� ������ �� ������� fdc_File
  delete from fdc_File
     where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);         

end fdc_File_Del;
/
