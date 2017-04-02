create or replace function fdc_Object_Get_Name
-- ���������� ��� ������� �� ��� ��������������
	(
	  pID number,                 -- ������������� �������
	  pUseTypeName number := 0,   -- 1 - ������������ �� �������� ���� ������� ��� ������ ����� 
                                -- (������: <�������� ����> <�������� �������>
                                -- 0 - ���������� ������ �������� ������� ��� ����
                                -- �� ��������� ������ ��������
	  pDoRaise	number := 1       -- ��������� �� ���������� ��� ���������� �������
                                -- �� ��������� (�������� <> 0) ��������� 
	)
  return varchar2
is
  Result	varchar2(1500);
  pTypeName	varchar2(1500);
  pNotFound boolean := false;
begin
  Result := null;

  -- �������� �������� �������� � ��� �������
  begin
    select O.Name, T.Name
      into Result, pTypeName
      from fdc_Object_Lst O,
	         fdc_Object T
     where O.ID = pID and
	         T.ID = O.Object_Type_ID;
  exception
	  when NO_DATA_FOUND then pNotFound := true;
  	when others then fdc_util.abort('������ ��������� ����� ������� �� ID='||pID, 1);
  end;
  
  -- ���� ������ �� ������ � ��������� ����������
  if pNotFound and (pDoRaise <> 0) then
    fdc_util.abort('�� ������ ������ ��� �������� ����� ������� �� ID='||pID, 1);
  end if;
  
  -- ��������� �������� ����, ���� ����
  if (pUseTypeName <> 0) then
	   Result := pTypeName||' '||Result;
  end if;

  return Result;
end fdc_Object_Get_Name;
/
