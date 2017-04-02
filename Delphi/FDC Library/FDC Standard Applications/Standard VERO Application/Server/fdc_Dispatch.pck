create or replace package fdc_Dispatch as
-- Пакет, реализующий работу Диспетчера - подсистемы автоматического управления процессами обработки данных 
-- При реализации конкретной системы множество настроек и констант 
-- определяется в коде пакета
-- Места в коде, где необходимо прописать реализацию, 
-- помечены комментариями, начинающимися с ##

-- Правила запуска и взаимодействие процессов зашиваются в коде
-- Где?
-- 1. В спецификации пакета:
--    Константы - типы процессов
--    Константа AUTO_SESSIONS_COUNT
--    Массив Session_Type_By_Priority
-- 2. В теле пакета:
--    Session_Restrictions
--    Session_IsWaiting
--    Get_Closing_Session_Type
--    Check_Session_Create_Params
--    ProcBySessionType
--    Session_Conditions
--    Get_Init_Session
--    Session_Init_By_Type
-- Сейчас для примера в коде зашиты 2 типа процессов:
--  SESSION_TYPE_SAMPLE1 и SESSION_TYPE_SAMPLE2
-- При реализации диспетчера их надо выкинуть
--------------------------------------------------------------------------
--                       Типы
--------------------------------------------------------------------------
subtype TSession is fdc_Session_Lst%rowtype;

--------------------------------------------------------------------------
--                       Константы
--------------------------------------------------------------------------
-----------------------
-- Типы процессов
-- здесь определяются системные имена всех управляемых диспетчером типов процессов
SESSION_TYPE_MAIN               constant fdc_Object_Type_Lst.Sysname%type   := 'Session';
SESSION_TYPE_DISPATCH           constant fdc_Object_Type_Lst.Sysname%type   := 'SessionDispatch';

-- Типы сессий для подписок:
-- Сессия генерации уведомлений по подпискам
SESSION_TYPE_GENNOTIFICATIONS   constant fdc_Object_Type_Lst.Sysname%type   := 'SessionGenNotifications';
-- Сессия установки флага активности подписок
SESSION_TYPE_SUBSCRIPTIONCHK    constant fdc_Object_Type_Lst.Sysname%type   := 'SessionSubscriptionCheck';

-- ## Следующие типы сессий и реализация их логики - только для примера!
-- Пусть SESSION_TYPE_SAMPLE1 - это процесс, стартующий по регламенту (каждые сутки)
SESSION_TYPE_SAMPLE1            constant fdc_Object_Type_Lst.Sysname%type   := 'SessionSample1';
-- Пусть SESSION_TYPE_SAMPLE2 - это процесс, "закрывающий" SESSION_TYPE_SAMPLE1
SESSION_TYPE_SAMPLE2            constant fdc_Object_Type_Lst.Sysname%type   := 'SessionSample2';
-----------------------

-- Состояния процессов
SESSION_STATE_SUCCESS    constant fdc_Object.Sysname%type   := 'SessionStateSuccess';
SESSION_STATE_ERROR      constant fdc_Object.Sysname%type   := 'SessionStateError';
SESSION_STATE_PROGRESS   constant fdc_Object.Sysname%type   := 'SessionStateProgress';
SESSION_STATE_HUNG       constant fdc_Object.Sysname%type   := 'SessionStateHung';
SESSION_STATE_CREATED    constant fdc_Object.Sysname%type   := 'SessionStateCreated';

-- Переходы состояний
SESSION_TRANSIT_CREATE     constant fdc_Object.Sysname%type := 'SessionTransitCreate';
SESSION_TRANSIT_START      constant fdc_Object.Sysname%type := 'SessionTransitStart';
SESSION_TRANSIT_FINISH     constant fdc_Object.Sysname%type := 'SessionTransitFinish';
SESSION_TRANSIT_ERROR      constant fdc_Object.Sysname%type := 'SessionTransitError';
SESSION_TRANSIT_CHECKHUNG  constant fdc_Object.Sysname%type := 'SessionTransitCheckHung';

-- Системные константы
MAXSESSIONS_SN               constant fdc_Object.Sysname%type := 'Dispatch.MaxSessions';
MAX_UNSUCCESSFUL_ATTEMPTS_SN constant fdc_Object.Sysname%type := 'Dispatch.MaxErrorsStartingSession';

-- Переменные настройки диспетчера
-- назначаются в initialization-секции пакета
MAXSESSIONS_VAL               number;  -- Количество одновременно работающих процессов
MAX_UNSUCCESSFUL_ATTEMPTS_VAL number;  -- Максимальное количество попыток запуска
                                       -- при ошибочном завершении процессов
                                       -- либо
                                       -- Максимальное количество неудачных попыток запуска в Job-е,
                                       -- после которого job считается "сломавшимся"
DISPATCH_ERROR_INTERVAL       number := 1;  -- Периодичность, с которой диспетчер отбрасывает в журнал
                                       -- повторяющиеся ошибки


-- Приоритетность автоматически запускаемых процессов
-- ## Здесь задается порядок проверки условий для запуска определенных типов процессов
-- все допустимые типы должны быть перечислены здесь
AUTO_SESSIONS_COUNT      constant number                 := 2;
type TSession_Priority is varray (2)
                          of fdc_Session_Lst.Sysname%type;
Session_Type_By_Priority constant TSession_Priority := TSession_Priority (
    SESSION_TYPE_SUBSCRIPTIONCHK,
    SESSION_TYPE_GENNOTIFICATIONS);

-- Типы процессов
type TSessionType is record
  (ID fdc_Object_Type_Lst.ID%type,
   Name fdc_Object_Type_Lst.Name%type);
