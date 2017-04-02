create or replace function fdc_Object_Is_Child_Of
-- Определяет является ли объект детём заданного 
-- 1 - является, 0 - нет
	(
	  pID	number,           -- идентификатор проверяемого объекта
  	pParentID number,     -- идентификатор родителя,
    pDoRaise number := 0  -- если отличен от 0, то по генерим исключение
                          -- по умолчанию нет 
    
	)
  return number
is
  pOwnerID number;
  
begin
  -- пытаемся определить родителя объекта
  begin
    select Owner_Object_ID
      into pOwnerID
      from fdc_Object
     where ID = pID;
  exception 
    when NO_DATA_FOUND then
      if (pDoRaise <> 0) then 
         fdc_util.abort('Не найден объект по ID = '||pID);
       else
         null;
      end if;     
  	when others then 
      if (pDoRaise <> 0) then 
         fdc_util.abort('Ошибка определения объекта по ID = '||pID, 1); 
       else
         null;
      end if;  
  end;    
    
  -- если родителем является заданный, то Ok, выходим
  if pOwnerID = pParentID then 
     return 1;
  end if;

  -- если родитель не определен, то выходим
  if (pOwnerID is null) then 
     return 0;
  end if;

  -- иначе рекурсия
  return fdc_Object_Is_Child_Of(pOwnerID, pParentID);
end fdc_Object_Is_Child_Of;
/
