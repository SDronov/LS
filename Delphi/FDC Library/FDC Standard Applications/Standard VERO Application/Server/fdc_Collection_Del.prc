create or replace procedure fdc_Collection_Del
-- Удаление подборки
	(
  pID number,                -- Идентификатор подборки               
  pDoLog number := 1         -- Логировать ли событие удаления объекта 
                             -- (создавать ли Event?)
                             -- по умолчанию логировать (значение 1)
                             -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа удаляемого объекта
  if (fdc_Object_Is(pID, 'Collection') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является подборкой');
  end if;

  -- удаление записи из таблицы fdc_Collection_Object
  delete from fdc_Collection_Object
      where Collection_ID = pID;

  -- удаление записи из таблицы fdc_Collection
  delete from fdc_Collection
      where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Collection_Del;
/
