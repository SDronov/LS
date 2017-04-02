create or replace function fdc_Object_Get_BySysName
-- Возвращает идентификатор объекта по его системному имени, учитывая тип объекта 
	(
	  pTypeSysName varchar2,  -- системное имя объектного типа, потомком которого должеть быть объект 
	  pSysName	varchar2,     -- системное имя объекта
	  pNoCase		number := 0   -- учитывать ли регистр системного имени. 
                            -- по умолчанию учитывать (значение 0)  
	)
  return number
is
  Result number(15);
begin
  if pNoCase = 0 then
     -- ищем учитывая регистр
	   select	O.ID
       into	Result
	     from	fdc_Object_Type T,
		        fdc_Child_Object_Type COT,
	        	fdc_Object_Lst O
	    where	T.SysName = pTypeSysName and
		        COT.Object_Type_ID = T.ID and
		        O.Object_Type_ID = COT.Child_Object_Type_ID and
		        O.SysName = pSysName;
   else	
     -- ищем не учитывая регистр
     select	O.ID
	     into	Result
	     from	fdc_Object_Type T,
		        fdc_Child_Object_Type COT,
		        fdc_Object_Lst O
	    where	T.SysName = pTypeSysName and
        		COT.Object_Type_ID = T.ID and
		        O.Object_Type_ID = COT.Child_Object_Type_ID and
		        upper(O.SysName) = upper(pSysName);
  end if;
  
  return Result;
exception 
  when NO_DATA_FOUND then fdc_util.Abort('Не найден системный объект '||pTypeSysName||'.'||pSysName);
  when others then fdc_util.abort('Ошибка поиска системного объекта '||pTypeSysName||'.'||pSysName, 1);
end fdc_Object_Get_BySysName;
/
