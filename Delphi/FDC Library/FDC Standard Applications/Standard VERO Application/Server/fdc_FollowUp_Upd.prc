create or replace procedure fdc_FollowUp_Upd
-- Изменение атрибутов мероприятия
	(
	pID		number,                               -- Идентификатор мероприятия
	pName		varchar2,                           -- Наименование мероприятия
	pObject_ID		number,                       -- Объект мероприятия (объект, по которому проводится мероприятие)
	pMomentPlan		date,                         -- Запланированный срок
	pMomentFact		date,                         -- Запланированный срок
	pResp_User_ID		number,                     -- Ответственный за мероприятие (ID пользователя)
	pDoer_User_ID		number,                     -- Исполнитель (ID пользователя)
  pResult varchar2,                           -- Резюме по результатам исполнения
	pShortName			varchar2,                   -- Краткое наименование
	pDescript		varchar2                        -- Комментарий
	)
is
  pFollowup   fdc_Followup%rowtype;
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'FollowUp') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является регистрационным мероприятием');
  end if;

  -- Сначала изменение атрибутов объекта со всяческими проверками
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- Получение старого значения
  begin
    select *
    into pFollowup
    from fdc_Followup
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке изменения не найдено мероприятие ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения значений мероприятия ID='||pID, 1);
  end;

  -- Изменение атрибутов записи fdc_Followup
  if nvl(pFollowup.Object_Id, 0) <> nvl(pObject_ID, 0) or
     nvl(pFollowup.Momentplan, to_date('01.01.1800', 'DD.MM.YYYY')) <> nvl(pMomentplan, to_date('01.01.1800', 'DD.MM.YYYY')) or
     nvl(pFollowup.Momentfact, to_date('01.01.1800', 'DD.MM.YYYY')) <> nvl(pMomentfact, to_date('01.01.1800', 'DD.MM.YYYY')) or
     nvl(pFollowup.Resp_User_ID, 0) <> nvl(pResp_User_ID, 0) or
     nvl(pFollowup.Doer_User_ID, 0) <> nvl(pDoer_User_ID, 0) or
     nvl(pFollowup.Result, 'No name') <> nvl(pResult, 'No name') then
    update Fdc_Followup
    set Object_ID=pObject_ID,
        MomentPlan=pMomentPlan,
        Resp_User_ID=pResp_User_ID,
        Doer_User_ID=pDoer_User_ID
    where ID = pID;
  end if;   
  
  -- Довыдача прав при изменении вовлеченных в мероприятие пользователей
  -- Права исполнителю на изменение
  if pResp_User_ID is not null then
    fdc_Object_Grant_Upd(pID, pDoer_User_ID, 2, 1, 1);
  end if;

  if pDoer_User_ID is not null then
    fdc_Object_Grant_Upd(pID, pDoer_User_ID, 2, 1, 1);
  end if;

end fdc_FollowUp_Upd;
/
