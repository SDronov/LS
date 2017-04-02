create or replace function fdc_State_Transit_Get_ByStates
-- Получение идентификатора перехода состояний по типу объекта, а также
-- системным именам исходного и целевого состояний
  (
  pObject_Type_SysName     varchar2,           -- Системное имя типа объекта, для которого ищется переход 
  pSrc_State_SysName       varchar2,           -- Системное имя исходного состояния
  pDst_State_SysName       varchar2            -- Системное имя целевого состояния
  )
return number  
is
  pState_Scheme_ID number;
  pSrc_State_ID number;
  pDst_State_ID number;
  pTransit_ID number;
begin
  -- Получение идентификатора схемы состояний для заданного типа объектов
  begin
    select T.State_Scheme_Id
    into pState_Scheme_ID
    from fdc_Object_Type T
    where T.Sysname = pObject_Type_SysName;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не найден тип данных по системному имени '||pObject_Type_SysName);
  	when others then fdc_util.Abort('Ошибка определения типа данных по системному имени '||pObject_Type_SysName, 1);
  end;
  
  -- Получение идентификатора исходного состояния
  begin
    select ID
    into pSrc_State_ID
    from Fdc_State_Lst S
    where S.STATE_SCHEME_ID = pState_Scheme_ID and
          S.Sysname = pSrc_State_SysName;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Для типа объекта '||pObject_Type_SysName||' не определено состояние '||pSrc_State_SysName);
  	when others then fdc_util.Abort('Ошибка определения состояния '||pSrc_State_SysName||' для типа объекта '||pObject_Type_SysName, 1);
  end;        

  -- Получение идентификатора целевого состояния
  begin
    select ID
    into pDst_State_ID
    from Fdc_State_Lst S
    where S.STATE_SCHEME_ID = pState_Scheme_ID and
          S.Sysname = pDst_State_SysName;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Для типа объекта '||pObject_Type_SysName||' не определено состояние '||pDst_State_SysName);
  	when others then fdc_util.Abort('Ошибка определения состояния '||pDst_State_SysName||' для типа объекта '||pObject_Type_SysName, 1);
  end;        

  -- Получение идентификатора перехода состояний
  begin
    select ID
    into pTransit_ID
    from Fdc_State_Transit T
    where T.STATE_SCHEME_ID = pState_Scheme_ID and
          T.SRC_STATE_ID = pSrc_State_ID and
          T.DST_STATE_ID = pDst_State_ID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Для типа объекта '||pObject_Type_SysName||' не определен переход из состояния '||pSrc_State_SysName||' в состояние '||pDst_State_SysName);
	  when TOO_MANY_ROWS then fdc_util.Abort('Для типа объекта '||pObject_Type_SysName||' не определен однозначно переход из состояния '||pSrc_State_SysName||' в состояние '||pDst_State_SysName);
  	when others then fdc_util.Abort('Ошибка определения перехода из состояния '||pSrc_State_SysName||' в состояние '||pDst_State_SysName||' для типа объекта '||pObject_Type_SysName, 1);
  end;        
  
  -- Возврат результата
  return pTransit_ID;
  
end;
/
