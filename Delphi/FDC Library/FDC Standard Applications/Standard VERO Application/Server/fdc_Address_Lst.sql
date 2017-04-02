create or replace view fdc_Address_Lst as
select	O.*,
        W.Name as OwnerName,
	      A.COUNTRY_DICT_ID,
        C.CODE as CountryCode,
	      C.Name as CountryName
  from	fdc_Address A,
	      fdc_Object_Lst O,
        fdc_Dict_Lst C,
        fdc_Object_Lst W
 where	O.ID = A.ID and
        C.ID (+) = A.COUNTRY_DICT_ID and
        W.ID (+) = O.OWNER_OBJECT_ID;

