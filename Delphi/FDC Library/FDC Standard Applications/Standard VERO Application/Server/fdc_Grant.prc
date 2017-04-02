create or replace procedure fdc_Grant
-- Дает права пользователю на серверный объект
-- Вынуждены запускать через процедуру с execute immediate, 
-- чтобы грантором был владелец схемы.
-- Иначе все права, данные пользователем с GrantOption другим 
-- пользователям, отъехали бы при лишении прав самого пользователя.  
  (
    pPrivs  varchar2,             -- список привилегий (select, update и тд)
                                  -- перечислены через запятую
    pObject varchar2,             -- название объекта
    pUser   varchar2,             -- пользователь
    pGrantOption number := 0      -- давать ли с GrantOption (значение, отличное от 0),
                                  -- или без GrantOption (значение 0)
  ) 
is
  pSQL varchar(4000);
begin
  -- генерим строку для запуска
  pSQL := 'grant ' || trim(pPrivs) || ' on ' || trim(pObject)
         || ' to ' || trim(pUser); 
         
  if (pGrantOption <> 0) then
     pSQL := rtrim(pSQL) || ' with grant option';      
  end if;     

  -- исполняем ее с помощью execute immediate
  execute immediate pSQL;
end;
/
