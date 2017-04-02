create or replace function fdc_User_ReadAccess
-- ���������� ����� �� ������������ ������ � ������� �� ������
-- ���������: 1 - �����, 0 - ���
	(
	  pID number   --������������� �������
	)
return number
is
  Result number := 0;
  pUser_ID number;
begin
  -- ���� ������������ - �������� ����� ��� ������ � ������ ��������������� ������, �� ��� OK
  if (fdc_User_Is_Schema_Owner = 1) or (fdc_User_Is_AdminData(0, 0) = 1) then
    return 1;
  end if;
  
  -- �������� ���������� ������������� ������������ � VERO �� ��� ������
  pUser_ID := fdc_User_Get;
  
  -- ���������� ���� �� ������������ ������ �� ������
  begin
    select 1
        into Result
     from	fdc_User_Grant UG
    where	UG.Object_ID = pID and
          UG.User_ID = pUser_ID and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ����������� ���������� �������� ������������ �� ������ ID='||pID, 1);
  end;
  
  -- ����, �������
  if (Result > 0) then
	   return Result;
  end if;
  
  -- ���������� ���� �� ���� �� ����� ������, � ������� ������ ������������ ������ �� ������
  begin
    select  1
        into Result
      from fdc_User_In_Group UG,
           fdc_User_Group_Grant UGG
     where UG.User_ID = pUser_ID and
           UGG.User_Group_ID = UG.User_Group_ID and
           UGG.Object_ID = pID and
           rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ����������� ���������� ����� �������� ������������ �� ������ ID='||pID, 1);
  end;

  -- ����, �������
  if (Result > 0) then
	   return Result;
  end if;
  
  -- ����� �� �����
  return 0;
end fdc_User_ReadAccess;
/
