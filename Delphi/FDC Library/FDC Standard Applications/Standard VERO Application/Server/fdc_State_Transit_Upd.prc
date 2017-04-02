create or replace procedure fdc_State_Transit_Upd
-- Изменяет правило перехода состояний
	(
	  pID	number,                      -- идентификатор правила перехода
  	pName	varchar2,                  -- название
	  pSysName varchar2,               -- системное имя перехода
	  pSrc_State_ID number,            -- идентификатор исходного состояния объекта (до перехода)
	  pDst_State_ID number,            -- идентификатор целевого состояния объекта (после перехода)
	  pBefore_Procedure_ID number,     -- идентификатор процедуры, которая вызывается перед переходом
	  pAfter_Procedure_ID	number,      -- идентификатор процедуры, которая вызывается после перехода
    pShortName varchar2,             -- короткое название
	  pDescript varchar2               -- описание
	)
is
  pSch1 number(15);
  pSch2 number(15);
  pState_Scheme_ID number(15); 
begin
  -- Проверяем, что или исходное, или целевое состояние задано
  if (pSrc_State_ID is null) and (pDst_State_ID is null) then
	   fdc_util.abort('Должно быть задано либо исходное либо целевое состояние');
  end if;

  -- Проверяем, что начальное и целевое состояния не совпадают
  if (pSrc_State_ID = pDst_State_ID) then
	   fdc_util.abort('Исходное и целевое состояния не должны совпадать');
  end if;
  
  -- Определяем схему состояний перехода
  begin
    select State_Scheme_ID
	    into pState_Scheme_ID
      from Fdc_State_Transit
     where ID = pID;
  exception
    when NO_DATA_FOUND then fdc_util.abort('Не найдено правило перехода по ID = ' || pID);
    when others then fdc_util.abort('Ошибка получения правила перехода по ID = ' || pID, 1);
  end;

  -- Если задано исходное состояние, то проверяем его
  if (pSrc_State_ID is not null) then
     begin
       -- ищем его схему состояний
	     select	State_Scheme_ID
	       into	pSch1
	       from	fdc_State
	      where	ID = pSrc_State_ID;
     exception
	     when NO_DATA_FOUND then fdc_util.abort('Не найдено исходное состояние перехода по ID = ' || pSrc_State_ID);
  	   when others then fdc_util.abort('Ошибка получения исходного состояния перехода по ID = ' || pSrc_State_ID, 1);
     end;
     
     -- проверяем
     if (pSch1 <> pState_Scheme_ID) then
        fdc_util.abort('Исходное состояние перехода и сам переход принадлежат разным схемам! Ошибка вызова!'); 
     end if;   
  end if;

  -- Если задано целевое состояние, то проверяем его
  if (pDst_State_ID is not null) then
     begin
       -- ищем его схему состояний
	     select	State_Scheme_ID
	       into	pSch2
	       from	fdc_State
	      where	ID = pDst_State_ID;
     exception
	     when NO_DATA_FOUND then fdc_util.abort('Не найдено целевое состояние перехода по ID = ' || pDst_State_ID);
  	   when others then fdc_util.abort('Ошибка получения целевого состояния перехода по ID = ' || pDst_State_ID, 1);
     end;   
     
     -- проверяем
     if (pSch2 <> pState_Scheme_ID) then
        fdc_util.abort('Целевое состояние перехода и сам переход принадлежат разным схемам! Ошибка вызова!'); 
     end if;
  end if;

  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- изменяем fdc_State_Transit
  update fdc_State_Transit
     set Src_State_ID	= pSrc_State_ID,
	       Dst_State_ID	= pDst_State_ID,
	       Before_Procedure_ID = pBefore_Procedure_ID,
	       After_Procedure_ID	= pAfter_Procedure_ID
   where ID = pID;

  -- если нужно, то меняем системное имя 
  fdc_Object_Upd_SysName(pID,pSysName);
end fdc_State_Transit_Upd;
/
