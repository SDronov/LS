create or replace function fdc_Event_Add
-- �������� ���������� �������
	(
	pEvent_Type_SysName	varchar2,             -- ��������� ��� ���� �������
	pName			varchar2,                       -- ��� �������
	pObject_ID		number,                     -- ������, �� �������� ��������� �������
	pDescript		varchar2 := null,             -- �������� �������
  pProgram    varchar2 := null              -- �������� ���������, �������������� �������
	)
return number
is
pNewID 		number(15);
pMachine	varchar2(1500);
pEvent_Type_ID number;
begin
  -- ��������, ��� ��� ������������� ��� �������
  fdc_Object_Type_Is(pEvent_Type_SysName,'Event');
  
  -- ��������� �������������� ������ �������
  pNewID := fdc_Object_Get_NewKey;
  
  -- ��������� ����� ������, � ������� ������������ �������
  pMachine := SYS_CONTEXT('USERENV','HOST');
  
  -- ��������� �������������� ���� �������
  pEvent_Type_ID := Fdc_Object_Get_BySysName('EventType', pEvent_Type_SysName);
  
  -- ���������� ������ � ������� fdc_Event
  insert into fdc_Event(ID,Object_ID,Moment, Login, Program, Machine, Event_Type_Id, Name, Descript)
  values(pNewID,pObject_ID,sysdate,user,pProgram, pMachine, pEvent_Type_ID, pName, pDescript);
  
  -- ������� �������������� ������ �������
  return pNewID;
exception
  when others then
    fdc_Util.Abort('������ �������� ������� ', 1);  
end fdc_Event_Add;
/
