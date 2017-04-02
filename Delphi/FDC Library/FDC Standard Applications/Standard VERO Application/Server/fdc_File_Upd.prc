create or replace procedure fdc_File_Upd
-- Изменение файла
	(
    pID number,                     -- идентификатор файла
	  pName varchar2,                 -- название
	  pSourceName	varchar2,           -- исходное название файла в ОС
	  pShortName varchar2,            -- короткое название
	  pDescript varchar2              -- описание
	)
is
begin
  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- Изменяем fdc_File
  update fdc_File
     set SourceName = pSourceName
   where ID = pID;

end fdc_File_Upd;
/
