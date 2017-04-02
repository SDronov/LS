create or replace procedure fdc_Collection_Clear
-- Очистить подборку (удалить из нее все объекты)
	(
	pID	number                  -- Идентификатор подборки
	)
is
  pChk number;
begin
  -- Проверка возможности изменения подборки
  begin
    pChk := Fdc_Object_Is_Updatable(pId, 1);
  exception  
    when others then
      fdc_util.Abort('При удалении всех объектов из подборки нет прав на изменение подборки', 1);
  end;
  
  -- Удаление всех записей в fdc_Collection_Object по заданной подборке
  delete from fdc_Collection_Object
  where Collection_ID = pID;

end fdc_Collection_Clear;
/
