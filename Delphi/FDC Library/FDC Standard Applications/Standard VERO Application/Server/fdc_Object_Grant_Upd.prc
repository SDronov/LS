create or replace procedure fdc_Object_Grant_Upd
-- Выдать, изменяет или снимает пользователю или группе права на заданный объект
	(
	pID		number,                   -- Идентификатор объекта, на который выдаются права
	pGrantee_ID	number,             -- Идентификатор пользователя или группы, которому (которой) выдаются права
	pAccessLevel	number := 1,      -- Уровень доступа, на который выдаются права (1 - только чтение, 2 - изменение, 3 - изменение прав доступа)
                                  -- Если уровень доступа 0, то права снимаются и доступ закрывается
	pDoNotCheck	number := 0,        -- <> 0 - не проверять полномочия текущего пользователя на выдачу прав на заданный объект
                                  -- 0 - проверять полномочия текущего пользователя (по умолчанию)
  pAdminNotGrant number := 1,     -- <> 0 - администратарам данных (группа AdminData)
                                  -- и пользователю - владельцу схемы специальный доступ не дается
                                  -- 0 - дается                         
  pNoReduction  number := 1       -- не равно 0 - если пользователь или группа уже имеют более высокие права на объект,
                                  -- то ничего не делаем, иначе повышаем права
                                  -- 0 - всегда изменяем права, в том числе и снижая их                                
	) 
is
begin
  -- Проверка типа грантуемого: пользователь или группа?
  -- Если пользователь
  if (fdc_Object_Is(pGrantee_ID,'User') <> 0) then
     if (pAccessLevel <> 0) then
        -- Если pAdminNotGrant выставлен и пользователь - владелец схемы или 
        -- администратор данных, то выходим
        if (pAdminNotGrant <> 0) 
              and ((fdc_User_Is_Schema_Owner(pGrantee_ID) <> 0) 
                  or (fdc_User_Is_AdminData(pGrantee_ID, 0) <> 0)) then
           return;
        end if; 
        
        -- Вызов процедура выдачи грантов для пользователя
  	    fdc_User_Grant_Add(pGrantee_ID, pID, pAccessLevel, pDoNotCheck, pNoReduction);
      else  
        -- Если доступ закрывается
		    fdc_User_Grant_Del(pGrantee_ID, pID, pDoNotCheck);
     end if;   
     
   -- Если группа  
   elsif (fdc_Object_Is(pGrantee_ID,'UserGroup') <> 0) then
    if (pAccessLevel <> 0) then
        -- Если pAdminNotGrant выставлен и пользователь - владелец схемы или 
        -- администратор данных, то выходим
        if (pAdminNotGrant <> 0)
              and ((fdc_User_Is_Schema_Owner(pGrantee_ID) <> 0) 
                  or (fdc_User_Is_AdminData(pGrantee_ID, 0) <> 0)) then 
           return;
        end if; 
        
        -- Вызов процедура выдачи грантов для группы
  	    fdc_User_Group_Grant_Add(pGrantee_ID, pID, pAccessLevel, pDoNotCheck, pNoReduction);
      else  
        -- Если доступ закрывается
		    fdc_User_Group_Grant_Del(pGrantee_ID, pID, pDoNotCheck);
     end if;    
   else	
     fdc_Util.Abort('Права на объекты выдаются только пользователям или группам пользователей. Указанный объект (ID = '||pGrantee_ID||') не является ни тем ни другим.');
  end if;
end fdc_Object_Grant_Upd;
/
