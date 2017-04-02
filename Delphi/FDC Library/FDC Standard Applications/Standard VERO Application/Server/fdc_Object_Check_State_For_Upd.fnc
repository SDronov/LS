create or replace function fdc_Object_Check_State_For_Upd
-- Возвращает допускает ли состояние объекта его изменение
-- 1 - допускает, 0 - нет
	(
	  pID number,              -- идентификатор объекта
    pDoRaise number := 1     -- поднимать ли исключение, если состояние объекта не допускает 
                             -- его изменение
                             -- по умолчанию (значение <> 0) поднимать
	)
  return number
is
  Result number := 0;
  pStateID number := null;
begin
  -- Определяем состояние объекта
  begin
    select State_ID
      into pStateID
      from fdc_Object
     where ID = pID;
  exception
    when NO_DATA_FOUND then 
      fdc_util.abort('Не найден объект по ID = '||pID);
  	when others then fdc_util.abort('Ошибка определения объекта по ID = '||pID, 1); 
  end;  

  -- Если состояние объекта не задано то все хорошо
  if (pStateID is null) then 
     Result := 1;
   else	
  -- Иначе смотрим допускает ли данное состояние изменение объекта   
     begin
       select	nvl(AllowUpdates, 0)
	       into	Result
	       from	fdc_State
	      where	ID = pStateID;
     exception   
       when others then 
         fdc_util.abort('Ошибка определения состояния объекта по ID = '||pStateID, 1); 
     end;   
  end if;

  -- Если нельзя изменять и нужно исключение, то поднимаем его  
  if (Result = 0) and (pDoRaise <> 0) then
	   fdc_util.abort('Состояние объекта не допускает его изменения.');
  end if;
  
  return Result;
end fdc_Object_Check_State_For_Upd;
/
