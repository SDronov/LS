create or replace procedure fdc_Person_Del
-- Удаление субъекта
	(
	pID number,                     -- Идентификатор удаляемого субъекта        
	pDoLog number := 1              -- Логировать ли событие удаления объекта 
                                  -- (создавать ли Event?)
                                  -- по умолчанию логировать (значение 1)
                                  -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа удаляемого объекта
  if (fdc_Object_Is(pID, 'Person') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является субъектом');
  end if;

  -- Если надо логировать - запись в протокол
  -- Не используем общий механизм логирования удалений через fdc_Object_Del,
  -- т.к. хотим сохранить содержание записи о субъекте
  if pDoLog = 1 then
    fdc_event_add_eventdel(pID, substr(fdc_Object_Get_RowData(pID), 1, 1500));
  end if;
  
  -- Удаление записи из fdc_Person
  delete from fdc_Person
  where ID = pID;
  
  -- Удаление экземпляра объекта
  fdc_Object_Del(pID, 0);
  
end fdc_Person_Del;
/
