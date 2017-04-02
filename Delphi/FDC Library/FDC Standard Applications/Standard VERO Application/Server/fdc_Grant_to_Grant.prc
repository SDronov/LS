create or replace procedure fdc_Grant_to_Grant
-- ƒает права пользователю на процедуру fdc_Grant
-- ¬ынуждены запускать через процедуру с execute immediate, 
-- чтобы грантором был владелец схемы.
-- »наче все права, данные пользователем с GrantOption другим 
-- пользовател€м, отъехали бы при лишении прав самого пользовател€. 
-- ƒавать права на fdc_Grant из fdc_Grant нельз€. Ѕудет дедлок.
  (
    pPrivs  varchar2,               -- привелегии
    pUser   varchar2,               -- пользователь 
    pGrantOption number := 0        -- давать ли с GrantOption (значение, отличное от 0),
                                    -- или без GrantOption (значение 0)
  ) 
is
  pSQL varchar(4000);
begin
  -- генерим строку дл€ запуска
  pSQL := 'grant ' || trim(pPrivs) || ' on fdc_Grant to ' || trim(pUser); 
         
  if (pGrantOption <> 0) then
     pSQL := rtrim(pSQL) || ' with grant option';      
  end if;     

  -- исполн€ем ее с помощью execute immediate
  execute immediate pSQL;
end;
/
