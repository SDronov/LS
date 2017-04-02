create or replace procedure fdc_Revoke
-- �������� ����� � ������������ �� ��������� ������
  (
    pPrivs  varchar2,   -- ������ ����������, ������������ ����� �������
    pObject varchar2,   -- �������� ���������� �������
    pUser   varchar2    -- ������������
  ) 
is
  pSQL varchar(4000);
begin
  -- ������� ������ ��� �������
  pSQL := 'revoke ' || trim(pPrivs) || ' on ' || trim(pObject)
         || ' from ' || trim(pUser); 
  
  -- ��������� �� � ������� execute immediate
  execute immediate pSQL;
end;
/
