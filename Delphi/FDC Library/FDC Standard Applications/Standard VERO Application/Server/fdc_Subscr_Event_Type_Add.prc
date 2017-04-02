create or replace procedure fdc_Subscr_Event_Type_Add
-- Добавление типа события для подписки
-- Для иерархии типов событий в этом списке всегда лежит тип верхнего уровня
	(
	pSubscription_ID number,      -- Идентификатор подписки
	pEvent_Type_ID	 number       -- Идентификатор типа события
	)
is
  ppEvent_Type_ID number;
begin
  -- Проверка, есть ли уже в подписке
  -- заданный тип события, либо его родительские типы
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
  	when others then fdc_util.Abort('Ошибка проверки родительского типа события для подписки', 1);
  end;  
        
  -- Если нет родительских типов событий, надо добавить заданный тип      
  if ppEvent_Type_ID is null then      
    -- Удаление всех типов более нижнего уровня
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
    
    -- Добавление заданного типа событий для подписки
    insert into fdc_subscr_event_type
      (subscription_id, event_type_id)
    values
      (psubscription_id, pevent_type_id);        
  end if;    

end fdc_Subscr_Event_Type_Add;
/
