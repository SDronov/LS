create or replace function fdc_ValueBool_Add
-- ���������� ��������� ��������� ��� ��������������� �������� ������-���� 
	(
    pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- ��������
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������   
	  pOwner_Object_ID	number,         -- ������������� �������-���������
    pNumValue	 number,                -- ����������� �������� (1 - ������, 0 - ����)  
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  pValName varchar2(1500);
  pNewID number;
begin
  -- ���� ����������� �������� �� ������, �� ����� � ��������� ����������
  if (pNumValue is null) then
	   fdc_util.abort('���������� ������ ����������� ��������');
  end if;

  -- ������� ��������� ��������, ��������, ��� �������� 0 ��� 1
  -- ���� ���, �� ����� � ��������� ����������  
  if (pNumValue = 1) then
	   pValName := '��';
  elsif (pNumValue = 0) then
     pValName := '���';
   else
     fdc_util.abort('�������� ������ ���� 0 ��� 1');  
  end if;
  
  -- ��������, ��� pObject_Type_SysName - ������� 'ValueBool'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueBool');

  -- �������� ������� �������
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pValName, 
               pNumValue, null, null, pShortName, pDescript);

  -- ���������� �������������
  return pNewID;
end fdc_ValueBool_Add;
/
