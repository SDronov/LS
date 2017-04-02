create or replace function fdc_Syscomponent_Is_ToGrant
-- Определяет должны ли данному пользователю быть даны права на серверный объект
-- Возвращает 0 - не должны, 1 - должны
	(
	  pLogin	varchar2,      -- логин пользователя
	  pSysName varchar2      -- системное название серверного объекта
	)
    return number
is
  pCnt	number;
begin
  select count(*)
    into pCnt
    from fdc_Syscomponent_Lst_To_Grant G
   where upper(G.Login) = upper(pLogin) and
	       G.SysName is not null and
	       upper(G.SysName) = upper(pSysName);

  if (pCnt > 0) then 
     return 1;
  end if;

  return 0;
end fdc_Syscomponent_Is_ToGrant;
/
