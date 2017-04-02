create or replace procedure fdc_Event_Notification_Check
-- ������� � ��������� ����������� � �������
  (
  pID number                       -- ������������� ����������� 
  )
is
  pNotification fdc_Event_Notification%rowtype;
begin
  -- ��������� ������ ����������� �� ��
  begin
    select *
    into pNotification
    from fdc_Event_Notification 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������� ����������� ID = '||pID);
  	when others then fdc_util.Abort('������ �������� ������������� ���� ������� ��� ��������', 1);
  end;  

  -- ��������, �� ���� �� ��������� �����
  if pNotification.Checked = 1 then
    fdc_util.Abort('����������� ��� ���� �������� ��� ���c���������');
  end if;

  -- ����������� ������� � ���� ���������
  update fdc_Event_Notification E
  set E.Checked = 1,
      E.Check_Date = sysdate
  where ID = pID;    
    
end  fdc_Event_Notification_Check;
/