type TSessionTypeLst is table of TSessionType index by fdc_Object_Type_Lst.SysName%type;
SessionTypeLst TSessionTypeLst;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       Процедуры
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       Основные
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Создание процесса в FDC_SESSION
-- Используется для отладки процедур по отдельным типам
-- а также диспетчером
function Session_Create(pSession_Type_SysName varchar2,
                        pInitial_Session_ID number := null,
                        pRaiseOnRestriction boolean := true)
return number;


--------------------------------------------------------------------------
-- Установка для процесса состояния "В процессе работы" - SESSION_STATE_PROGRESS
-- При этом может проставляться ID локального процесса (сессии)
-- для тех типов процессов, где ведется свой учет
-- Если Local_ID = null,
-- проставляется ID самого процесса: Local_ID := pSession_ID
procedure Session_Start(pSession_ID number,
                        pLocal_ID number := null);

--------------------------------------------------------------------------
-- Завершение процесса в FDC_Session
-- Возможные статусы -
-- SESSION_STATE_SUCCESS,
-- SESSION_STATE_ERROR (при этом должен быть передан Message)
-- SESSION_STATE_HUNG
-- SESSION_STATE_SUCCESS и SESSION_STATE_ERROR проставляются реализующей процесс процедурой
-- SESSION_STATE_HUNG может проставляться только вручную из приложения,
-- а также автоматически процессом диспетчера
-- при обнаружении "дохлого" job-а
procedure Session_Finalize(pSession_ID number,
                           pState_SysName varchar2 :=  SESSION_STATE_SUCCESS,
                           pMessage varchar2 := null);


--------------------------------------------------------------------------
-- Сигнал от процесса, что он жив.
-- Вызывается на каждом (по возможности) шаге процесса
-- Механика сохранения этой информации где-либо и ее использования
-- должна быть проработана дополнительно.
-- Пока проверяется только наличие и статус процесса.
-- Но вызовы уже сейчас вшиваются во все обрабатывающие процедуры
procedure Session_Message(pSession_ID number);

--------------------------------------------------------------------------
-- Самый главный, самый умный диспетчер
procedure Dispatch;


--------------------------------------------------------------------------
-- Процедура, вызываемая супердемоном (регламентным Job-ом)
-- При наличии условий (время подошло) и отсутствии ограничений
-- (системная константа Dispatch.DispatchIsActive = 0)
-- запускает диспетчер
procedure Main;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       Сервисные
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Получение процесса по ID
-- если заказанный процесс соответствует содержащемуся в gSession
-- возвращается gSession,
-- если нет - gSession считывается из БД и возвращается
function Session_GetByID(pSession_ID number,
                         pForceRefresh boolean := false)
return TSession;

--------------------------------------------------------------------------
-- Проверить, действительно ли завершенный процесс - ожидающий
-- возвращает 1 если ожидающая или 0 если нет
function Session_IsWaiting (pSession_ID number)
return number;

--------------------------------------------------------------------------
-- Проверить, идет ли
-- (есть ли в состояниях SESSION_STATE_CREATED, SESSION_STATE_PROGRESS)
-- процесс заданного типа (для заданной роли)
-- Если найдено, возвращает 1,
-- если не найдено - 0
function ActiveSessionExistsNum (pSession_Type_SysName varchar2)
return number;

--------------------------------------------------------------------------
-- Проверить консистентность системы
-- нету ли активных или ожидающих процессов
-- соответственно, целостна ли система по данным
-- если целостна, возвращает 1
-- если нет - 0
function System_Consistent_State_Num
return number;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       Примеры вызова
--------------------------------------------------------------------------
--------------------------------------------------------------------------
/*
-- Пример процедуры, реализующей тип процесса
procedure Session_Type_Proc(lSession_ID number) is
begin
  fdc_Dispatch.Session_Start...
  .................
  fdc_Dispatch.Session_Finalize(lSession_ID);
exception
  when others then
    fdc_Dispatch.Session_Finalize(lSession_ID, fdc_Dispatch.Session_State_Error, sqlerrm);
end;

*/
--------------------------------------------------------------------------
/*
Пример отладки такой процедуры

declare lSession_ID number;
begin
  lSession_ID := fdc_Dispatch.Session_Create(fdc_Dispatch.SESSION_TYPE_SAMPLE);
  Session_Type_Proc(lSession_ID);
end;
*/

--------------------------------------------------------------------------
-- Dummy-процедура - заглушка для вызова по неизвестным
-- или неотлаженным процедурам, реализующим какой-либо тип процесса
procedure Start_Dummy (pSession_ID number);


--------------------------------------------------------------------------
--                       Управление диспетчером                         --
--------------------------------------------------------------------------
-- Включен ли диспетчер?
-- Если включен, возвращает 1,
-- если нет - 0
function Dispatcher_IsActive return number;

--------------------------------------------------------------------------
-- Включить диспетчер
procedure Dispatcher_Start;

--------------------------------------------------------------------------
-- Отключить (деактивировать) диспетчер
procedure Dispatcher_Stop;



end;
/
create or replace package body fdc_Dispatch as
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       Переменные
--------------------------------------------------------------------------
--------------------------------------------------------------------------
gSession TSession;
gDispatch_Session_ID number;
gDispatch_Error boolean;

type TDispatch_Message is table of varchar2(1500);
gDispatch_Message TDispatch_Message := TDispatch_Message();

