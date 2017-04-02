create or replace function fdc_Object_Check_Access_Level
-- Определяет имеет ли текущий пользователь нужный уровень доступа к объекту
-- 1 - имеет, 0 - нет
	(
	  pID	number,              -- идентификатор объекта
	  pAccessLevel number,     -- уровень доступа
	  pDoRaise	number := 1     -- поднимать ли исключение при отсутствии заданного уровня доступа
                             -- по умолчанию (значение <> 0) поднимать 
	)
  return number
is
  Result number(15);
  pObjectLevel number(15);
  pUser_ID number(15);
begin
  -- если пользователь - владелец схемы, то Ok
  if user = fdc_util.schema then 
     return 1;
  end if;
  
  -- если проверяем доступ на раздачу прав на объекты и пользователь входит в группу администраторов данных, то Ok
  if (pAccessLevel = 3) and (fdc_User_Is_AdminData(0, 0) <> 0) then 
     return 1;
  end if;

  -- пытаемся определить идентификатор пользователя в VERO по его логину  
  pUser_ID := fdc_User_Get;
  
  -- получаем уровень общего доступа объекта
  begin
    select	AccessLevel
      into	pObjectLevel
      from	fdc_Object
     where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.abort('Не найден объект по ID = '||pID);
  	when others then fdc_util.abort('Ошибка получения уровня общего доступа объекта ID='||pID, 1);
  end;
  
  -- если уровень доступа объекта такой же или превышает запрашиваемый уровень доступа, то Ok
  -- такой уровень в общем доступе
  if pAccessLevel <= pObjectLevel then  
	   return 1;
  end if;

  Result := 0;
  
  -- определяем дан ли пользователю такой же или более высокий уровень доступа к объекту
  -- дан - Ok
  
  -- Есть ли такой уровень у самого пользователя
  begin
    select	1 
    into 	Result
    from	fdc_User_Grant
    where	Object_ID = pID and
         	User_ID = pUser_ID and
         	AccessLevel >= pAccessLevel and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка определения прав текущего пользователя на доступ к объекту ID='||pID, 1);
  end;
          
  if Result > 0 then 
     return 1;
  end if;

  -- определяем дана ли хоть одной группе, в которую входит пользователь, такой же или более 
  -- высокий уровень доступа к объекту
  -- дан - Ok

  -- Есть ли такой уровень у какой-либо группы в которую входит пользователь
  begin
    select	1 
    into 	Result
    from	fdc_User_In_Group UG,
        	fdc_User_Group_Grant UGG
    where	UG.User_ID = pUser_ID and
	        UGG.Object_ID = pID and
        	UGG.User_Group_ID = UG.User_Group_ID and
        	UGG.AccessLevel >= pAccessLevel and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка определения прав групп текущего пользователя на доступ к объекту ID='||pID, 1);
  end;
          
  if Result > 0 then 
     return 1;
  end if;
  
  -- если не имеет и нужно поднять исключение, то поднимаем

  if (Result = 0) and (pDoRaise <> 0) then
	   fdc_util.abort('Пользователь не имеет необходимого уровня доступа для выполнения операции.');
  end if;

  return 0;
end fdc_Object_Check_Access_Level;
/
