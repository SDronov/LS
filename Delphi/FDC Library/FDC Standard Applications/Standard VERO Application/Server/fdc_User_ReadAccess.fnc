create or replace function fdc_User_ReadAccess
-- Определяет имеет ли пользователь доступ к объекту на чтение
-- Результат: 1 - имеет, 0 - нет
	(
	  pID number   --Идентификатор объекта
	)
return number
is
  Result number := 0;
  pUser_ID number;
begin
  -- если пользователь - владелец схемы или входит в группу администраторов данных, то все OK
  if (fdc_User_Is_Schema_Owner = 1) or (fdc_User_Is_AdminData(0, 0) = 1) then
    return 1;
  end if;
  
  -- пытаемся определить идентификатор пользователя в VERO по его логину
  pUser_ID := fdc_User_Get;
  
  -- определяем даны ли пользователю гранты на объект
  begin
    select 1
        into Result
     from	fdc_User_Grant UG
    where	UG.Object_ID = pID and
          UG.User_ID = pUser_ID and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка определения привилегий текущего пользователя на объект ID='||pID, 1);
  end;
  
  -- даны, выходим
  if (Result > 0) then
	   return Result;
  end if;
  
  -- определяем даны ли хотя бы одной группе, в которую входит пользователь гранты на объект
  begin
    select  1
        into Result
      from fdc_User_In_Group UG,
           fdc_User_Group_Grant UGG
     where UG.User_ID = pUser_ID and
           UGG.User_Group_ID = UG.User_Group_ID and
           UGG.Object_ID = pID and
           rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка определения привилегий групп текущего пользователя на объект ID='||pID, 1);
  end;

  -- даны, выходим
  if (Result > 0) then
	   return Result;
  end if;
  
  -- иначе не имеет
  return 0;
end fdc_User_ReadAccess;
/
