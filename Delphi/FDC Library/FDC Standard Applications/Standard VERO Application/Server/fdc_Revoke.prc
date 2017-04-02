create or replace procedure fdc_Revoke
-- Отбирает права у пользователя на серверный объект
  (
    pPrivs  varchar2,   -- список привилегий, перечисленых через запятую
    pObject varchar2,   -- название серверного объекта
    pUser   varchar2    -- пользователь
  ) 
is
  pSQL varchar(4000);
begin
  -- генерим строку для запуска
  pSQL := 'revoke ' || trim(pPrivs) || ' on ' || trim(pObject)
         || ' from ' || trim(pUser); 
  
  -- исполняем ее с помощью execute immediate
  execute immediate pSQL;
end;
/
