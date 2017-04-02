create or replace function fdc_Collection_Get_Default
-- Получить текущую рабочую подборку для пользователя
  (
  pUser_ID number := 0           -- Идентификатор пользователя, при значении 0 берется текущий подключенный пользователь
  )
return number
is
  ppUser_ID number;
  pID number;
begin
  -- Получить идентификатор пользователя
  if  pUser_ID = 0 then
    ppUser_ID := fdc_User_Get;
  else
    ppUser_ID := pUser_ID;
  end if;
 
  -- Получить идентификатор объекта
  begin
  select	ID
  into	pID
  from	fdc_Collection_Lst
  where	User_ID = ppUser_ID and
  	    DefCollection = 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Ошибка получения рабочей подборки для пользователя', 1);
  end;
    
  -- Если нет текущей рабочей подборки - создать ее
  if pID is null then
    pID := fdc_Collection_Add( pobject_type_sysname => 'Collection',
                               pname => 'Рабочая подборка',
                               pshortname => 'Рабочая подборка',
                               puser_id => ppUser_ID,                               
                               pdescript => 'Автоматически созданная рабочая подборка',
                               pdefcollection => 1);
  end if;

  -- Вернуть полученный идентификатор
  return pID;
end fdc_Collection_Get_Default;
/
