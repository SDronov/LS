create or replace procedure fdc_Event_Del
-- �������� �������
-- ����� �� ��� ���� �� ��������� ������ � ��������������� ������ (AdminData)
-- � ��������� �����
-- ��� ������� ���������, ������� ����� ���� �������������� ��� ����� ������� - �����������
	(
	pID number,               -- ������������� ���������� �������
	pDoLog number := 0        -- ���������� �� ������� �������� ������� 
                            -- � ������ ������ - ��������� �������� ��� ������������� � fdc_Object_Free
	)
is
  pChkID number;
begin
  -- �������� ���������� ������������
  if (fdc_User_Is_AdminData(0, 0) = 0) and (user <>Fdc_Util.Schema) then
    fdc_Util.Abort('������� ������� ����� ������ ������������� ������ ��� �������� ����� ����������!');
  end if;
  
  -- �������� ������ EventState (���� ��� ������� ��������� ���������)
  delete from fdc_Event_State
  where ID = pID;
  
  -- �������� ������ �������
  delete from fdc_Event
  where ID = pID;
  
end fdc_Event_Del;
/
