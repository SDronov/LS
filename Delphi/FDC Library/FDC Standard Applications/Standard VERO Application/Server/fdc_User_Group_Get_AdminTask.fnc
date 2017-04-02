create or replace function fdc_User_Group_Get_AdminTask
-- Получить ID группы администраторов задач 'AdminTask'
return number
is
begin
  -- Возврат результата
  return fdc_User_Group_Get('AdminTask');
exception 
  when others then 
    Fdc_Util.Abort('Не определена группа администраторов задач (AdminTask)! Ошибка конфигурации системы!', 1);
end fdc_User_Group_Get_AdminTask;
/
