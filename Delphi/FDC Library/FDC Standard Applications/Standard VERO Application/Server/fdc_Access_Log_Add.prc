create or replace procedure fdc_Access_Log_Add
-- �������� � �������� ������� ������������� � ��������
-- ��������, ���� �������� ������������� �������� ������� � ����������
-- ������ ��������� ����� �� ����������
	(
	pID number,                                   -- ������������� �������
	pAction_Dict_ID number := 0                   -- ������������� ���� �������� ������������ (�� ����������� Dict.AccessAction) 
                                                -- �� ��������� (� ������ pAction_Dict_ID = 0) - �������� �������� �������� �������
	)
is
  ppAction_Dict_ID number;
begin
  -- ���� ������������ - �������� �����, �� ����� �������
  if user = fdc_Util.Schema then
    return;
  end if;

  -- ��������� � �������� �������������� �� ����������� Dict.AccessAction
  if pAction_Dict_ID = 0 then
    ppAction_Dict_ID := Fdc_Object_Get_Bysysname('Dict.AccessAction', 'Dict_AccessAction_Open');
  else
    if fdc_Object_Is(pAction_Dict_ID, 'Dict.AccessAction') = 1 then
      ppAction_Dict_ID := pAction_Dict_ID;
    else
      fdc_Util.Abort('�������� �������� ��������� pAction_Dict_ID='||pAction_Dict_ID||' � ��������� fdc_Access_Log_Add');
    end if;
  end if;

  -- ���������� ������ � ��������
	insert into fdc_Access_Log(ID, Object_ID, Action_Dict_ID, Login, Moment)
	values(fdc_Object_Get_NewKey, pID, ppAction_Dict_ID, user, sysdate);

end fdc_Access_Log_Add;
/
