create or replace procedure fdc_Column_Add
-- �������� �������� ������� � ������� fdc_Column
-- ���� �������� ��� ����, ������������ �� ���������� �����
	(
  pTableName varchar2,  --�������� �������
 	pColName varchar2,    --�������� �������
  pName	varchar2        --���������� ��� �������
	)
is
  pResTableName varchar2(100);
  pResColName varchar2(100);
  pDescript	varchar2(4000);
begin
  -- ������������
  pResTableName := upper(trim(pTableName));
  pResColName := upper(trim(pColName));
  -- ��������� ����������� � ������� 
  begin
    select Comments
    into	pDescript
    from User_Col_Comments
    where Table_Name = pResTableName and
          Column_Name = pResColName;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ��������� �������� ������� '||pTableName||'.'||pColName, 1);
  end;
  -- �������� ������ � ������� fdc_Column
  insert into fdc_Column(TableName,ColName,Name,IsPK,Descript)
         values (pResTableName,pResColName,pName,fdc_Column_Is_PK(pResTableName,pResColName),pDescript);
exception 
  when others then fdc_Util.Abort('�� ������ ����������� ������� '||pTableName||'.'||pColName, 1);
end fdc_Column_Add;
/
