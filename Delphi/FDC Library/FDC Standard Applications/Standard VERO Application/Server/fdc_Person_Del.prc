create or replace procedure fdc_Person_Del
-- �������� ��������
	(
	pID number,                     -- ������������� ���������� ��������        
	pDoLog number := 1              -- ���������� �� ������� �������� ������� 
                                  -- (��������� �� Event?)
                                  -- �� ��������� ���������� (�������� 1)
                                  -- ��� �������� 0 ���������� �� ����
	)
is
begin
  -- �������� ���� ���������� �������
  if (fdc_Object_Is(pID, 'Person') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������');
  end if;

  -- ���� ���� ���������� - ������ � ��������
  -- �� ���������� ����� �������� ����������� �������� ����� fdc_Object_Del,
  -- �.�. ����� ��������� ���������� ������ � ��������
  if pDoLog = 1 then
    fdc_event_add_eventdel(pID, substr(fdc_Object_Get_RowData(pID), 1, 1500));
  end if;
  
  -- �������� ������ �� fdc_Person
  delete from fdc_Person
  where ID = pID;
  
  -- �������� ���������� �������
  fdc_Object_Del(pID, 0);
  
end fdc_Person_Del;
/
