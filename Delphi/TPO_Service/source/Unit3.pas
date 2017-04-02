unit Unit3;

interface

uses
  Classes;

type
  TQueue = (btReadQueueR, btSpisQueueE, btError);

type TQueueInfo = class(TObject)
  private
   FQueue : TQueue;
   FFileContent: String;
   FPath: String;
  public
   property Queue : TQueue read FQueue write FQueue;
   property FileContent : String read FFileContent write FFileContent;
   property Path: String read FPath write FPath;
  end;

type

  TReadThread  = class(TThread)
  private
    FThreads: TThreadList;
    fIsActive: Boolean;
    FCountThead: Integer;
  protected
    procedure Execute; override;
    procedure DoWork;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    property IsActive : Boolean read fIsActive;
    property Threads: TThreadList read FThreads;
    property CountThead: Integer read FCountThead write FCountThead;
  end;

  TSpisThread  = class(TThread)
  private
    FThreads: TThreadList;
    fIsActive: Boolean;
  protected
    procedure Execute; override;
    procedure DoWork;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy;  override;
    property IsActive : Boolean read fIsActive;
    property Threads: TThreadList read FThreads;
  end;


  THandlerThread = class(TThread)
  private
    { Private declarations }
    FDelayTime: cardinal;
    fIsActive: Boolean;
    FQueueInfo: TQueueInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    property DelayTime: cardinal read FDelayTime write FDelayTime;
    property IsActive : Boolean read fIsActive;
    property QueueInfo: TQueueInfo read FQueueInfo write FQueueInfo;
  end;

  function GetFileContent(Stream: TStream): String;
  function OemToStr(const AStr: string): string;

implementation

uses
  Unit2, Windows, SysUtils, Log4D, fdcExceptions, DB, Oracle;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure THandlerThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ THandlerThread }

function GetFileContent(Stream: TStream): String;
var
  Lines: TStringList;
begin
  Lines := TStringList.Create;
  try
    Lines.LoadFromStream(Stream);
    Result := Lines.Text;
  finally
    Lines.Free;
    Stream.Position := 0;
  end;
end;

function OemToStr(const AStr: string): string;
begin
  Result := '';
  if AStr <> '' then
  begin
    SetString(Result, nil, Length(AStr));
    OemToChar(PChar(AStr), PChar(Result));
  end;
end;

constructor THandlerThread.Create(CreateSuspended: Boolean);
begin
  fIsActive := False;
  FQueueInfo := TQueueInfo.Create;
  inherited Create(CreateSuspended);
end;

destructor  THandlerThread.Destroy;
begin
  FQueueInfo.Free;
  inherited Destroy;
end;


procedure THandlerThread.Execute;
var
  H: TDataModule2;
