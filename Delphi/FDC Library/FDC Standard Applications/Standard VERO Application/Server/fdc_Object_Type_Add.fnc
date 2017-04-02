create or replace function fdc_Object_Type_Add
-- �������� ���� �������
-- ��������������, ��� 2 �������� ����: 'Object' � 'ObjectType' ��� ����������
-- ���������� ������������� ����
	(
	pObject_Type_SysName	varchar2,    -- ��������� ��� ���� "��� �������"('ObjectType', 'EventType') 
	pName			varchar2 := null,        -- ������ ������������ ������������ ����
	pSysName		varchar2,              -- ��������� ��� ������������ ����
  pShortName	varchar2,              -- ������� ������������ ������������ ���� (����������� ����� �� ������������, ���������� �� ���� ���)  
	pTableName	varchar2,              -- ������������ ������� ��� ������ ����� ���� (���� null, ������� � ������������� ����)  
	pIcon			varchar2,                -- ������ ���� � ���� ������ (���� null, ������� � ������������� ����)                  
	pState_Scheme_ID	number,          -- ����� ��������� ������� ������� ����   
	pParent_Object_Type_ID	number,    -- ������������ ��� (������ not null!)
  pObjectTableInstance number := 1,  -- �������� �� ���������� ���� � ������� fdc_object 
                                     -- ��� ���� ��������� ����� - 1
                                     -- ��� ������� (� � ����������� ������ ����������� �����) - 0
	pDescript		varchar2 := null       -- ����������� � ���� �������
	)
return number
is
  pNewID number(15);
  ppTableName varchar2(1500);
  pParentType fdc_Object_Type%rowtype;
  ppIcon varchar2(4000);
  ppState_Scheme_ID	number;
  ppObjectTableInstance number(1);
  pChk number;
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'ObjectType'
  fdc_Object_Type_Is(pObject_Type_SysName,'ObjectType');
  
  -- �������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);
  
  -- ��������� ������ ������������� ����. ��� � ����� ������ �����������
  if pParent_Object_Type_ID is not null then
    begin
      select *
      into pParentType
      from fdc_Object_Type T
      where ID = pParent_Object_Type_ID; 
    exception
    	when others then fdc_util.abort('������ ��������� ������������� ���� ID='||pParent_Object_Type_ID, 1);
    end;
  end if;  

  -- ����������� ������� ����
  ppTableName := upper(trim(pTableName));
  if ppTableName is not null then
    -- ������� �������� �� ����������. ���������, �� ������������ �� �������� �����
    -- ����������� ���������: ���� ������� ��� ����������� ����� ���� ����, ����� �� ��� ������ ���� ������������ ���
    -- ����� ������: ���� ������� ������������� ���� �� �� �� �����, ��� ������� ������������ ����,
    --               ������ ��� ������� (������������ ����) �� ������������ ��� ������������ �����-���� ������ ��������� �����
    if ppTableName <> pParentType.Tablename then
      pChk := 0;
      begin
        select 1
        into pChk
        from fdc_Object_Type T
        where T.Tablename = ppTableName and
              rownum <= 1;
      exception
    	  when NO_DATA_FOUND then null;
      	when others then fdc_util.abort('������ �������� ������������ ������� ����', 1);
      end;
      if pChk > 0 then
        fdc_Util.Abort('������������ ������������� ������� ��� ����. ������ ������� ������������ � ������ ��������.');
      end if;
    end if;
  else
    -- ���� ������� �� �������� �� ����������, ����� �� �� ������������� ����
    ppTableName := pParentType.Tablename;
  end if;
  
  -- ����������� ������ ����
  ppIcon := nvl(pIcon, pParentType.Icon);
  
  -- ����������� ����� ��������������� ���� � ������� ��������
  ppObjectTableInstance := nvl(pObjectTableInstance, pParentType.Objecttableinstance);
  
  -- ����������� ����� ���������
  if ppObjectTableInstance = 0 then
    if pState_Scheme_ID is not null then
      fdc_Util.Abort('���������������� � �������� ��� �� ����� ����� ����� ���������!');
    end if;  
  else
    ppState_Scheme_ID := nvl(pState_Scheme_ID, pParentType.State_Scheme_Id);
  end if;
  
  -- ���������� ������ � ������� ObjectType
  insert into fdc_Object_Type(ID,Name, ShortName, SysName, TableName, 
                              Icon, State_Scheme_ID, Parent_Object_Type_ID, ObjectTableInstance)
  values(pNewID,pName, pShortName, pSysName, ppTableName, 
         ppIcon, ppState_Scheme_ID, pParent_Object_Type_ID, ppObjectTableInstance);
  
  -- ����������� �������� ������������ � ������������� ����
  insert into fdc_Child_Object_Type(Object_Type_ID,Child_Object_Type_ID)
  (select Object_Type_ID,pNewID
  from	fdc_Child_Object_Type
  where	Child_Object_Type_ID = pParent_Object_Type_ID);
  
  -- ���������� ������ ���-�-���� � �������� ������������
  insert into fdc_Child_Object_Type(Object_Type_ID,Child_Object_Type_ID) values (pNewID,pNewID);
  
  -- ������� ������ ID
  return pNewID;
exception
  when others then
    Fdc_Util.Abort('�� ������ ���������� ���������� ���� '||pName||':', 1);
end fdc_Object_Type_Add;
/
