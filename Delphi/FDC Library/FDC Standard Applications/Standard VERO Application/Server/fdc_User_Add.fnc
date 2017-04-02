create or replace function fdc_User_Add
-- ����������� ������ ������������ ������� � VERO
-- ���������� ��� �������������
	(
	  pObject_Type_SysName	varchar2,    -- ��������� ��� ���������� ���� ������������
  	pLogin		varchar2,                -- ��� �����
	  pLastName	varchar2,                -- �������
	  pFirstName	varchar2,              -- ���
	  pMiddleName	varchar2,              -- ��������
    pShortName varchar2 := null,       -- �������� �������� 
    pDescript varchar2 := null         -- ����������� 
	)
    return number
is
  pNewID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'User'
  fdc_Object_Type_Is(pObject_Type_SysName, 'User');   

  -- ������� ������ ������������
  pNewID := fdc_Object_Add(pObject_Type_SysName, trim(pLastName||' '||pFirstName||' '||pMiddleName), 1,
                     null, null, pShortName, pDescript);
  
  -- ���� ����������� ������ ������ ��������������� ����� � ������ ������������
  fdc_Object_Grant_Upd(pNewID, fdc_User_Group_Get_AdminTask, 3, 1);

  -- ������� ������ � ������� fdc_User
  insert into fdc_User(ID, Login, LastName, FirstName, MiddleName, AllowGrantOption)
      values(pNewID, upper(pLogin), pLastName, pFirstName, pMiddleName, 0);

  -- ���������� ������������� ������ ������������    
  return pNewID;
end fdc_User_Add;
/
