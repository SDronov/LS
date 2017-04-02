create or replace procedure fdc_Object_Upd
-- Изменение основных характеристик объекта. Дополнительные, вродк
-- уровня доступа, системного имени, объекта-владельца меняются
-- отдельными процедурами
	(
	  pID	number,                   -- идентификатор объекта
	  pName	varchar2,               -- название
    pShortName varchar2,          -- короткое название
	  pDescript varchar2            -- описание
	)
is
  pChk number;
  pEvent_ID number;
  lName varchar2(1500);
  lDescript varchar2(1500);
  lShortName varchar2(1500);
begin
  -- Проверяем может ли текущий пользователь изменять объект. Нет - исключение
  pChk := fdc_Object_Is_Updatable(pID, 1);

  -- Начитываем старые значения объекта
  begin
    select O.Name, O.ShortName, O.Descript
      into lName, lShortName, lDescript 
      from fdc_Object O
     where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При изменении не найден объект по ID = '||pID);
  	when others then fdc_util.Abort('Ошибка получения значений объекта по ID = '||pID, 1);
  end;   
  
  -- Если значения поменялись, то изменяем объект   
  if Nvl(trim(pName), 'No name') <> Nvl(lName, 'No name') or 
     Nvl(trim(pShortName), 'No name') <> Nvl(lShortName, 'No name') or
     Nvl(trim(pDescript), 'No name') <> Nvl(lDescript, 'No name') then
        update	fdc_Object
           set Name = trim(pName),
               ShortName = trim(pShortName),
  	           Descript = trim(pDescript)
         where ID = pID;
  end if;  

  -- Если объект является объектым типом, то меняем значения типа, если это надо
  if fdc_object_is(pID, 'ObjectType') = 1 then
     begin
       -- Начитываем старые значения объектного типа
       select Name, ShortName
         into lName, lShortName
         from Fdc_Object_Type
         where ID = pID;
     exception
	     when NO_DATA_FOUND then fdc_util.Abort('При изменении не найден объектный тип по ID = '||pID);
       when others then fdc_util.Abort('Ошибка получения значений объектного типа по ID = '||pID, 1);
     end;   

     -- Если значения поменялись, то изменяем объектный тип       
     if Nvl(trim(pName), 'No name') <> Nvl(lName, 'No name') or 
        Nvl(trim(pShortName), 'No name') <> Nvl(lShortName, 'No name') then
           update Fdc_Object_Type
              set Name = pName,
                  ShortName = pShortName
            where ID = pID;
     end if;
  end if;
 
  -- если нужно, то меняем наименование дополнительных значений значений атрибутов
  -- объектов, являющихся ссылками на наш объект
  for V in (select V.ID
	            from fdc_Value V, fdc_Object O
             where V.Ref_Object_ID = pID
               and O.ID = V.ID
               and Nvl(trim(O.Name), 'No name') <> Nvl(pName, 'No name'))
	    loop
	      update fdc_Object
	         set Name = trim(pName)
         where ID = V.ID;
      end loop;

  -- Генерим событие изменения объекта     
  pEvent_ID := fdc_Event_Add('EventUpd','Изменен '||fdc_Object_Get_Name(pID,1),pID);
  
exception
  when others then
    Fdc_Util.Abort('Не прошло изменение объекта '||pName||'(ID='||pID||'):', 1);    
end fdc_Object_Upd;
/
