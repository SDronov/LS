create or replace procedure fdc_ValueRef_Sys_Set
-- Изменяет ссылки на объект системной константы по ее системному имени
	(
	  pSysName	varchar2,       -- системное имя  
    pRef_Object_ID number     -- строковое значение атрибута 
	)
is
  pRefName varchar(1500);
begin
  -- Получаем имя объекта, на который делается ссылка
  -- Если не нашли, то исключение
  pRefName := fdc_Object_Get_Name(pRef_Object_ID); 

  -- Вызываем базовую процедуру изменения константы
  fdc_Value_Sys_Set(pSysName, pRefName, null, null, pRef_Object_ID);
   
end fdc_ValueRef_Sys_Set;