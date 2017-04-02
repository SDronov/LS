create or replace procedure fdc_Revoke_to_Revoke
-- �������� ����� � ������������ �� ��������� fdc_Revoke
-- �������� �������� �� fdc_Revoke ������. ����� ������.
  (
    pPrivs  varchar2,   -- ������ ����������, ������������ ����� �������
    pUser   varchar2    -- ������������
  ) 
is
  pSQL varchar(4000);
begin
  -- ������� ������ ��� �������
  pSQL := 'revoke ' || trim(pPrivs) || ' on fdc_Revoke from ' || trim(pUser); 
  
  -- ��������� �� � ������� execute immediate
  execute immediate pSQL;
end;
/
