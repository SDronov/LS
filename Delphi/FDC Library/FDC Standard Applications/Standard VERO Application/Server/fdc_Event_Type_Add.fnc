create or replace function fdc_Event_Type_Add
-- �������� ���� �������
	(
	pObject_Type_SysName	varchar2,             -- ��������� ��� ���� "��� �������"(������ ���� ����������� 'EventType') 
	pName			varchar2 := null,                 -- ������ ������������ ������������ ����
	pSysName		varchar2,                       -- ��������� ��� ������������ ����
  pShortName		varchar2,                     -- ������� ������������ ������������ ���� (����������� ����� �� ������������, ���������� �� ���� ���) 
	pTableName		varchar2,                     -- ������������ ������� ��� ������ ����� ���� (���� null, ������� � ������������� ����)  
	pIcon			varchar2,                         -- ������ ���� � ���� ������ (���� null, ������� � ������������� ����)
	pParent_Event_Type_ID	number,               -- ������������ ��� �������(������ not null!)
	pDescript		varchar2 := null                -- ����������� � ���� �������
	)
return number
is
pNewID number(15);
begin
  -- ��������, ��� ��� ������������� ��� �������   
  fdc_Object_Type_Is(pObject_Type_SysName,'EventType');
  
  -- �������� ������ ���������� ����
  pNewID := fdc_Object_Type_Add(
  		pObject_Type_SysName,
  		pName,
  		pSysName,
      pShortName,
  		pTableName,
  		pIcon,
  		null,
  		pParent_Event_Type_ID,
      0,
  		pDescript);
  
  -- "������������" � ������� fdc_Event_Type
  insert into fdc_Event_Type(ID)
  values(pNewID);
  
  -- ������� �������������� ������ ���� �������
  return pNewID;
end fdc_Event_Type_Add;
/
