create or replace function fdc_Event_NotChecked_ForSubscr
-- ��������, ���������� �� ����� ������� 
-- (�� ����������� �� ������� ��������)
-- ���� ����������, ���������� 1,
-- ���� ��� - 0
return number
is
  pMaxChkRows number := 4;
  pRowNum number := 0;
  pRetVal number := 1;
begin
  -- ������ ��������� ��������� �������:
  -- ���� ��� ������� ��������� �����������, ���������� 0, ����� - 1
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
