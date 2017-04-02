create or replace function fdc_ValueRefFile_Add
-- Добавление системной константы или дополнительного атрибута ссылки на файл VERO. 
	(
    pObject_Type_SysName	varchar2,   -- системное имя объектного типа
	  pName			varchar2,               -- название  
    pSysName  varchar2,               -- системное имя
    pIsSystem number,                 -- признак системной константы
	  pOwner_Object_ID	number,         -- идентификатор объекта-владельца
    pFile_ID number,                  -- идентификатор файла в VERO, на который делается ссылка      
	  pShortName   varchar2 := null,    -- короткое название
	  pDescript		varchar2 := null      -- описание
	)
    return number
is
  pNewID number;
  pChk number;
begin
  -- Проверка, что pObject_Type_SysName - потомок 'ValueRefFile'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueRefFile');

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

  -- Вызываем базовую функцию добавления ссылки на объект
  pNewID := fdc_ValueRef_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pFile_ID, pShortName, pDescript);

  -- Возвращаем значение идентификатора
  return pNewID;
end fdc_ValueRefFile_Add;
/
