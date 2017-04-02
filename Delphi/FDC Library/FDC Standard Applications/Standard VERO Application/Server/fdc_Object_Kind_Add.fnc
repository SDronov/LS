create or replace function fdc_Object_Kind_Add
-- Добавляет новую пометку объекта и возвращает ее идентификатор
	(
	  pObject_Type_SysName varchar2, -- системное имя объектного типа   
	  pObject_ID number,             -- идентификатор объекта, к которому делается пометка   
	  pKind_ID number,               -- идентификатор пометки
	  pEvidence_ID number,           -- идентификатор основания пометки
  	pDescript varchar2 := null     -- описание
	)
    return number
is
  pNewID number(15);
  pName varchar2(1500);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'ObjectKind'
  fdc_Object_Type_Is(pObject_Type_SysName,'ObjectKind');

  -- Генерим название пометки объекта
  begin
    select P.Name||' - '||K.Name
      into pName
      from fdc_Object P,
	         fdc_Object K
     where P.ID = pObject_ID and
	         K.ID = pKind_ID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не найдены параметры Объект и Пометка.', 1);
  	when others then fdc_util.Abort('Ошибка получения параметров Объект и Пометка.', 1);
  end;         

  -- Создаем новый объект пометки объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 2,
                pObject_ID, null, null, pDescript);

  -- Добавляем запись в таблицу fdc_Object_Kind
  -- Если основание не задано, то в качестве основания заносим текущего пользователя              
  insert into fdc_Object_Kind(ID, Kind_ID, Evidence_ID)
        values(pNewID, pKind_ID, nvl(pEvidence_ID, fdc_User_Get));

  -- Возвращаем идентификатор
  return pNewID;
  
end fdc_Object_Kind_Add;
/
