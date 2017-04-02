create or replace procedure fdc_Subscription_Del
-- �������� ��������
	(
  pID number,                -- ������������� ��������               
  pDoLog number := 1         -- ���������� �� ������� �������� ������� 
                             -- (��������� �� Event?)
                             -- �� ��������� ���������� (�������� 1)
                             -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Subscription') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������');
  end if;

  -- �������� ������� � �������� � ����� ������� � ��������
  delete from Fdc_Subscr_Event_Type
  where subscription_id = pID;
  delete Fdc_Subscription
  where ID = pID;
  -- ��� ����, ���� ���� ����������� �� ���� ��������,
  -- �� ��������� ����������� �� ���� �������
  

  -- ����� ������� ��������� �������� �������    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Subscription_Del;
/
