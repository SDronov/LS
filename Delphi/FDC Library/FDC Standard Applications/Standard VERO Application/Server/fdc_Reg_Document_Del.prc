create or replace procedure fdc_Reg_Document_Del
-- Удаление  регистрационного документа
	(
	pID number,                -- Идентификатор  регистрационного документа
  pDoLog number := 1         -- Логировать ли событие удаления объекта 
                             -- (создавать ли Event?)
                             -- по умолчанию логировать (значение 1)
                             -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа удаляемого объекта
  if (fdc_Object_Is(pID, 'RegDocument') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является регистрационным документом');
  end if;

  -- удаление записи из таблицы fdc_Reg_Document
  delete from fdc_Reg_Document
  where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Reg_Document_Del;
/