-- Структура для хранения инициализирующих сессий,
-- которые в рамках данной сессии диспетчера не могут быть закрыты из-за ограничений
-- Храним чтобы при проверке ожидающих сессий на них не зацикливаться
type TRestricted_Initial_Session is table of number index by binary_integer;
Restricted_Initial_Session TRestricted_Initial_Session;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       Процедуры
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Private
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Инициализация переменных
-- и сервисных структур в памяти процесса диспетчера
procedure InitVariables is
begin
  -- Системные переменные
  MAXSESSIONS_VAL :=fdc_valuenumber_sys_get(MAXSESSIONS_SN);
  MAX_UNSUCCESSFUL_ATTEMPTS_VAL := fdc_valuenumber_sys_get(MAX_UNSUCCESSFUL_ATTEMPTS_SN);

  -- Ассоциированный массив типов процессов
  for rec in (select ST.*
              from fdc_Object_Type_Lst ST,
                   fdc_Object_Type_Lst S,
                   fdc_child_object_type CT
              where S.Sysname = SESSION_TYPE_MAIN and
                    CT.OBJECT_TYPE_ID = S.ID and
                    CT.CHILD_OBJECT_TYPE_ID = ST.ID) loop
    if rec.sysname <> SESSION_TYPE_MAIN then
      SessionTypeLst(rec.SysName).ID := rec.ID;
      SessionTypeLst(rec.SysName).Name := rec.Name;
    end if;
  end loop;

end;

--------------------------------------------------------------------------
-- Получение процесса по ID
-- если заказанный процесс соответствует содержащемуся в gSession
-- возвращается gSession,
-- если нет - gSession считывается из БД и возвращается
function Session_GetByID(pSession_ID number,
                         pForceRefresh boolean := false)
return TSession is
------------------------------------
begin
  if pSession_ID is null then
    Fdc_Util.Abort('Пустое значение параметра ID процесса', 0, -20030);
  end if;
  if gSession.ID is null or gSession.ID <> pSession_ID or pForceRefresh then
    begin
      select *
      into gSession
      from fdc_Session_Lst
      where ID = pSession_ID;
    exception
      when no_data_found then
        Fdc_Util.Abort('Не найден процесс ID = '||pSession_ID, 0, -20128);
    end;
  end if;
  return gSession;
end;

--------------------------------------------------------------------------
-- Дополнить сообщение сессии диспетчера
procedure Dispatch_Message_Add (pMessage varchar2) is
begin
  for i in 1..gDispatch_Message.Count loop
    if trim(pMessage) = gDispatch_Message(i) then
      return;
    end if;
  end loop;
  gDispatch_Message.Extend;
  gDispatch_Message(gDispatch_Message.Count) := pMessage;
end;

--------------------------------------------------------------------------
-- Получить строку сообщения сессии диспетчера
function Dispatch_Message_Get return varchar2 is
lResult varchar2(1500) := '';
crlf varchar2(2) := '';
begin
  for i in 1..gDispatch_Message.Count loop
    if i > 1 then
      crlf := chr(10);
    end if;
    lResult := substr(lResult||crlf||gDispatch_Message(i), 1, 1500);
  end loop;
  return lResult;
end;

--------------------------------------------------------------------------
-- Проверить, "жив" ли процесс
-- если да, возвращает true,
-- иначе - помечает процесс как зависший,
-- при необходимости убивает job
-- и возвращает false
function Session_Alive (pSession in out nocopy TSession)
return boolean is
------------------------------------
lJob user_Jobs%rowtype;
lError varchar2(2000) := 'Сессия помечена как зависшая. ID=';
l_Session_Dead boolean := false;
lResult boolean := true;
lMessage varchar2(2000);
begin
  if pSession.Job_ID is not null then
    begin
      select *
      into lJob
      from user_jobs
      where job = pSession.Job_ID;
      if lJob.Broken = 'Y' or lJob.Failures >= MAX_UNSUCCESSFUL_ATTEMPTS_VAL then
        l_Session_Dead := true;
        if lJob.Broken = 'Y' then
          lMessage := 'Сломавшийся ';
        end if;
        lMessage := lMessage ||'Job удален. Количество попыток запуска - '||lJob.Failures;
      end if;
    exception
      when no_data_found then
        l_Session_Dead := true;
      when others then
        Fdc_Util.Abort('Ошибка на проверке состояния процесса: ', 1, -20218);
    end;
  end if;
  if l_Session_Dead then
    lError := lError || psession.ID;
    Session_Finalize(pSession.ID, SESSION_STATE_HUNG, lMessage);
    Dispatch_Message_Add(lError);
    lResult := false;
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- Проверить, идет ли
-- (есть ли в состояниях SESSION_STATE_CREATED, SESSION_STATE_PROGRESS)
-- процесс заданного типа 
-- Если найдено, возвращает True,
-- если не найдено - false
function ActiveSessionExists (pSession_Type_SysName varchar2)
return boolean is
------------------------------------
begin
  if pSession_Type_SysName is null then
    Fdc_Util.Abort('Пустой тип процесса для поиска', 0, -20082);
  end if;

  for rec in (select /*+FIRST_ROWS*/ *
              from fdc_Session_Lst S
              where S.Object_Type_ID = SessionTypeLst(pSession_Type_SysName).ID
              and S.State_SysName in (SESSION_STATE_CREATED, SESSION_STATE_PROGRESS)) loop
    if Session_Alive(rec) then
      return true;
    end if;
  end loop;
  return false;
end;

-- Wrapper над ней - возвращает числовое значение
function ActiveSessionExistsNum (pSession_Type_SysName varchar2)
return number is
begin
  if ActiveSessionExists (pSession_Type_SysName) then
    return 1;
  else
    return 0;
  end if;
end;

--------------------------------------------------------------------------
-- Проверить, по незакрытому процессу
-- не прошла ли уже успешная сессия
-- Если прошла, проставляет ее в End_Session и возвращает true, нет - false
function Closing_Session_Successful (pInitial_Session_ID number)
return boolean is
------------------------------------
lSession_ID fdc_Session.ID%type;
lRetVal boolean := true;
begin
  begin
    select ID
    into lSession_ID
    from Fdc_Session_Lst S
    where S.INITIAL_SESSION_ID = pInitial_Session_ID and
          S.State_SysName = SESSION_STATE_SUCCESS and
          rownum <= 1;
    fdc_Session_Upd_Close(pInitial_Session_ID, lSession_ID);
  exception
    when no_Data_Found then
      lRetVal := false;
  end;
  return lRetVal;
