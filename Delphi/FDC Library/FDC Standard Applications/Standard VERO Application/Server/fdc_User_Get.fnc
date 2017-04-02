create or replace function fdc_User_Get
-- Возвращает идентификатор пользователя VERO по его логину 
-- Если логин не передан или он NULL, то берет логин текущего пользователя.
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
      fdc_util.abort('Попытка несанкционированного доступа! Пользователь '||nvl(pLogin, user)||' не зарегистрирован в системе.');
  	when others then fdc_util.abort('Ошибка определения идентификатора пользователя '||nvl(pLogin, user), 1); 
  end;

  return Result;
end fdc_User_Get;
/