begin
  fIsActive := True;

  //DeleteFile(QueueInfo.Path + '\otvet.dbf');
  if self.FQueueInfo.Queue = btReadQueueR then
  begin
    if FileExists(QueueInfo.Path + '\otvet.dbf') then
    if not DeleteFile(QueueInfo.Path + '\otvet.dbf') then
      TLogLogger.GetRootLogger.Info( 'Неудачная попытка удалить '+ QueueInfo.Path + '\otvet.dbf');
  end;

  if FileExists(QueueInfo.Path + '\eoj.txt') then
  if not DeleteFile(QueueInfo.Path + '\eoj.txt') then
    TLogLogger.GetRootLogger.Info( 'Неудачная попытка удалить '+ QueueInfo.Path + '\eoj.txt');
  if FileExists(QueueInfo.Path + '\job.log') then
  if not DeleteFile(QueueInfo.Path + '\job.log') then
    TLogLogger.GetRootLogger.Info( 'Неудачная попытка удалить '+ QueueInfo.Path + '\job.log');
  if FileExists(QueueInfo.Path + '\otvetE.dbf') then
  if not DeleteFile(QueueInfo.Path + '\otvetE.dbf') then
    TLogLogger.GetRootLogger.Info( 'Неудачная попытка удалить '+ QueueInfo.Path + '\otvetE.dbf');

  with TLogLogger.GetRootLogger do
     if IsInfoEnabled then
        Info(Format('Обработка файла: %s\job.txt', [self.FQueueInfo.Path]));
  begin
      try
        try
          if DelayTime > 0 then
          begin
            TLogLogger.GetRootLogger.Debug(Format('Пауза %d мс', [DelayTime]));
            Sleep(DelayTime);
          end;

         try
            H := TDataModule2.Create(nil);
          try
            if TLogLogger.GetRootLogger.IsDebugEnabled then
              TLogLogger.GetRootLogger.Debug('Текст запроса: ' + OemToStr(self.FQueueInfo.FFileContent));
              H.Handle(QueueInfo);
          finally
            H.Session.LogOff;
            H.Free;
          end;

          except
          on E: EfdcException do begin
          TLogLogger.GetRootLogger.Error(Format('Фатальная ошибка при обработке файла %s\job.txt', [self.FQueueInfo.Path]));
          TLogLogger.GetRootLogger.Error(E.UserMessage + '. ' + E.UserHint);
        end;
        on E: Exception do
          TLogLogger.GetRootLogger.Error(Format('Фатальная ошибка при обработке файла %s\job.txt', [self.FQueueInfo.Path]), E);
        end;

        finally
          if DelayTime > 0 then
          begin
            TLogLogger.GetRootLogger.Debug(Format('Пауза %d мс', [DelayTime]));
            Sleep(DelayTime);
          end;

          with TLogLogger.GetRootLogger do
             if IsDebugEnabled then
                 Debug(Format('Формирование файла: %s\eoj.txt', [self.FQueueInfo.Path]));
          MoveFileEx(PChar(self.FQueueInfo.Path + '\job.txt'), PChar(self.FQueueInfo.Path +
            '\eoj.txt'),
            MOVEFILE_REPLACE_EXISTING);
        end;
      except
        on E: EfdcException do begin
          TLogLogger.GetRootLogger.Error(Format('Фатальная ошибка при обработке файла %s\job.txt', [self.FQueueInfo.Path]));
          TLogLogger.GetRootLogger.Error(E.UserMessage + '. ' + E.UserHint);
        end;
        on E: Exception do
          TLogLogger.GetRootLogger.Error(Format('Фатальная ошибка при обработке файла %s\job.txt', [self.FQueueInfo.Path]), E);
      end;
  end;  
end;

constructor TReadThread.Create(CreateSuspended: Boolean);
begin
  fIsActive := False;
  FThreads := TThreadList.Create;
  inherited Create(CreateSuspended);
end;

destructor TReadThread.Destroy;
begin
  FreeAndNil(FThreads);
  inherited;
end;

procedure TReadThread.Execute;
begin
  while not Terminated do
  begin
     Sleep(1);
     DoWork;
  end;
end;

procedure TReadThread.DoWork;
var
  ThList: TList;
  TheadCount : Integer;
  i: integer;
begin
  fIsActive := True;

  ThList := FThreads.LockList;

  TheadCount:= self.CountThead;

  if  ThList.Count < TheadCount then
    TheadCount :=  ThList.Count;

  if  ThList.Count > 0 then
    for i :=0 to TheadCount-1 do
    if not THandlerThread(ThList[0]).IsActive then
      THandlerThread(ThList[i]).Resume;

  FThreads.UnlockList;
end;

constructor TSpisThread.Create(CreateSuspended: Boolean);
begin
  fIsActive := False;
  FThreads := TThreadList.Create;
  inherited Create(CreateSuspended);
end;

destructor TSpisThread.Destroy;
begin
  FreeAndNil(FThreads);
  inherited;
end;

procedure TSpisThread.Execute;
begin
  while not Terminated do
  begin
     Sleep(1);
     DoWork;
  end;
end;

procedure TSpisThread.DoWork;
var
  ThList: TList;
begin
  fIsActive := True;

  ThList := FThreads.LockList;
  
  if  ThList.Count > 0 then
  if not THandlerThread(ThList[0]).IsActive then
      THandlerThread(ThList[0]).Resume;

  FThreads.UnlockList;    
end;

end.

