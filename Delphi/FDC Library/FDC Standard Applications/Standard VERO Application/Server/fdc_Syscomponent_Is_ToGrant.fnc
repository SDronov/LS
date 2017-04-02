create or replace function fdc_Syscomponent_Is_ToGrant
-- ���������� ������ �� ������� ������������ ���� ���� ����� �� ��������� ������
-- ���������� 0 - �� ������, 1 - ������
	(
	  pLogin	varchar2,      -- ����� ������������
	  pSysName varchar2      -- ��������� �������� ���������� �������
	)
    return number
is
  pCnt	number;
begin
  select count(*)
    into pCnt
    from fdc_Syscomponent_Lst_To_Grant G
   where upper(G.Login) = upper(pLogin) and
	       G.SysName is not null and
	       upper(G.SysName) = upper(pSysName);

  if (pCnt > 0) then 
     return 1;
  end if;

  return 0;
end fdc_Syscomponent_Is_ToGrant;
/
