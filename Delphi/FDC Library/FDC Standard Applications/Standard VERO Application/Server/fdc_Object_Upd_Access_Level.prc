create or replace procedure fdc_Object_Upd_Access_Level
-- Изменяет общий уровень доступа к объекту
	(
	  pID	number,              -- идентификатор объекта
	  pAccessLevel number      -- уровень доступа
	)
is
  pOldAccessLevel number;
  pCnt number;
  pAct varchar2(1500);
  pEventID number;
begin
  -- Проверяем имеет ли пользователь право менять общий уровень доступа к объекту
  -- Нет - исключение
  pCnt := fdc_Object_Check_Access_Level(pID,3,1);

  -- Получаем старое значение уровня доступа к объекту
  begin
     select	AccessLevel
       into	pOldAccessLevel
       from	fdc_Object
      where	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При изменении уровня доступа не найден объект по ID = '||pID);
  	when others then fdc_util.Abort('Ошибка получения значения уровня доступа объекта по ID = '||pID, 1);
  end; 
  
  -- Если текущий и заданный уровень доступа отличаются то...
  if (pOldAccessLevel <> pAccessLevel) then
     
     -- Изменяем уровень доступа у объекта
	   update fdc_Object
	      set	AccessLevel = pAccessLevel
    	where	ID = pID;
      
     -- Создаем соответствующее событие
     pEventID := fdc_Event_Add('EventAccessUpd',
          'Общий доступ к ' || fdc_Object_Get_Name(pID, 1) || 
          ' изменен с "' || fdc_Access_Level_GetName(pOldAccessLevel) ||
          '" на "' || fdc_Access_Level_GetName(pAccessLevel), pID);

     pCnt := 0;
     
     -- Если доступ к объекту закрывается то смотрим имеет ли хоть кто-то хоть
     -- какой-то специальный доступ для того, чтобы объект вообще не пропадал
     -- из видимости. Если нет, то даем отдельный специальный доступ себе на все.
     -- Достаточно спорный код, возможно требует дополнительных мыслей.
 	   if (pAccessLevel = 0) then
        begin
          -- Смотрим имеет ли какой-то пользователь спец доступ к объекту
		      select 1
		        into pCnt
		        from fdc_User_Grant
		       where Object_ID = pID and
                 rownum <= 1;
        exception
	        when NO_DATA_FOUND then null;
  	      when others then fdc_util.abort('Ошибка определения специального доступа пользователя к объекту с ID = '||pID, 1);
        end;         

        -- Если таковых нет, то смотрим имеет ли какая-то группа спец доступ к объекту
		    if pCnt = 0 then
           begin
			       select 1
			         into	pCnt
			         from	fdc_User_Group_Grant
			        where	Object_ID = pID and
                    rownum <= 1;
           exception
	           when NO_DATA_FOUND then null;
  	         when others then fdc_util.abort('Ошибка определения специального доступа группы к объекту с ID = '||pID, 1);
           end;         
		    end if;

        -- Если спец доступа нет ни у кого, то даем себе отдельный спец доступ на все.
		    if pCnt = 0 then
           fdc_Object_Grant_Upd(pID, Fdc_User_Get, 3, 1);
		    end if;
	   end if;
  end if;
exception
  when others then
    Fdc_Util.Abort('Не прошло изменение общего уровня доступа к объекту с ID = '||pID||':', 1);        
end fdc_Object_Upd_Access_Level;
/