end;

--------------------------------------------------------------------------
-- Проверить, по незакрытому процессу
-- не работает ли сейчас закрывающий процесс?
-- Если работает, возвращает true, нет - false
function Closing_Session_Active (pInitial_Session_ID number)
return boolean is
------------------------------------
lSession_ID fdc_Session.ID%type;
lRetVal boolean := true;
begin
  begin
    select ID
    into lSession_ID
    from Fdc_Session_Lst S
    where S.INITIAL_SESSION_ID = pInitial_Session_ID and
          S.State_SysName in (SESSION_STATE_CREATED, SESSION_STATE_PROGRESS) and
          rownum <= 1;
  exception
    when no_Data_Found then
      lRetVal := false;
  end;
  return lRetVal;
end;

--------------------------------------------------------------------------
-- Проверить, действительно ли завершенный процесс - ожидающий
function Session_IsWaiting (pSession in out nocopy TSession)
return boolean is
lResult boolean := false;
begin
  if pSession.State_SysName = SESSION_STATE_SUCCESS and
             pSession.End_Session_ID = 0 then
    case pSession.TypeSysName
      when SESSION_TYPE_SAMPLE1 then
        if not Closing_Session_Active(pSession.ID) and
           not Closing_Session_Successful(pSession.ID) then
          lResult := true;
        end if;
      else
        null;
    end case;
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- Проверить, действительно ли завершенный процесс - ожидающий
-- overload предыдущей функции
-- для вызова снаружи
-- возвращает 1 если ожидающая или 0 если нет
function Session_IsWaiting (pSession_ID number)
return number is
lSession TSession;
lResult number := 0;
begin
  lSession := Session_Getbyid(pSession_ID);
  if Session_IsWaiting(lSession) then
    lResult := 1;
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- Проверить, есть ли завершенный, но незакрытый процесс
-- заданного типа 
function Session_Waiting (pSession_Type_SysName varchar2)
return number is
cursor Session_Waiting_Cur (pSession_Type_SysName varchar2) is
  select /*+FIRST_ROWS*/ *
  from fdc_Session_Lst S
  where S.Object_Type_Id = SessionTypeLst(pSession_Type_SysName).ID
  and S.State_SysName in (SESSION_STATE_SUCCESS)
  and S.END_SESSION_ID = 0
  order by ID;
lSession TSession;
lResult fdc_Session.ID%type := null;
begin
  if pSession_Type_SysName is null then
    Fdc_Util.Abort('Пустой тип процесса для поиска', 0, -20090);
  end if;
  open Session_Waiting_Cur(pSession_Type_SysName);
    begin
    fetch Session_Waiting_Cur into lSession;
    while Session_Waiting_Cur%found loop
      -- Проверка, действительно ли это ожидающий процесс
      -- и не было ли уже на него обнаружено ограничений
      if (not Restricted_Initial_Session.exists(lSession.ID)) and
         (Session_IsWaiting(lSession)) then
        lResult := lSession.ID;
        exit;
      end if;
      fetch Session_Waiting_Cur into lSession;
    end loop;
    close Session_Waiting_Cur;
  exception
    when others then
      close Session_Waiting_Cur;
      Fdc_Util.Abort('Ошибка проверки ожидающих процессов: ', 1, -20189);
  end;
  return lResult;
end;

--------------------------------------------------------------------------
-- Проверить консистентность системы
-- нету ли активных или ожидающих процессов
-- соответственно, целостна ли система по данным
-- если целостна, возвращает true
-- если нет - false
function System_Consistent_State
return boolean is
RetVal boolean := true;
lSession_Type_Sys_Name varchar2(100);
begin
  lSession_Type_Sys_Name := SessionTypeLst.first;
  while lSession_Type_Sys_Name is not null loop
    RetVal := not ActiveSessionExists(lSession_Type_Sys_Name);
    exit when not RetVal;
    lSession_Type_Sys_Name := SessionTypeLst.next(lSession_Type_Sys_Name);
  end loop;
  return RetVal;
end;

-- wrapper над ней
-- если целостна, возвращает 1
-- если нет - 0
function System_Consistent_State_Num
return number is
begin
  if System_Consistent_State then
    return 1;
  else
    return 0;
  end if;
end;
--------------------------------------------------------------------------
-- Проверка ограничивающих условий на создание процесса
-- если есть ограничения - true
-- если все в порядке - возвращает false
function Session_Restrictions(pSession_Type_SysName varchar2,
                              pRestriction out varchar2)
