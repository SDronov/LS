create or replace procedure fdc_FollowUp_Del
-- Удаление мероприятия
	(
	pID number,                -- Идентификатор адреса
  pDoLog number := 1         -- Логировать ли событие удаления объекта 
                             -- (создавать ли Event?)
                             -- по умолчанию логировать (значение 1)
                             -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа удаляемого объекта
  if (fdc_Object_Is(pID, 'FollowUp') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является мероприятием');
  end if;

  -- удаление записи из таблицы fdc_FollowUp
  delete from fdc_FollowUp
  where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      

end fdc_FollowUp_Del;
/
