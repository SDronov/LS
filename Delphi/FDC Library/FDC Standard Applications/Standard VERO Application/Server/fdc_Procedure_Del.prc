create or replace procedure fdc_Procedure_Del
-- �������� ���������
	(
	  pID number,             -- ������������� ���������
    pDoLog number := 1      -- ���������� �� ������� �������� ������� 
                            -- (��������� �� Event?)
                            -- �� ��������� ���������� (�������� 1)
                            -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_Procedure
  delete from fdc_Procedure
      where ID = pID;

  -- ����� ������� ��������� �������� ��������� ����������    
  fdc_Server_Component_Del(pID, pDoLog);
end fdc_Procedure_Del;
/
