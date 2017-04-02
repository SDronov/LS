create or replace procedure fdc_Object_Free
-- Полиморфная процедура удаления экземпляра объекта произвольного типа
-- В зависимости от типа объекта вызывает конкретную процедуру удаления,
-- зарегистрированную для данного типа
-- Процедура может вызываться как с клиента, так и в коде других серверных процедур
	(
	pID number,                     -- Идентификатор удаляемого объекта
	pDoLog number := 1              -- Логировать ли событие удаления объекта 
                                  -- (создавать ли Event?)
                                  -- по умолчанию логировать (значение 1)
                                  -- при значении 0 логировать не надо
	)
is
  pTypeID		number(15);
  pNoObject boolean := false;
  pDelProcID	number(15);

  pTableName	varchar2(1500);
  pParTableName	varchar2(1500);
  pDelProc	varchar(1500);
  pParTypeID	number(15);
begin
  -- Получение типа объекта или события
  -- Сначала поищем в объектах
  begin
    select O.OBJECT_TYPE_ID
    into pTypeID
    from fdc_Object O
    where ID = pID;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Ошибка получения типа удаляемого объекта по ID='||pID, 1);
  end;
  
  -- Если в объектах не нашли - ищем в событиях
  if pTypeID is null then
    begin
      select E.Event_Type_Id
      into pTypeID
      from fdc_Event E
      where ID = pID;
    exception
  	  when NO_DATA_FOUND then fdc_util.Abort('Удаляемый объект (или событие) по ID='||pID||' не найден!', 0);
    	when others then fdc_util.Abort('Ошибка получения типа удаляемого объекта по ID='||pID, 1);
    end;
  end if;  

  -- Получение указателя на процедуру удаления
  begin
    select T.DEL_PROCEDURE_ID
    into pDelProcID
    from fdc_Object_Type T
    where ID = pTypeID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Тип удаляемого объекта (или события) по ID='||pTypeID||' не найден!', 0);
  	when others then fdc_util.Abort('Ошибка чтения типа удаляемого объекта по ID='||pTypeID, 1);
  end;
  
  -- Если процедура удаления не задана - никакого free не будет!
  if pDelProcID is null then
    fdc_Util.Abort('Для типа '||Fdc_Object_Get_Name(pTypeID)||' не задана процедура удаления!', 0);
  end if;
  
  -- Получение системного имени процедуры удаления
  begin
  pDelProc := fdc_Object_Get_SysName(pDelProcID);
  exception when others then 
    fdc_Util.Abort('Ошибка получения системного имени процедуры удаления по ID='||pDelProcID||' для типа '||Fdc_Object_Get_Name(pTypeID), 1);
  end;
  
  -- Если sysname пустой - тоже ничего не выйдет
  if trim(pDelProc) is null then
  	fdc_Util.Abort('Пустое системное имя процедуры удаления по ID='||pDelProcID||' для типа '||Fdc_Object_Get_Name(pTypeID), 0);
  end if;
  
  -- Собственно вызов процедуры удаления
  execute immediate 'begin '||pDelProc||'('||pID||', '||pDoLog||'); end;';
end fdc_Object_Free;
/
