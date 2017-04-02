create or replace procedure fdc_User_Grant_Add
-- Выдать пользователю права на заданный объект
	(
	pUser_ID number,                -- Идентификатор пользователя, которому выдаются права
	pObject_ID number,              -- Идентификатор объекта, на который выдаются права
	pAccessLevel number,            -- Уровень доступа, на который выдаются права (1 - только чтение, 2 - изменение, 3 - изменение прав доступа)
	pDoNotCheck number := 0,        -- не равно 0 - не проверять полномочия текущего пользователя на выдачу прав на заданный объект
                                  -- 0 - проверять полномочия текущего пользователя (по умолчанию)
  pNoReduction number := 0        -- не равно 0 - если пользователь уже имеет более высокие права на объект,
                                  -- то ничего не делаем, иначе повышаем права
                                  -- 0 - всегда изменяем права, в том числе и снижая их
	)
is
  pChk1 number := 0;
  pAcc number := 0;
  pEventID number;
begin
  -- Проверка полномочий текущего пользователя
  if (pDoNotCheck = 0) then
  	pChk1 := fdc_Object_Check_Access_Level(pObject_ID, 3, 1);
  end if;
  
  -- Есть ли уже какие-либо права у пользователя группе на заданный объект?
  begin
    select AccessLevel	
    into	pAcc
    from	fdc_User_Grant
    where	User_ID = pUser_ID and
    	    Object_ID = pObject_ID and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка определения прав пользователя на объект', 1);
  end;
      
  -- pAcc > 0 - уже есть в fdc_User_Grant запись о правах, 
  -- pAcc = 0 - нет
  if pAcc > 0 then
    -- Если пользователь уже имеет такие права, то выходим    
    if (pAccessLevel = pAcc) then 
       return;
    end if;
    
    -- Если pNoReduction выставлен и пользователь уже имеет более высщкие права,
    -- то ничего не меняем и выходим
    if (pNoReduction <> 0) and (pAccessLevel < pAcc) then
       return;
    end if;      
    
    -- Иначе изменение уровня доступа
  	update	fdc_User_Grant
  	set	AccessLevel = pAccessLevel
  	where	User_ID = pUser_ID and
   		    Object_ID = pObject_ID;
          
    -- Создаем соответствующее событие
    pEventID := fdc_Event_Add('EventAccessUpd',
          'Специальный доступ к ' || fdc_Object_Get_Name(pObject_ID, 1) || 
          ' для пользователя ' || fdc_Object_Get_Name(pUser_ID) ||
          ' изменен с "' || fdc_Access_Level_GetName(pAcc) ||
          '" на "' || fdc_Access_Level_GetName(pAccessLevel), pObject_ID);      
  else
    -- Добавление уровня доступа
  	insert into fdc_User_Grant(User_ID, Object_ID, AccessLevel)
	  values(pUser_ID, pObject_ID, pAccessLevel);
    
    -- Создаем соответствующее событие
    pEventID := fdc_Event_Add('EventAccessUpd',
          'Добавлен специальный доступ к ' || fdc_Object_Get_Name(pObject_ID, 1) || 
          ' на "' || fdc_Access_Level_GetName(pAccessLevel) ||
          '" для пользователя ' || fdc_Object_Get_Name(pUser_ID), pObject_ID);
  end if;
end fdc_User_Grant_Add;
/
