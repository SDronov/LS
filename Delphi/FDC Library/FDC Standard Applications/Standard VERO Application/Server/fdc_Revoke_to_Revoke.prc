create or replace procedure fdc_Revoke_to_Revoke
-- Отбираем права у пользователя на процедуру fdc_Revoke
-- Отбирать напрямую из fdc_Revoke нельзя. Будет дедлок.
  (
    pPrivs  varchar2,   -- список привилегий, перечисленых через запятую
    pUser   varchar2    -- пользователь
  ) 
is
  pSQL varchar(4000);
begin
  -- генерим строку для запуска
  pSQL := 'revoke ' || trim(pPrivs) || ' on fdc_Revoke from ' || trim(pUser); 
  
  -- исполняем ее с помощью execute immediate
  execute immediate pSQL;
end;
/
