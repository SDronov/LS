create or replace view fdc_Person_Lst as
select /*+FIRST_ROWS*/
  O.*,
	P.SurName,
	P.FirstName,
	P.MiddleName,
  P.OGRN,
	P.INN,
	P.KPP,
	P.OKPO,
	P.BIC,
	P.BirthDate,
	P.BirthYear,
	P.BirthLocation,
  p.Opf_Dict_Id,
  Fdc_Object_Get_Name(p.opf_Dict_Id, 0, 0) as OPF_Name
from	fdc_Person P,
	fdc_Object_Lst O
where	P.ID = O.ID;

