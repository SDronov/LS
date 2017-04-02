{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcLogger.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcLogger;

{
  Библиотека классов, реализующая протоколирование произвольных событий
  программы.
}

interface

uses
  Windows, Classes;

type
  { ID события - целое число. Генерируется автоматичеки (последовательно,
    начиная с ID = 1), т.е. это счеткик, при каждом старте программы сбрасывается }
  TLogEventID = Cardinal;

  { Типы событий, которые могут протоколироваться }
  TLogEventType = (etDebug, etInformation, etWarning, etError);
  TLogEventsSet = set of TLogEventType;

const
  CAllLogEvents: TLogEventsSet = [etDebug, etInformation, etWarning, etError];

type

  { TLogEvent class }
  { Класс описывает системное событие, подлежащее регистрации в журнале.
    Обычно не используется непосредственно, так как для генерирования журналируемых
    событий используется класс TfdcEventSource }

  TfdcLogEvent = class
  private
    FEventType: TLogEventType;
    FTimeStamp: TDateTime;
    FTickCount: DWORD;
    FID: TLogEventID;
    FCorrelatedEventID: TLogEventID;
    FMessageText: string;
  protected
    { Функция возвращает "текстовое" представление события - в том виде, как оно
      попадает в журнал событий }
    function GetEventLogText: string; virtual;
  public
    { CorrelatedEventID - ID события, с которым [логически] связано
        создаваемое  событие.
      Значение по умолчанию ATimeStamp = 0 заменяется на системное время }
    constructor Create(const AMessageText: string; ACorrelatedEventID:
      TLogEventID = 0;
      AEventType: TLogEventType = etInformation;
      ATimeStamp: TDateTime = 0);
    constructor CreateCopy(const ASource: TfdcLogEvent);
    destructor Destroy; override;
    property EventType: TLogEventType read FEventType;
    property TimeStamp: TDateTime read FTimeStamp;
    property TickCount: DWORD read FTickCount;
    property ID: TLogEventID read FID;
    property CorrelatedEventID: TLogEventID read FCorrelatedEventID;
    property MessageText: string read FMessageText;
  end;

  TfdcCustomLog = class;

  { TfdcEventSource class }
  { Фабрика событий - вспомогательный класс, используемый для генерирования событий.
    Должен быть зарегистрирован в одном или более экземпляре журнала (класса, порожденного
    от TfdcCustomLog). При генерировании события извещает те журналы, в которых
    зарегистрирован о поступлении нового события. }


  TDestinationLogItem = class;
  TDestinationLogs = class;

  TfdcCustomEventSource = class(TComponent)
  private
    FLogs: TDestinationLogs;
    function GetLog(Index: Integer): TDestinationLogItem;
    procedure SetLogs(Value: TDestinationLogs);
  protected
    procedure RegisterLog(const AEventLog: TfdcCustomLog);
    procedure UnregisterLog(const AEventLog: TfdcCustomLog);
    procedure PutEventToLogs(const AEvent: TfdcLogEvent);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    { Значение по умолчанию ATimeStamp = 0 заменяется на системное время }
    function GenerateEvent(const AMessageText: string;
      ACorrelatedEventID: TLogEventID = 0;
      AEventType: TLogEventType = etInformation;
      ATimeStamp: TDateTime = 0): TLogEventID;

    property Logs: TDestinationLogs read FLogs write SetLogs;
    property Log[Index: Integer]: TDestinationLogItem read GetLog;
  end;

  TfdcEventSource = class(TfdcCustomEventSource)
  published
    {$WARN PRIVATE_PROPACCESSOR OFF}
    property Logs: TDestinationLogs read FLogs write SetLogs;
    {$WARN PRIVATE_PROPACCESSOR ON}
  end;

  { TfdcCustomLog abstract class }
  { Абстрактный класс - Журнал событий. Источники событий (экземпляры TfdcEventSource)
    должны быть зарегистрированы (RegisterEventSource) по крайней мере в одном из
    экземпляров классов, порожденных от TfdcCustomLog. }

  TfdcCustomLog = class(TComponent)
  private
    FLock: TRTLCriticalSection;
    FEventSources: TList;
    FEventTypes: TLogEventsSet;
    procedure SetEventTypes(AValue: TLogEventsSet);
  protected
    procedure Lock;
    procedure Unlock;
    property EventTypes: TLogEventsSet read FEventTypes write SetEventTypes;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RegisterEventSource(const AEventSource: TfdcCustomEventSource);
    procedure PutEvent(const AEvent: TfdcLogEvent); virtual; abstract;
  end;

  { TfdcConsoleLog class }
  { Класс реализует журнал, выводимый на консоль (текстовый режим Win32) }

  TfdcConsoleLog = class(TfdcCustomLog)
  public
    procedure PutEvent(const AEvent: TfdcLogEvent); override;
  published
    property EventTypes;
  end;

  { TfdcWinDebugLog class }
  { Класс использует вызов Win32 API OutputDebugString для вывода текста системному (Win32)
    отладчику. Может использоваться как средство "отладочной печати" в тех случаях,
    когда программу трудно либо невозможно отлаживать средствами Delphi - например,
    на удаленной машине, приложение работает как служба NT и т.п. Вывод TfdcWinDebugLog
    можно посмотреть, например, используя утилиту DebugView -
    http://www.sysinternals.com/ntw2k/freeware/debugview.shtml }

  TfdcWinDebugLog = class(TfdcCustomLog)
  public
    procedure PutEvent(const AEvent: TfdcLogEvent); override;
  published
    property EventTypes;
  end;

  { TfdcWinEventLog class }
  { Реализует журналирование событий в NT Application Log (системный журнал).
    Замечание - события типа etDebug не выводятся в системный журнал, поскольку он
    не предназначен для целей отладки. }

  TfdcWinEventLog = class(TfdcCustomLog)
  private
    FSourceName: string;
    FSystemEventLogHandle: THandle;
    procedure SetSourceName(AValue: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure PutEvent(const AEvent: TfdcLogEvent); override;
  published
    property EventTypes;
    property SourceName: string read FSourceName write SetSourceName;
  end;

  { TfdcFileLog class }
  { Файловый журнал. }

  TfdcFileLog = class(TfdcCustomLog)
  private
    FEvents: TList;
    FFileName: string;
    FControlBlockIndex: Integer;
    procedure SetFileName(AValue: String);
  protected
    property ControlBlockIndex: Integer read FControlBlockIndex write
      FControlBlockIndex;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure PutEvent(const AEvent: TfdcLogEvent); override;
  published
    property EventTypes;
    property FileName: string read FFileName write SetFileName;
  end;

  TDestinationLogItem = class(TCollectionItem)
  private
    FName: String;
    FLog: TfdcCustomLog;
  protected
    function GetDisplayName: string; override;
    procedure SetDisplayName(const Value: string); override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure RegisterEventSource(const AEventSource: TfdcCustomEventSource);
    procedure PutEvent(const AEvent: TfdcLogEvent);
  published
    property Name: string read GetDisplayName write SetDisplayName;
    property Log: TfdcCustomLog read FLog write FLog;
  end;

  TDestinationLogs = class(TCollection)
  private
    FEventSource: TfdcCustomEventSource;
    function GetActionItem(Index: Integer): TDestinationLogItem;
    procedure SetActionItem(Index: Integer; Value: TDestinationLogItem);
  protected
    function GetAttrCount: Integer; override;
    function GetAttr(Index: Integer): string; override;
    function GetItemAttr(Index, ItemIndex: Integer): string; override;
    function GetOwner: TPersistent; override;
  public
    constructor Create(AEventSource: TfdcCustomEventSource; AItemClass: TCollectionItemClass);
    function Add: TDestinationLogItem;
    property EventSource: TfdcCustomEventSource read FEventSource;
    property Items[Index: Integer]: TDestinationLogItem read GetActionItem
      write SetActionItem; default;
  end;

procedure ResetTickCount;
procedure Register;

implementation

//{$R *.DCR}

uses
  SysUtils, SyncObjs;

procedure Register;
begin
  RegisterComponents('FDC', [TfdcEventSource, TfdcConsoleLog, TfdcWinDebugLog,
    TfdcWinEventLog, TfdcFileLog]);
end;

var
  CEventID: Integer = 0;
  StartTickCount: DWORD = 0;

function GetNextEventID: Integer;
begin
  InterlockedIncrement(CEventID);
  Result := CEventID;
end;

procedure ResetTickCount;
begin
  StartTickCount := GetTickCount;
end;

{ TfdcLogEvent }

constructor TfdcLogEvent.Create(const AMessageText: string;
  ACorrelatedEventID: TLogEventID = 0;
  AEventType: TLogEventType = etInformation;
  ATimeStamp: TDateTime = 0);
begin
  inherited Create;
  FEventType := AEventType;
  if ATimeStamp = 0 then
    FTimeStamp := Now
  else
    FTimeStamp := ATimeStamp;
  FTickCount := GetTickCount - StartTickCount;
  FID := GetNextEventID;
  FCorrelatedEventID := ACorrelatedEventID;
  FMessageText := AMessageText;
end;

constructor TfdcLogEvent.CreateCopy(const ASource: TfdcLogEvent);
begin
  inherited Create;
  FEventType := ASource.FEventType;
  FTimeStamp := ASource.FTimeStamp;
  FID := ASource.FID;
  FCorrelatedEventID := ASource.FCorrelatedEventID;
  FMessageText := ASource.FMessageText;
end;

destructor TfdcLogEvent.Destroy;
begin
  inherited;
end;

function TfdcLogEvent.GetEventLogText: string;
begin
  Result := Format('%s %d %d %d %s', [FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ ',
    TimeStamp),
    TickCount, ID, CorrelatedEventID, MessageText]);
end;

{ TfdcEventSource }

constructor TfdcCustomEventSource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLogs := TDestinationLogs.Create(Self, TDestinationLogItem);
end;

destructor TfdcCustomEventSource.Destroy;
begin
  FLogs.Free;
  inherited Destroy;
end;

function TfdcCustomEventSource.GenerateEvent(const AMessageText: string;
  ACorrelatedEventID: TLogEventID; AEventType: TLogEventType;
  ATimeStamp: TDateTime): TLogEventID;
var
  FNewEvent: TfdcLogEvent;
begin
  FNewEvent := TfdcLogEvent.Create(AMessageText, ACorrelatedEventID, AEventType,
    ATimeStamp);
  try
    PutEventToLogs(FNewEvent);
    Result := FNewEvent.ID;
  finally
    FNewEvent.Free;
  end;
end;

function TfdcCustomEventSource.GetLog(Index: Integer): TDestinationLogItem;
begin
  Result := FLogs[Index];
end;

procedure TfdcCustomEventSource.SetLogs(Value: TDestinationLogs);
begin
  FLogs.Assign(Value);
end;

procedure TfdcCustomEventSource.PutEventToLogs(const AEvent: TfdcLogEvent);
var
  i: Integer;
begin
  for i := 0 to Logs.Count - 1 do
    Log[i].PutEvent(AEvent);
end;

procedure TfdcCustomEventSource.RegisterLog(const AEventLog: TfdcCustomLog);
var
  i: Integer;
  AlreadyRegistered: Boolean;
begin
  AlreadyRegistered := False;
  for i := 0 to Logs.Count - 1 do
    if Log[i].Log = AEventLog then
    begin
      AlreadyRegistered := True;
      Break;
    end;

  if not AlreadyRegistered then
    TDestinationLogItem.Create(Logs).Log := AEventLog;
end;

procedure TfdcCustomEventSource.UnregisterLog(const AEventLog: TfdcCustomLog);
var
  i: Integer;
begin
  for i := 0 to Logs.Count - 1 do
    if Log[i].Log = AEventLog then
    begin
      Logs.Delete(i);
      Break;
    end;
end;

{ TEventLog }

constructor TfdcCustomLog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitializeCriticalSection(FLock);
  FEventSources := TList.Create;
end;

destructor TfdcCustomLog.Destroy;
var
  i: Integer;
begin
  Lock;
  try
    if Assigned(FEventSources) then
      for i := 0 to FEventSources.Count - 1 do
        TfdcCustomEventSource(FEventSources[i]).UnregisterLog(Self);

    FEventSources.Free;
    inherited;
  finally
    Unlock;
    DeleteCriticalSection(FLock);
  end;
end;

procedure TfdcCustomLog.SetEventTypes(AValue: TLogEventsSet);
begin
  Lock;
  try
    if FEventTypes <> AValue then
      FEventTypes := AValue;
  finally
    Unlock;
  end;
end;

procedure TfdcCustomLog.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TfdcCustomLog.Unlock;
begin
  LeaveCriticalSection(FLock);
end;

procedure TfdcCustomLog.RegisterEventSource(const AEventSource: TfdcCustomEventSource);
begin
  Lock;
  try
    if FEventSources.IndexOf(AEventSource) = -1 then
    begin
      FEventSources.Add(AEventSource);
      AEventSource.RegisterLog(Self);
    end;
  finally
    Unlock;
  end;
end;

{ TConsoleEventLog }

{ TODO
var
  ConsoleLock: TRTLCriticalSection; }

procedure TfdcConsoleLog.PutEvent(const AEvent: TfdcLogEvent);
begin
  WriteLn(AEvent.GetEventLogText);
end;

{ PWinDebugEventLog }

procedure TfdcWinDebugLog.PutEvent(const AEvent: TfdcLogEvent);
begin
  OutputDebugString(PChar(AEvent.GetEventLogText));
end;

type
  TLogFileState = (lsUnknown, lsOpenPending, lsOpened, lsClosePending,
    lsClosed);

  TLogFileControlBlock = class
  private
    FLogFileState: TLogFileState;
    FFileName: string;
    FReferenceCounter: Integer;
    FOutputFile: Text;
  protected
    procedure AddReference;
    procedure ReleaseReference;
    procedure OpenLog;
    procedure CloseLog;
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;
    property LogFileState: TLogFileState read FLogFileState;
    property FileName: string read FFileName;
    procedure WriteString(const AString: string);
  end;

  TLogFilesWriter = class(TThread)
  private
    FLogFilesList: TThreadList;
    FLogsList: TThreadList;
  protected
    procedure CheckLogs;
    procedure RegisterLog(const ALog: TfdcFileLog);
    procedure UnregisterLog(const ALog: TfdcFileLog);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute; override;
  end;

var
  LogFilesWriterEvent: SyncObjs.TEvent;
  LogFilesWriter: TLogFilesWriter;

  { TFileEventLog }

constructor TfdcFileLog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEvents := TList.Create;
  FControlBlockIndex := -1;

  if not (csDesigning in ComponentState) then
  begin
    { создать signleton LogFilesWriterEvent если нужно }
    if (LogFilesWriterEvent = nil) and
       (not (csDesigning in ComponentState)) then
      LogFilesWriterEvent := TEvent.Create(nil, False, False, '');

    { создать signleton LogFilesWriter если нужно }
    if (LogFilesWriter = nil) and
       (not (csDesigning in ComponentState)) then
    begin
      LogFilesWriter := TLogFilesWriter.Create;
      LogFilesWriter.Resume;
    end;
  end;
end;

destructor TfdcFileLog.Destroy;
begin
  if not (csDesigning in ComponentState) then
  { can't happen in design-time - for sure we don't have
    neither pending events nor valid LogFilesWriter }
  begin
    { Сначала надо дождаться момента, когда все события будут записаны в журнал }
    while True do
    begin
      Lock;
      try
        if FEvents.Count > 0 then
        begin
          Sleep(10);
          Continue;
        end
        else
          Break;
      finally
        Unlock;
      end;
      Sleep(1);
    end; // while

    LogFilesWriter.UnregisterLog(Self);
  end;

  Lock;
  try
    FEvents.Free;
  finally
    Unlock;
  end;
  inherited; { TODO протестировать }
end;

procedure TfdcFileLog.SetFileName(AValue: String);
begin
  if not (csDesigning in ComponentState) then
  begin
    Lock;
    try
      if AnsiCompareText(FFileName, AValue) <> 0 then
      begin
        if (FFileName <> '') and (FControlBlockIndex <> -1) then
          LogFilesWriter.UnregisterLog(Self);
        FControlBlockIndex := -1;
        if Trim(AValue) <> '' then
        begin
          FFileName := Trim(AValue);
          LogFilesWriter.RegisterLog(Self);
        end;
      end;
    finally
      Unlock;
    end;
  end;
end;

procedure TfdcFileLog.Loaded;
begin
end;

procedure TfdcFileLog.PutEvent(const AEvent: TfdcLogEvent);
var
  FNewEvent: TfdcLogEvent;
begin
  FNewEvent := TfdcLogEvent.CreateCopy(AEvent);
  Lock;
  try
    FEvents.Add(FNewEvent);
  finally
    Unlock;
  end;
  LogFilesWriterEvent.SetEvent;
end;

{ TWinSysEventLog }

constructor TfdcWinEventLog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TfdcWinEventLog.Destroy;
begin
  if FSystemEventLogHandle <> 0 then
    Windows.DeregisterEventSource(FSystemEventLogHandle);
  inherited;
end;

procedure TfdcWinEventLog.SetSourceName(AValue: String);
begin
  if AnsiCompareText(FSourceName, AValue) <> 0 then
  begin
    if FSystemEventLogHandle <> 0 then
      Windows.DeregisterEventSource(FSystemEventLogHandle);
    if Trim(AValue) <> '' then
    begin
      FSourceName := AValue;
      FSystemEventLogHandle := Windows.RegisterEventSource(nil, PChar(FSourceName));
    end;
  end;
end;

procedure TfdcWinEventLog.PutEvent(const AEvent: TfdcLogEvent);
const
  CLogEventType2WinEventTypeMap: array[Low(TLogEventType)..High(TLogEventType)]
  of Word = ({etDebug}0,
    {etInformational}EVENTLOG_INFORMATION_TYPE,
    {etWarning}EVENTLOG_WARNING_TYPE,
    {etError}EVENTLOG_ERROR_TYPE);
var
  P: Pointer;
  S: string;
begin
  Lock;
  try
    S := AEvent.GetEventLogText;
    P := PChar(S);
    // В системный журнал не выводим отладочные сообщения (etDebug) - он для этого
    // не предназначен. Для отладки используйте другие типы журналов
    if CLogEventType2WinEventTypeMap[AEvent.EventType] <> 0 then
      Windows.ReportEvent(FSystemEventLogHandle,
        CLogEventType2WinEventTypeMap[AEvent.EventType], 0 {TODO}, AEvent.ID,
          nil,
        1, 0, @P, nil);
  finally
    Unlock;
  end;
end;

{ TLogFileControlBlock }

constructor TLogFileControlBlock.Create(const AFileName: string);
begin
  inherited Create;
  FFileName := AFileName;
  FLogFileState := lsOpenPending;
  AddReference;
end;

destructor TLogFileControlBlock.Destroy;
begin
  CloseLog;
  inherited;
end;

procedure TLogFileControlBlock.AddReference;
begin
  Inc(FReferenceCounter);
end;

procedure TLogFileControlBlock.ReleaseReference;
begin
  Dec(FReferenceCounter);
  if FReferenceCounter = 0 then
    {Free} CloseLog;
end;

procedure TLogFileControlBlock.OpenLog;
begin
  if FLogFileState in [lsOpened, lsClosePending] then
    Exit;

  AssignFile(FOutputFile, FFileName);
  if FileExists(FFileName) then
    Append(FOutputFile)
  else
    Rewrite(FOutputFile);
  FLogFileState := lsOpened;
end;

procedure TLogFileControlBlock.CloseLog;
begin
  if FLogFileState in [lsOpened, lsClosePending] then
  begin
    CloseFile(FOutputFile);
    FLogFileState := lsClosed;
  end;
end;

procedure TLogFileControlBlock.WriteString(const AString: string);
begin
  OpenLog;
  WriteLn(FOutputFile, AString);
  Flush(FOutputFile);
end;

{ TLogFilesWriter }

constructor TLogFilesWriter.Create;
begin
  inherited Create(True);
  FLogsList := TThreadList.Create;
  FLogFilesList := TThreadList.Create;
end;

destructor TLogFilesWriter.Destroy;
begin
  FLogsList.Free;
  { TODO закрывать все файлы }
  FLogFilesList.Free;
  LogFilesWriter := nil;
  inherited;
end;

procedure TLogFilesWriter.CheckLogs;
var
  i, j: Integer;
  AStringList: TStringList;
begin
  AStringList := TStringList.Create;
  try
    { Забираем накопившиеся сообщения из всех журналов в премежуточный
      TStringList - для того, чтобы не тормозить другие нити по возможности (вывод
      в файлы может быть относительно дорогой операцией, в особенности если делать
      Flush для каждой I/O операции) }
    with FLogsList.LockList do
    try
      for i := 0 to Count - 1 do
        with TfdcFileLog(Items[I]) do
        begin
          Lock;
          try
            for j := 0 to FEvents.Count - 1 do
              if ControlBlockIndex >= 0 then
              begin
                AStringList.AddObject(TfdcLogEvent(FEvents[j]).GetEventLogText,
                  TObject(ControlBlockIndex));
                TfdcLogEvent(FEvents[j]).Free;
              end;
            FEvents.Clear;
          finally
            Unlock;
          end;
        end;
    finally
      FLogsList.UnlockList;
    end;

    { Теперь все что забрали на предыдущем шаге - разбрасываем по
      соответствующим выходным файлам }
    with FLogFilesList.LockList do
    try
      for I := 0 to AStringList.Count - 1 do
      begin
        TLogFileControlBlock(Items[Integer(AStringList.Objects[I])]).WriteString(AStringList[I]);
      end;
    finally
      FLogFilesList.UnlockList;
    end;
    AStringList.Clear;
  finally
    AStringList.Free;
  end;
end;

procedure TLogFilesWriter.RegisterLog(const ALog: TfdcFileLog);
var
  i: Integer;
  IsNewLogFile: Boolean;
begin
  with FLogsList.LockList do
  try
    if IndexOf(ALog) = -1 then
      Add(ALog);
  finally
    FLogsList.UnlockList;
  end;

  with FLogFilesList.LockList do
  try
    IsNewLogFile := True;
    for I := 0 to Count - 1 do
      if CompareText(TLogFileControlBlock(Items[I]).FileName, ALog.FileName) = 0
        then
      begin
        TLogFileControlBlock(Items[I]).AddReference;
        ALog.ControlBlockIndex := I;
        IsNewLogFile := False;
      end;

    if IsNewLogFile then
      ALog.ControlBlockIndex := Add(TLogFileControlBlock.Create(ALog.FileName));
  finally
    FLogFilesList.UnlockList;
  end; // try/finally
end;

procedure TLogFilesWriter.UnregisterLog(const ALog: TfdcFileLog);
var
  i: Integer;
begin
  if ALog.ControlBlockIndex <> -1 then
    with FLogFilesList.LockList do
    try
      TLogFileControlBlock(Items[ALog.ControlBlockIndex]).ReleaseReference;
    finally
      FLogFilesList.UnlockList;
    end; // try/finally

  with FLogsList.LockList do
  try
    i := IndexOf(ALog);
    if i <> -1 then
      Delete(i);
  finally
    FLogsList.UnlockList;
  end; // try/finally
end;

procedure TLogFilesWriter.Execute;
var
  WaitResult: TWaitResult;
begin
  try
    while not Terminated do
    begin
      WaitResult := LogFilesWriterEvent.WaitFor(1);
      case WaitResult of //
        wrSignaled: CheckLogs;
        wrTimeout: Continue;
      end; // case
    end; // while
    CheckLogs; // последняя проверка перед выходом
  except
    on E: Exception do
      WriteLn(E.Message); { TODO Ошибку в системный журнал - по крайней мере }
  end; // try/except
end;

{ TDestinationLogs }

constructor TDestinationLogs.Create(AEventSource: TfdcCustomEventSource;
  AItemClass: TCollectionItemClass);
begin
  inherited Create(AItemClass);
  FEventSource := AEventSource;
end;

function TDestinationLogs.Add: TDestinationLogItem;
begin
  Result := TDestinationLogItem(inherited Add);
  // if not (csDesigning in EventSource.ComponentState) then
  Result.RegisterEventSource(EventSource);
end;

function TDestinationLogs.GetActionItem(Index: Integer): TDestinationLogItem;
begin
  Result := TDestinationLogItem(inherited Items[Index]);
end;

procedure TDestinationLogs.SetActionItem(Index: Integer; Value: TDestinationLogItem);
begin
  Items[Index].Assign(Value);
end;

function TDestinationLogs.GetAttrCount: Integer;
begin
  Result := 2;
end;

function TDestinationLogs.GetAttr(Index: Integer): string;
begin
  case Index of
    0: Result := 'Name';
    1: Result := 'Destination Log';
  else
    Result := '';
  end;
end;

function TDestinationLogs.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  case Index of
    0: Result := Items[ItemIndex].Name;
    1: if Items[ItemIndex].Log <> nil then
         Result := Items[ItemIndex].Log.Name;
  else
    Result := '';
  end;
end;

function TDestinationLogs.GetOwner: TPersistent;
begin
  Result := FEventSource; 
end;

{ TDestinationLogItem }

procedure TDestinationLogItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TDestinationLogItem then
  begin
    if Assigned(Collection) then
      Collection.BeginUpdate;
    try
      inherited AssignTo(Dest)
      { TODO }
      // TDestinationLogItem(Dest) := Self;
    finally
      if Assigned(Collection) then
        Collection.EndUpdate;
    end;
  end
  else
    inherited AssignTo(Dest);
end;

function TDestinationLogItem.GetDisplayName: string;
begin
  Result := FName;
end;

procedure TDestinationLogItem.RegisterEventSource(const AEventSource: TfdcCustomEventSource);
begin
  FLog.RegisterEventSource(AEventSource);
end;

procedure TDestinationLogItem.PutEvent(const AEvent: TfdcLogEvent);
begin
  FLog.PutEvent(AEvent);
end;

procedure TDestinationLogItem.SetDisplayName(const Value: string);
begin
  if AnsiCompareText(Value, FName) <> 0 then
  begin
    { TODO проверка на уникальность имени }
    FName := Value;
    Changed(False);
  end;
end;

initialization
  ResetTickCount;
  LogFilesWriterEvent := nil;
  LogFilesWriter := nil;

finalization
  if Assigned(LogFilesWriter) then
  begin
    LogFilesWriter.Terminate;
    LogFilesWriter.WaitFor;
    LogFilesWriter.Free;
  end;

  if Assigned(LogFilesWriterEvent) then
    LogFilesWriterEvent.Free;
end.



