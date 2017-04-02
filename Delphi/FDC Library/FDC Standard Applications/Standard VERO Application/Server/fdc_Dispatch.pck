create or replace package fdc_Dispatch as
-- �����, ����������� ������ ���������� - ���������� ��������������� ���������� ���������� ��������� ������ 
-- ��� ���������� ���������� ������� ��������� �������� � �������� 
-- ������������ � ���� ������
-- ����� � ����, ��� ���������� ��������� ����������, 
-- �������� �������������, ������������� � ##

-- ������� ������� � �������������� ��������� ���������� � ����
-- ���?
-- 1. � ������������ ������:
--    ��������� - ���� ���������
--    ��������� AUTO_SESSIONS_COUNT
--    ������ Session_Type_By_Priority
-- 2. � ���� ������:
--    Session_Restrictions
--    Session_IsWaiting
--    Get_Closing_Session_Type
--    Check_Session_Create_Params
--    ProcBySessionType
--    Session_Conditions
--    Get_Init_Session
--    Session_Init_By_Type
-- ������ ��� ������� � ���� ������ 2 ���� ���������:
--  SESSION_TYPE_SAMPLE1 � SESSION_TYPE_SAMPLE2
-- ��� ���������� ���������� �� ���� ��������
--------------------------------------------------------------------------
--                       ����
--------------------------------------------------------------------------
subtype TSession is fdc_Session_Lst%rowtype;

--------------------------------------------------------------------------
--                       ���������
--------------------------------------------------------------------------
-----------------------
-- ���� ���������
-- ����� ������������ ��������� ����� ���� ����������� ����������� ����� ���������
SESSION_TYPE_MAIN               constant fdc_Object_Type_Lst.Sysname%type   := 'Session';
SESSION_TYPE_DISPATCH           constant fdc_Object_Type_Lst.Sysname%type   := 'SessionDispatch';

-- ���� ������ ��� ��������:
-- ������ ��������� ����������� �� ���������
SESSION_TYPE_GENNOTIFICATIONS   constant fdc_Object_Type_Lst.Sysname%type   := 'SessionGenNotifications';
-- ������ ��������� ����� ���������� ��������
SESSION_TYPE_SUBSCRIPTIONCHK    constant fdc_Object_Type_Lst.Sysname%type   := 'SessionSubscriptionCheck';

-- ## ��������� ���� ������ � ���������� �� ������ - ������ ��� �������!
-- ����� SESSION_TYPE_SAMPLE1 - ��� �������, ���������� �� ���������� (������ �����)
SESSION_TYPE_SAMPLE1            constant fdc_Object_Type_Lst.Sysname%type   := 'SessionSample1';
-- ����� SESSION_TYPE_SAMPLE2 - ��� �������, "�����������" SESSION_TYPE_SAMPLE1
SESSION_TYPE_SAMPLE2            constant fdc_Object_Type_Lst.Sysname%type   := 'SessionSample2';
-----------------------

-- ��������� ���������
SESSION_STATE_SUCCESS    constant fdc_Object.Sysname%type   := 'SessionStateSuccess';
SESSION_STATE_ERROR      constant fdc_Object.Sysname%type   := 'SessionStateError';
SESSION_STATE_PROGRESS   constant fdc_Object.Sysname%type   := 'SessionStateProgress';
SESSION_STATE_HUNG       constant fdc_Object.Sysname%type   := 'SessionStateHung';
SESSION_STATE_CREATED    constant fdc_Object.Sysname%type   := 'SessionStateCreated';

-- �������� ���������
SESSION_TRANSIT_CREATE     constant fdc_Object.Sysname%type := 'SessionTransitCreate';
SESSION_TRANSIT_START      constant fdc_Object.Sysname%type := 'SessionTransitStart';
SESSION_TRANSIT_FINISH     constant fdc_Object.Sysname%type := 'SessionTransitFinish';
SESSION_TRANSIT_ERROR      constant fdc_Object.Sysname%type := 'SessionTransitError';
SESSION_TRANSIT_CHECKHUNG  constant fdc_Object.Sysname%type := 'SessionTransitCheckHung';

