create or replace procedure fdc_Dict_Del
-- Удаление позиции справочника
	(
	pID	number,                     -- Идентификатор позиции справочника
	pDoLog number := 1              -- Логировать ли событие удаления объекта 
                                  -- (создавать ли Event?)
                                  -- по умолчанию логировать (значение 1)
                                  -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа позиции справочника
  if (fdc_Object_Is(pID, 'Dict') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является позицией справочника');
  end if;

  -- Удаление записи fdc_Dict
  delete from fdc_Dict
  where ID = pID;
  
  -- Удаление экземпляра объекта
  fdc_Object_Del(pID, pDoLog);

end fdc_Dict_Del;
/
