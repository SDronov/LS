create or replace procedure fdc_Object_Upd_Owner
-- Изменяет родителя у объекта
	(
	  pID	number,               -- идентификатор объекта
	  pOwnerID number           -- идентификатор родителя  
	)
is
  pCnt number;
  pOldOwnerID number;
begin
  -- Проверяем имеет ли пользователь право изменять объект
  -- Нет - исключение
  pCnt := fdc_Object_Check_Access_Level(pID,2,1);

  -- Получаем старое родителя объекта
  begin
     select	Owner_Object_ID
       into	pOldOwnerID
       from	fdc_Object
      where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При изменении родителя не найден объект по ID = '||pID);
  	when others then fdc_util.Abort('Ошибка получения родителя объекта по ID = '||pID, 1);
  end;

  -- Если требуется, то устанавливаем родителя
  if (NVL(pOwnerID, -1) <> NVL(pOldOwnerID, -1)) then
     update fdc_Object
        set Owner_Object_ID = pOwnerID
      where ID = pID;
  end if;    
exception
  when others then
    Fdc_Util.Abort('Не прошло изменение родителя у объекта с ID = '||pID||':', 1);        
end fdc_Object_Upd_Owner;
/
