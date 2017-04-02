create or replace function fdc_Object_Type_Get_ChildCount
-- Возвращает сколько непосредственных детей есть у объектного типа
	(
	  pID number      -- идентификатор объектного типа
	)
    return number
is
  Result number(15);
begin
  select count(*)
    into Result
    from fdc_Object_Type
   where Parent_Object_Type_ID = pID;

  return Result;
end fdc_Object_Type_Get_ChildCount;
/
