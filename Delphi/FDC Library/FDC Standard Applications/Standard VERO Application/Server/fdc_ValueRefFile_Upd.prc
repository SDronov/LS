create or replace procedure fdc_ValueRefFile_Upd
-- Изменяет системную константу или дополнительный атрибут ссылки на файл. 
	(
    pID	number,                       -- идентификатор
	  pName			varchar2,               -- название  
    pSysName  varchar2,               -- системное имя
    pFile_ID number,                  -- идентификатор файла, на который делается ссылка
	  pShortName   varchar2,            -- короткое название
	  pDescript		varchar2              -- описание
	)
is
  pChk number;
begin
  -- Смотрим на наличие файла, на который делается ссылка
  begin
    select 1
      into pChk
      from fdc_File
     where ID = pFile_ID;
  exception
    when NO_DATA_FOUND then fdc_util.Abort('Не определен файл по ID = '||pFile_ID);
  	when others then fdc_util.Abort('Ошибка получения файла по ID = '||pFile_ID, 1); 
  end;

  -- Вызываем базовую процедуру изменения ссылки на объект
  fdc_ValueRef_Upd(pID, pName, pSysName, pFile_ID, pShortName, pDescript);

end fdc_ValueRefFile_Upd;
/
