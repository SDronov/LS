create or replace procedure fdc_Access_Log_Add
-- Записать в протокол доступа пользователей к объектам
-- например, факт открытия пользователем карточки объекта в приложении
-- Доступ владельца схемы не логируется
	(
	pID number,                                   -- Идентификатор объекта
	pAction_Dict_ID number := 0                   -- Идентификатор типа действия пользователя (по справочнику Dict.AccessAction) 
                                                -- По умолчанию (в случае pAction_Dict_ID = 0) - действие открытия карточки объекта
	)
is
  ppAction_Dict_ID number;
begin
  -- Если пользователь - владелец схемы, то сразу выходим
  if user = fdc_Util.Schema then
    return;
  end if;

  -- Получение и проверка идентификатора по справочнику Dict.AccessAction
  if pAction_Dict_ID = 0 then
    ppAction_Dict_ID := Fdc_Object_Get_Bysysname('Dict.AccessAction', 'Dict_AccessAction_Open');
  else
    if fdc_Object_Is(pAction_Dict_ID, 'Dict.AccessAction') = 1 then
      ppAction_Dict_ID := pAction_Dict_ID;
    else
      fdc_Util.Abort('Неверное значение параметра pAction_Dict_ID='||pAction_Dict_ID||' в процедуре fdc_Access_Log_Add');
    end if;
  end if;

  -- Добавление записи в протокол
	insert into fdc_Access_Log(ID, Object_ID, Action_Dict_ID, Login, Moment)
	values(fdc_Object_Get_NewKey, pID, ppAction_Dict_ID, user, sysdate);

end fdc_Access_Log_Add;
/
