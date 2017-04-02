create or replace function fdc_Dict_Get_FullCode
-- ��������� ������� ���� ������� �����������, 
-- ������������ ��� ���� �� �������� �������
	(
  pID number              -- ������������� ������� �����������
	)
return varchar2
is
  pFullCode varchar2(1500);
  pCode varchar2(1500);
  pOwnerID number;
begin
  -- �������� ���� ������� �����������
  if (fdc_Object_Is(pID, 'Dict') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� �������� �����������');
  end if;
  
  -- �������� � ������� �������
  pOwnerID := pID;
  
  -- ������������ �������� ������� �������
  while pOwnerID is not null loop
  	select	O.Owner_Object_ID, trim(D.Code)
  	into	pOwnerID, pCode
  	from	fdc_Dict D,
          fdc_Object O
  	where	O.ID = D.ID and
          D.ID = pOwnerID;
    -- ������������ � ������ ���������� ��� 
  	pFullCode := trim(pCode||pFullCode);
  end loop;
  
  return pFullCode;
end fdc_Dict_Get_FullCode;
/
