create or replace function fdc_User_Is_In_Group
-- Определяет принадлежность пользователя к группе.
-- Результат: 1 - пользователь входит в группу, 0 - нет
	(
	pGroupSysName varchar2,         -- системное имя группы
  pUser_ID number := 0,           -- ID пользователя, при значении 0 берется текущий подключенный пользователь
	pDoRaise number := 1            -- поднимать ли исключение при не вхождения пользователя в группу
                                  -- по умолчанию поднимать (значение отличное от 0)
                                  -- при значении 0 поднимать не надо
	)
return number
is
  result number := 0;
  pGroupName varchar2(1500) := null;
begin
  if pUser_ID = 0 then
    -- смотрим принадлежит ли текущий пользователь к группе
    begin
      select --+ordered	 
             1
        into result
        from fdc_User U,
  	         fdc_User_In_Group UIG,
  	         fdc_Object G
       where upper(U.Login) = user and
             UIG.User_ID = U.ID and
             G.ID = UIG.User_Group_ID and
             G.SysName = pGroupSysName and
             rownum <= 1;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('Ошибка определения принадлежности текущего пользователя к группе '||pGroupSysName, 1);
    end;
  else   
    -- смотрим принадлежит ли заданный пользователь к группе
    begin
      select --+ordered	 
             1
        into result
        from fdc_User_In_Group UIG,
  	         fdc_Object G
       where UIG.User_ID = pUser_ID and
             G.ID = UIG.User_Group_ID and
             G.SysName = pGroupSysName and
             rownum <= 1;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('Ошибка определения принадлежности пользователя (ID='||pUser_ID||') к группе '||pGroupSysName, 1);
    end;
  end if;
    
  -- если не принадлежит и должно быть поднято исключение...
  if result = 0 and pDoRaise <> 0 then
     -- пытаемся определить название группы по ее системному имени   
    begin
      select Name 
      into pGroupName
      from Fdc_Object
      where SysName = pGroupSysName; 
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('Ошибка определения названия группы '||pGroupSysName, 1);
    end;
     
    -- поднимаем исключение
    fdc_util.abort('Для совершения действия необходимы полномочия члена группы "'|| pGroupName || '" ('||pGroupSysName||')');
  end if;
  
  -- Возвращаем результат
  return result;
end fdc_User_Is_In_Group;
/
