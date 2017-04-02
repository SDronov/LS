create or replace function fdc_State_Get_Name
-- Возвращает название состояния объекта. Если состояние не найдено,
-- то исключение
	(
	  pID number   -- идентификатор состояния
	)
    return varchar2
is
  Result varchar2(1500);
begin
  -- Если состояния нет, то возвращаем 'Формируется',
  -- иначе название объекта
  if (pID is null) or (pID = 0) then
	   Result := 'Формируется';
   else
     Result := fdc_Object_Get_Name(pID);  
  end if;

  return Result;
end fdc_State_Get_Name;
/
