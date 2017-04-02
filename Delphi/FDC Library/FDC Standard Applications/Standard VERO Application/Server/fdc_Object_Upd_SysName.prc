create or replace procedure fdc_Object_Upd_SysName
-- Изменение системного имени объекта
	(
	  pID	number,            -- идентификатор объекта
	  pSysName varchar2      -- системное имя объекта
	)
is
  pChk number;
  pOldSysName varchar2(1500);
begin
  -- Проверяем может ли текущий пользователь изменять объект. Нет - исключение
  pChk := fdc_Object_Is_Updatable(pID, 1);

  -- Начитываем старое системное имя объекта
  begin
    select SysName
      into pOldSysName
      from fdc_Object
     where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При изменении системного имени не найден объект по ID = '||pID);
  	when others then fdc_util.Abort('Ошибка получения системного имени объекта по ID = '||pID, 1);
  end;   

  -- Если старое и новое имя совпадают, то ничего менять не надо
  if Nvl(pOldSysName, 'No name') = Nvl(pSysName, 'No name') then
	   return;
  end if;

  -- Изменяем системное имя объекта
  update fdc_Object
     set SysName = pSysName
   where ID = pID;

  -- Если объект является объектным типом, то меняем системное имя 
  -- в таблице fdc_Object_Type тоже 
  if fdc_object_is(pID, 'ObjectType') = 1 then
     update Fdc_Object_Type
        set SysName = pSysName
      where ID = pID;
  end if;
exception
  when others then
    Fdc_Util.Abort('Не прошло изменение системного имени объекта '||pSysName||'(ID='||pID||'):', 1);      
end fdc_Object_Upd_SysName;
/
