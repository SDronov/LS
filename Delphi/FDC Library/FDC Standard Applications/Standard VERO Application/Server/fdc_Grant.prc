create or replace procedure fdc_Grant
-- ���� ����� ������������ �� ��������� ������
-- ��������� ��������� ����� ��������� � execute immediate, 
-- ����� ��������� ��� �������� �����.
-- ����� ��� �����, ������ ������������� � GrantOption ������ 
-- �������������, �������� �� ��� ������� ���� ������ ������������.  
  (
    pPrivs  varchar2,             -- ������ ���������� (select, update � ��)
                                  -- ����������� ����� �������
    pObject varchar2,             -- �������� �������
    pUser   varchar2,             -- ������������
    pGrantOption number := 0      -- ������ �� � GrantOption (��������, �������� �� 0),
                                  -- ��� ��� GrantOption (�������� 0)
  ) 
is
  pSQL varchar(4000);
begin
  -- ������� ������ ��� �������
  pSQL := 'grant ' || trim(pPrivs) || ' on ' || trim(pObject)
         || ' to ' || trim(pUser); 
         
  if (pGrantOption <> 0) then
     pSQL := rtrim(pSQL) || ' with grant option';      
  end if;     

  -- ��������� �� � ������� execute immediate
  execute immediate pSQL;
end;
/
