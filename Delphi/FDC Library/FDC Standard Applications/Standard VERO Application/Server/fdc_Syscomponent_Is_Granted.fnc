create or replace function fdc_Syscomponent_Is_Granted
-- ���������� ����� �� ������ ������������ ����� �� ��������� ������
-- ���������� 0 - �� ����� ����, 1 - �����, 2 - ����� � ������ ������� ������� (GrantOption)
	(
	  pSchema	varchar2,      -- �������� �����
	  pLogin	varchar2,      -- ����� ������������ 
	  pSysName varchar2      -- ��������� �������� ���������� �������
	)
    return number
is
  pCnt number;
  pGrantable number;
begin
  -- ����� ����������� �� All_Tab_Privs
  select count(*), nvl(max(decode(grantable, 'YES', 1, 0)), 0)
     into pCnt, pGrantable
    from All_Tab_Privs P
   where P.Table_Schema = upper(pSchema) and
         P.Grantee	= upper(pLogin) and
         P.Grantor = upper(pSchema) and
	  	   P.Table_Name	= upper(pSysName);

  -- ���� ������������ ����� �����, �� ������� ����� �� � GrantOption         
  if (pCnt > 0) then
     if (pGrantable > 0) then
        return 2;
      else
        return 1;
     end if;     
  end if;

  return 0;
end fdc_Syscomponent_Is_Granted;
/