-- ��������� ���������
MAXSESSIONS_SN               constant fdc_Object.Sysname%type := 'Dispatch.MaxSessions';
MAX_UNSUCCESSFUL_ATTEMPTS_SN constant fdc_Object.Sysname%type := 'Dispatch.MaxErrorsStartingSession';

-- ���������� ��������� ����������
-- ����������� � initialization-������ ������
MAXSESSIONS_VAL               number;  -- ���������� ������������ ���������� ���������
MAX_UNSUCCESSFUL_ATTEMPTS_VAL number;  -- ������������ ���������� ������� �������
                                       -- ��� ��������� ���������� ���������
                                       -- ����
                                       -- ������������ ���������� ��������� ������� ������� � Job-�,
                                       -- ����� �������� job ��������� "�����������"
DISPATCH_ERROR_INTERVAL       number := 1;  -- �������������, � ������� ��������� ����������� � ������
                                       -- ������������� ������


-- �������������� ������������� ����������� ���������
-- ## ����� �������� ������� �������� ������� ��� ������� ������������ ����� ���������
-- ��� ���������� ���� ������ ���� ����������� �����
AUTO_SESSIONS_COUNT      constant number                 := 2;
type TSession_Priority is varray (2)
                          of fdc_Session_Lst.Sysname%type;
Session_Type_By_Priority constant TSession_Priority := TSession_Priority (
    SESSION_TYPE_SUBSCRIPTIONCHK,
    SESSION_TYPE_GENNOTIFICATIONS);

-- ���� ���������
type TSessionType is record
  (ID fdc_Object_Type_Lst.ID%type,
   Name fdc_Object_Type_Lst.Name%type);
type TSessionTypeLst is table of TSessionType index by fdc_Object_Type_Lst.SysName%type;
SessionTypeLst TSessionTypeLst;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       ���������
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       ��������
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- �������� �������� � FDC_SESSION
-- ������������ ��� ������� �������� �� ��������� �����
-- � ����� �����������
function Session_Create(pSession_Type_SysName varchar2,
                        pInitial_Session_ID number := null,
                        pRaiseOnRestriction boolean := true)
return number;


--------------------------------------------------------------------------
-- ��������� ��� �������� ��������� "� �������� ������" - SESSION_STATE_PROGRESS
-- ��� ���� ����� ������������� ID ���������� �������� (������)
-- ��� ��� ����� ���������, ��� ������� ���� ����
-- ���� Local_ID = null,
-- ������������� ID ������ ��������: Local_ID := pSession_ID
procedure Session_Start(pSession_ID number,
                        pLocal_ID number := null);

--------------------------------------------------------------------------
-- ���������� �������� � FDC_Session
-- ��������� ������� -
-- SESSION_STATE_SUCCESS,
-- SESSION_STATE_ERROR (��� ���� ������ ���� ������� Message)
-- SESSION_STATE_HUNG
-- SESSION_STATE_SUCCESS � SESSION_STATE_ERROR ������������� ����������� ������� ����������
-- SESSION_STATE_HUNG ����� ������������� ������ ������� �� ����������,
-- � ����� ������������� ��������� ����������
-- ��� ����������� "�������" job-�
procedure Session_Finalize(pSession_ID number,
                           pState_SysName varchar2 :=  SESSION_STATE_SUCCESS,
                           pMessage varchar2 := null);


--------------------------------------------------------------------------
-- ������ �� ��������, ��� �� ���.
-- ���������� �� ������ (�� �����������) ���� ��������
-- �������� ���������� ���� ���������� ���-���� � �� �������������
-- ������ ���� ����������� �������������.
-- ���� ����������� ������ ������� � ������ ��������.
-- �� ������ ��� ������ ��������� �� ��� �������������� ���������
procedure Session_Message(pSession_ID number);

--------------------------------------------------------------------------
-- ����� �������, ����� ����� ���������
procedure Dispatch;


