create or replace function fdc_Event_Is
-- Проверяет является ли запрашиваемое событие экземпляром или потомком данного типа в иерархии типов
-- Возвращает 1, если является, иначе 0
	(
	pID	number,                   -- Идентификатор события
	pTypeSysName varchar2         -- Системное имя типа
	)
return number
is
result number := 0;
begin
  -- Ищем тип-предок по иерархии типов
  begin
    select 1
    into	 result
    from	 fdc_Event E,
        	 fdc_Child_Object_Type COT,
    	     fdc_Object_Type T
    where	 E.ID = pID and
    	     COT.Child_Object_Type_ID = E.Event_Type_ID and
    	     T.ID = COT.Object_Type_ID and
    	     T.SysName = pTypeSysName and
           rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка проверки типа события ID='||pID, 1);
  end;
  -- Возвращаем результат проверки     
  return result;           
end fdc_Event_Is;
/
