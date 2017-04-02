create or replace function fdc_Kind_Add
-- ������� ����� ������� � ���������� ��� �������������
	(
	  pObject_Type_SysName varchar2,  -- ��������� ��� ���������� ����
	  pName varchar2,                 -- ��������
	  pSysName varchar2,              -- ��������� ��������
	  pRate	number,                   -- ���������� (0 - 100)
	  pIcon	varchar2,                 -- ������ �������
	  pShortName varchar2 := null,    -- �������� ��������
	  pDescript varchar2 := null      -- ��������
	)
  return number
is
  pNewID number(15);
begin
  -- ���������, ��� ���������� �� 0 �� 100
  if (pRate < 0) or (pRate > 100) then
	   fdc_util.abort('���������� ������� ������ ���� �� 0 �� 100');
  end if;

  -- ��������, ��� pObject_Type_SysName - ������� 'Kind'
  fdc_Object_Type_Is(pObject_Type_SysName,'Kind');

  -- ������� ������ �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, pSysName, pShortName, pDescript);
  
  -- ���� ������ ������ ������ � �������
  fdc_Object_Grant_Upd(pNewID, fdc_User_Get, 3, 1);
  
  -- ��������� ������ � ������� fdc_Kind
  insert into fdc_Kind(ID, Rate, Icon)
         values( pNewID, pRate, pIcon);

  -- ���������� �������������       
  return pNewID;
end fdc_Kind_Add;
/
