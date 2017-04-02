create or replace function fdc_Object_Is_Active
-- Проверяет является ли объект активным или нет
-- Если активен, то возвращает 1, иначе 0
	(
	  pID number,            -- идентификатор объекта
	  pStrict number := 0    -- если значение = 0 (по умолчанию), то активными будут считаться 
                           -- и объекты, для типов которых не определена схема состояний, 
                           -- иначе такие объекты активными считаться не будут 
	)
    return number
is
  pActive number;
  pSchemeID number;
begin
  -- пытаемся получить идентификатор схемы состояния объекта и активность по его статусу
  begin
    select T.State_Scheme_ID, S.Active
      into pSchemeID, pActive
      from fdc_Object O,
	         fdc_Object_Type T,
       	   fdc_State S
     where O.ID = pID and
	         T.ID = O.Object_Type_ID and
	         S.ID (+)= O.State_ID;
  exception 
    when NO_DATA_FOUND then
         fdc_util.abort('Не найден объект по ID = '||pID);
  	when others then 
         fdc_util.abort('Ошибка определения объекта по ID = '||pID, 1); 
  end;          

  -- если схема состояний не задана и не строгое сранение, то Ok,
  -- иначе смотрим на активность статуса  
  if pSchemeID is null then
	   if pStrict = 0 then 
        return 1;
	    else 
        return nvl(pActive,0);
	   end if;
  end if;

  return pActive;
end fdc_Object_Is_Active;
/