return boolean is
------------------------------------
lResult boolean := false;
lError varchar2(2000);
lRestriction_Text varchar2(2000) := null;
lSampleRestriction1 varchar2(2000) := 'Уже идет такой процесс!';
lSampleRestriction2 varchar2(2000) := 'Идет процесс, закрывающий предыдущее исполнение этого';
lSampleRestriction3 varchar2(2000) := 'Еще не закрыт предыдущий процесс';
lSampleRestriction4 varchar2(2000) := 'Идет процесс, несовместимый с этим';
begin
  case pSession_Type_SysName
  when SESSION_TYPE_GENNOTIFICATIONS then
    if ActiveSessionExists(SESSION_TYPE_GENNOTIFICATIONS) then
      lRestriction_Text := lSampleRestriction1;
    elsif ActiveSessionExists(SESSION_TYPE_SUBSCRIPTIONCHK) then
      lRestriction_Text := lSampleRestriction4;
    end if;  
  when SESSION_TYPE_SUBSCRIPTIONCHK then
    if ActiveSessionExists(SESSION_TYPE_SUBSCRIPTIONCHK) then
      lRestriction_Text := lSampleRestriction1;
    elsif ActiveSessionExists(SESSION_TYPE_GENNOTIFICATIONS) then
      lRestriction_Text := lSampleRestriction4;
    end if;  
  when SESSION_TYPE_SAMPLE1 then
    if ActiveSessionExists(SESSION_TYPE_SAMPLE1) then
      lRestriction_Text := lSampleRestriction1;
    elsif ActiveSessionExists(SESSION_TYPE_SAMPLE2) then
      lRestriction_Text := lSampleRestriction2;
    elsif Session_Waiting(SESSION_TYPE_SAMPLE1) is not null then
      lRestriction_Text := lSampleRestriction3;
    end if;  
  when SESSION_TYPE_SAMPLE2 then
    if ActiveSessionExists(SESSION_TYPE_SAMPLE2) then
      lRestriction_Text := lSampleRestriction1;
    end if;  
  else
    Fdc_Util.Abort('Неверный тип процесса: '||pSession_Type_SysName, 0, -20215);
  end case;
  if lRestriction_Text is not null then
    lResult := true;
    pRestriction := lRestriction_Text;
    lError := 'Ограничение на запуск процесса ' || SessionTypeLst(pSession_Type_SysName).Name;
    lError := lError ||': '||lRestriction_Text;
    Dispatch_Message_Add(lError);
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- Получение типа закрывающего процесса по заданному
-- типу процесса 
function Get_Closing_Session_Type (pSession_Type_SysName varchar2)
return varchar2 is
lSession_Type_SysName varchar2(1500):=null;
------------------------------
begin
  case pSession_Type_SysName
    when SESSION_TYPE_SAMPLE1 then
      lSession_Type_SysName := SESSION_TYPE_SAMPLE2;
    else
      null;
  end case;
  return lSession_Type_SysName;
end;

--------------------------------------------------------------------------
-- Проверка корректности параметров для ручного создания процесса
-- из процедуры Session_Create
procedure Check_Session_Create_Params
                       (pSession_Type_SysName varchar2,
                        pInitial_Session_ID number) is
------------------------------------
lInitial_Session TSession;
begin
  -- Проверка типа процесса
  if pSession_Type_SysName not in (SESSION_TYPE_GENNOTIFICATIONS, SESSION_TYPE_SUBSCRIPTIONCHK, 
                                   SESSION_TYPE_SAMPLE1, SESSION_TYPE_SAMPLE2) then
    rollback;
    Fdc_Util.Abort('Неверный тип процесса: '||pSession_Type_SysName, 0, -20593);
  end if;
  if (pSession_Type_SysName in (SESSION_TYPE_GENNOTIFICATIONS, SESSION_TYPE_SUBSCRIPTIONCHK, SESSION_TYPE_SAMPLE1) 
      and pInitial_Session_ID is not null) or
     (pSession_Type_SysName = SESSION_TYPE_SAMPLE2 and pInitial_Session_ID is null) then
    Fdc_Util.Abort('Неверно задан параметр инициализирующего процесса', 0, -20615);
  end if;   
  if pInitial_Session_ID is not null then
    lInitial_Session := Session_GetByID(pInitial_Session_ID, true);
    if lInitial_Session.State_SysName <> SESSION_STATE_SUCCESS then
      Fdc_Util.Abort('Инициализирующий процесс для создаваемой сессии не был завершен успешно!', 0, -20615);
    end if;
    if not (pSession_Type_SysName = Get_Closing_Session_Type(lInitial_Session.TypeSysName)) then
      Fdc_Util.Abort('Неверный тип для заданного инициализирующего процесса', 0, -20622);
    end if;
    if lInitial_Session.End_Session_ID <> 0 then
      Fdc_Util.Abort('Инициализирующий процесс уже закрыт процессом ID='||lInitial_Session.End_Session_ID, 0, -20625);
    end if;
  end if;
end;

--------------------------------------------------------------------------
-- Получить момент последнего успешного запуска
-- процесса заданного типа
-- Используется для типов процессов,
-- работающих по регламенту
function Last_Successful_Time(pSession_Type_SysName varchar2)
return date is
------------------------------------
l_Last_Date date;
begin
  select max(dt_Start)
  into l_Last_Date
  from fdc_Session_Lst S
  where S.TypeSysName = pSession_Type_SysName and
  S.State_SysName = SESSION_STATE_SUCCESS;
  return l_Last_Date;
end;

--------------------------------------------------------------------------
-- Получить количество последних ошибочных записей
-- о запуске процесса заданного типа
-- (по заданному инициализирующему процессу)
-- Обработать ситуацию максимального количества неудачных попыток
function Unsuccessful_Attempts(pSession_Type_SysName varchar2,
                               pInitial_Session_ID number := null)
return boolean is
------------------------------------
l_Attempts number := 0;
l_RetVal boolean := false;
------------------------------------
function Error_Message return varchar2 is
pError_Message varchar2(2000);
begin
    pError_Message := 'Превышено максимальное количество попыток запуска процесса ';
    pError_Message := pError_Message || SessionTypeLst(pSession_Type_SysName).Name;
    if pInitial_Session_ID is not null then
      pError_Message := pError_Message || ' по инициализирующему процессу ID = '||pInitial_Session_ID;
    end if;
    pError_Message := pError_Message || chr(10) || 'Необходимо решить возникшую проблему для восстановления штатной работы системы!';
    return pError_Message;
