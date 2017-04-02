create or replace function fdc_Object_Get_BySysName
-- ���������� ������������� ������� �� ��� ���������� �����, �������� ��� ������� 
	(
	  pTypeSysName varchar2,  -- ��������� ��� ���������� ����, �������� �������� ������� ���� ������ 
	  pSysName	varchar2,     -- ��������� ��� �������
	  pNoCase		number := 0   -- ��������� �� ������� ���������� �����. 
                            -- �� ��������� ��������� (�������� 0)  
	)
  return number
is
  Result number(15);
begin
  if pNoCase = 0 then
     -- ���� �������� �������
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
     -- ���� �� �������� �������
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
  when NO_DATA_FOUND then fdc_util.Abort('�� ������ ��������� ������ '||pTypeSysName||'.'||pSysName);
  when others then fdc_util.abort('������ ������ ���������� ������� '||pTypeSysName||'.'||pSysName, 1);
end fdc_Object_Get_BySysName;
/
