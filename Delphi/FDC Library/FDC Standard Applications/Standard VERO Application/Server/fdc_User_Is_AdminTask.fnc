create or replace function fdc_User_Is_AdminTask
-- явл€етс€ ли текущий пользователь администратором задач (AdminTask)
-- –езультат: 1 - пользователь входит в группу, 0 - нет
  (
  pUser_ID number := 0,           -- »дентификатор пользовател€, при значении 0 беретс€ текущий подключенный пользователь
	pDoRaise number := 1            -- поднимать ли исключение при не вхождени€ пользовател€ в группу
                                  -- по умолчанию поднимать (значение отличное от 0)
                                  -- при значении 0 поднимать не надо
  )
return number
is
begin
  return fdc_User_Is_In_Group('AdminTask', pUser_ID, pDoRaise);
end;
/
