create or replace procedure fdc_Value_Sys_Set
-- �������� �������� ��������� ��������� �� �� ���������� �����
	(
	  pSysName	varchar2,       -- ��������� ���  
    pStringValue varchar2,    -- ��������� �������� �������� 
    pNumValue number,         -- �������� �������� ��������
    pDateTimeValue date,      -- ��������� �������� ��������
    pRef_Object_ID number     -- ������ �� ������ ����
	)
is
  pID number(15);
begin
  -- ���� ��� �������� �� ������, �� ����� � ��������� ����������
  if (pStringValue is null) and (pNumValue is null) and (pDateTimeValue is null)
         and (pRef_Object_ID is null) then
	   fdc_util.abort('���������� ������ ��������� ��������');
  end if;

  -- ���� ��������� ���������
  begin
    select ID
      into pID
      from fdc_Value_Lst
     where SysName = pSysName
       and IsSystem <> 0;
  exception
    when NO_DATA_FOUND then fdc_util.Abort('�� ������� ��������� ��������� �� ���������� ����� '||pSysName);
 	  when others then fdc_util.Abort('������ ��������� ��������� ��������� �� ���������� ����� '||pSysName, 1);    
  end;
  
  -- �������� ������ � ������� fdc_Sys_Value 
  update fdc_Value
     set StringValue = pStringValue,
         NumValue = pNumValue,
         DateTimeValue = pDateTimeValue,
         Ref_Object_ID = pRef_Object_ID
   where ID = pID;
   
end fdc_Value_Sys_Set;
/
