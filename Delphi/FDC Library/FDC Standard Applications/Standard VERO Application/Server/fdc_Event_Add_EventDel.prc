create or replace procedure fdc_Event_Add_EventDel
-- �������� ������� �������� �������
-- ��������������, ��� � ���� ������ ��� ������ ��������� ��� �� ������
-- ��� ��������� ����������� (� ����������� �� ���������) ���������� �� fdc_Object_Del
	(
	pID number,                   -- ������������� ���������� �������
  pDescript varchar2 := null    -- ������, ������������ � ���� descript �������            
	)
is
  pNewID number(15);
begin
  -- ����� ������� ��������� �������� �������
  pNewID := fdc_Event_Add('EventDel','������ ������ '||fdc_Object_Get_Name(pID,1, 1), pID, pDescript);

end fdc_Event_Add_EventDel;
/
