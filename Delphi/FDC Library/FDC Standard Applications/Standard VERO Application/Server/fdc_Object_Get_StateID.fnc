create or replace function fdc_Object_Get_StateID
-- Возвращает идентификатор состояния объекта по его идентификатору
-- Если требуется, то генерим исключение при возникновении ошибок
	(
	 pID number,             -- идентификатор объекта
   pDoRaise number := 0    -- если отличен от 0, то по генерим исключение
                           -- по умолчанию нет
	)
   return number
is
  Result number(15);
begin
  begin
    select State_ID
      into Result
      from fdc_Object_Lst
     where ID = pID;
     
    Result := NVL(Result, 0); 
  exception 
    when NO_DATA_FOUND then
      if (pDoRaise <> 0) then 
         fdc_util.abort('Не найден объект по ID = '||pID);
       else
         null;
      end if;     
  	when others then 
      if (pDoRaise <> 0) then 
         fdc_util.abort('Ошибка определения объекта по ID = '||pID, 1); 
       else
         null;
      end if;  
  end;     
  
  return Result;
end fdc_Object_Get_StateID;
/
