create or replace function fdc_Object_Type_Is_Subtype
-- Проверяет является ли запрашиваемый тип потомком данного
-- Возвращает 1, если является, иначе 0
	(
  	pType 	 varchar2,    -- системное имя запрашиваемого типа
    pBaseType varchar2,   -- системное имя ожидаемого предка
  	pDoRaise number := 0  -- поднимать ли исключение. Значение 0 (по умолчанию) - не поднимать.
	)
  return number
is
  result number;
begin
  result := 0;

  begin
    select	1
      into	result
      from	fdc_Object_Type T
       	join fdc_Child_Object_Type CT on CT.Object_Type_ID = T.ID
      	join fdc_Object_Type TT on TT.ID = CT.Child_Object_Type_ID
     where	T.SysName = pBaseType and
	          TT.SysName = pType and
            rownum <= 1;    
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка проверки типа '||pType||' на наследование от '||pBaseType, 1);
  end;
  
  --Если не найден и нужно поднять исключение, то поднимаем.
  if result = 0 and pDoRaise <> 0 then
     fdc_Util.Abort('Тип '||pType||' не является подтипом '||pBaseType);
  end if;
  
  -- Возвращаемый результат
  return result;
end fdc_Object_Type_Is_Subtype;
/
