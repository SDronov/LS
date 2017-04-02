create or replace function fdc_User_Is_In_Group
-- ���������� �������������� ������������ � ������.
-- ���������: 1 - ������������ ������ � ������, 0 - ���
	(
	pGroupSysName varchar2,         -- ��������� ��� ������
  pUser_ID number := 0,           -- ID ������������, ��� �������� 0 ������� ������� ������������ ������������
	pDoRaise number := 1            -- ��������� �� ���������� ��� �� ��������� ������������ � ������
                                  -- �� ��������� ��������� (�������� �������� �� 0)
                                  -- ��� �������� 0 ��������� �� ����
	)
return number
is
  result number := 0;
  pGroupName varchar2(1500) := null;
begin
  if pUser_ID = 0 then
    -- ������� ����������� �� ������� ������������ � ������
    begin
      select --+ordered	 
             1
        into result
        from fdc_User U,
  	         fdc_User_In_Group UIG,
  	         fdc_Object G
       where upper(U.Login) = user and
             UIG.User_ID = U.ID and
             G.ID = UIG.User_Group_ID and
             G.SysName = pGroupSysName and
             rownum <= 1;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('������ ����������� �������������� �������� ������������ � ������ '||pGroupSysName, 1);
    end;
  else   
    -- ������� ����������� �� �������� ������������ � ������
    begin
      select --+ordered	 
             1
        into result
        from fdc_User_In_Group UIG,
  	         fdc_Object G
       where UIG.User_ID = pUser_ID and
             G.ID = UIG.User_Group_ID and
             G.SysName = pGroupSysName and
             rownum <= 1;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('������ ����������� �������������� ������������ (ID='||pUser_ID||') � ������ '||pGroupSysName, 1);
    end;
  end if;
    
  -- ���� �� ����������� � ������ ���� ������� ����������...
  if result = 0 and pDoRaise <> 0 then
     -- �������� ���������� �������� ������ �� �� ���������� �����   
    begin
      select Name 
      into pGroupName
      from Fdc_Object
      where SysName = pGroupSysName; 
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('������ ����������� �������� ������ '||pGroupSysName, 1);
    end;
     
    -- ��������� ����������
    fdc_util.abort('��� ���������� �������� ���������� ���������� ����� ������ "'|| pGroupName || '" ('||pGroupSysName||')');
  end if;
  
  -- ���������� ���������
  return result;
end fdc_User_Is_In_Group;
/
