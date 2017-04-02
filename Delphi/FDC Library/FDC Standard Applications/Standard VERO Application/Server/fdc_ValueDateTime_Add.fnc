create or replace function fdc_ValueDateTime_Add
-- ���������� ��������� ��������� ��� ��������������� �������� ����. 
	(
    pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- ��������  
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������
	  pOwner_Object_ID	number,         -- ������������� �������-���������
    pDateTimeValue date,              -- �������� ����
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  pValName varchar2(1500);
  pNewID number;
begin
  -- ���� �������� ���� �� ������, �� ����� � ��������� ����������
  if (pDateTimeValue is null) then
	   fdc_util.abort('���������� ������ �������� ����');
  end if;

  -- ��������, ��� pObject_Type_SysName - ������� 'ValueDateTime'
  fdc_Object_Type_Is(pObject_Type_SysName,'ValueDateTime');

  -- ������� ��������� ������ ����
  if (trim(pDateTimeValue) <> pDateTimeValue) then
	   pValName := To_Char(pDateTimeValue,'DD.MM.YYYY HH24.MI.SS');
   else	
     pValName := To_Char(pDateTimeValue,'DD.MM.YYYY');
  end if;

  -- �������� ������� �������
  pNewID := fdc_Value_Add(pObject_Type_SysName, pName, pSysName, pIsSystem, pOwner_Object_ID, pValName, 
               null, pDateTimeValue, null, pShortName, pDescript);

  -- ���������� �������������            
  return pNewID;
end fdc_ValueDateTime_Add;
/
