create or replace function fdc_Address_Add
-- �������� ������
	(
	pObject_Type_SysName	varchar2,             -- ��������� ��� ���� ������ (������ ���� �������� 'Address') 
	pName			varchar2,                         -- ������������ (������ ������)
  pOwner_ID number := null,                   -- �������� - ������, � �������� ��������� ����� (������ �����������, ��� ��� ������ ��������)                                  
  pCountry_Dict_ID number := null,            -- ������������� ������ �� ����������� �����
  pDescript varchar2 := null                  -- ��������  
	)
return number
is
  pNewID number(15);
begin
  -- �������� ���� ������  
  fdc_Object_Type_Is(pObject_Type_SysName,'Address');

  -- �������� ������ ������
  if trim(pName) is null then
    fdc_Util.Abort('��� �������� ������ �� ����������� ������ �������� ������');
  end if;
  
  -- �������� ���������
  if pOwner_ID is not null and Fdc_Object_Is(pOwner_ID, 'Person') = 0 then
    fdc_Util.Abort('��� �������� ������ ������� �������� ������������� ���������');
  end if;
  
  -- �������� �������������� ������
  if pCountry_Dict_ID is not null and Fdc_Object_Is(pCountry_Dict_ID, 'Dict.OKSM') = 0 then
    fdc_Util.Abort('��� �������� ������ ������� �������� ������������� ������');
  end if;

  -- �������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pOwner_ID, null, null, pDescript);

  -- ���� ������������ ����� �� ��������� � ������� ���� �� ������
  fdc_Object_Grant_Upd(pNewID, Fdc_User_Get, 3, 1);

  -- �������� ������ � fdc_Address
  insert into fdc_Address(ID, Country_Dict_ID)
  values(pNewID, pCountry_Dict_ID);
  
  return pNewID;
end fdc_Address_Add;
/
