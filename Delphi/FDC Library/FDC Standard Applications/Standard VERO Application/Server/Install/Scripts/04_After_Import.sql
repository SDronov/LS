@@Define_Variables.sql
spool &&INSTALL_LOG_PATH\04_After_Import.log

-- ������������� ����� ����.
-- ����������� �� ����� ������������ - ��������� ����� ���� ����� �������

PROMPT **************************************************************************
PROMPT ����������� � ������� &&SERVER_NAME �� ����� ������������ &&VERO_USER...
PROMPT

connect &&VERO_USER/&&VERO_USER_PASSWORD@&&SERVER_NAME

begin
  fdc_Service.New_Location;
end;
/

PROMPT **************************************************************************
PROMPT ��������� ��������� ����� ���� ������� ���������.

exit