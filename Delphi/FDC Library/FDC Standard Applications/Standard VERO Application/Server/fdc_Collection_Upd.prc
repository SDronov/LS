create or replace procedure fdc_Collection_Upd
-- ��������� ��������� ��������
	(
	pID 		number,                               -- ������������� ��������
	pName 		varchar2,                           -- ������������ ��������
  pShortName    varchar2,                       -- ������� ������������ ��������
	pUser_ID	number,                             -- ������������ - �������� ��������
	pDescript	varchar2,                           -- ����������� � ��������
	pDefCollection	number                        -- �������� �� ������� ������� ���������
	)
is
  pCollection fdc_Collection%rowtype;
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Collection') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������');
  end if;

  -- ������� ��������� ��������� ������� �� ���������� ����������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- ��������� ������� ��������
  begin
    select *
    into pCollection
    from fdc_Collection
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ������� ��������� �� ������� �������� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� �������� �������� ID='||pID, 1);
  end;

  -- ��������� ��������� ������ fdc_Collection
  if Nvl(pUser_ID, -1) <> Nvl(pCollection.User_ID, -1) or
     Nvl(pDefCollection, -1) <> Nvl(pCollection.DefCollection, -1) then

    -- ���� �������� ���������� �������, ����� ������ ���� ������� � ������ �������� 
    if pDefCollection = 1 and pCollection.DefCollection = 0 then
    	update	fdc_Collection
    	set	DefCollection = 0
    	where	User_ID = pUser_ID and
            DefCollection = 1;
    end if;
    
    -- ���� ��������� ������ ��������, ����� ���� ������ ������� �����
    if Nvl(pUser_ID, -1) <> Nvl(pCollection.User_ID, -1) then
      fdc_Object_Grant_Upd(pID, pUser_ID, 3, 1);
    end if;  
     
    -- ���������� ��������� ������ � fdc_Collection 
    update	fdc_Collection
    set	User_ID =	pUser_ID,
    	  DefCollection = pDefCollection
    where	ID = pID;
  end if;   

end fdc_Collection_Upd;
/
