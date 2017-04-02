unit QueryManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Unit2, DB, Oracle, OracleData, QueryList, ExtCtrls, IniFiles, Unit3;


type
  TQueryManager = class
  private
    FList: TStringList;
    FReadThread: TReadThread;
    FSpisThread: TSpisThread;
    FFirstPass: Boolean;
    FDelayTime: Integer;
    FCountReadThead: Integer;
    procedure InitThreads;
    procedure StartThreadForSpis(const QueueInfo : TQueueInfo);
    procedure StartThreadForRead(const QueueInfo : TQueueInfo);
    procedure ThreadTerminatedSpis(Sender: TObject);
    procedure ThreadTerminatedRead(Sender: TObject);
    procedure MapNetworkDir(IniFile: TIniFile);
    function GetQueueInfo(const FilePath: string) : TQueueInfo;
    function CheachDirectoryInQueue(const Path:String): Boolean;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure DoProcess;
    function GetPathList: TStrings;
  end;

implementation

uses
   Dialogs, Log4D, StrUtils;

function  TQueryManager.GetQueueInfo(const FilePath: string) : TQueueInfo;
var
  CmdFile: TFileStream;
  QueueInfo : TQueueInfo;
  CmdLine: string;
begin

  CmdFile := TFileStream.Create(FilePath + '\job.txt', fmOpenRead + fmShareDenyNone);
  QueueInfo:=  TQueueInfo.Create;

  try
    CmdLine:= OemToStr(GetFileContent(CmdFile));

    if Pos('/E1', CmdLine) = 1 then
     QueueInfo.Queue:= btSpisQueueE1
    else if Pos('/E', CmdLine) = 1 then
     QueueInfo.Queue:= btSpisQueueE
    else if Pos('/R', CmdLine) = 1 then
      QueueInfo.Queue:= btReadQueueR
    else if Pos('/V', CmdLine) = 1 then
      QueueInfo.Queue:= btSpisQueueV
    else if Pos('/S', CmdLine) = 1 then
      QueueInfo.Queue:= btOtzivQueueS
    else if Pos('/T', CmdLine) = 1 then
      QueueInfo.Queue:= btReadQueueT
    else if Pos('/O', CmdLine) = 1 then
      QueueInfo.Queue:=  btSpisQueueO
    else
      QueueInfo.Queue:= btError;
      
   QueueInfo.FileContent := CmdLine;
   QueueInfo.Path := FilePath;

  finally
   CmdFile.Free;
  end;

  result:=  QueueInfo;
  
end;

procedure TQueryManager.StartThreadForRead(const QueueInfo : TQueueInfo);
var
  i: Integer;
  List: TList;
  NewThread: THandlerThread;
begin
  List := FReadThread.Threads.LockList;
  try
    for I := 0 to List.Count - 1 do
    begin
      if THandlerThread(List[I]).QueueInfo.Path = QueueInfo.Path then
           Exit;
    end;

    NewThread := THandlerThread.Create(True);
    NewThread.QueueInfo := QueueInfo;
    NewThread.DelayTime := FDelayTime;
    NewThread.OnTerminate := ThreadTerminatedRead;
    NewThread.FreeOnTerminate := True;
    List.Add(NewThread);

    TLogLogger.GetRootLogger.Info( 'Поставлен в очередь на запрос платежек запрос из "' + QueueInfo.Path + '". Запросов в очереди платежек: ' + IntToStr( List.Count ) );

    DeleteFile(QueueInfo.Path + '\eoj.txt');
    DeleteFile(QueueInfo.Path + '\otvet.dbf');

  finally
     FReadThread.Threads.UnlockList
  end;
end;

procedure TQueryManager.StartThreadForSpis(const QueueInfo : TQueueInfo);
var
  i: Integer;
  List: TList;
  NewThread: THandlerThread;
