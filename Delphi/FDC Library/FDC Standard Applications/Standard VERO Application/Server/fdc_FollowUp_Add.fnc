create or replace function fdc_FollowUp_Add
-- Создание мероприятия
	(
	pObject_Type_SysName	varchar2,             -- Системное имя типа мероприятия (должен быть подтипом 'FollowUp') 
	pName			varchar2,                         -- Наименование 
	pObject_ID		number,                       -- Объект мероприятия (объект, по которому проводится мероприятие)
	pMomentPlan		date,                         -- Запланированный срок
	pResp_User_ID		number,                     -- Ответственный за мероприятие (ID пользователя)
	pDoer_User_ID		number := null,             -- Исполнитель (ID пользователя)
	pShortName			varchar2 := null,           -- Краткое наименование
	pDescript		varchar2 := null                -- Комментарий
	)
return number
is
  pNewID number(15);
  pCurrUser number(15);
begin
  -- Проверка типа рег. документа  
  fdc_Object_Type_Is(pObject_Type_SysName,'FollowUp');
  
  -- Создание экземпляра объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, null, nvl(pShortName, pName), pDescript);

  -- Даем пользователю, создавшему мероприятие права на изменение и раздачу прав на объект
  fdc_Object_Grant_Upd(pNewID, Fdc_User_Get, 3, 1);
  
  -- Права ответственному на изменение
  if pResp_User_ID is not null then
    fdc_Object_Grant_Upd(pNewID, pResp_User_ID, 2, 1);
  end if;

  -- Права исполнителю на изменение
  if pDoer_User_ID is not null then
    fdc_Object_Grant_Upd(pNewID, pDoer_User_ID, 2, 1);
  end if;

  -- Создание записи в fdc_Followup
  insert into fdc_FollowUp(ID,Object_ID, MomentPlan, MomentFact, Resp_User_ID, Doer_User_ID, Result)
  values(pNewID,pObject_ID, pMomentPlan, null, nvl(pResp_User_ID,pCurrUser), pDoer_User_ID, null);
  
  return pNewID;

end fdc_FollowUp_Add;
/
