create or replace function fdc_User_Group_Get
-- Получить ID группы по системному имени
   (
     pSysName varchar2
   )  
     return number
is
  Result number(15);
begin
  select G.ID
    into Result
    from fdc_User_Group G,
  	     fdc_Object O
  where	O.ID = G.ID and
  	    O.SysName = pSysName;
        
  -- Возврат результата
  return Result;
exception 
	when NO_DATA_FOUND then fdc_util.abort('Не найдена группа '||pSysName);
  when others then fdc_util.abort('Ошибка получения идентификатора группы '||pSysName, 1);
end fdc_User_Group_Get;
/
