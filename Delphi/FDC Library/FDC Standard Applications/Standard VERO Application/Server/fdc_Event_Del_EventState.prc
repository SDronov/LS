create or replace procedure fdc_Event_Del_EventState
-- �������� ������� �������� ���������
	(
	pID number                 -- ������������� ���������� �������
	)
is
begin
  -- �������� ������ �� ������� fdc_Event_State
  delete from fdc_Event_State
  where ID = pID;
  
  -- ����� ������� ��������� �������� �������
  fdc_Event_Del(pID);
  
end fdc_Event_Del_EventState;
/
