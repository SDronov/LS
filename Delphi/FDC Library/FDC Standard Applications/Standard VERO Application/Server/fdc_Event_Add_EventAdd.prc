create or replace procedure fdc_Event_Add_EventAdd
-- Создание события создания объекта
	(
	pID number,                       -- Идентификатор созданного объекта
	pName varchar2 := null            -- Название события (если Null, то будет сгенерировано автоматически)
	)
is
  pNewID number(15);
begin
  -- Вызов базовой процедуры создания события
  pNewID := fdc_Event_Add('EventAdd', nvl(trim(pName),'Создан объект '||fdc_Object_Get_Name(pID, 0, 1)),pID);

end fdc_Event_Add_EventAdd;
/
