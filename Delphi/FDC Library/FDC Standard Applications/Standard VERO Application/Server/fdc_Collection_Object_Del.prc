create or replace procedure fdc_Collection_Object_Del
-- Удаление объекта из подборки 
	(
  pID	number                   -- Идентификатор объекта в подборке
	)
is
  pCollectionObject fdc_Collection_Object%rowtype;
begin
    -- Получение старого значения
  begin
    select *
    into pCollectionObject
    from fdc_Collection_Object
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При попытке удаления не найден объект в подборке ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения объекта в подборке ID='||pID, 1);
  end;

  -- Проверка возможности внесения изменений в подборку
  if Fdc_Object_Is_Updatable(pCollectionObject.Collection_ID, 0) = 0 then
    fdc_Util.Abort('Нет прав на изменение подборки, либо ее состояние не допускает изменений');
  end if;

  -- Удаление записи из таблицы fdc_Collection_Object
  delete from fdc_Collection_Object
  where	ID = pID;

end fdc_Collection_Object_Del;
/
