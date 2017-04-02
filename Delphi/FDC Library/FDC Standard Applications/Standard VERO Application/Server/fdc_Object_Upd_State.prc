create or replace procedure fdc_Object_Upd_State
-- Изменяет состояние объекта, если это возможно
-- Поднимает исключение при невозможности изменить статус
	(
	  pID number,                   -- идентификатор объекта   
	  pState_Transit_ID number      -- идентификатор перехода состояний
	)
is
  pSrc_State_ID number(15);
  pDst_State_ID number(15);
  pState_ID number(15);
  pEvent_ID number(15);
  pBefore_Procedure varchar2(30);
  pAfter_Procedure varchar2(30);
  pStr varchar2(1500);
begin
  -- определяем текущее состояние объекта
  begin
    select State_ID
      into pState_ID
      from fdc_Object
     where ID = pID;
  exception 
    when NO_DATA_FOUND then
         fdc_util.abort('Не найден объект по ID = '||pID);
  	when others then 
         fdc_util.abort('Ошибка определения состояния объекта по ID = '||pID, 1); 
  end;

  -- определяем начальное и конечное состояния заданного перехода, 
  -- а также процедуры до и после него
  begin
    select T.Src_State_ID, T.Dst_State_ID, BP.SysName, AP.SysName
      into pSrc_State_ID, pDst_State_ID, pBefore_Procedure, pAfter_Procedure
      from fdc_State_Transit T,
	         fdc_Object BP,
	         fdc_Object AP
     where T.ID = pState_Transit_ID and
	         BP.ID (+)= T.Before_Procedure_ID and
	         AP.ID (+)= T.After_Procedure_ID;
  exception 
    when NO_DATA_FOUND then
         fdc_util.abort('Не найден переход состояния по ID = '||pID);
  	when others then 
         fdc_util.abort('Ошибка определения перехода состояний по ID = '||pID, 1); 
  end;         

  -- если текущее состояние объекта отличается от начального состояния перехода,
  -- то ошибка
  if nvl(pState_ID,-1) <> nvl(pSrc_State_ID,-1) then
	   fdc_util.abort('Исходное состояние объекта не совпадает с объявленным изменением');
	   return;
  end if;

  -- формируем строку для запуска процедур до и после перехода
  pStr := '('||pID||','||pState_Transit_ID||',';

  -- запускаем заданную процедуру до перехода
  if (trim(pBefore_Procedure) is not null) then
	   begin
	     execute immediate 'begin '||pBefore_Procedure||pStr||'0); end;';
	   exception 
       when others then 
         fdc_util.abort('Ошибка выдолнения процедуры до перехода состояния объекта', 1); 
         return;
	   end;
  end if;

  -- изменяем состояние объекта
  update fdc_Object
     set State_ID = pDst_State_ID
   where ID = pID;

  -- заносим событие перехода состояния объекта 
  fdc_Event_Add_EventState('EventState', pID, pState_Transit_ID);

  -- запускаем заданную процедуру после перехода
  if trim(pAfter_Procedure) is not null then
	   begin
	     execute immediate 'begin '||pAfter_Procedure||pStr||'1); end;';
     exception 
       when others then 
         fdc_util.abort('Ошибка выдолнения процедуры после перехода состояния объекта', 1); 
         return;
	   end;  
  end if;
exception
  when others then
    Fdc_Util.Abort('Не прошло изменение состояния объекта '||'(ID='||pID||'):', 1);
end fdc_Object_Upd_State;
/
