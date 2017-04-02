create or replace function fdc_Object_Type_Is_Subtype
-- ��������� �������� �� ������������� ��� �������� �������
-- ���������� 1, ���� ��������, ����� 0
	(
  	pType 	 varchar2,    -- ��������� ��� �������������� ����
    pBaseType varchar2,   -- ��������� ��� ���������� ������
  	pDoRaise number := 0  -- ��������� �� ����������. �������� 0 (�� ���������) - �� ���������.
	)
  return number
is
  result number;
begin
  result := 0;

  begin
    select	1
      into	result
      from	fdc_Object_Type T
       	join fdc_Child_Object_Type CT on CT.Object_Type_ID = T.ID
      	join fdc_Object_Type TT on TT.ID = CT.Child_Object_Type_ID
     where	T.SysName = pBaseType and
	          TT.SysName = pType and
            rownum <= 1;    
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ �������� ���� '||pType||' �� ������������ �� '||pBaseType, 1);
  end;
  
  --���� �� ������ � ����� ������� ����������, �� ���������.
  if result = 0 and pDoRaise <> 0 then
     fdc_Util.Abort('��� '||pType||' �� �������� �������� '||pBaseType);
  end if;
  
  -- ������������ ���������
  return result;
end fdc_Object_Type_Is_Subtype;
/