--------------------------------------------------------------------------
-- ���������, ���������� ������������ (������������ Job-��)
-- ��� ������� ������� (����� �������) � ���������� �����������
-- (��������� ��������� Dispatch.DispatchIsActive = 0)
-- ��������� ���������
procedure Main;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       ���������
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- ��������� �������� �� ID
-- ���� ���������� ������� ������������� ������������� � gSession
-- ������������ gSession,
-- ���� ��� - gSession ����������� �� �� � ������������
function Session_GetByID(pSession_ID number,
                         pForceRefresh boolean := false)
return TSession;

--------------------------------------------------------------------------
-- ���������, ������������� �� ����������� ������� - ���������
-- ���������� 1 ���� ��������� ��� 0 ���� ���
function Session_IsWaiting (pSession_ID number)
return number;

--------------------------------------------------------------------------
-- ���������, ���� ��
-- (���� �� � ���������� SESSION_STATE_CREATED, SESSION_STATE_PROGRESS)
-- ������� ��������� ���� (��� �������� ����)
-- ���� �������, ���������� 1,
-- ���� �� ������� - 0
function ActiveSessionExistsNum (pSession_Type_SysName varchar2)
return number;

--------------------------------------------------------------------------
-- ��������� ��������������� �������
-- ���� �� �������� ��� ��������� ���������
-- ��������������, �������� �� ������� �� ������
-- ���� ��������, ���������� 1
-- ���� ��� - 0
function System_Consistent_State_Num
return number;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       ������� ������
--------------------------------------------------------------------------
--------------------------------------------------------------------------
/*
-- ������ ���������, ����������� ��� ��������
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
������ ������� ����� ���������

declare lSession_ID number;
begin
  lSession_ID := fdc_Dispatch.Session_Create(fdc_Dispatch.SESSION_TYPE_SAMPLE);
  Session_Type_Proc(lSession_ID);
end;
*/

--------------------------------------------------------------------------
-- Dummy-��������� - �������� ��� ������ �� �����������
-- ��� ������������ ����������, ����������� �����-���� ��� ��������
procedure Start_Dummy (pSession_ID number);


--------------------------------------------------------------------------
--                       ���������� �����������                         --
--------------------------------------------------------------------------
-- ������� �� ���������?
-- ���� �������, ���������� 1,
-- ���� ��� - 0
function Dispatcher_IsActive return number;

--------------------------------------------------------------------------
-- �������� ���������
procedure Dispatcher_Start;

--------------------------------------------------------------------------
-- ��������� (��������������) ���������
procedure Dispatcher_Stop;



end;
/
create or replace package body fdc_Dispatch as
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       ����������
--------------------------------------------------------------------------
--------------------------------------------------------------------------
gSession TSession;
gDispatch_Session_ID number;
gDispatch_Error boolean;

type TDispatch_Message is table of varchar2(1500);
gDispatch_Message TDispatch_Message := TDispatch_Message();

-- ��������� ��� �������� ���������������� ������,
-- ������� � ������ ������ ������ ���������� �� ����� ���� ������� ��-�� �����������
-- ������ ����� ��� �������� ��������� ������ �� ��� �� �������������
type TRestricted_Initial_Session is table of number index by binary_integer;
Restricted_Initial_Session TRestricted_Initial_Session;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                       ���������
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Private
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- ������������� ����������
-- � ��������� �������� � ������ �������� ����������
procedure InitVariables is
begin
  -- ��������� ����������
  MAXSESSIONS_VAL :=fdc_valuenumber_sys_get(MAXSESSIONS_SN);
  MAX_UNSUCCESSFUL_ATTEMPTS_VAL := fdc_valuenumber_sys_get(MAX_UNSUCCESSFUL_ATTEMPTS_SN);

  -- ��������������� ������ ����� ���������
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
-- ��������� �������� �� ID
-- ���� ���������� ������� ������������� ������������� � gSession
-- ������������ gSession,
-- ���� ��� - gSession ����������� �� �� � ������������
function Session_GetByID(pSession_ID number,
                         pForceRefresh boolean := false)
