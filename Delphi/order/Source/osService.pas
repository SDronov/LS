unit osService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  osScktSrv, ScktComp, Contnrs, osRemoteData;

type
  TORDERService = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);

    procedure OnAddClient (Sender: TObject; Thread: TServerClientThread);
    procedure OnRemoveClient (Sender: TObject; Thread: TServerClientThread);
  private
    fSocketServer : TSocketDispatcher;
    fDBUserName   : string;
    fDBServer     : string;
    fDBPassword   : string;
    //8.8.16
    fDBFTSUserName : string;
    fDBFTSServer   : string;
    fDBFTSPassword : string;
    fInnKppList    : Tstrings;
    fDateList      : Tstrings;
    //
    fQueueTimeOut : Integer;
    fQueueList    : TObjectList;

    fWinSockLoaded : Boolean;
  public
    fHSemQueue    : THandle;
    function GetServiceController: TServiceController; override;

    procedure AddToQueue( AQuery : TRemoteDM );
    procedure RemoveFromQueue( AQuery : TRemoteDM );

    property DBUserName   : string read fDBUserName;
    property DBServer     : string read fDBServer;
    property DBPassword   : string read fDBPassword;
    property QueueTimeOut : Integer read fQueueTimeOut;
    //8.8.16
    property DBFTSUserName : string read fDBFTSUserName;
    property DBFTSServer   : string read fDBFTSServer;
    property DBFTSPassword : string read fDBFTSPassword;
    property InnKppList    : Tstrings read fInnKppList;
    property DateList      : Tstrings read fDateList;
    //
  end;

var
  ORDERService: TORDERService;

implementation

uses
  Log4D
 ,IniFiles
 ,SConnect
 ,Forms;

{$R *.DFM}

const
  cReg_SecName_Conn       = 'Connection';
  cReg_ValName_Conn_Port  = 'Port';
  cReg_ValName_Conn_TOut  = 'TimeOut';

  cReg_SecName_Log        = 'Logon';
  cReg_ValName_Log_User   = 'username';
  cReg_ValName_Log_DB     = 'database';
  cReg_ValName_Log_Pass   = 'password';
  //8.8.16
  cReg_SecName_Log_FTS    = 'FTSLogon';
  cIK_Sec                 = 'InnKppList';
  //
  cReg_SecName_Queue      = 'Queue';
  cReg_ValName_Queue_TOut = 'TimeOut';

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ORDERService.Controller(CtrlCode);
end;

function TORDERService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TORDERService.ServiceExecute(Sender: TService);
begin
  while not Terminated do
    begin
      try
        if WaitForSingleObject( fHSemQueue, INFINITE ) = WAIT_OBJECT_0 then
          begin
            if  Assigned(fQueueList) then
              begin
                if fQueueList.Count > 0 then
                  if Assigned(( fQueueList[0] as TRemoteDM )) then
                  begin
                    if not ( fQueueList[0] as TRemoteDM ).Active then
                           ( fQueueList[0] as TRemoteDM ).Active := True;
                  end
                    else
                      TLogLogger.GetRootLogger.Fatal( 'Ошибка при обработке очереди запросов! Разрушен элемент очереди!');
              end
              else
                TLogLogger.GetRootLogger.Fatal( 'Ошибка при обработке очереди запросов! Очередь разрушена!');
            if not ReleaseSemaphore( fHSemQueue, 1, nil ) then
              TLogLogger.GetRootLogger.Error( Format( 'Ошибка при переводе семафора очереди в сигнальное состояние: %d', [ GetLastError ] ) );
          end;
      except
        on E : Exception do
          TLogLogger.GetRootLogger.Fatal( 'Ошибка при обработке очереди запросов!', E );
      end;

      ServiceThread.ProcessRequests(False);
      Sleep(50);
    end;
end;

procedure TORDERService.ServiceStart(Sender: TService;
  var Started: Boolean);

  var
    Ini      : TIniFile;
    iPort    : Integer;
    iTimeOut : Integer;
    //8.8.16
    i          : integer;
    iPosD      : integer;
    sInnKpp    : String;
    //
