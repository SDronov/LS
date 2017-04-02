create or replace function fdc_Object_Is_Active
-- ��������� �������� �� ������ �������� ��� ���
-- ���� �������, �� ���������� 1, ����� 0
	(
	  pID number,            -- ������������� �������
	  pStrict number := 0    -- ���� �������� = 0 (�� ���������), �� ��������� ����� ��������� 
                           -- � �������, ��� ����� ������� �� ���������� ����� ���������, 
                           -- ����� ����� ������� ��������� ��������� �� ����� 
	)
    return number
is
  pActive number;
  pSchemeID number;
begin
  -- �������� �������� ������������� ����� ��������� ������� � ���������� �� ��� �������
  begin
    select T.State_Scheme_ID, S.Active
      into pSchemeID, pActive
      from fdc_Object O,
	         fdc_Object_Type T,
       	   fdc_State S
     where O.ID = pID and
	         T.ID = O.Object_Type_ID and
	         S.ID (+)= O.State_ID;
  exception 
    when NO_DATA_FOUND then
         fdc_util.abort('�� ������ ������ �� ID = '||pID);
  	when others then 
         fdc_util.abort('������ ����������� ������� �� ID = '||pID, 1); 
  end;          

  -- ���� ����� ��������� �� ������ � �� ������� ��������, �� Ok,
  -- ����� ������� �� ���������� �������  
  if pSchemeID is null then
	   if pStrict = 0 then 
        return 1;
	    else 
        return nvl(pActive,0);
	   end if;
  end if;

  return pActive;
end fdc_Object_Is_Active;
/
