create or replace procedure fdc_Event_Notification_Reglam
  (
  pSession_ID number               -- ������������� �������� ��������� ������
  )
is
-- ��������� ����������� �� �������� ���������
-- ����������� ��� ����� ������� � fdc_event
-- �� ������� ������������ ���������
-- ���� ���� ������������ - ��������� �����������
-- ��� ��������� ����������� � �������� ��� ����������� ����������
  pActive number := null;
  pEventTypeGenNotificationsID number;
  pAnyEvents number := 0;
  pNewID number;
begin
  -- ����� �������� ��������� ����������� �� ���������
  fdc_Dispatch.Session_Start(pSession_ID);
  begin
    -- ��������, ���� �� �������� ��������
    begin
      select Active
      into pActive
      from Fdc_Subscription S
      where S.Active = 1 and
            rownum <= 1;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('������ �������� �������� ��������', 1);
    end;
  
    -- ���� ���� �������� �������� - ��������� ������
    if pActive is not null then 
      -- ��������� �������������� ���� ������� ��������� �����������
      pEventTypeGenNotificationsID := Fdc_Object_Type_Get_Bysysname('EventGenNotifications');
      
      -- ������ ���� ������� ������ �� ������� EventGenNotifications
      for rec in (select ID, Event_Type_ID from fdc_Event order by ID desc) loop
        -- ���� ��� ��� ������� EventGenNotifications, �� ����������� ������������
        if rec.event_type_id = pEventTypeGenNotificationsID then
          exit;
        end if;
        
        -- ���� ��� ������ �������������� �������, ������������� ����, 
        -- ��� �����-�� ���������� ������� ����������
        if pAnyEvents = 0 then
          pAnyEvents := 1;
        end if;  
        
        -- ����� ��������� �������� �������� � ��������� �����������
        -- �� ���������� �������
        fdc_Event_Check_Subscription (rec.ID);
        
      end loop; -- ��������� ������� �� ��������
    end if; -- pActive is not null (���� �������� ��������) 
      
    -- ���� ��� ��������� ������� - ������� ������� EventGenNotifications
    if pAnyEvents = 1 then
      pNewID := Fdc_Event_Add(Pevent_Type_Sysname => 'EventGenNotifications', 
                              Pname => '��������� ����������� ���������',
                              Pobject_Id => null);
      commit;                        
    end if; 
    
    -- ���������� ��������
    fdc_Dispatch.Session_Finalize(pSession_ID);
  exception
    when others then
      rollback;
      fdc_Dispatch.Session_Finalize(pSession_ID, fdc_Dispatch.Session_State_Error, sqlerrm);  
  end;
end fdc_Event_Notification_Reglam;
/
