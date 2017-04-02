create or replace function fdc_User_Is_Schema_Owner
-- Определяет, является ли пользователь владельцем схемы
-- если является, возвращает 1
-- если нет - возвращает 0
  (
    pUser_ID number := 0,          -- Идентификатор пользователя, при значении 0 берется текущий подключенный пользователь
    pDoRaise number := 0           -- поднимать ли исключение если не владелец схемы или при не нахождении пользователя 
                                   -- по умолчанию не поднимать (значение 0)
                                   -- при значении отличном от 0 поднимать
  )  
  return number 
is
  pLogin varchar2(1500) := null;
  pResult number := 0;
begin
  if (pUser_ID <> 0) then
    -- определяем логин пользователя
    begin
      select upper(U.Login)	 
        into pLogin
        from fdc_User U
       where U.ID = pUser_ID;
    exception
  	  when NO_DATA_FOUND then 
        if (pDoRaise <> 0) then
           fdc_util.Abort('Не найден пользователь по ID = '||pUser_ID); 
        end if;   
    	when others then 
        if (pDoRaise <> 0) then
           fdc_util.abort('Ошибка нахождения пользователя по ID = '||pUser_ID, 1);
        end if;
    end;
   else
    pLogin := user;
  end if;   

  -- проверяем является ли пользователь владельцем схемы
  if pLogin = fdc_Util.Schema then
     pResult := 1;
  end if;    

  -- если нужно поднимаем исключение    
  if (pResult = 0) and (pDoRaise <> 0) then
     fdc_util.Abort('Пользователь ' || pLogin || ' не является владельцем схемы'); 
  end if;   
  
  -- возвращаем результат
  return pResult;
end;
/
