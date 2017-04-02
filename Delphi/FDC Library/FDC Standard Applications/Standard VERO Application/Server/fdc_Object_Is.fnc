create or replace function fdc_Object_Is
-- Проверяет является ли запрашиваемый объект экземпляром или потомком данного типа в объектной иерархии
-- Возвращает 1, если является, иначе 0
	(
	pID	number,             -- Идентификатор объекта
	pTypeSysName varchar2   -- системное имя типа 
	)
return number
is
result number := 0;
begin
  -- Ищем тип-предок по иерархии типов
  begin
    select 1
    into	 result
    from	 fdc_Object O,
        	 fdc_Child_Object_Type COT,
    	     fdc_Object_Type T
    where	 O.ID = pID and
    	     COT.Child_Object_Type_ID = O.Object_Type_ID and
    	     T.ID = COT.Object_Type_ID and
    	     T.SysName = pTypeSysName and
           rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка проверки типа объекта ID='||pID, 1);
  end;
  -- Возвращаем результат проверки     
  return result;           
end fdc_Object_Is;
/
