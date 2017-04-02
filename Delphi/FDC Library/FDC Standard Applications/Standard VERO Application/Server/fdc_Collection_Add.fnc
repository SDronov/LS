create or replace function fdc_Collection_Add
-- �������� �������� ��������
	(
	pObject_Type_SysName	varchar2,             -- ��������� ��� ���� �������� (������ ���� �������� 'Collection') 
	pName			varchar2,                         -- ������������ ��������
  pShortName    varchar2,                     -- ������� ������������ ��������
	pUser_ID    number := null,                 -- ������������ - �������� ��������. � ������ NULL ������� ������� ������������ ������������
	pDescript		varchar2 := null,               -- ����������� � ��������
	pDefCollection		number := 0               -- ��������� �� ��� ������� ������� ��������
	)
return number
is
  pNewID number(15);
  ppUser_ID number(15);
begin
  -- �������� ���� ��������  
  fdc_Object_Type_Is(pObject_Type_SysName,'Collection');

  -- ��������� �������������� ������������
  ppUser_ID := nvl(pUser_ID,fdc_User_Get);

  -- �������� ���������� ������� (����� ������ ������)
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, null, pShortName, pDescript);

  -- ���� ������������ ����� �� ��������� � ������� ���� �� ������
  fdc_Object_Grant_Upd(pNewID, ppUser_ID, 3, 1);

  -- ���� ������� ������� �������� - ����� ����� ������� "�������" � ������ ��������
  if pDefCollection = 1 then
  	update	fdc_Collection
  	set	DefCollection = 0
  	where	User_ID = ppUser_ID and
          DefCollection = 1;
  end if;

  -- �������� ������ � fdc_Collection
  insert into fdc_Collection(ID, User_Id, Coldate, Defcollection)
  values(pNewID, ppUser_ID, sysdate, pDefCollection);
  
  return pNewID;
end fdc_Collection_Add;
/
