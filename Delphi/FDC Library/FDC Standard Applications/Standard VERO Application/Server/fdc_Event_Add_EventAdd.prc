create or replace procedure fdc_Event_Add_EventAdd
-- �������� ������� �������� �������
	(
	pID number,                       -- ������������� ���������� �������
	pName varchar2 := null            -- �������� ������� (���� Null, �� ����� ������������� �������������)
	)
is
  pNewID number(15);
begin
  -- ����� ������� ��������� �������� �������
  pNewID := fdc_Event_Add('EventAdd', nvl(trim(pName),'������ ������ '||fdc_Object_Get_Name(pID, 0, 1)),pID);

end fdc_Event_Add_EventAdd;
/
