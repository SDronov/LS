create or replace procedure fdc_View_Del
-- �������� �������������
	(
	  pID number,            -- ������������� �������������
    pDoLog number := 1     -- ���������� �� ������� �������� ������� 
                           -- (��������� �� Event?)
                           -- �� ��������� ���������� (�������� 1)
                           -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_View
  delete from fdc_View
      where ID = pID;

  -- ����� ������� ��������� �������� ��������� ����������      
  fdc_Server_Component_Del(pID, pDoLog);
end fdc_View_Del;
/
