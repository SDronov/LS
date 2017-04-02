create or replace procedure fdc_Session_Upd_Close
-- Простановка идентификатора закрывающего процесса обработки данных
-- для его инициализирующего процесса 
-- идентификатор проставляется при успешном завершении закрывающего процесса
	(
  pID                number,                      -- Идентификатор "закрываемого" процесса обработки данных
  pEnd_Session_ID    number                       -- Идентификатор "закрывающего" процесса обработки данных
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
	  when NO_DATA_FOUND then fdc_util.Abort('Не найден закрываемый процесс, ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения закрываемого процесса, ID='||pID, 1);
  end;  
  if pSession.State_SysName <> 'SessionStateSuccess' then
    fdc_Util.Abort('Неверное состояние процесса для его продолжения закрывающим процессом! (ID='|| pID ||')');
  end if;
  
  -- Установка идентификатора "закрывающего" процесса
  update fdc_Session
  set End_Session_ID = pEnd_Session_ID
  where ID = pID;    
end;
/
