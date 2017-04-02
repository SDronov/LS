create or replace function fdc_User_Has_Task
-- Проверяет назначена ли задача пользователю.
-- Если логин не задан или NULL, то берет текущего пользователя
-- Возвращает 1 - назначена, 0 - нет.
	(
	  pTaskSysName varchar2,
    pLogin varchar2 := null
	)
    return number
is
  lID number;
begin
  begin
    select	--+ordered
  	       T.ID
      into lID
      from fdc_User U,
  	       fdc_User_In_Group UIG,
           fdc_User_Group_Task UGT,
  	       fdc_Object T
     where upper(U.Login) = upper(nvl(pLogin, user)) and
  	       UIG.User_ID = U.ID and
  	       UGT.USER_GROUP_ID = UIG.User_Group_ID and
           UGT.TASK_ID = T.ID and
  	       T.SysName = pTaskSysName and
           rownum <= 1;
  exception
    when NO_DATA_FOUND then return 0;
  	when others then fdc_util.abort('Ошибка получения задач, назначенных для пользователя '||nvl(pLogin, user), 1); 
  end;

  return 1;  
end fdc_User_Has_Task;
/
