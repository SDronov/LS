create or replace procedure fdc_Subscription_Set_Active
-- Установка флага активности подписки
	(
	pID		number                               -- Идентификатор подписки  
	)
is
  pSubscription fdc_Subscription%rowtype;
  ppActive number := 0;
begin
  
  -- Получение записи подписки
  begin
    select *
    into pSubscription
    from fdc_Subscription
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При установки флага активности не найдена подписка ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений подписки ID='||pID, 1);
  end;

  -- Определение значения ppActive
  if sysdate >= pSubscription.StartDate and sysdate <= nvl(pSubscription.StopDate, sysdate + 1) then    
    ppActive := 1;
  end if;  
  
  -- Если нужно - update записи fdc_Subscription
  if ppActive <> pSubscription.Active then
    update fdc_Subscription
    set Active = Ppactive
    where ID = pID;
  end if;

end fdc_Subscription_Set_Active;
/
