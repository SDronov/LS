create or replace function fdc_Dict_Add
-- ���������� ������� �����������
	(
	pObject_Type_SysName	varchar2,      -- ��������� ��� ���� ����������� (������ ���� �������� 'Dict') 
	pOwner_Object_ID	number,            -- "������������" ������� ���� �� ����������� (��� ������������� ������������)
	pName			varchar2,                  -- ������������ (��������� ��������)
  pShortName  varchar2,                -- ������� ������������ ������� �����������                         
	pCode			varchar2,                  -- ��� ������� ����������� (��������, ��� �����, �����)
	pCode2			varchar2 := null,        -- �������������� ��� ������� ����������� (��� �������������)
	pDescript		varchar2 := null         -- ����������� � �������
	)
return number
is
  pChk number;
  pNewID number(15);
begin
  -- �������� ���� �����������  
  fdc_Object_Type_Is(pObject_Type_SysName,'Dict');
  
  -- �������� ���� ������������ �������
  if (pOwner_Object_ID is not null) and (fdc_Object_Is(pOwner_Object_ID, 'Dict') = 0) then
    Fdc_Util.Abort('������, ��������� ��� ������������ ������� � ����������� (ID='||pOwner_Object_ID||') �� �������� �������� �����������');
  end if;
  
  -- �������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName,pName,1,pOwner_Object_ID,null,pShortName,pDescript);
  
  -- ���� ������������ ����� �� ��������� �������
  fdc_Object_Grant_Upd(pNewID, fdc_User_Get, 2, 1);
  
  -- �������� ������ � fdc_Dict
  insert into fdc_Dict(ID,Code, Code2)
  values(pNewID, pCode, pCode2);
  
  return pNewID;
end fdc_Dict_Add;
/
