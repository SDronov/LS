create or replace function fdc_Object_Relation_Add
-- ��������� ����� ��������� ����� ���������
	(
	  pObject_Type_SysName varchar2,  -- ��������� ��� ���������� ����
    pName varchar2,                 -- ��������
	  pObject_ID number,              -- ������������� ������� 
    pRel_Object_Id number,          -- ������������� �������, � ������� ��������������� ���������
    pRole varchar2,                 -- ����
    pBackwardRole varchar2,         -- �������� ����
    pShortName varchar2 := null,    -- �������� ��������
	  pDescript	varchar2 := null      -- ��������
  )
    return number
is
  pNewID number;
begin
  -- ��������, ��� pObject_Type_SysName - ������� 'ObjectRelation'
  fdc_Object_Type_Is(pObject_Type_SysName,'ObjectRelation');

  -- ������� ����� ������ ��������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 2,
                     null, null, pShortName, pDescript);

  -- ������� ������ � ������� Fdc_Object_Relation                    
  insert into Fdc_Object_Relation(Id, Object_Id, Rel_Object_Id, Role, Backwardrole)
       values (pNewId, pObject_Id, pRel_Object_Id, pRole, pBackwardrole);

  -- ���������� �������������  
  return pNewId;
end;
/
