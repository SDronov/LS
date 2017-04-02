create or replace procedure fdc_Event_Add_EventState
-- Создание экземпляра события перехода состояния
	(
	pEvent_Type_SysName	varchar2,                  -- системное имя типа события
	pObject_ID		number,                          -- объект, по которому произошло событие
	pState_Transit_ID	number                       -- идентификатор перехода состояния
	)
is
  pNewID number(15);
  pName varchar2(1500);
begin
  -- Проверка типа события  
  fdc_Object_Type_Is(pEvent_Type_SysName,'EventState');

  -- Получение названия события
  begin
    select	'Выполнено "'||Name||'"'||' по '||fdc_Object_Get_Name(pObject_ID, 0, 1)
    into	pName
    from	fdc_Object
    where	ID = pState_Transit_ID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не определен переход состояния по ID = '||pState_Transit_ID);
  	when others then fdc_util.Abort('Ошибка поучения перехода состояния по ID = '||pState_Transit_ID, 1);
  end;
  
  -- Создание события
  pNewID := fdc_Event_Add('EventState', pName, pObject_ID);
  
  -- Добавление записи в таблицу fdc_Event_State
  insert into fdc_Event_State(ID,State_Transit_ID)
  values(pNewID,pState_Transit_ID);
end fdc_Event_Add_EventState;
/
