create or replace function fdc_Syscomponent_Is_Granted
-- Определяет имеет ли данный пользователь права на серверный объект
-- Возвращает 0 - не имеет прав, 1 - имеет, 2 - имеет с правом раздачи грантов (GrantOption)
	(
	  pSchema	varchar2,      -- название схемы
	  pLogin	varchar2,      -- логин пользователя 
	  pSysName varchar2      -- системное название серверного объекта
	)
    return number
is
  pCnt number;
  pGrantable number;
begin
  -- Берем иноформацию из All_Tab_Privs
  select count(*), nvl(max(decode(grantable, 'YES', 1, 0)), 0)
     into pCnt, pGrantable
    from All_Tab_Privs P
   where P.Table_Schema = upper(pSchema) and
         P.Grantee	= upper(pLogin) and
         P.Grantor = upper(pSchema) and
	  	   P.Table_Name	= upper(pSysName);

  -- Если пользователь имеет права, то смотрим имеет ли с GrantOption         
  if (pCnt > 0) then
     if (pGrantable > 0) then
        return 2;
      else
        return 1;
     end if;     
  end if;

  return 0;
end fdc_Syscomponent_Is_Granted;
/
