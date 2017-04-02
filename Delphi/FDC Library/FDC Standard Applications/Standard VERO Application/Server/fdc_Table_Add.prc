create or replace procedure fdc_Table_Add
-- �������� �������� ������� � ������� fdc_Table
-- ���� �������� ��� ����, ��� ��������� ��������� � �������� ������
	(
	pTableName varchar2,  --�������� ������� � ��
  pName	varchar2        --���������� ��� �������
	)
is
  pResTableName varchar2(100);
  pDescript varchar2(4000);
begin
  -- ������������
  pResTableName := upper(trim(pTableName));
  -- �������� ������������� ��������
  delete from fdc_Column where TableName = pResTableName;
  delete from fdc_Table where TableName = pResTableName;
  -- ��������� ����������� � �������
  begin
    select  Comments
    into pDescript
    from User_Tab_Comments
    where Table_Name = pResTableName;
  exception 
     when others then fdc_Util.Abort('������� '||pResTableName||' �� ������� � ��');
  end;
  -- �������� ������ � fdc_Table
  insert into fdc_Table(TableName,Name,Descript) 
         values(pResTableName,pName,pDescript);

exception 
  when others then fdc_Util.Abort('�� ������ ����������� ������� '||pResTableName, 1);
end fdc_Table_Add;
/
