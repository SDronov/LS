create or replace procedure fdc_SysComponent_Del
-- �������� ��������� ����������
	(
	  pID number,             -- ������������� ����������
    pDoLog number := 1      -- ���������� �� ������� �������� ������� 
                            -- (��������� �� Event?)
                            -- �� ��������� ���������� (�������� 1)
                            -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ������ �� ������� fdc_SysComponent
  delete from fdc_SysComponent
      where ID = pID;

  -- ����� ������� ��������� �������� �������     
  fdc_Object_Del(pID, pDoLog);
end fdc_SysComponent_Del;
/
