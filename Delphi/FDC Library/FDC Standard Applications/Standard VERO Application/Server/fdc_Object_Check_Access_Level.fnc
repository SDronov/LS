create or replace function fdc_Object_Check_Access_Level
-- ���������� ����� �� ������� ������������ ������ ������� ������� � �������
-- 1 - �����, 0 - ���
	(
	  pID	number,              -- ������������� �������
	  pAccessLevel number,     -- ������� �������
	  pDoRaise	number := 1     -- ��������� �� ���������� ��� ���������� ��������� ������ �������
                             -- �� ��������� (�������� <> 0) ��������� 
	)
  return number
is
  Result number(15);
  pObjectLevel number(15);
  pUser_ID number(15);
begin
  -- ���� ������������ - �������� �����, �� Ok
  if user = fdc_util.schema then 
     return 1;
  end if;
  
  -- ���� ��������� ������ �� ������� ���� �� ������� � ������������ ������ � ������ ��������������� ������, �� Ok
  if (pAccessLevel = 3) and (fdc_User_Is_AdminData(0, 0) <> 0) then 
     return 1;
  end if;

  -- �������� ���������� ������������� ������������ � VERO �� ��� ������  
  pUser_ID := fdc_User_Get;
  
  -- �������� ������� ������ ������� �������
  begin
    select	AccessLevel
      into	pObjectLevel
      from	fdc_Object
     where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.abort('�� ������ ������ �� ID = '||pID);
  	when others then fdc_util.abort('������ ��������� ������ ������ ������� ������� ID='||pID, 1);
  end;
  
  -- ���� ������� ������� ������� ����� �� ��� ��������� ������������� ������� �������, �� Ok
  -- ����� ������� � ����� �������
  if pAccessLevel <= pObjectLevel then  
	   return 1;
  end if;

  Result := 0;
  
  -- ���������� ��� �� ������������ ����� �� ��� ����� ������� ������� ������� � �������
  -- ��� - Ok
  
  -- ���� �� ����� ������� � ������ ������������
  begin
    select	1 
    into 	Result
    from	fdc_User_Grant
    where	Object_ID = pID and
         	User_ID = pUser_ID and
         	AccessLevel >= pAccessLevel and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ����������� ���� �������� ������������ �� ������ � ������� ID='||pID, 1);
  end;
          
  if Result > 0 then 
     return 1;
  end if;

  -- ���������� ���� �� ���� ����� ������, � ������� ������ ������������, ����� �� ��� ����� 
  -- ������� ������� ������� � �������
  -- ��� - Ok

  -- ���� �� ����� ������� � �����-���� ������ � ������� ������ ������������
  begin
    select	1 
    into 	Result
    from	fdc_User_In_Group UG,
        	fdc_User_Group_Grant UGG
    where	UG.User_ID = pUser_ID and
	        UGG.Object_ID = pID and
        	UGG.User_Group_ID = UG.User_Group_ID and
        	UGG.AccessLevel >= pAccessLevel and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ����������� ���� ����� �������� ������������ �� ������ � ������� ID='||pID, 1);
  end;
          
  if Result > 0 then 
     return 1;
  end if;
  
  -- ���� �� ����� � ����� ������� ����������, �� ���������

  if (Result = 0) and (pDoRaise <> 0) then
	   fdc_util.abort('������������ �� ����� ������������ ������ ������� ��� ���������� ��������.');
  end if;

  return 0;
end fdc_Object_Check_Access_Level;
/
