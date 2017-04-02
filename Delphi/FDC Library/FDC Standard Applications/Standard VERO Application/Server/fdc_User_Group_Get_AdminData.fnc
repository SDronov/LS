create or replace function fdc_User_Group_Get_AdminData
-- Получить ID группы администраторов данных 'AdminData'
return number
is
begin
  -- Возврат результата
  return fdc_User_Group_Get('AdminData');
exception 
  when others then 
    Fdc_Util.Abort('Не определена группа администраторов данных (AdminData)! Ошибка конфигурации системы!', 1);
end fdc_User_Group_Get_AdminData;
/
