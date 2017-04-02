create or replace procedure fdc_Event_Del
-- Удаление события
-- Права на это есть по умолчанию только у администраторов данных (AdminData)
-- и владельца схемы
-- Это базовая процедура, которая может быть переопределена для типов событий - наследников
	(
	pID number,               -- Идентификатор удаляемого события
	pDoLog number := 0        -- Логировать ли событие удаления объекта 
                            -- в данном случае - фиктивеый параметр для совместимости с fdc_Object_Free
	)
is
  pChkID number;
begin
  -- Проверка полномочий пользователя
  if (fdc_User_Is_AdminData(0, 0) = 0) and (user <>Fdc_Util.Schema) then
    fdc_Util.Abort('Удалять события может только администратор данных или владелец схемы приложения!');
  end if;
  
  -- Удаление записи EventState (если это событие изменения состояния)
  delete from fdc_Event_State
  where ID = pID;
  
  -- Удаление записи события
  delete from fdc_Event
  where ID = pID;
  
end fdc_Event_Del;
/