return TSession is
------------------------------------
begin
  if pSession_ID is null then
    Fdc_Util.Abort('������ �������� ��������� ID ��������', 0, -20030);
  end if;
  if gSession.ID is null or gSession.ID <> pSession_ID or pForceRefresh then
    begin
      select *
      into gSession
      from fdc_Session_Lst
      where ID = pSession_ID;
    exception
      when no_data_found then
        Fdc_Util.Abort('�� ������ ������� ID = '||pSession_ID, 0, -20128);
    end;
  end if;
  return gSession;
end;

--------------------------------------------------------------------------
-- ��������� ��������� ������ ����������
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
-- �������� ������ ��������� ������ ����������
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
-- ���������, "���" �� �������
-- ���� ��, ���������� true,
-- ����� - �������� ������� ��� ��������,
-- ��� ������������� ������� job
-- � ���������� false
function Session_Alive (pSession in out nocopy TSession)
return boolean is
------------------------------------
lJob user_Jobs%rowtype;
lError varchar2(2000) := '������ �������� ��� ��������. ID=';
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
          lMessage := '����������� ';
        end if;
        lMessage := lMessage ||'Job ������. ���������� ������� ������� - '||lJob.Failures;
      end if;
    exception
      when no_data_found then
        l_Session_Dead := true;
      when others then
        Fdc_Util.Abort('������ �� �������� ��������� ��������: ', 1, -20218);
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
-- ���������, ���� ��
-- (���� �� � ���������� SESSION_STATE_CREATED, SESSION_STATE_PROGRESS)
-- ������� ��������� ���� 
-- ���� �������, ���������� True,
-- ���� �� ������� - false
function ActiveSessionExists (pSession_Type_SysName varchar2)
return boolean is
------------------------------------
begin
  if pSession_Type_SysName is null then
    Fdc_Util.Abort('������ ��� �������� ��� ������', 0, -20082);
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

-- Wrapper ��� ��� - ���������� �������� ��������
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
-- ���������, �� ����������� ��������
-- �� ������ �� ��� �������� ������
-- ���� ������, ����������� �� � End_Session � ���������� true, ��� - false
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
-- ���������, �� ����������� ��������
-- �� �������� �� ������ ����������� �������?
-- ���� ��������, ���������� true, ��� - false
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
-- ���������, ������������� �� ����������� ������� - ���������
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
-- ���������, ������������� �� ����������� ������� - ���������
-- overload ���������� �������
-- ��� ������ �������
-- ���������� 1 ���� ��������� ��� 0 ���� ���
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
-- ���������, ���� �� �����������, �� ���������� �������
-- ��������� ���� 
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
    Fdc_Util.Abort('������ ��� �������� ��� ������', 0, -20090);
  end if;
  open Session_Waiting_Cur(pSession_Type_SysName);
    begin
    fetch Session_Waiting_Cur into lSession;
    while Session_Waiting_Cur%found loop
      -- ��������, ������������� �� ��� ��������� �������
      -- � �� ���� �� ��� �� ���� ���������� �����������
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
      Fdc_Util.Abort('������ �������� ��������� ���������: ', 1, -20189);
  end;
  return lResult;
end;

--------------------------------------------------------------------------
-- ��������� ��������������� �������
-- ���� �� �������� ��� ��������� ���������
-- ��������������, �������� �� ������� �� ������
-- ���� ��������, ���������� true
-- ���� ��� - false
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

-- wrapper ��� ���
-- ���� ��������, ���������� 1
-- ���� ��� - 0
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
-- �������� �������������� ������� �� �������� ��������
-- ���� ���� ����������� - true
-- ���� ��� � ������� - ���������� false
function Session_Restrictions(pSession_Type_SysName varchar2,
                              pRestriction out varchar2)
