unit uQueryManager;


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
    //FCountReadThead: Integer;
    procedure StartThreadForSpis(const QueueInfo : TQueueInfo);
    procedure StartThreadForRead(const QueueInfo : TQueueInfo);
    procedure ThreadTerminatedSpis(Sender: TObject);
    procedure ThreadTerminatedRead(Sender: TObject);
    function GetQueueInfo(const FilePath: string) : TQueueInfo;
    function CheachDirectoryInQueue(const Path:String): Boolean;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure DoProcess;
  end;

implementation

uses Log4D;

procedure TQueryManager.DoProcess;
var
 i: integer;
 sr: TSearchRec;
 FilePath, FilePathNew: String;
 QueueInfo : TQueueInfo;
begin

   //стартуем поток запрос платежек
   if not FReadThread.IsActive then
   begin
     FReadThread.CountThead := DataModule2.Options.ThreadCount;
     FReadThread.Resume;
     TLogLogger.GetRootLogger.Info('Запущен поток запроса платежек');
   end;

      //стартуем поток списаний
   if not FSpisThread.IsActive then
   begin
     FSpisThread.Resume;
     TLogLogger.GetRootLogger.Info('Запущен основной поток');
   end;

   for i := 0 to DataModule2.Options.PathList.Count-1 do
   begin
   if FindFirst(DataModule2.Options.PathList[i], faDirectory, sr) = 0 then
    begin
      FilePath := ExtractFileDir(DataModule2.Options.PathList[i]);
      repeat
         if (sr.Name <> '..') and DirectoryExists(FilePath + '\'+ sr.Name) then
         begin

         if sr.Name = '.' then
           FilePathNew := FilePath
         else
           FilePathNew := FilePath + '\'+ sr.Name;

          if FFirstPass then
           with TLogLogger.GetRootLogger do
             if IsDebugEnabled then
                 Debug(Format('Просмотр каталога: %s', [FilePathNew]));

          if CheachDirectoryInQueue(FilePathNew) = false then
          if  FileExists(FilePathNew + '\job.txt') then
          begin
             //инфо по джобу
              QueueInfo := GetQueueInfo(FilePathNew);

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
      TLogLogger.GetRootLogger.Error(Format('Ошибка при доступе к каталогу "%s": %s', [DataModule2.Options.PathList[i], SysErrorMessage(GetLastError)]));
   end;

   FFirstPass:=false;

end;

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

    if ((Pos('/E', CmdLine) = 1)or(Pos('/D', CmdLine) = 1)) then
     QueueInfo.Queue:= btSpisQueueE
    else if Pos('/R', CmdLine) = 1 then
      QueueInfo.Queue:= btReadQueueR
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
  //SleepTime: Cardinal;
  //SleepTimeSec: Cardinal;
begin
  //SleepTimeSec:= DataModule2.Options.WaitTpoTInterval;
  //SleepTime := round(SleepTimeSec / 0.001);

  List := FReadThread.Threads.LockList;
  try
    for I := 0 to List.Count - 1 do
    begin
      if THandlerThread(List[I]).QueueInfo.Path = QueueInfo.Path then
           Exit;
    end;

    //if FileExists(QueueInfo.Path + '\otvet.dbf') then
    //while not DeleteFile(QueueInfo.Path + '\otvet.dbf') do
    //begin
      //Sleep(SleepTime);
      //TLogLogger.GetRootLogger.Info( 'Неудачная попытка удалить '+ QueueInfo.Path + '\otvet.dbf Поток спит '+ inttostr(SleepTimeSec)+' секунд');
    //end;

    NewThread := THandlerThread.Create(True);
    NewThread.QueueInfo := QueueInfo;
    NewThread.DelayTime := FDelayTime;
    NewThread.OnTerminate := ThreadTerminatedRead;
    NewThread.FreeOnTerminate := True;
    List.Add(NewThread);

    TLogLogger.GetRootLogger.Info( 'Поставлен в очередь на запрос платежек запрос из "' + QueueInfo.Path + '". Запросов в очереди платежек: ' + IntToStr( List.Count ) );

  finally
     FReadThread.Threads.UnlockList
  end;
end;

procedure TQueryManager.StartThreadForSpis(const QueueInfo : TQueueInfo);
var
  i: Integer;
  List: TList;
  NewThread: THandlerThread;
  //SleepTime: Cardinal;
  //SleepTimeSec: Cardinal;
begin
  //SleepTimeSec:= DataModule2.Options.WaitTpoTInterval;
  //SleepTime := round(SleepTimeSec / 0.001);
  
  List := FSpisThread.Threads.LockList;
  try
    for I := 0 to List.Count - 1 do
    begin
      if THandlerThread(List[I]).QueueInfo.Path = QueueInfo.Path then
           Exit;
    end;

    //if FileExists(QueueInfo.Path + '\otvet.dbf') then
    //while not DeleteFile(QueueInfo.Path + '\otvet.dbf') do
    //begin
      //Sleep(SleepTime);
      //TLogLogger.GetRootLogger.Info( 'Неудачная попытка удалить '+ QueueInfo.Path + '\otvet.dbf Поток спит '+ inttostr(SleepTimeSec)+' секунд');
    //end;

    NewThread := THandlerThread.Create(True);
    NewThread.QueueInfo :=  QueueInfo;
    NewThread.DelayTime := FDelayTime;
    NewThread.OnTerminate := ThreadTerminatedSpis;
    NewThread.FreeOnTerminate := True;
    List.Add(NewThread);

    TLogLogger.GetRootLogger.Info( 'Поставлен в основную очередь запрос из "' + QueueInfo.Path + '". Запросов в основной очереди: ' + IntToStr( List.Count ) );

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

constructor TQueryManager.Create;
begin
  FFirstPass := True;
  FReadThread := TReadThread.Create(true);
  FSpisThread := TSpisThread.Create(true);
  FList := TStringList.Create;
  TStringList(FList).Sorted := True;
  TStringList(FList).Duplicates := dupIgnore;
end;

destructor TQueryManager.Destroy;
begin
  FreeAndNil(FReadThread);
  FreeAndNil(FSpisThread);
  FreeAndNil(FList);
  inherited;
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

end.
