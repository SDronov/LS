create or replace procedure fdc_Session_Upd_Finish
-- Завершение процесса обработки данных 
	(
  pID                  number,           -- Идентификатор завершаемого процесса обработки данных
  pResStateSysName     varchar2,         -- Системное имя результирующего состояния процесса
                                         -- одно из: 'SessionStateSuccess', 'SessionStateError', 'SessionStateHung'
  pMessage             varchar2 := null  -- Сообщение по завершении сессии (например, сообщение об ошибке)
  ) 
is
  pSession fdc_Session_Lst%rowtype;  
begin
  -- Проверка результирующего состояния процесса
  if pResStateSysName not in ('SessionStateSuccess', 'SessionStateError', 'SessionStateHung') then
    fdc_util.Abort('Неверное результирующее состояние при завершении процесса обработки данных: '||pResStateSysName);
  end if;

  -- Получение записи процесса
  begin
    select *
    into pSession
    from fdc_Session_Lst 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не найден закрываемый процесс, ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения закрываемого процесса, ID='||pID, 1);
  end;  
  
  -- Перевод состояния процесса
  Fdc_Object_Upd_State(pID, 
                       fdc_State_Transit_Get_ByStates(pSession.Typesysname, 
                                                      pSession.State_Sysname, 
                                                      pResStateSysName
                                                     )
                      );
  
  -- Запись информации о моменте завершения и сообщении процесса
  update fdc_Session
  set dt_end = sysdate,
      Message = pMessage
  where ID = pID;    
end;
/
