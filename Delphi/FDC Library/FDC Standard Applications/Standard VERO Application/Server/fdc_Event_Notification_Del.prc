create or replace procedure fdc_Event_Notification_Del
-- �������� ����������� � �������
  (
  pID number                       -- ������������� ����������� 
  )
is
begin
  -- �������� ���������� � ��������, �� ������� ������ �����������
  delete fdc_subscr_notification SN
  where SN.NOTIFICATION_ID = pID;
  
  -- �������� �����������
  delete fdc_Event_Notification
  where ID = pID;
end fdc_Event_Notification_Del;
/
