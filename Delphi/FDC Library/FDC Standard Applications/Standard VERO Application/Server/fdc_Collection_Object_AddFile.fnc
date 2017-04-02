create or replace function fdc_Collection_Object_AddFile
-- Внесение файла в подборку. Возвращает идентификатор файла в Веро
	(
	  pCollection_ID	number,       -- Идентификатор подборки
  	pFileName 	varchar2,         -- имя файла
    pRoleName	varchar2 := null,   -- Роль объекта в подборке
	  pDescript	varchar2 := null    -- Комментарий к объекту в подборке
	)
    return number
is
  pFileID number(15);
begin
  -- создаем объект файла в Веро
  pFileID := fdc_File_Add('File', pFileName, pFileName); 

  -- включаем файл в подборку
  fdc_Collection_Object_Add(pCollection_ID, pFileID, pRoleName, pDescript);

  -- возвращаем идентификатор файла
  return pFileID;
end fdc_Collection_Object_AddFile;
/
