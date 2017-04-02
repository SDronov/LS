create or replace procedure fdc_Event_Add_EventDel
-- Создание события удаления объекта
-- Предполагается, что в этот момент сам объект физически еще не удален
-- Эта процедура опционально (в зависимости от параметра) вызывается из fdc_Object_Del
	(
	pID number,                   -- Идентификатор удаляемого объекта
  pDescript varchar2 := null    -- Строка, передаваемая в поле descript события            
	)
is
  pNewID number(15);
begin
  -- Вызов базовой процедуры создания события
  pNewID := fdc_Event_Add('EventDel','Удален объект '||fdc_Object_Get_Name(pID,1, 1), pID, pDescript);

end fdc_Event_Add_EventDel;
/