begin
  List := FSpisThread.Threads.LockList;
  try
    for I := 0 to List.Count - 1 do
    begin
      if THandlerThread(List[I]).QueueInfo.Path = QueueInfo.Path then
           Exit;
    end;

    NewThread := THandlerThread.Create(True);
    NewThread.QueueInfo :=  QueueInfo;
    NewThread.DelayTime := FDelayTime;
    NewThread.OnTerminate := ThreadTerminatedSpis;
    NewThread.FreeOnTerminate := True;
    List.Add(NewThread);

    TLogLogger.GetRootLogger.Info( 'Поставлен в основную очередь запрос из "' + QueueInfo.Path + '". Запросов в основной очереди: ' + IntToStr( List.Count ) );

    DeleteFile(QueueInfo.Path + '\eoj.txt');
    DeleteFile(QueueInfo.Path + '\otvet.dbf');
  finally
    FSpisThread.Threads.UnlockList
  end;
end;

function TQueryManager.CheachDirectoryInQueue(const Path:String): Boolean;
var
  List: TList;
  i: integer;
begin
  result:=false;

  List := FSpisThread.Threads.LockList;

    for I := 0 to List.Count - 1 do
    begin
      if THandlerThread(List[I]).QueueInfo.Path = Path then
      begin
           FSpisThread.Threads.UnlockList;
           result:=true;
           exit;
      end;
    end;

  FSpisThread.Threads.UnlockList;



  List := FReadThread.Threads.LockList;

    for I := 0 to List.Count - 1 do
    begin
      if THandlerThread(List[I]).QueueInfo.Path = Path then
      begin
           FReadThread.Threads.UnlockList;
           result:=true;
           exit;
      end;
    end;

  FReadThread.Threads.UnlockList;

end;

procedure TQueryManager.DoProcess;
var
  I: Integer;
  sr: TSearchRec;
  FilePath: String;
  //ThList: TList;
  QueueInfo : TQueueInfo;
begin
   //стартуем поток запрос платежек
   if not FReadThread.IsActive then
     begin
     FReadThread.CountThead := FCountReadThead;
     FReadThread.Resume;
     TLogLogger.GetRootLogger.Info('Запущен поток запроса платежек');
     end;

   //стартуем поток списаний
   if not FSpisThread.IsActive then
   begin
     FSpisThread.Resume;
     TLogLogger.GetRootLogger.Info('Запущен основной поток');
   end;

  for I := 0 to FList.Count - 1 do // Iterate
  begin
    if FindFirst(FList[I], faDirectory, sr) = 0 then
    begin
      FilePath := ExtractFilePath(FList[I]);
      repeat
         if (sr.Name <> '..') and DirectoryExists(FilePath + sr.Name) then
         begin
          if FFirstPass then
           with TLogLogger.GetRootLogger do
             if IsDebugEnabled then
                 Debug(Format('Просмотр каталога: %s', [FilePath + sr.Name]));

          if CheachDirectoryInQueue(FilePath + sr.Name) = false then
          if  FileExists(FilePath + sr.Name + '\job.txt') then
          begin
             //инфо по джобу
              QueueInfo := GetQueueInfo(FilePath + sr.Name);

              if QueueInfo.Queue = btReadQueueR then
                //ставим в очередь запрос платежек
                StartThreadForRead(QueueInfo)
              else
                //ставим в очередь на списание
                StartThreadForSpis(QueueInfo);

          end;
         end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end
    else
      TLogLogger.GetRootLogger.Error(Format('Ошибка при доступе к каталогу "%s": %s', [FList[I], SysErrorMessage(GetLastError)]));
  end;                    
  FFirstPass := False;
end;

procedure TQueryManager.InitThreads;
var
  Ini: TIniFile;
  i: Integer;
  S: string;
  sr: TSearchRec;
begin
  if TLogLogger.GetRootLogger.IsDebugEnabled then
     TLogLogger.GetRootLogger.Debug(Format('Файл параметров: %s', [ChangeFileExt(Application.ExeName, '.ini')]));

  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
      MapNetworkDir(Ini);
      FDelayTime := Ini.ReadInteger('common', 'sleep', 0);
      FCountReadThead := Ini.ReadInteger('common', 'countreadthread', 1);

      I := 0;
      repeat
        S := Ini.ReadString('path_list', 'item' + IntToStr(I), '');
        if S <> '' then
        begin
          if FindFirst(S, faDirectory, sr) = 0 then
          begin
            FList.Add(LowerCase(S));
            FindClose(sr);
          end
          else
            TLogLogger.GetRootLogger.Error(Format('Ошибка при доступе к каталогу "%s": %s', [S, SysErrorMessage(GetLastError)]));
        end;
        Inc(I);
      until S = '';
  finally
    Ini.Free;
  end;
  TLogLogger.GetRootLogger.Info(Format('Список каталогов обмена с КПС "Инспектор ОТО":%s', [FList.CommaText]));
