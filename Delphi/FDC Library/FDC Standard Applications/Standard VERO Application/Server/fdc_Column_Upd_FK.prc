create or replace procedure fdc_Column_Upd_FK
-- ������������� � fdc_column ���������� � ��������� ������� �� ������� ����
-- ���������� �� Post-trigger-� Erwin ��� ����������� �������
-- ������ �� �������� ������ �� ���������� � ����� ��?
-- ������ ��� �� ������ ���������� ��������� ������������ ������� ����� ��� �� ������������ � ����� ��
	(
  pTableName varchar2,   --�������� �������
	pColName varchar2,     --�������� �������
	pPKTableName varchar2, --�������� ��������� �������
	pPKColName varchar2,   --�������� ��������� �������
	pFKName varchar2       --�������� �����
	)
is
begin
  -- ������ ���������� � ������� �����
  update fdc_Column
  set PKTableName = upper(trim(pPKTableName)),
    	PKColName = upper(trim(pPKColName)),
	    FKName = upper(trim(pFKName))
  where TableName = upper(trim(pTableName)) 
    and ColName = upper(trim(pColName));
end fdc_Column_Upd_FK;
/
