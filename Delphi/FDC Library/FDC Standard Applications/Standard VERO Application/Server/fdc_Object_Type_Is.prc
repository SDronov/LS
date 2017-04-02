create or replace procedure fdc_Object_Type_Is
-- ѕровер€ет €вл€етс€ ли запрашиваемый тип потомком данного.
-- ≈сли не €вл€етс€, то генеритс€ исключение
	(
	  pType varchar2,     -- системное им€ запрашиваемого типа
	  pBaseType varchar2  -- системное им€ ожидаемого предка
	)
is
  pCnt number;
begin
  pCnt := fdc_Object_Type_Is_Subtype(pType,pBaseType,1);
end fdc_Object_Type_Is;
/
