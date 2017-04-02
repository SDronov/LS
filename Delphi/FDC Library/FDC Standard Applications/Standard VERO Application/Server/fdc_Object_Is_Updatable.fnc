create or replace function fdc_Object_Is_Updatable
-- Определяет может ли текущий пользователь изменять заданный объект 
-- 1 - может, 0 - не может
	(
	  pID number,              -- идентификатор объекта
    pDoRaise	number := 0    -- поднимать ли исключение если не может изменять
                             -- по умолчанию (значение 0) не поднимать
	)
    return number
is
  pAccessLevel number;
  pAllowUpdate number;
begin
  -- Если пользователь владелец схемы, то Ок.
  if user = fdc_util.schema then
 	   return 1;
  end if;

  -- Определяем имеет ли пользователь уровень доступа для изменения объекта
  pAccessLevel := fdc_Object_Check_Access_Level(pID, 2, pDoRaise);

  -- Если нет прав на изменение, то выходим
  if (pAccessLevel = 0) then
     return 0;
  end if;

  -- Теперь смотрим допускает ли состояние объекта изменение
  pAllowUpdate := fdc_Object_Check_State_For_Upd(pID, pDoRaise);
  
  -- Если допускает, то ОК, иначе изменять объект нельзя
  if (pAllowUpdate <> 0) then
	   return 1;
   else	
     return 0;
  end if;
end fdc_Object_Is_Updatable;
/
