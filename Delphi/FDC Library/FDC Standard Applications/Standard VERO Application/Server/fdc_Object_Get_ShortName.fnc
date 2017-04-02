create or replace function fdc_Object_Get_ShortName
-- Возвращает короткое название объекта по его идентификатору
	(
	  pID number,               -- идентификатор объекта
    pDoRaise number := 1      -- если не 0, то поднимается исключение при возникновении
                              -- какой-то ошибки. По умолчанию поднимается.
	)
    return varchar2
is
  Result varchar2(1500);
begin
  begin
    select ShortName
      into Result
      from fdc_Object_Lst
     where ID = pID;
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
end fdc_Object_Get_ShortName;
/