begin
  TLogLogger.GetRootLogger.Info('Запуск службы...');
  if not fWinSockLoaded then
    if not LoadWinSock2 then
      begin
        TLogLogger.GetRootLogger.Info('Запуск не возможен: не загружен WinSocket2');
        Started := False;
        Exit;
      end
    else
      fWinSockLoaded := True;

  // Прочитать параметры
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format('<Файл параметров: %s>', [Ini.FileName] ) );
  try
    iPort    := Ini.ReadInteger( cReg_SecName_Conn, cReg_ValName_Conn_Port, 211 );
    iTimeOut := Ini.ReadInteger( cReg_SecName_Conn, cReg_ValName_Conn_TOut, 5 );

    fDBUserName := Ini.ReadString( cReg_SecName_Log, cReg_ValName_Log_User, 'DOMOD_417' );
    fDBServer   := Ini.ReadString( cReg_SecName_Log, cReg_ValName_Log_DB,   'DOMOD_417' );
    fDBPassword := Ini.ReadString( cReg_SecName_Log, cReg_ValName_Log_Pass, 'LS' );
    //8.8.16
    fDBFTSUserName  := Ini.ReadString( cReg_SecName_Log_FTS, cReg_ValName_Log_User, 'DOMOD_417' );
    fDBFTSServer    := Ini.ReadString( cReg_SecName_Log_FTS, cReg_ValName_Log_DB, 'DOMOD_417' );
    fDBFTSPassword  := Ini.ReadString( cReg_SecName_Log_FTS, cReg_ValName_Log_Pass, 'LS' );
    //
    fQueueTimeOut := Ini.ReadInteger( cReg_SecName_Queue, cReg_ValName_Queue_TOut, 5 );
    //8.8.16
    fInnKppList := TstringList.Create;
    fDateList := TstringList.Create;
    Ini.ReadSectionValues(cIK_Sec, fInnKppList);
    Ini.ReadSectionValues(cIK_Sec, fDateList);

    For i := 0 to fInnKppList.Count - 1 do
      begin
        fInnKppList[i] := StringReplace(fInnKppList[i], ' ', '', [rfReplaceAll]);
        sInnKpp := fInnKppList.ValueFromIndex[i];
        iPosD := Pos('|',sInnKpp);
        fInnKppList[i] := Copy(sInnKpp, 1, iPosD-1);
        fDateList[i] := Copy(sInnKpp, iPosD+1, Length(sInnKpp));
        fDateList[i] := Copy(fDateList[i],6,2)+'/'+Copy(fDateList[i],9,2)+'/'+Copy(fDateList[i],1,4);
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
          Debug( Format('<Запись ИНН: ' + fInnKppList[i] + ' .Дата: ' + fDateList[i] + '>', [fHSemQueue] ) );
      end;
    //
    TLogLogger.GetRootLogger.Info('  Параметры:');
    TLogLogger.GetRootLogger.Info('    Порт:             ' + IntToStr( iPort ));
    TLogLogger.GetRootLogger.Info('    Таймаут:          ' + IntToStr( iTimeOut ));
    TLogLogger.GetRootLogger.Info('    Пользователь:     ' + fDBUserName );
    TLogLogger.GetRootLogger.Info('    БД:               ' + fDBServer );
    //8.8.16
    TLogLogger.GetRootLogger.Info('    Пользователь ЕЛС: ' + fDBFTSUserName );
    TLogLogger.GetRootLogger.Info('    БД ЕЛС:           ' + fDBFTSServer );
    //
    TLogLogger.GetRootLogger.Info('    Таймаут ожидания запроса в очереди: ' + IntToStr( fQueueTimeOut ) );
  finally
    Ini.Free;
  end;

  // Создать список запросов
  fQueueList := TObjectList.Create;
  fQueueList.OwnsObjects := False;
  fHSemQueue := CreateSemaphore( nil, 1, 1, nil );

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format('<Создан семафор для очереди запросов: %d>', [fHSemQueue] ) );

  // Поднять SocketServer
  fSocketServer := TSocketDispatcher.Create( Self );
  try
    with fSocketServer do
      begin
        OnAddClient    := Self.OnAddClient;
        OnRemoveClient := Self.OnRemoveClient;

        Port    := iPort;
        Timeout := iTimeOut;

        Open;
        TLogLogger.GetRootLogger.Info('Запущен диспетчер подключений');
      end;
  except
    on E : Exception do
      begin
        TLogLogger.GetRootLogger.Error( 'Ошибка при открытии сокета', E );
        TLogLogger.GetRootLogger.Error( '-' );
        Started := False;
        Exit;
      end;
  end;

  // Сервис запущен
  TLogLogger.GetRootLogger.Info('Служба запущена');
  Started := True;
end;

