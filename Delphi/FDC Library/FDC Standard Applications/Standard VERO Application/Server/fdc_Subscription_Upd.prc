create or replace procedure fdc_Subscription_Upd
-- Изменение атрибутов подписки
	(
	pID		number,                               -- Идентификатор подписки  
	pName			varchar2,                         -- Наименование подписки (если пустое, генерируется автоматически)
  pShortName    varchar2,                     -- Краткое наименование подписки (если пустое, вносится как пустое в таблицу)
	pStopDate	date := null,                     -- Момент окончания действия подписки
	pDescript	varchar2 := null                  -- Комментарий
	)
is
  pSubscription fdc_Subscription%rowtype;
  ppActive number := 0;
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Subscription') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является подпиской');
  end if;

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- Получение старого значения
  begin
    select *
    into pSubscription
    from fdc_Subscription
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найдена подписка ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений подписки ID='||pID, 1);
  end;

  -- Изменение атрибутов записи fdc_Subscription
  if nvl(pSubscription.Stopdate, sysdate - 3650) <> nvl(pStopdate, sysdate - 3650) then
    if sysdate >= pSubscription.StartDate and sysdate <= nvl(pStopDate, sysdate + 1) then    
      ppActive := 1;
    end if;  
    update fdc_Subscription
    set Stopdate = pStopdate,
        Active = Ppactive
    where ID = pID;
  end if;

end fdc_Subscription_Upd;
/
