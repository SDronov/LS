create or replace function fdc_Object_Get_Name
-- Возвращает имя объекта по его идентификатору
	(
	  pID number,                 -- идентификатор объекта
	  pUseTypeName number := 0,   -- 1 - использовать ли название типа объекта при выводе имени 
                                -- (формат: <название типа> <название объекта>
                                -- 0 - возвращать только название объекта без типа
                                -- по умолчанию только название
	  pDoRaise	number := 1       -- поднимать ли исключение при отсутствии объекта
                                -- по умолчанию (значение <> 0) поднимать 
	)
  return varchar2
is
  Result	varchar2(1500);
  pTypeName	varchar2(1500);
  pNotFound boolean := false;
begin
  Result := null;

  -- пытаемся начитать название и тип объекта
  begin
    select O.Name, T.Name
      into Result, pTypeName
      from fdc_Object_Lst O,
	         fdc_Object T
     where O.ID = pID and
	         T.ID = O.Object_Type_ID;
  exception
	  when NO_DATA_FOUND then pNotFound := true;
  	when others then fdc_util.abort('Ошибка получения имени объекта по ID='||pID, 1);
  end;
  
  -- Если объект не найден и требуется исключение
  if pNotFound and (pDoRaise <> 0) then
    fdc_util.abort('Не найден объект при получени имени объекта по ID='||pID, 1);
  end if;
  
  -- добавляем название типа, если надо
  if (pUseTypeName <> 0) then
	   Result := pTypeName||' '||Result;
  end if;

  return Result;
end fdc_Object_Get_Name;
/