end;
------------------------------------
begin
  for rec in (select * from fdc_Session_Lst S
              where S.TypeSysName = pSession_Type_SysName and
                    (pInitial_Session_ID is null or
                     (pInitial_Session_ID = S.Initial_Session_ID))
              order by ID desc) loop
    if rec.State_SysName in (SESSION_STATE_ERROR, SESSION_STATE_HUNG) then
      l_Attempts := l_Attempts + 1;
    else
      exit;
    end if;
  end loop;
  if l_Attempts >= MAX_UNSUCCESSFUL_ATTEMPTS_VAL then
    l_RetVal := true;
    Dispatch_Message_Add(Error_Message);
  end if;
  return l_RetVal;
end;

--------------------------------------------------------------------------
-- Получить имя запускаемой процедуры по типу процесса
function ProcBySessionType(pSession_Type_SysName varchar2)
return Varchar2 is
------------------------------------
lProcName varchar2(2000);
begin
  case pSession_Type_SysName
    when SESSION_TYPE_SAMPLE1 then lProcName := 'SAMPLE1';
    when SESSION_TYPE_SAMPLE2 then lProcName := 'SAMPLE2';
    when SESSION_TYPE_GENNOTIFICATIONS then lProcName := 'FDC_EVENT_NOTIFICATION_REGLAM';
    when SESSION_TYPE_SUBSCRIPTIONCHK then lProcName := 'FDC_SUBSCRIPTION_CHECK_ALL';
    else
      Fdc_Util.Abort('Неверный тип процесса для автоматического запуска: '|| pSession_Type_SysName, 0, -20649);
  end case;
  return lProcName;
end;
--------------------------------------------------------------------------
-- Запуск автоматического как Job
procedure Session_JobStart(pSession_Type_SysName varchar2,
                           pSession_ID number) is
------------------------------------
lJob_ID number;
lWhat varchar2(2000);
l_Refreshed_Session TSession;
begin
  lWhat := ProcBySessionType(pSession_Type_SysName)||'('||pSession_ID||');';
  dbms_job.submit(lJob_ID, lWhat);
  fdc_Session_Upd_Job(pSession_ID, lJob_ID);
  -- Чтобы перечитать текущую сессию в памяти
  l_Refreshed_Session := Session_GetByID(pSession_ID, true);
  commit;
end;

--------------------------------------------------------------------------
-- Проверка наличия условий для запуска процессов,
-- стартующих без инициализирующего
function Session_Conditions(pSession_Type_SysName varchar2)
return boolean is
------------------------------------
lLastTime date;
lSysVal varchar2(100);
lConditions boolean := false;
begin
  if ActivesessionExists(pSession_Type_SysName) then
    lConditions := false;
  else  
    case pSession_Type_SysName
      when SESSION_TYPE_SAMPLE1 then
        lLastTime := Last_Successful_Time(pSession_Type_SysName);
        lConditions := lLastTime is null or
                       sysdate - lLastTime >= 1;
      when SESSION_TYPE_GENNOTIFICATIONS then
        lLastTime := Last_Successful_Time(pSession_Type_SysName);
        lConditions := (lLastTime is null or
                         (sysdate - lLastTime >= fdc_ValueNumber_Sys_Get('Dispatch.GenNotificationsMinInterval')/24/60))
                       and 
                       fdc_Event_NotChecked_ForSubscr = 1;
      when SESSION_TYPE_SUBSCRIPTIONCHK then
        lLastTime := Last_Successful_Time(pSession_Type_SysName);
        lConditions := lLastTime is null or
                       sysdate - lLastTime >= fdc_ValueNumber_Sys_Get('Dispatch.SubscriptionCheckInterval')/24/60;
    end case;                   
  end if;
  return lConditions;
end;

--------------------------------------------------------------------------
-- Ищет и возвращает первый из найденных инициализирующих процессов
-- для заданного типа процесса
-- если ничего не найдено - возвращает null
function Get_Init_Session(pSession_Type_SysName varchar2)
return TSession is
------------------------------------
lInit_Session_Type fdc_Session_Lst.TypeSysName%type;
lSession TSession;
begin
  lSession.ID := null;
  case pSession_Type_SysName
    when SESSION_TYPE_SAMPLE2 then
      lSession.ID := Session_Waiting(SESSION_TYPE_SAMPLE1);
    else
      Fdc_Util.Abort('Неверный тип для получения инициализирующего процесса: '|| pSession_Type_SysName, 0, -20725);
  end case;
  if lSession.ID is not null then
    lSession := Session_Getbyid(lSession.ID);
  end if;
  return lSession;
end;
--------------------------------------------------------------------------
-- Проверка условий запуска и запуск процессов
-- Возвращает
-- 0 - при удачном запуске процесса
-- 1 - при ограничении на запуск
-- 2 - при превышении максимального количества ошибок
function Session_Init_Process(pSession_Type_SysName varchar2,
                               pInitial_Session TSession,
                               p_Session_Slots in out number)
                               return number is
------------------------------------
lSession_ID fdc_Session.ID%type;
lResult number := 0;
begin
  if Unsuccessful_Attempts(pSession_Type_SysName, pInitial_Session.ID) then
    -- Если превышено количество ошибочных процессов - прекращаем обработку
    p_Session_Slots := 0;
    lResult := 2;
    gDispatch_Error := true;
  else
    lSession_ID := Session_Create(pSession_Type_SysName, pInitial_Session.ID, false);
    if lSession_ID is not null then
      -- Сессия создалась, ограничений нет
      p_Session_Slots := p_Session_Slots - 1;
      Session_JobStart(pSession_Type_SysName, lSession_ID);
    else
      -- Сработали ограничения - прерываем обработку,
      lResult := 1;
    end if;
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- Wrapper над ней же
procedure Session_Init_Process(pSession_Type_SysName varchar2,
                               pInitial_Session TSession,
                               p_Session_Slots in out number) is
