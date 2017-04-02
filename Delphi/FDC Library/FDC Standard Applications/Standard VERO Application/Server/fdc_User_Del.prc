create or replace procedure fdc_User_Del
-- �������� ������������
	(
	  pID number,          -- ������������� ������������
    pDoLog number := 1   -- ���������� �� ������� �������� ������� 
                         -- (��������� �� Event?)
                         -- �� ��������� ���������� (�������� 1)
                         -- ��� �������� 0 ���������� �� ����
	)
is
begin
    -- �������� ������ �� ������� fdc_User 
    delete from fdc_User
        where ID = pID;

    -- ����� ������� ��������� �������� �������    
    fdc_Object_Del(pID, PDoLog);
end fdc_User_Del;
/
