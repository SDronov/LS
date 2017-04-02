create or replace function fdc_Column_Is_PK
-- ���������, ������ �� ������� ������� � ��������� ����
-- ���� ������ - ���������� 1,
-- ���� �� ������ - 0
	(
	pTableName varchar2,  --�������� �������
	pColName varchar2     --�������� �������
	)
  return number
is
  pResTableName varchar2(100);
  pResColName varchar2(100);
  pkName varchar2(30);
begin
  -- ������������
  pResTableName := upper(trim(pTableName));
  pResColName := upper(trim(pColName));
  -- ��������� PK
  begin
    select C.Constraint_Name
    into	 pkName
    from   User_Cons_Columns CC,
           User_Constraints C
    where CC.Table_Name = pResTableName and
          CC.Column_Name = pResColName and
          C.Constraint_Name = CC.Constraint_Name and
          C.Constraint_Type = 'P';
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ ����������� ����������� ���������� ����� ��� '||pTableName||'.'||pColName, 1);
  end;
  -- ������� ����������
  if pkName is null then 
     return 0;
   else 
     return 1;
  end if;
end fdc_Column_Is_PK;
/
