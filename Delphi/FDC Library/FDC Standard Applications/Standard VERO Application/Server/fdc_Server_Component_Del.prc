create or replace procedure fdc_Server_Component_Del
-- �������� ��������� ����������
	(
	  pID number,           -- ������������� ����������
    pDoLog number := 1    -- ���������� �� ������� �������� ������� 
                          -- (��������� �� Event?)
                          -- �� ��������� ���������� (�������� 1)
                          -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_Server_Component
  delete from fdc_Server_Component
     where ID = pID;

  -- ����� ������� ��������� �������� ��������� ����������       
  fdc_SysComponent_Del(pID, pDoLog);
end fdc_Server_Component_Del;
/
