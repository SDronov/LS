create or replace procedure fdc_Session_Upd_Start
-- Начало процесса обработки данных
	(
  pID                  number,                   -- Идентификатор стартующего процесса обработки данных
  pLocal_ID            number := null            -- Идентификатор процесса в специализированном журнале 
                                                 -- для данного типа процессов 
                                                 -- (в случае, если ведется некий специфический журнал 
                                                 --  процессов обработки определенного типа)
  ) 
is
  pSession fdc_Session_Lst%rowtype;  
begin
  -- Проверка типа и состояния процесса
  begin
    select *
    into pSession
    from fdc_Session_Lst 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не найден процесс, ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения процесса, ID='||pID, 1);
  end;  
  if pSession.State_SysName <> 'SessionStateCreated' then
    fdc_Util.Abort('Неверное состояние стартующего процесса (ID='|| pID ||')');
  end if;

  -- Перевод состояния процесса
  Fdc_Object_Upd_State(pID, 
                       fdc_State_Transit_Get_ByStates(pSession.Typesysname, 
                                                      'SessionStateCreated', 
                                                      'SessionStateProgress'
                                                     )
                      );
 
  -- Запись информации об идентификаторе процесса в специализированном журнале
  if pLocal_ID is not null then
    update fdc_Session
    set Local_ID = pLocal_ID
    where ID = pID;    
  end if;
end;
/
