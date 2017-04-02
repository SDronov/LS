create or replace function fdc_Event_NotChecked_ForSubscr
-- ѕроверка, существуют ли новые событи€ 
-- (не проверенные на предмет подписки)
-- ≈сли существуют, возвращает 1,
-- если нет - 0
return number
is
  pMaxChkRows number := 4;
  pRowNum number := 0;
  pRetVal number := 1;
begin
  -- ѕросто провер€ем последние событи€:
  -- если это событие генерации уведомлений, возвращаем 0, иначе - 1
  for rec in (select ID, Event_Type_ID from fdc_Event order by ID desc) loop
    if rec.Event_Type_ID = Fdc_Object_Type_Get_Bysysname('EventGenNotifications') then
      pRetVal := 0;
      exit;
    end if;
    if pRowNum > pMaxChkRows or rec.Event_Type_ID <> fdc_object_type_get_bysysname('EventState') then
      exit;  
    else
      pRowNum := pRowNum + 1;
    end if;  
  end loop;
  return pRetVal;
end;
/
