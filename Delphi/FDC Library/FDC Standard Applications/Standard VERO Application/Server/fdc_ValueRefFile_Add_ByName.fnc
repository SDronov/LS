create or replace function fdc_ValueRefFile_Add_ByName
-- Добавление дополнительного атрибута ссылки на файл Веро по названию файла
	(
    pName	varchar2,              -- название
    pOwner_Object_ID number,     -- идентификатор объекта-владельца
	  pFileName	varchar2           -- имя файла
	)
    return number
is
  lName varchar2(1500);
  pFileID number(15);
  pValID number(15);
begin
  lName := NVL(pName, pFileName);

  -- создаем объект файла в Веро
  pFileID := fdc_File_Add('File', lName, pFileName);                      
  
  -- добавляем дополнительный атрибут-файл
  pValID := fdc_ValueRefFile_Add('ValueRefFile', lName, null, 0, pOwner_Object_ID, pFileID);

  -- возвращаем идентификатор атрибута-файла
  return pFileID;
end fdc_ValueRefFile_Add_ByName;
/
