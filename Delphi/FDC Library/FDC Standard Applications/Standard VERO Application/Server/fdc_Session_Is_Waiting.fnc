create or replace function fdc_Session_Is_Waiting (pSession_ID number)
return number is
-- ���������, ������������� �� ����������� ������� - ���������
-- ���������� 1 ���� ��������� ��� 0 ���� ���
begin
  return fdc_dispatch.session_iswaiting(pSession_ID);
end fdc_Session_Is_Waiting;
/
