create or replace function fdc_Object_Is_Deletable
-- Определяет может ли текущий пользователь удалить заданный объект 
-- 1 - может, 0 - не может
-- Условиями возможности удаления являются:
--   либо пользователь является владельцем схемы - тогда ВСЕ можно
--   либо состояние объекта позволяет его удаление, 
--        текущий пользователь имеет права не ниже права на изменение
--        на этот объект и все подчиненные
	(
	  pID number,              -- идентификатор объекта
    pDenyReason out number,  -- причина запрета удаления: 
                             -- 1 - недостаточно прав на удаляемый объект
                             -- 2 - состояние объекта не допускает удаления
                             -- 3 - есть подчиненные объекты, на которые недостаточно прав
    pDoRaise	number := 0    -- поднимать ли исключение если не может удалить
                             -- по умолчанию (значение 0) не поднимать
                             -- pDoraise передается в вызываемые процедуры
                             -- и в тексте данной процедуры непосредственно не отрабатывается
	)
    return number
is
  pChk number;
begin
  pDenyReason := 0;
  
  -- Если пользователь владелец схемы, то Ок.
  if user = fdc_util.schema then
 	   return 1;
  end if;

  -- Определяем имеет ли пользователь уровень доступа для удаления объекта
  if fdc_Object_Check_Access_Level(pID, 2, pDoRaise) = 0 then
    pDenyReason := 1;
    return 0;
  end if;

  -- Теперь смотрим допускает ли состояние объекта удаление
  if fdc_Object_Check_State_For_Del(pID, pDoRaise) = 0 then
    pDenyReason := 2;
    return 0;
  end if;

  -- Теперь проверяем, есть ли среди подчиненных объектов те, на которые нету прав
  begin
    select ID 
    into pChk
    from (
      select ID
      from Fdc_Object O
      start with ID = pID
      connect by prior O.ID = O.Owner_Object_Id) Q
    where ID <> pID and
      fdc_Object_Check_Access_Level(Q.ID, 2, pDoRaise) = 0 and
      rownum <= 1;    
  exception
	  when NO_DATA_FOUND then pChk := 0;
  	when others then fdc_util.Abort('Ошибка проверки прав на подчиненные объекты для объекта '||
                                     fdc_Object_Get_Name(pID, 1, 1)||' (ID='||pID||'): ', 1);
  end;
  
  -- Если объекты нашлись, не позволяем удаления
  if (pChk <> 0) then
    pDenyReason := 3;
    return 0;
  else	
    return 1;
  end if;
end fdc_Object_Is_Deletable;
/
