@@Define_Variables.sql
spool &&INSTALL_LOG_PATH\02_Before_Import.log

-- ��������������� �������� ������� � LOB-�����.
-- ����������� �� ����� ������������ - ��������� ����� ���� �� �������

PROMPT **************************************************************************
PROMPT ����������� � ������� &&SERVER_NAME �� ����� ������������ &&VERO_USER...
PROMPT

connect &&VERO_USER/&&VERO_USER_PASSWORD@&&SERVER_NAME

create table FDC_FILE
(
  ID         NUMBER(15) not null,
  SOURCENAME VARCHAR2(1500) not null,
  BODY       BLOB
)
/
comment on table FDC_FILE is '������������ ��� �������� ��������� ������';

exit