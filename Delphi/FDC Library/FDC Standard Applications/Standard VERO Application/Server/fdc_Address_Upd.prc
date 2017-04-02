create or replace procedure fdc_Address_Upd
-- ��������� ��������� ������
	(
	pID			number,                             -- ������������� ������
	pName			varchar2,                         -- ������������ (������ ������)
  pCountry_Dict_ID number,                    -- ������������� ������ �� ����������� �����
  pDescript varchar2                          -- ��������
	)
is
  pAddress fdc_Address%rowtype;
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Address') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� �������');
  end if;

  -- ������� ��������� ��������� ������� �� ���������� ����������
  fdc_Object_Upd(pID, pName, null, pDescript);
  
  -- ��������� ������� ��������
  begin
    select *
    into pAddress
    from fdc_Address
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ������� ��������� �� ������ ����� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ������ ID='||pID, 1);
  end;

  -- ��������� ��������� ������ fdc_Address
  if Nvl(pCountry_Dict_ID, -1) <> Nvl(pAddress.Country_Dict_ID, -1) then
    update Fdc_Address
    set Country_Dict_ID = pCountry_Dict_ID
    where ID = pID;
  end if;   

end fdc_Address_Upd;
/
