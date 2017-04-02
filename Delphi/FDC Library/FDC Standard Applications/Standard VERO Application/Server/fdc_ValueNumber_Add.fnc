create or replace function fdc_ValueNumber_Add
-- ���������� ��������� ��������� ��� ��������������� �������� �����. 
	(
    pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- �������� 
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������   
	  pOwner_Object_ID	number,         -- ������������� �������-���������
    pNumValue	 number,                -- �������� �����   
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  pNewID number;
begin
  -- ���� �������� �������� �� ������, �� ����� � ��������� ����������
  if (pNumValue is null) then
	   fdc_util.abort('���������� ������ �������� �����');
  end if;

  -- ��������, ��� pObject_Type_SysName - ������� 'ValueNumber'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueNumber');

  -- �������� ������� ������� ��������
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pNumValue, 
               pNumValue, null, null, pShortName, pDescript);

  -- ���������� �������������             
  return pNewID;
end fdc_ValueNumber_Add;
/
