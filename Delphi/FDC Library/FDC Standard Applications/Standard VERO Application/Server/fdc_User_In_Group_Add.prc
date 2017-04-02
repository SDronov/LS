create or replace procedure fdc_User_In_Group_Add
-- Включение пользователя в группу
	(
	  pUser_ID number,            -- идентификатор пользователя
	  pUser_Group_ID	number,     -- идентификатор группы
    pDoRaiseDupVal number := 1  -- определяет поднимать ли исключение, если пользователь
                                -- уже входит в данную группу.
                                -- По умолчанию (значение <> 0) поднимать,
                                -- 0 не поднимать  
	) 
is
 pAllow number(1);
begin
  -- Добавление записи в таблицу fdc_User_In_Group
  begin
    insert into fdc_User_In_Group(User_ID, User_Group_ID)
          values (pUser_ID, pUser_Group_ID);
  exception
    when DUP_VAL_ON_INDEX then 
      if (pDoRaiseDupVal <> 0) then 
         fdc_util.abort('Пользователь уже включен в данную группу');   
       else
         return;
      end if;     
  when others then 
      fdc_util.abort('Ошибка включения пользователя в группу', 1);         
  end;        
       
  -- Если пользователь включен в группу администраторов задач (AdminTask),
  -- то даем ему возможность раздавать права на системные объекты
  if (fdc_User_Is_AdminTask(pUser_ID, 0) <> 0) then
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
     
     -- если требуется, то проставляем AllowGrantOption в таблице fdc_User
     if (pAllow <> 1) then
        update fdc_User
           set AllowGrantOption = 1
         where ID = pUser_ID;
     end if;     
  end if;        
end fdc_User_In_Group_Add;
/
