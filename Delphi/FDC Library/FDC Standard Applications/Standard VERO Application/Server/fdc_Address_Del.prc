create or replace procedure fdc_Address_Del
-- Удаление адреса
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
  if (fdc_Object_Is(pID, 'Address') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является адресом');
  end if;

  -- удаление записи из таблицы fdc_Address
  delete from fdc_Address
  where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Address_Del;
/
