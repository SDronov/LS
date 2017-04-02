create or replace procedure fdc_Collection_Object_Add
-- Внесение объекта в подборку
	(
	pCollection_ID	number,       -- Идентификатор подборки
	pObject_ID	number,           -- Идентификатор объекта
	pRoleName	varchar2 := null,   -- Роль объекта в подборке
	pDescript	varchar2 := null,   -- Комментарий к объекту в подборке
  pDoRaiseDupVal number := 1,   -- Определяет поднимать ли исключение, если объект
                                -- уже входит в данную подборку с такой же ролью.
                                -- По умолчанию (значение <> 0) поднимать,
                                -- 0 не поднимать  
  pDoCheckRoleName number := 0  -- Определяет считать ли дублем многократное вхождение объекта
                                -- с разными ролями. 
                                -- По умолчанию (значение = 0) считать,
                                -- <> 0 не считать    
                                                              
	)
is
  pChk number := null;
begin
  -- Проверка возможности внесения изменений в подборку
  if Fdc_Object_Is_Updatable(pCollection_ID, 0) = 0 then
    fdc_Util.Abort('Нет прав на изменение подборки, либо ее состояние не допускает изменений');
  end if;
  
  -- Проверка, что этот объект уже в подборке
  begin
    select Object_ID
    into pChk
    from fdc_Collection_Object CO
    where CO.Object_ID = pObject_ID and
          CO.Collection_ID = pCollection_ID and
          ((NVL(pDoCheckRoleName, 0) = 0) or 
          ((trim(pROLENAME) is null and trim(CO.rolename) is null) or
           (upper(trim(CO.ROLENAME)) = upper(trim(prolename)))));
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Ошибка проверки наличия объекта в подборке', 1);
  end;
  
  if (pChk is not null) then
     if (pDoRaiseDupVal <> 0) then
        fdc_Util.Abort('Объект '||Fdc_Object_Get_Name(pObject_ID, 0, 1)||' уже внесен в подборку '||Fdc_Object_Get_Name(pCollection_ID, 0, 1));
      else
        return; 
     end if;
  end if;   
  
  -- Добавление записи в fdc_Collection_Object
	insert into fdc_Collection_Object(ID, Collection_ID,Object_ID, RoleName, Descript)
	values(Fdc_Object_Get_Newkey, pCollection_ID,pObject_ID, pRoleName, pDescript);

end fdc_Collection_Object_Add;
/
