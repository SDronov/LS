create or replace function fdc_State_Scheme_Add
-- ������� ����� ����� ��������� � ���������� �� �������������
	(
	  pObject_Type_SysName varchar2,  -- ��������� ��� ���������� ���� �����
	  pName	varchar2,                 -- ��������
    pShortName varchar2 := null,    -- �������� ��������
	  pDescript varchar2 := null      -- ��������
	)
    return number
is
  pNewID number(15);
  pEvent_ID number(15);
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'StateScheme'
  fdc_Object_Type_Is(pObject_Type_SysName,'StateScheme');

  -- ������� ������ ����� ���������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, null, pShortName, pDescript);

  -- ������� ������ � ������� fdc_State_Scheme
  insert into fdc_State_Scheme(ID)
       values(pNewID);

  -- ���������� ������������� �����     
  return pNewID;
end fdc_State_Scheme_Add;
/
