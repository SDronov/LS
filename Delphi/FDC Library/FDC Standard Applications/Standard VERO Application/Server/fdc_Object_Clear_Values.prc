create or replace procedure fdc_Object_Clear_Values
-- Удаляет все значения дополнительных атрибутов объекта
	(
	  pID number     -- идентификатор объекта
	)
is
begin
  for E in (select V.ID 
              from fdc_Object O, fdc_Value V 
              where O.Owner_Object_ID = pID
                and V.ID = O.ID) 
    loop
	    fdc_Object_Free(E.ID,0);
	  end loop;
end fdc_Object_Clear_Values;
/
