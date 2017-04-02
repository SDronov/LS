create or replace procedure fdc_Subscr_Event_Type_Add
-- ���������� ���� ������� ��� ��������
-- ��� �������� ����� ������� � ���� ������ ������ ����� ��� �������� ������
	(
	pSubscription_ID number,      -- ������������� ��������
	pEvent_Type_ID	 number       -- ������������� ���� �������
	)
is
  ppEvent_Type_ID number;
begin
  -- ��������, ���� �� ��� � ��������
  -- �������� ��� �������, ���� ��� ������������ ����
  begin
    select E.Event_Type_ID
    into ppEvent_Type_ID
    from Fdc_Subscr_Event_Type E,
         Fdc_Child_Object_Type COT
    where E.Subscription_Id = pSubscription_ID and
          E.EVENT_TYPE_ID = COT.Object_Type_Id and
          COT.Child_Object_Type_Id = pEvent_Type_ID;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ �������� ������������� ���� ������� ��� ��������', 1);
  end;  
        
  -- ���� ��� ������������ ����� �������, ���� �������� �������� ���      
  if ppEvent_Type_ID is null then      
    -- �������� ���� ����� ����� ������� ������
    for rec in (
      select E.Event_Type_ID
      into ppEvent_Type_ID
      from Fdc_Subscr_Event_Type E,
           Fdc_Child_Object_Type COT
      where E.Subscription_Id = pSubscription_ID and
            E.EVENT_TYPE_ID = COT.Child_Object_Type_Id and
            COT.Object_Type_Id = pEvent_Type_ID) loop
      delete from Fdc_Subscr_Event_Type E
      where E.Subscription_Id = pSubscription_ID and
            E.Event_Type_Id = rec.Event_Type_ID;
    end loop;        
    
    -- ���������� ��������� ���� ������� ��� ��������
    insert into fdc_subscr_event_type
      (subscription_id, event_type_id)
    values
      (psubscription_id, pevent_type_id);        
  end if;    

end fdc_Subscr_Event_Type_Add;
/
