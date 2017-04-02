create or replace procedure fdc_Session_Del
-- �������� �������� ��������� ������
	(
	pID number,                -- ������������� �������� ��������� ������  
  pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'Session') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ��������� ��������� ������');
  end if;

  -- �������� ������ �� ������� fdc_Session
  delete from fdc_Session
  where ID = pID;

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Session_Del;
/
