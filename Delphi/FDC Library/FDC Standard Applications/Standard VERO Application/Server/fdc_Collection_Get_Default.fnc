create or replace function fdc_Collection_Get_Default
-- �������� ������� ������� �������� ��� ������������
  (
  pUser_ID number := 0           -- ������������� ������������, ��� �������� 0 ������� ������� ������������ ������������
  )
return number
is
  ppUser_ID number;
  pID number;
begin
  -- �������� ������������� ������������
  if  pUser_ID = 0 then
    ppUser_ID := fdc_User_Get;
  else
    ppUser_ID := pUser_ID;
  end if;
 
  -- �������� ������������� �������
  begin
  select	ID
  into	pID
  from	fdc_Collection_Lst
  where	User_ID = ppUser_ID and
  	    DefCollection = 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ ��������� ������� �������� ��� ������������', 1);
  end;
    
  -- ���� ��� ������� ������� �������� - ������� ��
  if pID is null then
    pID := fdc_Collection_Add( pobject_type_sysname => 'Collection',
                               pname => '������� ��������',
                               pshortname => '������� ��������',
                               puser_id => ppUser_ID,                               
                               pdescript => '������������� ��������� ������� ��������',
                               pdefcollection => 1);
  end if;

  -- ������� ���������� �������������
  return pID;
end fdc_Collection_Get_Default;
/
