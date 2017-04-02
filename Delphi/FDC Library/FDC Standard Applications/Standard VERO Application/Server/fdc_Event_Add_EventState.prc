create or replace procedure fdc_Event_Add_EventState
-- �������� ���������� ������� �������� ���������
	(
	pEvent_Type_SysName	varchar2,                  -- ��������� ��� ���� �������
	pObject_ID		number,                          -- ������, �� �������� ��������� �������
	pState_Transit_ID	number                       -- ������������� �������� ���������
	)
is
  pNewID number(15);
  pName varchar2(1500);
begin
  -- �������� ���� �������  
  fdc_Object_Type_Is(pEvent_Type_SysName,'EventState');

  -- ��������� �������� �������
  begin
    select	'��������� "'||Name||'"'||' �� '||fdc_Object_Get_Name(pObject_ID, 0, 1)
    into	pName
    from	fdc_Object
    where	ID = pState_Transit_ID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ��������� ������� ��������� �� ID = '||pState_Transit_ID);
  	when others then fdc_util.Abort('������ �������� �������� ��������� �� ID = '||pState_Transit_ID, 1);
  end;
  
  -- �������� �������
  pNewID := fdc_Event_Add('EventState', pName, pObject_ID);
  
  -- ���������� ������ � ������� fdc_Event_State
  insert into fdc_Event_State(ID,State_Transit_ID)
  values(pNewID,pState_Transit_ID);
end fdc_Event_Add_EventState;
/