return boolean is
------------------------------------
lResult boolean := false;
lError varchar2(2000);
lRestriction_Text varchar2(2000) := null;
lSampleRestriction1 varchar2(2000) := '��� ���� ����� �������!';
lSampleRestriction2 varchar2(2000) := '���� �������, ����������� ���������� ���������� �����';
lSampleRestriction3 varchar2(2000) := '��� �� ������ ���������� �������';
lSampleRestriction4 varchar2(2000) := '���� �������, ������������� � ����';
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
    Fdc_Util.Abort('�������� ��� ��������: '||pSession_Type_SysName, 0, -20215);
  end case;
  if lRestriction_Text is not null then
    lResult := true;
    pRestriction := lRestriction_Text;
    lError := '����������� �� ������ �������� ' || SessionTypeLst(pSession_Type_SysName).Name;
    lError := lError ||': '||lRestriction_Text;
    Dispatch_Message_Add(lError);
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- ��������� ���� ������������ �������� �� ���������
-- ���� �������� 
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
-- �������� ������������ ���������� ��� ������� �������� ��������
-- �� ��������� Session_Create
procedure Check_Session_Create_Params
                       (pSession_Type_SysName varchar2,
                        pInitial_Session_ID number) is
------------------------------------
lInitial_Session TSession;
begin
  -- �������� ���� ��������
  if pSession_Type_SysName not in (SESSION_TYPE_GENNOTIFICATIONS, SESSION_TYPE_SUBSCRIPTIONCHK, 
                                   SESSION_TYPE_SAMPLE1, SESSION_TYPE_SAMPLE2) then
    rollback;
    Fdc_Util.Abort('�������� ��� ��������: '||pSession_Type_SysName, 0, -20593);
  end if;
  if (pSession_Type_SysName in (SESSION_TYPE_GENNOTIFICATIONS, SESSION_TYPE_SUBSCRIPTIONCHK, SESSION_TYPE_SAMPLE1) 
      and pInitial_Session_ID is not null) or
     (pSession_Type_SysName = SESSION_TYPE_SAMPLE2 and pInitial_Session_ID is null) then
    Fdc_Util.Abort('������� ����� �������� ����������������� ��������', 0, -20615);
  end if;   
  if pInitial_Session_ID is not null then
    lInitial_Session := Session_GetByID(pInitial_Session_ID, true);
    if lInitial_Session.State_SysName <> SESSION_STATE_SUCCESS then
      Fdc_Util.Abort('���������������� ������� ��� ����������� ������ �� ��� �������� �������!', 0, -20615);
    end if;
    if not (pSession_Type_SysName = Get_Closing_Session_Type(lInitial_Session.TypeSysName)) then
      Fdc_Util.Abort('�������� ��� ��� ��������� ����������������� ��������', 0, -20622);
    end if;
    if lInitial_Session.End_Session_ID <> 0 then
      Fdc_Util.Abort('���������������� ������� ��� ������ ��������� ID='||lInitial_Session.End_Session_ID, 0, -20625);
    end if;
  end if;
end;

--------------------------------------------------------------------------
-- �������� ������ ���������� ��������� �������
-- �������� ��������� ����
-- ������������ ��� ����� ���������,
-- ���������� �� ����������
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
-- �������� ���������� ��������� ��������� �������
-- � ������� �������� ��������� ����
-- (�� ��������� ����������������� ��������)
-- ���������� �������� ������������� ���������� ��������� �������
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
    pError_Message := '��������� ������������ ���������� ������� ������� �������� ';
    pError_Message := pError_Message || SessionTypeLst(pSession_Type_SysName).Name;
    if pInitial_Session_ID is not null then
      pError_Message := pError_Message || ' �� ����������������� �������� ID = '||pInitial_Session_ID;
    end if;
    pError_Message := pError_Message || chr(10) || '���������� ������ ��������� �������� ��� �������������� ������� ������ �������!';
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
-- �������� ��� ����������� ��������� �� ���� ��������
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
      Fdc_Util.Abort('�������� ��� �������� ��� ��������������� �������: '|| pSession_Type_SysName, 0, -20649);
  end case;
  return lProcName;
