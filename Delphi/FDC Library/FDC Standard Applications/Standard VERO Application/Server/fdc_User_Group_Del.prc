create or replace procedure fdc_User_Group_Del
-- �������� ������ �������������
	(
	  pID number,              -- ������������� ������
    pDoLog number := 1       -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� �� ������� fdc_User_Group
  delete from fdc_User_Group
       where ID = pID;

  -- ����� ������� ��������� �������� �������     
  fdc_Object_Del(pID, pDoLog);
end fdc_User_Group_Del;
/
