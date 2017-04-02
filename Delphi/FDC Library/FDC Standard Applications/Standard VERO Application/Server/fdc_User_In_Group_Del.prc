create or replace procedure fdc_User_In_Group_Del
-- Удаление пользователя из группы
	(
	  pUser_ID number,          -- идентификатор пользователя
	  pUser_Group_ID number     -- идентификатор группы
	)
is
  pAllow number(1);
begin
  -- Удаление записи из таблицы fdc_User_In_Group
  begin
    delete from fdc_User_In_Group
       where User_ID = pUser_ID and
	           User_Group_ID = pUser_Group_ID;
  exception
    when others then 
      fdc_util.abort('Ошибка удаления пользователя из группы', 1);         
  end;         
           
  -- Если пользователь исключен из группы администраторов задач (AdminTask),
  -- то снимаем у него возможность раздавать права на системные объекты         
  if (fdc_User_Is_AdminTask(pUser_ID, 0) = 0) then
     begin
       -- определение старого значения AllowGrantOption
       select AllowGrantOption
         into pAllow 
         from fdc_User
        where ID = pUser_ID;
     exception
       when NO_DATA_FOUND then
         fdc_util.abort('Не найден пользователь по ID = '||pUser_ID);
 	    when others then 
         fdc_util.abort('Ошибка определения пользователя по ID = '||pUser_ID, 1);           
     end;
     
     -- если требуется, то сбрасываем AllowGrantOption в таблице fdc_User
     if (pAllow <> 0) then
       update fdc_User
          set AllowGrantOption = 0
        where ID = pUser_ID;
     end if;     
  end if;          
end fdc_User_In_Group_Del;
/
