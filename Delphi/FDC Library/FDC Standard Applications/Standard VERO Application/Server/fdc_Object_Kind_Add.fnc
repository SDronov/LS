create or replace function fdc_Object_Kind_Add
-- ��������� ����� ������� ������� � ���������� �� �������������
	(
	  pObject_Type_SysName varchar2, -- ��������� ��� ���������� ����   
	  pObject_ID number,             -- ������������� �������, � �������� �������� �������   
	  pKind_ID number,               -- ������������� �������
	  pEvidence_ID number,           -- ������������� ��������� �������
  	pDescript varchar2 := null     -- ��������
	)
    return number
is
  pNewID number(15);
  pName varchar2(1500);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'ObjectKind'
  fdc_Object_Type_Is(pObject_Type_SysName,'ObjectKind');

  -- ������� �������� ������� �������
  begin
    select P.Name||' - '||K.Name
      into pName
      from fdc_Object P,
	         fdc_Object K
     where P.ID = pObject_ID and
	         K.ID = pKind_ID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������� ��������� ������ � �������.', 1);
  	when others then fdc_util.Abort('������ ��������� ���������� ������ � �������.', 1);
  end;         

  -- ������� ����� ������ ������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 2,
                pObject_ID, null, null, pDescript);

  -- ��������� ������ � ������� fdc_Object_Kind
  -- ���� ��������� �� ������, �� � �������� ��������� ������� �������� ������������              
  insert into fdc_Object_Kind(ID, Kind_ID, Evidence_ID)
        values(pNewID, pKind_ID, nvl(pEvidence_ID, fdc_User_Get));

  -- ���������� �������������
  return pNewID;
  
end fdc_Object_Kind_Add;
/