lResult number;
begin
  lResult := Session_Init_Process(pSession_Type_SysName,
                                  pInitial_Session,
                                  p_Session_Slots);
end;
--------------------------------------------------------------------------
-- Запуск процессов по условиям в зависимости от типа
procedure Session_Init_By_Type(pSession_Type_SysName varchar2,
                            p_Session_Slots in out number) is
------------------------------------
lInitial_Session TSession;
lInit_Process_Result number;
begin
  if pSession_Type_SysName in (SESSION_TYPE_GENNOTIFICATIONS, SESSION_TYPE_SUBSCRIPTIONCHK, SESSION_TYPE_SAMPLE1) then
    -- Процессы, стартующие без инициализирующего
    if Session_Conditions(pSession_Type_SysName) then
      Session_Init_Process(pSession_Type_SysName, null, p_Session_Slots);
    end if;
  elsif pSession_Type_SysName in (SESSION_TYPE_SAMPLE2) then
  -- С инициализирующим процессом
    -- Далее цикл по возможно разным ролям для типа процесса
    lInitial_Session := Get_Init_Session(pSession_Type_SysName);
    while (lInitial_Session.ID is not null) and
          (p_Session_Slots > 0) loop
      lInit_Process_Result := Session_Init_Process(pSession_Type_SysName, lInitial_Session, p_Session_Slots);
      lInitial_Session := Get_Init_Session(pSession_Type_SysName);
    end loop;
  end if;
end;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!       Public     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Создание процесса в FDC_SESSION
-- Используется для отладки процедур по отдельным типам
-- а также диспетчером
function Session_Create(pSession_Type_SysName varchar2,
                        pInitial_Session_ID number := null,
                        pRaiseOnRestriction boolean := true)
return number is
PRAGMA AUTONOMOUS_TRANSACTION;
------------------------------------
lSession_ID fdc_Session.ID%type := null;
lAnyRestrictions boolean;
lRestrictionStr varchar2(2000);
begin

  -- Проверка входных параметров на корректность
  begin
    Check_Session_Create_Params (pSession_Type_SysName,
                                 pInitial_Session_ID);
  exception
    when others then
      Fdc_Util.Abort('Ошибка создания процесса. ', 1, -20136);
  end;

  lAnyRestrictions := Session_Restrictions(pSession_Type_SysName, lRestrictionStr);
  if not lAnyRestrictions then
  -- Собственно создание процесса
    lSession_ID := fdc_Session_Add(pSession_Type_SysName, pInitial_Session_ID);
  else
    if pInitial_Session_ID is not null then
      Restricted_Initial_Session(pInitial_Session_ID) := 1;
    end if;
    if pRaiseOnRestriction then
      Fdc_Util.Abort('Сессия не создана! Сработало ограничение на ее создание ('||lRestrictionStr||')', 0, -20936);
    end if;
  end if;
  commit;
  RETURN lSession_ID;
end;

--------------------------------------------------------------------------
-- Установка для процесса состояния "В процессе работы" - SESSION_STATE_PROGRESS
-- При этом может проставляться ID локального процесса (сессии)
-- для тех типов процессов, где ведется свой учет
-- Если Local_ID = null (только для буферных типов процессов
--                       и процессов обмена - пока),
-- проставляется ID самого процесса: Local_ID := pSession_ID
procedure Session_Start(pSession_ID number,
                        pLocal_ID number := null) is
lSession TSession;
lErrorMessage varchar2(2000) := null;
------------------------------------
PRAGMA AUTONOMOUS_TRANSACTION;
begin
  begin
    lSession := Session_GetByID(pSession_ID);
    fdc_Session_upd_Start(pSession_ID, pLocal_ID);
    -- И перечитать в память!
    lSession := Session_GetByID(pSession_ID, true);
  exception
    when others then
      lErrorMessage := sqlerrm;
  end;
  if lErrorMessage is not null then
    Session_Finalize(pSession_ID, SESSION_STATE_ERROR, 'Ошибка старта процесса: '||lErrorMessage);
    if lSession.Job_ID is null then
      Fdc_Util.Abort('Ошибка старта процесса: '||lErrorMessage, 0, -20204);
    end if;
  end if;
  commit;
end;

--------------------------------------------------------------------------
-- Завершение процесса в FDC_Session
-- Возможные статусы -
-- SESSION_STATE_SUCCESS,
-- SESSION_STATE_ERROR (при этом должен быть передан Message)
-- SESSION_STATE_HUNG
-- SESSION_STATE_SUCCESS и SESSION_STATE_ERROR проставляются реализующей процесс процедурой
-- SESSION_STATE_HUNG может проставляться только вручную из приложения,
-- а также автоматически процессом диспетчера
-- при обнаружении "дохлого" job-а
procedure Session_Finalize(pSession_ID number,
                           pState_SysName varchar2 :=  SESSION_STATE_SUCCESS,
                           pMessage varchar2 := null) is
PRAGMA AUTONOMOUS_TRANSACTION;
------------------------------------
lSession TSession;
l_Job number;
lMessage varchar2(2000);
begin
  if pState_SysName not in (SESSION_STATE_SUCCESS, SESSION_STATE_ERROR, SESSION_STATE_HUNG) then
    Fdc_Util.Abort('Неверный статус для закрытия сессии: '||pState_SysName, 0, -20177);
  end if;
  if pMessage is not null then
    lMessage := substr(pMessage, 1, 1500);
  else
    if pState_SysName = SESSION_STATE_ERROR then
      lMessage := 'Текст ошибки отсутствует';
    end if;
  end if;
  lSession := Session_GetByID(pSession_ID, true);
  fdc_Session_Upd_Finish(pSession_ID, pState_SysName, lMessage);
  if pState_SysName = SESSION_STATE_SUCCESS and
     lSession.Initial_Session_Id is not null then
    fdc_Session_Upd_Close(lSession.Initial_Session_Id, pSession_ID);
  end if;
  if lSession.job_ID is not null then
    begin
      select job
      into l_Job
      from user_jobs
      where job = lSession.job_ID;
      dbms_job.remove(lSession.job_ID);
    exception
      when others then
        null;
    end;
  end if;
  lSession := Session_GetByID(pSession_ID, true);
  commit;