end;
--------------------------------------------------------------------------
-- ������ ��������������� ��� Job
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
  -- ����� ���������� ������� ������ � ������
  l_Refreshed_Session := Session_GetByID(pSession_ID, true);
  commit;
end;

--------------------------------------------------------------------------
-- �������� ������� ������� ��� ������� ���������,
-- ���������� ��� �����������������
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
-- ���� � ���������� ������ �� ��������� ���������������� ���������
-- ��� ��������� ���� ��������
-- ���� ������ �� ������� - ���������� null
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
      Fdc_Util.Abort('�������� ��� ��� ��������� ����������������� ��������: '|| pSession_Type_SysName, 0, -20725);
  end case;
  if lSession.ID is not null then
    lSession := Session_Getbyid(lSession.ID);
  end if;
  return lSession;
end;
--------------------------------------------------------------------------
-- �������� ������� ������� � ������ ���������
-- ����������
-- 0 - ��� ������� ������� ��������
-- 1 - ��� ����������� �� ������
-- 2 - ��� ���������� ������������� ���������� ������
function Session_Init_Process(pSession_Type_SysName varchar2,
                               pInitial_Session TSession,
                               p_Session_Slots in out number)
                               return number is
------------------------------------
lSession_ID fdc_Session.ID%type;
lResult number := 0;
begin
  if Unsuccessful_Attempts(pSession_Type_SysName, pInitial_Session.ID) then
    -- ���� ��������� ���������� ��������� ��������� - ���������� ���������
    p_Session_Slots := 0;
    lResult := 2;
    gDispatch_Error := true;
  else
    lSession_ID := Session_Create(pSession_Type_SysName, pInitial_Session.ID, false);
    if lSession_ID is not null then
      -- ������ ���������, ����������� ���
      p_Session_Slots := p_Session_Slots - 1;
      Session_JobStart(pSession_Type_SysName, lSession_ID);
    else
      -- ��������� ����������� - ��������� ���������,
      lResult := 1;
    end if;
  end if;
  return lResult;
end;

--------------------------------------------------------------------------
-- Wrapper ��� ��� ��
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
-- ������ ��������� �� �������� � ����������� �� ����
procedure Session_Init_By_Type(pSession_Type_SysName varchar2,
                            p_Session_Slots in out number) is
------------------------------------
lInitial_Session TSession;
lInit_Process_Result number;
begin
  if pSession_Type_SysName in (SESSION_TYPE_GENNOTIFICATIONS, SESSION_TYPE_SUBSCRIPTIONCHK, SESSION_TYPE_SAMPLE1) then
    -- ��������, ���������� ��� �����������������
    if Session_Conditions(pSession_Type_SysName) then
      Session_Init_Process(pSession_Type_SysName, null, p_Session_Slots);
    end if;
  elsif pSession_Type_SysName in (SESSION_TYPE_SAMPLE2) then
  -- � ���������������� ���������
    -- ����� ���� �� �������� ������ ����� ��� ���� ��������
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
-- �������� �������� � FDC_SESSION
-- ������������ ��� ������� �������� �� ��������� �����
-- � ����� �����������
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

  -- �������� ������� ���������� �� ������������
  begin
    Check_Session_Create_Params (pSession_Type_SysName,
                                 pInitial_Session_ID);
  exception
    when others then
      Fdc_Util.Abort('������ �������� ��������. ', 1, -20136);
  end;

  lAnyRestrictions := Session_Restrictions(pSession_Type_SysName, lRestrictionStr);
  if not lAnyRestrictions then
  -- ���������� �������� ��������
    lSession_ID := fdc_Session_Add(pSession_Type_SysName, pInitial_Session_ID);
  else
    if pInitial_Session_ID is not null then
      Restricted_Initial_Session(pInitial_Session_ID) := 1;
    end if;
    if pRaiseOnRestriction then
      Fdc_Util.Abort('������ �� �������! ��������� ����������� �� �� �������� ('||lRestrictionStr||')', 0, -20936);
    end if;
  end if;
  commit;
  RETURN lSession_ID;
