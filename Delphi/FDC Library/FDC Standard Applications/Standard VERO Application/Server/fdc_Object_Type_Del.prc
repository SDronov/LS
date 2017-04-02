create or replace procedure fdc_Object_Type_Del
-- Удаление типа объекта
	(
	pID number,                     -- Идентификатор удаляемого типа объекта
	pDoLog number := 1              -- Логировать ли событие удаления объекта 
                                  -- (создавать ли Event?)
                                  -- по умолчанию логировать (значение 1)
                                  -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа удаляемого объекта
  if (fdc_Object_Is(pID, 'ObjectType') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является типом объекта');
  end if;

  -- Удаление всех связок с типами-предками
  delete from fdc_Child_Object_Type
  where	Child_Object_Type_ID = pID;
  
  -- Удаление записи типа в fdc_Object_Type
  delete from fdc_Object_Type
  where	ID = pID;
  
  -- Вызов базовой процедуры удаления объекта
  fdc_Object_Del(pID, pDoLog);

end fdc_Object_Type_Del;
/
