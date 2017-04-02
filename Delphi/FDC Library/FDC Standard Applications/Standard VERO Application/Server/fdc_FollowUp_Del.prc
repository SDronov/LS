create or replace procedure fdc_FollowUp_Del
-- �������� �����������
	(
	pID number,                -- ������������� ������
  pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'FollowUp') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ������������');
  end if;

  -- �������� ������ �� ������� fdc_FollowUp
  delete from fdc_FollowUp
  where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      

end fdc_FollowUp_Del;
/
