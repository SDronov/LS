create or replace function fdc_Value_Add
-- ���������� ��������� ��������� ��� ��������������� �������� � �������.. 
	(
	  pObject_Type_SysName	varchar2,   -- ��������� ��� ���������� ����
	  pName			varchar2,               -- ��������  
    pSysName  varchar2,               -- ��������� ���
    pIsSystem number,                 -- ������� ��������� ���������
    pOwner_Object_ID	number,         -- ������������� �������-���������
    pStringValue varchar2,            -- ��������� �������� 
    pNumValue number := null,         -- �������� ��������
    pDateTimeValue date := null,      -- ��������� ��������
    pRef_Object_ID number := null,    -- ������������� �������, �� ������� �������� ������ 
	  pShortName   varchar2 := null,    -- �������� ��������
	  pDescript		varchar2 := null      -- ��������
	)
    return number
is
  
  pNewID	number(15);
  pSchID number(15);
  pValName varchar2(1500);
  pLevel number;
begin
  -- ���� ��� �������� �� ������, �� ����� � ��������� ����������
  if (pStringValue is null) and (pNumValue is null) 
         and (pDateTimeValue is null) and (pRef_Object_ID is null) then
	   fdc_util.abort('���������� ������ ��������');
  end if;
  
  -- ��������, ��� pObject_Type_SysName - ������� 'Value'
  fdc_Object_Type_Is(pObject_Type_SysName,'Value');

  -- ��������� ��������� ������ ����� �������� � ��������� ���, � ������� �������-���������
  if (pIsSystem <> 0) then
     -- ���� �� ������ ��������� ���, �� ����� � ��������� ����������
     if (pSysName is null) then
        fdc_util.abort('�� ������ ��������� ��� ��������� ���������');
     end if;
     
     -- ���� �� ������ ��������, �� ����� � ��������� ����������
     if (pName is null) then
	      fdc_util.abort('���������� ������ �������� ���������� ��������');
     end if;
     
     -- ��������, ��� �� ���������� ��������� ��������� � ����� ��������� ������
     begin
       select V.ID
         into pSchID
         from fdc_Value V, fdc_Object O
        where O.ID = V.ID
          and upper(O.SysName) = upper(pSysName) 
          and V.IsSystem <> 0;
     exception
       when NO_DATA_FOUND then 
         null;
       when others then 
         fdc_util.abort('������ ������ ��������� ��������� � ��������� ������ '||pSysName, 1);   
     end;
     
     if (pSchID is not null) then
        fdc_util.abort('��������� ��������� � ��������� ������ ' || pSysName || ' ��� ����������.');      
     end if;
     
     pValName := pName;
     
     -- ������� ������� ��� ��������� �� ������
     pLevel := 1;
   else
     -- ���� �� ����� ��������, �� ����� � ��������� ����������
     if (pOwner_Object_ID is null) then
        fdc_util.abort('�� ����� ������-�������� ��������������� ��������');
     end if;
     
     -- ��������� ����� �� ������������ ������ �� ������ � �������, � �������� ����������� �������
     -- ���� �� �����, �� ����������
      pLevel := fdc_Object_Check_Access_Level(pOwner_Object_ID,1,1);
      
      -- ���� �������� �������� �� ������, �� � �������� �������� ����� ��� ��������� �������� 
      pValName := NVL(pName, pStringValue);
      
      -- ������� ������� ��� �������� �� ������-������
      pLevel := 2;
  end if;      

  -- ������� ����� ������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pValName, pLevel,
                pOwner_Object_ID, pSysName, pShortName, pDescript);

  -- ������� ������ � ������� fdc_Value               
  insert into fdc_Value(ID, IsSystem, StringValue, NumValue, DateTimeValue, Ref_Object_ID)
           values (pNewID, pIsSystem, pStringValue, pNumValue, pDateTimeValue, pRef_Object_ID);

  -- ���������� ������������� ������ ��������
  return pNewID;
end fdc_Value_Add;
/
