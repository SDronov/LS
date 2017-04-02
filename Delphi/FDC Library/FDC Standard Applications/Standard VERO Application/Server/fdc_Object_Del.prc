create or replace procedure fdc_Object_Del
-- Удаление экземпляра объекта
-- !!Вместе с объектом удаляются все подчиненные объекты (ссылающиеся на него полем OWNER_ID)!!
-- !!Процедура не вызывается непосредственно, а только из процедур удаления по отдельным типам!!
-- !!Каждая из процедур удаления типа ДОЛЖНА вызвать fdc_Object_Del
-- Все процедуты, регистрируемые для объектных типов как процедуры удаления, 
-- должны иметь те же два параметра: pID, pDoLog.
-- Это требование общей процедуры fdc_Object_Free
	(
	pID number,                     -- Идентификатор объекта
	pDoLog number := 1              -- Логировать ли событие удаления объекта 
                                  -- (создавать ли Event?)
                                  -- по умолчанию логировать (значение 1)
                                  -- при значении 0 логировать не надо
	)
is
pChk number;
pSysName varchar(1500);
pName varchar(1500);
pError varchar2(4000);
pChildID number;
pDenyReason number;
begin
  -- Проверка, имеет ли текущий пользователь права на изменение объекта
  pChk := fdc_Object_Is_Deletable(pID,pDenyReason,1);

  -- Получение системного имени объекта
  begin
    select	SysName
    into	pSysName
    from	fdc_Object
    where 	ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('При удалении не найден объект по ID = '||pID);
  	when others then fdc_util.Abort('Ошибка получения системного имени объекта по ID = '||pID, 1);
  end;
  
  -- Если есть системное имя - требуются полномочия администратора данных
  if (pSysName is not null) and ((user <> fdc_util.schema) and (fdc_User_Is_AdminData(0, 0) = 0)) then
  	fdc_Util.Abort('Объект '||fdc_Object_Get_Name(pID,1)||' имеет системное имя '||pSysName||'. Для его удаления необходимы полномочия администратора.');
  end if;
  
  -- Проверка, нет ли ссылающихся объектов
  begin
    select	O.OWNER_OBJECT_ID
    into	pChk
    from	fdc_Value V,
          fdc_Object O
    where 	V.Ref_Object_Id = pID and
            V.Id = O.Id and
            rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Удаление объекта <'||fdc_Object_Get_Name(pID, 1, 0)||'> невозможно: '||
                                    'есть объект <'||fdc_Object_Get_Name(pChk, 1, 0)||'>, ссылающийся на него');
  end;
  
  -- Проверка, нет ли связанных объектов
  begin
    select *
    into	pChk
    from (
      select	O.OBJECT_ID
      from	fdc_Object_Relation O
      where 	O.OBJECT_ID = pID and
              rownum <= 1
      union        
      select	O.OBJECT_ID
      from	fdc_Object_Relation O
      where 	O.Rel_Object_Id = pID and
              rownum <= 1)
    where rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Удаление объекта <'||fdc_Object_Get_Name(pID, 1, 0)||'> невозможно: '||
                                    'есть объект <'||fdc_Object_Get_Name(pChk, 1, 0)||'>, связанный с ним');
  end;
  
  -- Удаление пользовательских и групповых привилегий
  delete from fdc_User_Grant
  where Object_ID = pID;
  
  delete from fdc_User_Group_Grant
  where Object_ID = pID;
  
  -- Удаление подчиненных объектов
  -- Запрос на fdc_Object а не на fdc_Object_Lst 
  -- так как проверка прав еще будет проведена процедурой fdc_Object_Del
  for rec in (select ID from fdc_Object O
              where O.Owner_Object_Id = pID) loop
    -- Независимо от типа подчиненных объектов          
    fdc_Object_Free(rec.ID, pDoLog);          
  end loop;            
  
  -- Если логируемое удаление - создать событие удаления
  if pDoLog = 1 then
    fdc_Event_Add_EventDel(pID);
  end if;
  
  -- Удаление самого экземпляра объекта
  delete from fdc_Object
  where ID = pID;
  
exception
    when others then
      Fdc_Util.Abort('Не прошло удаление объекта '||pName||'(ID='||pID||'):', 1);
  
end fdc_Object_Del;
/
