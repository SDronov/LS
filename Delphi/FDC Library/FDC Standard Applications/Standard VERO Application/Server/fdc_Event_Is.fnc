create or replace function fdc_Event_Is
-- ��������� �������� �� ������������� ������� ����������� ��� �������� ������� ���� � �������� �����
-- ���������� 1, ���� ��������, ����� 0
	(
	pID	number,                   -- ������������� �������
	pTypeSysName varchar2         -- ��������� ��� ����
	)
return number
is
result number := 0;
begin
  -- ���� ���-������ �� �������� �����
  begin
    select 1
    into	 result
    from	 fdc_Event E,
        	 fdc_Child_Object_Type COT,
    	     fdc_Object_Type T
    where	 E.ID = pID and
    	     COT.Child_Object_Type_ID = E.Event_Type_ID and
    	     T.ID = COT.Object_Type_ID and
    	     T.SysName = pTypeSysName and
           rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ �������� ���� ������� ID='||pID, 1);
  end;
  -- ���������� ��������� ��������     
  return result;           
end fdc_Event_Is;
/
