create or replace procedure fdc_User_Group_Grant_Del
-- �������� ����� � ������ ������������� �� �������� ������
	(
	pUser_Group_ID number,           -- ������������� ������, � ������� ��������� �����
	pObject_ID	number,              -- ������������� �������, �� ������� ��������� �����
	pDoNotCheck 	number := 0        -- �� ����� 0 - �� ��������� ���������� �������� ������������ �� ������ ���� �� �������� ������
                                   -- 0 - ��������� ���������� �������� ������������ (�� ���������)
	)
is
  pChk1 number := 0;
  pEventID number;
begin
  -- �������� ���������� �������� ������������
  if (pDoNotCheck = 0) then
  	pChk1 := fdc_Object_Check_Access_Level(pObject_ID, 3, 1);
  end if;
  
  -- ��������� ������
  delete from fdc_User_Group_Grant
    where	User_Group_ID = pUser_Group_ID and
          Object_ID = pObject_ID;
          
  -- ������� ��������������� �������
  pEventID := fdc_Event_Add('EventAccessUpd',
          '������ ����������� ������ � ' || fdc_Object_Get_Name(pObject_ID, 1) || 
          ' ��� ������ ' || fdc_Object_Get_Name(pUser_Group_ID), pObject_ID);        
end fdc_User_Group_Grant_Del;
/