end;


procedure TQueryManager.ThreadTerminatedRead(Sender: TObject);
var
  ThList: TList;
begin
  ThList := FReadThread.Threads.LockList;
  ThList.Remove(Sender);

  TLogLogger.GetRootLogger.Info('Осталось в очереди на запрос платежек: ' + inttostr(ThList.Count));

  if ThList.Count > 0 then
    if not THandlerThread(ThList[0]).IsActive then
      THandlerThread(ThList[0]).Resume;
  FReadThread.Threads.UnlockList;
end;


procedure TQueryManager.ThreadTerminatedSpis(Sender: TObject);
var
  ThList: TList;
begin
  ThList := FSpisThread.Threads.LockList;
  ThList.Remove(Sender);

  TLogLogger.GetRootLogger.Info('Осталось в основной очереди: ' +inttostr(ThList.Count));

  if ThList.Count > 0 then
    if not THandlerThread(ThList[0]).IsActive then
      THandlerThread(ThList[0]).Resume;
  FSpisThread.Threads.UnlockList;
end;

constructor TQueryManager.Create;
begin
  FFirstPass := True;
  FReadThread := TReadThread.Create(true);
  FSpisThread := TSpisThread.Create(true);
  FList := TStringList.Create;
  TStringList(FList).Sorted := True;
  TStringList(FList).Duplicates := dupIgnore;
  InitThreads;
end;


destructor TQueryManager.Destroy;
begin
  FreeAndNil(FReadThread);
  FreeAndNil(FSpisThread);
  FreeAndNil(FList);
  inherited;
end;

function TQueryManager.GetPathList: TStrings;
begin
  Result := TStringList.Create;
  try
    Result.Text :=  FList.Text;
  except
    Result.Free;
    raise;
  end;  
end;

function LogonDecrypt(S: string): string;
var i, x: Integer;
begin
  Result := '';
  if S <> '' then
  try
    x := StrToInt(Copy(S, 1, 4));
    i := 1;
    repeat
      Delete(S, 1, 4);
      if S <> '' then Result := Result + Char(((StrToInt(Copy(S, 1, 4)) - 1000) xor (x + i * 10)) div 16);
      inc(i);
    until S = '';
  except
  end;
end;

procedure TQueryManager.MapNetworkDir(IniFile: TIniFile);
var
  ARemoteName: string;
  ALocalName: string;
  AProvider: string;
  NetResource: TNetResource;
  Passwd: String;
begin
  Passwd := IniFile.ReadString('network', 'password', '');

  if AnsiStartsText('crypt:',  Passwd) then
      Passwd := LogonDecrypt(Copy(Passwd, Length('crypt:')+1, MaxInt));

  ALocalName := IniFile.ReadString('network', 'localname', '');
  ARemoteName := IniFile.ReadString('network', 'remotename', '');
  AProvider := IniFile.ReadString('network', 'provider', '');
  if ALocalName <> '' then
  begin
    NetResource.dwType := RESOURCETYPE_DISK;
    NetResource.lpLocalName := PChar(ALocalName);
    NetResource.lpRemoteName := PChar(ARemoteName);
    NetResource.lpProvider := PChar(AProvider);
    TLogLogger.GetRootLogger.Debug(Format('Попытка подключения сетевого диска "%s" для "%s".'
    + ' Имя пользователя: %s',
             [NetResource.lpLocalName, NetResource.lpRemoteName, IniFile.ReadString('network', 'username', '')]));
    if WNetAddConnection2(NetResource, PChar(Passwd), PChar(IniFile.ReadString('network', 'username', '')), 0)
      = NO_ERROR then
      TLogLogger.GetRootLogger.Error(Format('Подключен сетевой диск "%s"',
               [NetResource.lpLocalName]))
    else
    begin
      TLogLogger.GetRootLogger.Error(Format('Ошибка подключения сетевого диска "%s": %s',
               [NetResource.lpLocalName, SysErrorMessage(GetLastError)]));
    end;
  end;
end;


end.