procedure TORDERService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
  var
    lv_Queue : TRemoteDM;
begin
  TLogLogger.GetRootLogger.Info( 'Остановка службы...' );
  // Дождаться обработки очереди (не более 1 минуты)
  if fQueueList.Count > 0 then
    begin
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '<Очередь запросов не пуста. Ожидание обработки запросов в течении 1 минуты>' );
      Sleep( 60000 );
    end;
  if fQueueList.Count > 0 then
    begin
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '<Очередь запросов не пуста. Удаление запросов из очереди>' );
      // удалить все запросы из очереди
      while fQueueList.Count > 0 do
        begin
          lv_Queue := fQueueList.Items[ fQueueList.Count - 1 ] as TRemoteDM;
          fQueueList.Remove( lv_Queue );
          lv_Queue.Free;
        end;
    end;
  fQueueList.Free;
  fQueueList := nil;
  CloseHandle( fHSemQueue );
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Разрушен семафор очереди запросов>' );

  // Остановить SocketServer
  fSocketServer.Free;
  fSocketServer := nil;

  // Сервис остановлен
  TLogLogger.GetRootLogger.Info('Служба остановлена');
  Stopped := True;
end;

procedure TORDERService.ServiceCreate(Sender: TObject);
var
 i: Integer;
 S: string;
begin
  fWinSockLoaded := False;

  if FindCmdLineSwitch('depend', ['-','/'], True) then
  begin
    for I := 0 to System.ParamCount - 1 do    // Iterate
    begin
      S := ParamStr(I);
      S := LowerCase(Copy(ParamStr(I), 2, maxInt));
      if (LowerCase(Copy(ParamStr(I), 2, maxInt)) = 'depend') and (System.ParamCount <= I + 1) then
      begin
          TDependency(Self.Dependencies.Add).Name := ParamStr(I + 1);
          Exit;
      end;
    end;    // for
  end;
end;

procedure TORDERService.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  TLogLogger.GetRootLogger.Info('Служба приостановлена');
end;

procedure TORDERService.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  TLogLogger.GetRootLogger.Info('Работа службы возобновилась');
end;

procedure TORDERService.OnAddClient(Sender: TObject;
  Thread: TServerClientThread);
begin
  TLogLogger.GetRootLogger.Info( Format( 'Подключение от клиента с IP: %s Port: %d', [ Thread.ClientSocket.RemoteAddress, Thread.ClientSocket.RemotePort ] ) );
end;

procedure TORDERService.OnRemoveClient(Sender: TObject;
  Thread: TServerClientThread);
begin
  TLogLogger.GetRootLogger.Info( Format( 'Подключение от клиента с IP: %s Port: %d закрыто', [ Thread.ClientSocket.RemoteAddress, Thread.ClientSocket.RemotePort ] ) );
end;

procedure TORDERService.AddToQueue(AQuery: TRemoteDM);
begin
  if not AQuery.Active then
    if WaitForSingleObject( fHSemQueue, INFINITE ) = WAIT_OBJECT_0 then
      begin
        fQueueList.Add( AQuery );
        TLogLogger.GetRootLogger.Info( Format( AQuery.ConnectionName + '<В очередь добавлен запрос %s от %s. Запросов в очереди: %d>', [ AQuery.Key, AQuery.ConnectionName, fQueueList.Count ] ) );
        if not ReleaseSemaphore( fHSemQueue, 1, nil ) then
          TLogLogger.GetRootLogger.Error( Format( 'Ошибка при переводе семафора очереди в сигнальное состояние: %d', [ GetLastError ] ) );
      end
  else
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( 'Попытка добавить в список запросов активный запрос отклонена!' );
end;

procedure TORDERService.RemoveFromQueue(AQuery: TRemoteDM);
begin
  if WaitForSingleObject( fHSemQueue, INFINITE ) = WAIT_OBJECT_0 then
    begin
      if fQueueList.Remove( AQuery ) <> -1 then
        TLogLogger.GetRootLogger.Info( Format( AQuery.ConnectionName + '<Исключён из очереди запрос %s от %s. Запросов в очереди: %d>', [ AQuery.Key, AQuery.ConnectionName, fQueueList.Count ] ) );
      if not ReleaseSemaphore( fHSemQueue, 1, nil ) then
        TLogLogger.GetRootLogger.Error( Format( 'Ошибка при переводе семафора очереди в сигнальное состояние: %d', [ GetLastError ] ) );
    end;
end;

end.
