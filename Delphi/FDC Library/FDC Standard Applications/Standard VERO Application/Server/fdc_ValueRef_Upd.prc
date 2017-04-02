create or replace procedure fdc_ValueRef_Upd
-- Изменяет системную константу или дополнительный атрибут ссылки на объект
	(
    pID	number,                       -- идентификатор
	  pName			varchar2,               -- название 
    pSysName  varchar2,               -- системное имя
    pRef_Object_ID number,            -- идентификатор объекта, на который делается ссылка      
	  pShortName   varchar2,            -- короткое название
	  pDescript		varchar2              -- описание
	)
is
  pRefName varchar(1500);
begin
  -- Получаем имя объекта, на который делается ссылка
  -- Если не нашли, то исключение
  pRefName := fdc_Object_Get_Name(pRef_Object_ID); 

  -- Вызываем базовую процедуру
  fdc_Value_Upd(pID, pName, pSysName, pRefName, null, null, pRef_Object_ID, pShortName, pDescript);

end fdc_ValueRef_Upd;
/
