create or replace procedure fdc_Object_Kind_Upd
-- Изменение основания и описания у пометки объекта
	(
	  pID	number,              -- идентификатор пометки объекта
	  pEvidence_ID number,     -- идентификатор основания 
	  pDescript	varchar2       -- описание 
	)
is
  pName varchar2(1500);
begin
  -- Находим название пометки объекта по ее идентификатору
  -- Если не нашли, то исключение
  pName := fdc_Object_Get_Name(pID);

  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, null, pDescript);
  
  -- -- изменяем fdc_Object_Kind
  update fdc_Object_Kind
     set Evidence_ID = pEvidence_ID
   where ID = pID;

end fdc_Object_Kind_Upd;
/
