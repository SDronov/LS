create or replace procedure fdc_Subscr_Event_Type_Del
-- �������� ���� ������� ��� ��������
	(
	pSubscription_ID number,      -- ������������� ��������
	pEvent_Type_ID	 number       -- ������������� ���� �������
	)
is
begin
  -- �������� ������ � fdc_Subscr_Event_Type
  delete from fdc_Subscr_Event_Type
  where   Subscription_ID = pSubscription_ID and
  	      Event_Type_ID = pEvent_Type_ID;

end fdc_Subscr_Event_Type_Del;
/
