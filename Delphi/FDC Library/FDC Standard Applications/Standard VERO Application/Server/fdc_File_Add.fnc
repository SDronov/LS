create or replace function fdc_File_Add
-- Создает новый объект файла в VERO и возвращает его идентификатор
	(
	  pObject_Type_SysName varchar2,  -- системное имя объектного типа
	  pName varchar2,                 -- название
	  pSourceName	varchar2,           -- исходное название файла в ОС
	  pShortName varchar2 := null,    -- короткое название
	  pDescript varchar2 := null      -- описание
	)
    return number
is
  pNewID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'File'
  fdc_Object_Type_Is(pObject_Type_SysName,'File');

  -- Вызываем базовую функцию создания объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, null, pShortName, pDescript);

  -- Даем автору полный доступ к нему
  fdc_Object_Grant_Upd(pNewID, fdc_User_Get, 3, 1);

  -- Добавляем запись в таблицу fdc_File
  insert into fdc_File(ID, SourceName, Body)
     values(pNewID, pSourceName, empty_blob());

  -- Возвращаем идентификатор   
  return pNewID;
end fdc_File_Add;
/
