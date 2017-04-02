create or replace procedure fdc_Value_Upd
-- �������� ��������� ��������� ��� �������������� �������
	(
	  pID	number,                       -- �������������
	  pName varchar2,                   -- ��������
    pSysName  varchar2,               -- ��������� ���
    pStringValue varchar2,            -- ��������� �������� 
    pNumValue number,                 -- �������� ��������
    pDateTimeValue date,              -- ��������� ��������
    pRef_Object_ID number,            -- ������������� �������, �� ������� �������� ������ 
	  pShortName varchar2,              -- �������� ��������
	  pDescript varchar2                -- ��������
	)
is
 pOwner_ID number(15);
 pSchID number(15);
 pValName varchar2(1500);
 pLevel number;
 pIsSystem number;
begin
 -- ���� ��� �������� �� ������, �� ����� � ��������� ����������
  if (pStringValue is null) and (pNumValue is null) 
         and (pDateTimeValue is null) and (pRef_Object_ID is null) then
	   fdc_util.abort('���������� ������ �������� ��������');
  end if;
  
  -- ���� ��������� �������� � �������� �� ��� ���������
  begin
    select IsSystem, Owner_Object_ID
      into pIsSystem, pOwner_ID
      from fdc_Value_Lst
     where ID = pID;
  exception 
    when NO_DATA_FOUND then
         fdc_util.abort('�� ������� �������� �� ID = '||pID);
  	when others then 
         fdc_util.abort('������ ����������� �������� �� ID = '||pID, 1); 
  end; 

 -- ���������, ���� �� � ������������ ������ �� ��������� �������-���������
 -- ���� ��� - ����������
 if (pOwner_ID is not null) then
    pLevel := fdc_Object_Check_Access_Level(pOwner_ID,2,1);
 end if;
 
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
          and V.IsSystem <> 0
          and V.ID <> pID;
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
   else
     -- ���� �� ����� ��������, �� ����� � ��������� ����������
     if (pOwner_ID is null) then
        fdc_util.abort('�� ����� ������-�������� ��������������� ��������');
     end if;
     
     -- ���� �������� �������� �� ������, �� � �������� �������� ����� ��� ��������� �������� 
     pValName := NVL(pName, pStringValue);
  end if;      
 
 -- ����� ������� ��������� ��������� �������
 fdc_Object_Upd(pID, pValName, pShortName, pDescript);
 
 -- ������ ��������� ��� 
 fdc_Object_Upd_SysName(pID, pSysName);
  
 -- �������� ������ � ������� fdc_Value 
 update	fdc_Value
    set	StringValue = pStringValue,
        NumValue = pNumValue,
        DateTimeValue = pDateTimeValue,
        Ref_Object_ID = pRef_Object_ID
  where ID = pID;
end fdc_Value_Upd;
/
