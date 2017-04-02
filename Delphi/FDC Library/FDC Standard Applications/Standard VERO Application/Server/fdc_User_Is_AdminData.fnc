create or replace function fdc_User_Is_AdminData
-- �������� �� ������� ������������ ��������������� ������ (AdminData)
-- ���������: 1 - ������������ ������ � ������, 0 - ���
  (
  pUser_ID number := 0,           -- ������������� ������������, ��� �������� 0 ������� ������� ������������ ������������
	pDoRaise number := 1            -- ��������� �� ���������� ��� �� ��������� ������������ � ������
                                  -- �� ��������� ��������� (�������� �������� �� 0)
                                  -- ��� �������� 0 ��������� �� ����
  )
return number
is
begin
  return fdc_User_Is_In_Group('AdminData', pUser_ID, pDoRaise);
end;
/
