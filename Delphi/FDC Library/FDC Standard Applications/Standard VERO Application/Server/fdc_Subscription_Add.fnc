create or replace function fdc_Subscription_Add
-- Создание подписки на события
	(
	pObject_Type_SysName	varchar2,             -- Системное имя типа подписки (должен быть подтипом 'Subscription') 
	pName			varchar2,                         -- Наименование подписки (если пустое, генерируется автоматически)
  pShortName    varchar2,                     -- Краткое наименование подписки (если пустое, вносится как пустое в таблицу)
	pAddressee_ID    number,                    -- Идентификатор адресата подписки (пользователь или группа)
	pObject_ID	number,                         -- Идентификатор объекта подписки
  pEvidence_ID number,                        -- Идентификатор основания подписки
	pStartDate	date := null,                   -- Момент начала действия подписки                          -- 
	pStopDate	date := null,                     -- Момент окончания действия подписки
	pDescript	varchar2 := null                  -- Комментарий
	)
return number
is
  pNewID number(15);
  ppUser_ID number(15);
  ppName varchar2(1500);
  ppStartDate date;
  ppActive number := 0;
begin

  -- Проверка типа подборки  
  fdc_Object_Type_Is(pObject_Type_SysName,'Subscription');
  
  -- Получение идентификатора текущего пользователя
  ppUser_ID := fdc_User_Get;
  
  -- Проверка адресата
  if not (Fdc_Object_Is(pAddressee_ID, 'User') = 1 or Fdc_Object_Is(pAddressee_ID, 'UserGroup') = 1) then
    Fdc_Util.Abort('Адресатом подписки может быть только пользователь или группа пользователей');
  end if;
  
  -- Назначение момента начала подписки
  ppStartDate := nvl(pStartDate, sysdate);
  if sysdate >= ppStartDate and sysdate <= nvl(pStopDate, sysdate + 1) then    
    ppActive := 1;
  end if;  

  -- Назначение назание
  if pName is null then
    if pObject_ID is null then
      ppName := 'Контроль событий на '||Fdc_Object_Get_Name(pAddressee_ID);
    else
      ppName := 'Контроль по '||Fdc_Object_Get_Name(pObject_ID, 1);
    end if;
  else
    ppName := pName;
  end if;  
  
  -- Создание экземпляра объекта (общий доступ закрыт)
  pNewID := fdc_Object_Add(pObject_Type_SysName, ppName, 0, null, null, pShortName, pDescript);

  -- Даем пользователю права на изменение и раздачу прав на объект
  fdc_Object_Grant_Upd(pNewID, ppUser_ID, 3, 1);
  
  -- Даем права адресату
  fdc_Object_Grant_Upd(pNewID, pAddressee_ID, 1, 1);
  
  -- Добавление записи в fdc_Subscription
  insert into fdc_subscription
    (id, addressee_id, object_id, evidence_id, active, startdate, stopdate)
  values
    (pNewID, paddressee_id, pobject_id, pevidence_id, ppActive, ppStartDate, pstopdate);

  -- Возврат значения
  return pNewID;

end fdc_Subscription_Add;
/
