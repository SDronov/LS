create or replace function fdc_User_Get
-- ���������� ������������� ������������ VERO �� ��� ������ 
-- ���� ����� �� ������� ��� �� NULL, �� ����� ����� �������� ������������.
	(
	  pLogin varchar2 := null
	)
    return number
is
  Result number(15);
begin
  Result := 0;

  begin
    select ID
      into Result
      from fdc_User
     where upper(Login) = upper(nvl(pLogin, user));
  exception
    when NO_DATA_FOUND then 
      fdc_util.abort('������� �������������������� �������! ������������ '||nvl(pLogin, user)||' �� ��������������� � �������.');
  	when others then fdc_util.abort('������ ����������� �������������� ������������ '||nvl(pLogin, user), 1); 
  end;

  return Result;
end fdc_User_Get;
/
