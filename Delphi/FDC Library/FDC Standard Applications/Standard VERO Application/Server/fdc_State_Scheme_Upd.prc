create or replace procedure fdc_State_Scheme_Upd
-- Изменение схемы состояний
	(
	  pID	number,                 -- идентификатор схемы
	  pName	varchar2,             -- название   
    pShortName varchar2,        -- короткое название
	  pDescript varchar2          -- описание 
	)
is
begin
  -- вызов базовой функции изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
end fdc_State_Scheme_Upd;
/
