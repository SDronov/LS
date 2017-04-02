create or replace function fdc_ValueString_Add
-- ���������� ��������� ��������� ��� ��������������� �������� ������
	(
	  pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- ��������
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������  
	  pOwner_Object_ID	number,         -- ������������� �������-���������
    pStringValue   varchar2,          -- ��������� ��������
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  pNewID number;
begin
  -- ���� ��������� �������� �� ������, �� ����� � ��������� ����������
  if (pStringValue is null) then
	   fdc_util.abort('���������� ������ ��������� ��������');
  end if;

  -- ��������, ��� pObject_Type_SysName - ������� 'ValueString'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueString');

  -- �������� ������� �������
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pStringValue, 
               null, null, null, pShortName, pDescript);

  -- ���������� �������������  
  return pNewID;
end fdc_ValueString_Add;
/
