create or replace procedure fdc_Event_Check_Subscription
-- �������� �� �������, ��� �� �� ���� �������� � �� ����� �� ������� ����-������ �����������
-- ���� ��������� ���������� �������� �������� (��� ���������), ������������ �����������
-- � ������� ������ ���� ���������� ���������� ������������ ���������� fdc_event_notification_reglam,
-- ����������� ��� ����������� ����������
  (
  pID number                -- ������������� �������
  )
is
  pEvent fdc_Event%rowtype;  
  pObject fdc_Object%rowtype;
  -- �� ������� ������� ����� ������������� ������ ��������,
  -- � ����� �� ����� ������ ����������� �����������
  type TSubscriptionLst is table of number index by varchar2(15);
  SubscriptionLst TSubscriptionLst;
  pSubscription_Ind varchar2(15);
  pSubscription_ID number;
  pAddressee_ID number;
  -------------------------------------------------
  function lEvent_Type_Fit (pEvent_Type_ID number,
                            pSubscription_ID number) 
  return boolean
  is
    pChkId number := null;
  begin
    -- ��������, ��� �� �������� ���� ������ ��� �������    
    begin
      select ST.EVENT_TYPE_ID
      into pChkID
      from Fdc_Subscr_Event_Type ST,
           fdc_Child_Object_Type COT
      where ST.SUBSCRIPTION_ID = pSubscription_ID and
            ST.EVENT_TYPE_ID = COT.OBJECT_TYPE_ID and
            COT.Child_Object_Type_Id = pEvent_Type_ID and
            rownum <= 1;
    exception
      when no_data_found then
        pChkID := 0;
      when others then fdc_util.abort('������ �������� ���� � �������� �� �������:', 1);     
    end;    
    -- ���� ������ ��� ������� �� ������, ��������� - 
    -- ����� ����, �� �������� ��� ����������� �� ���� �������
    if pChkID = 0 then
      begin
        select ST.EVENT_TYPE_ID
        into pChkID
        from Fdc_Subscr_Event_Type ST
        where ST.SUBSCRIPTION_ID = pSubscription_ID and
              rownum <= 1;
        pChkID := 0;
      exception
        when no_data_found then
          pChkID := 1;
        when others then fdc_util.abort('������ �������� ���� � �������� �� �������:', 1);     
      end;    
    end if;
    return (pChkID > 0);
  end lEvent_Type_Fit;                          
  -------------------------------------------------
begin
  -- ��������� ���������� �� �������
  begin
    select *
    into pEvent
    from Fdc_Event
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.abort('�� ������� ������� �� ID='||pID);
  	when others then fdc_util.abort('������ ��������� ���������� �� �������:', 1);
  end;
  
  -- ��������� ���������� �� �������
  if pEvent.Object_ID is not null then
    begin
      select *
      into pObject
      from Fdc_Object
      where ID = pEvent.Object_ID;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('������ ��������� ���������� �� �������:', 1);
    end;
  end if;
  
  -- ��������, ��� �� �������� ��� ���� ��� ������� ��� ��� ������
  -- ��� ������ ������� ��������
  for rec1 in (
    select S.ID
    from Fdc_Subscription S,
         Fdc_Subscr_Event_Type ST,
         Fdc_Child_Object_Type COT
    where S.Active = 1 and
          S.OBJECT_ID is null and
          S.ID = ST.SUBSCRIPTION_ID and
          ST.EVENT_TYPE_ID = COT.OBJECT_TYPE_ID and
          pEvent.Event_Type_ID = COT.CHILD_OBJECT_TYPE_ID) loop
    SubscriptionLst(to_char(rec1.ID)) := rec1.ID;      
  end loop;        
         
  if pEvent.Object_ID is not null then       
    -- ��������, ��� �� �������� �� ���� ��������� �������
    for rec1 in (
      select S.ID
      from Fdc_Subscription S
      where S.Active = 1 and
            S.OBJECT_ID = pEvent.Object_ID) loop
        if lEvent_Type_Fit(pEvent.Event_Type_ID, rec1.ID) then
          SubscriptionLst(to_char(rec1.ID)) := rec1.ID;      
        end if;  
    end loop;        
    
    -- ��������, ��� �� �������� �� ���� ��� ������� ���� ��� �������
    for rec1 in (
      select S.ID
      from Fdc_Subscription S,
           fdc_Child_Object_Type COT
      where S.Active = 1 and
            S.OBJECT_ID = COT.OBJECT_TYPE_ID and
            COT.CHILD_OBJECT_TYPE_ID = pObject.Object_Type_Id) loop
        if lEvent_Type_Fit(pEvent.Event_Type_ID, rec1.ID) then
          SubscriptionLst(to_char(rec1.ID)) := rec1.ID;      
        end if;  
    end loop;  
    
    -- �� ���, ��� ������� �� ������������ �������� ���������, ������� ������ SubscriptionLst
    -- ������ �� ���� ����� ������������� �����������
    -- ���� �� ������ ��������
    pSubscription_Ind := SubscriptionLst.first;
    while pSubscription_Ind is not null loop
      pSubscription_ID := SubscriptionLst(pSubscription_Ind);
      begin
        select S.ADDRESSEE_ID
        into pAddressee_ID
        from Fdc_Subscription S
        where ID = pSubscription_ID;
      exception
    	  when NO_DATA_FOUND then fdc_util.abort('�� ������� �������� �� ID='||pSubscription_ID);
      	when others then fdc_util.abort('������ ��������� ���������� � ��������:', 1);
      end;
      if Fdc_Object_Is(pAddressee_ID, 'User') = 1 then
        fdc_event_notification_add(pevent_id => pID,
                                   puser_id => pAddressee_ID,
                                   psubscription_id => pSubscription_ID);
      elsif Fdc_Object_Is(pAddressee_ID, 'UserGroup') = 1 then
        for rec2 in (select UG.USER_ID
                     from Fdc_User_In_Group UG
                     where UG.USER_GROUP_ID = pAddressee_ID) loop
        fdc_event_notification_add(pevent_id => pID,
                                   puser_id => rec2.User_ID,
                                   psubscription_id => pSubscription_ID);
        end loop;            
      else
        fdc_util.abort('�������� ��� �������� �� �������� ID='||pSubscription_ID);
      end if;
      pSubscription_Ind := SubscriptionLst.next(pSubscription_Ind);
    end loop;
          
  end if;  -- rec.Object_ID is not null
end fdc_Event_Check_Subscription;
/