end;

--------------------------------------------------------------------------
-- ��������� ��� �������� ��������� "� �������� ������" - SESSION_STATE_PROGRESS
-- ��� ���� ����� ������������� ID ���������� �������� (������)
-- ��� ��� ����� ���������, ��� ������� ���� ����
-- ���� Local_ID = null (������ ��� �������� ����� ���������
--                       � ��������� ������ - ����),
-- ������������� ID ������ ��������: Local_ID := pSession_ID
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
    -- � ���������� � ������!
    lSession := Session_GetByID(pSession_ID, true);
  exception
    when others then
      lErrorMessage := sqlerrm;
  end;
  if lErrorMessage is not null then
    Session_Finalize(pSession_ID, SESSION_STATE_ERROR, '������ ������ ��������: '||lErrorMessage);
    if lSession.Job_ID is null then
      Fdc_Util.Abort('������ ������ ��������: '||lErrorMessage, 0, -20204);
    end if;
  end if;
  commit;
end;

--------------------------------------------------------------------------
-- ���������� �������� � FDC_Session
-- ��������� ������� -
-- SESSION_STATE_SUCCESS,
-- SESSION_STATE_ERROR (��� ���� ������ ���� ������� Message)
-- SESSION_STATE_HUNG
-- SESSION_STATE_SUCCESS � SESSION_STATE_ERROR ������������� ����������� ������� ����������
-- SESSION_STATE_HUNG ����� ������������� ������ ������� �� ����������,
-- � ����� ������������� ��������� ����������
-- ��� ����������� "�������" job-�
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
    Fdc_Util.Abort('�������� ������ ��� �������� ������: '||pState_SysName, 0, -20177);
  end if;
  if pMessage is not null then
    lMessage := substr(pMessage, 1, 1500);
  else
    if pState_SysName = SESSION_STATE_ERROR then
      lMessage := '����� ������ �����������';
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
-- ������ �� ��������, ��� �� ���.
-- ���������� �� ������ (�� �����������) ���� ��������
-- �������� ���������� ���� ���������� ���-���� � �� �������������
-- ������ ���� ����������� �������������.
-- ���� ����������� ������ ������� � ������ ��������.
-- �� ������ ��� ������ ��������� �� ��� �������������� ���������
procedure Session_Message(pSession_ID number) is
------------------------------------
lSession TSession;
begin
  lSession := Session_GetByID(pSession_ID);
  if lSession.State_SysName <> SESSION_STATE_PROGRESS then
    lSession := Session_GetByID(pSession_ID, true);
    if lSession.State_SysName <> SESSION_STATE_PROGRESS then
      Fdc_Util.Abort('�������� ��������� ��������: '||lSession.State_Name, 0, -20178);
    end if;
  end if;
end;

--------------------------------------------------------------------------
-- ����� �������, ����� ����� ���������
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
      Fdc_Util.Abort('������ ��������� ����������:', 1, -20001);
  end;
end;

--------------------------------------------------------------------------
-- ���������, ���������� ������������ (������������ Job-��)
-- ��� ������� ������� (����� �������) � ���������� �����������
-- (��������� ��������� Dispatch.DispatchIsActive = 0)
-- ��������� ���������
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
-- Dummy-��������� - �������� ��� ������ �� �����������
-- ��� ������������ ����������, ����������� �����-���� ��� ��������
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
--                       ���������� �����������                         --
--------------------------------------------------------------------------
-- ������� �� ���������?
-- ���� �������, ���������� 1,
-- ���� ��� - 0
function Dispatcher_IsActive return number is
begin
  return fdc_ValueBool_Sys_Get('Dispatch.DispatchIsActive');
end;

--------------------------------------------------------------------------
-- �������� ���������
procedure Dispatcher_Start is
begin
  fdc_ValueBool_Sys_set('Dispatch.DispatchIsActive', 1);
end;

--------------------------------------------------------------------------
-- ��������� (��������������) ���������
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