end;

--------------------------------------------------------------------------
-- Сигнал от процесса, что он жив.
-- Вызывается на каждом (по возможности) шаге процесса
-- Механика сохранения этой информации где-либо и ее использования
-- должна быть проработана дополнительно.
-- Пока проверяется только наличие и статус процесса.
-- Но вызовы уже сейчас вшиваются во все обрабатывающие процедуры
procedure Session_Message(pSession_ID number) is
------------------------------------
lSession TSession;
begin
  lSession := Session_GetByID(pSession_ID);
  if lSession.State_SysName <> SESSION_STATE_PROGRESS then
    lSession := Session_GetByID(pSession_ID, true);
    if lSession.State_SysName <> SESSION_STATE_PROGRESS then
      Fdc_Util.Abort('Неверное состояние процесса: '||lSession.State_Name, 0, -20178);
    end if;
  end if;
end;

--------------------------------------------------------------------------
-- Самый главный, самый умный диспетчер
procedure Dispatch is
------------------------------------
lSession_Slots number;
lActive_Sessions number;
lSession_Priority number := 1;
begin
  gDispatch_Session_ID := fdc_session_add(SESSION_TYPE_DISPATCH, null, null);
  gDispatch_Message.delete;
  gDispatch_Error := false;
  Restricted_Initial_Session.delete;
  begin
    fdc_session_upd_Start(gDispatch_Session_ID);
    commit;
    select count(State_ID)
    into lActive_Sessions
    from fdc_Session_Lst
    where State_SysName = SESSION_STATE_PROGRESS and
          TypeSysName <> SESSION_TYPE_DISPATCH;
    lSession_Slots := MAXSESSIONS_VAL - lActive_Sessions;

    while lSession_Slots > 0 and lSession_Priority <= AUTO_SESSIONS_COUNT loop
      Session_Init_By_Type(Session_Type_By_Priority(lSession_Priority),
                            lSession_Slots);
      lSession_Priority := lSession_Priority + 1;
    end loop;
    if gDispatch_Error then
      fdc_session_upd_Finish(gDispatch_Session_ID, SESSION_STATE_ERROR, Dispatch_Message_Get);
    else
      fdc_session_upd_Finish(gDispatch_Session_ID, SESSION_STATE_SUCCESS, Dispatch_Message_Get);
    end if;
    commit;
  exception
    when others then
      rollback;
      Dispatch_Message_Add(sqlerrm);
      fdc_session_upd_Finish(gDispatch_Session_ID, SESSION_STATE_ERROR, Dispatch_Message_Get);
      commit;
      Fdc_Util.Abort('Ошибка процедуры диспетчера:', 1, -20001);
  end;
end;

--------------------------------------------------------------------------
-- Процедура, вызываемая супердемоном (регламентным Job-ом)
-- При наличии условий (время подошло) и отсутствии ограничений
-- (системная константа Dispatch.DispatchIsActive = 0)
-- запускает диспетчер
procedure Main is
lDispatchIsActive boolean;
lDispatchInterval number;
lLastTime date;
begin
  lDispatchIsActive := (fdc_ValueBool_Sys_Get('Dispatch.DispatchIsActive') = 1);
  lDispatchInterval := fdc_ValueNumber_Sys_Get('Dispatch.DispatchInterval')/24/60;
  if lDispatchIsActive then
    if (not ActiveSessionExists(SESSION_TYPE_DISPATCH)) then
      lLastTime := Last_Successful_Time(SESSION_TYPE_DISPATCH);
      if lLastTime is null or sysdate - lLastTime >= lDispatchInterval then
        Dispatch;
      end if; -- lLastTime is null or sysdate - lLastTime >= lDispatchInterval_val
    end if; -- (not ActiveSessionExists(SESSION_TYPE_DISPATCH))
  end if; -- trim(lDispatchIsActive) = 1
end;
------------------------------------

--------------------------------------------------------------------------
-- Dummy-процедура - заглушка для вызова по неизвестным
-- или неотлаженным процедурам, реализующим какой-либо тип процесса
procedure Start_Dummy (pSession_ID number) is
lSession fdc_Session_Lst%rowtype;
lLocal_ID number := null;
lGTDYear number := null;
begin
  if pSession_ID is null then
    return;
  end if;
  select *
  into lSession
  from fdc_Session_Lst
  where ID = pSession_ID;
  Session_Start(pSession_ID, lLocal_ID);
  Session_Finalize(pSession_ID);
end;

--------------------------------------------------------------------------
--                       Управление диспетчером                         --
--------------------------------------------------------------------------
-- Включен ли диспетчер?
-- Если включен, возвращает 1,
-- если нет - 0
function Dispatcher_IsActive return number is
begin
  return fdc_ValueBool_Sys_Get('Dispatch.DispatchIsActive');
end;

--------------------------------------------------------------------------
-- Включить диспетчер
procedure Dispatcher_Start is
begin
  fdc_ValueBool_Sys_set('Dispatch.DispatchIsActive', 1);
end;

--------------------------------------------------------------------------
-- Отключить (деактивировать) диспетчер
procedure Dispatcher_Stop is
begin
  fdc_ValueBool_Sys_set('Dispatch.DispatchIsActive', 0);
end;
--------------------------------------------------------------------------
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Package Initialization

begin
  InitVariables;
end;
/
