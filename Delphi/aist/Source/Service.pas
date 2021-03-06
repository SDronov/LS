unit Service;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  {QueryManager,} uScktSrv, ScktComp, Contnrs, Unit4;

type
  TARMTIService = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);

    procedure OnAddClient (Sender: TObject; Thread: TServerClientThread);
    procedure OnRemoveClient (Sender: TObject; Thread: TServerClientThread);
  private
    { Private declarations }
    //FManager: TQueryManager;
    fSocketServer : TSocketDispatcher;
    fDBUserName   : string;
    fDBServer     : string;
    fDBPassword   : string;
    fDBUserNameFTS: string;
    fDBServerFTS  : string;
    fDBPasswordFTS: string;
    fQueueTimeOut : Integer;
    {fWaitTime      : DWORD;}
    fQueueList    : TObjectList;

    fWinSockLoaded : Boolean;
  public
    fHSemQueue    : THandle;
    { Public declarations }
    function GetServiceController: TServiceController; override;

    procedure AddToQueue( AQuery : TRemDM );
    procedure RemoveFromQueue( AQuery : TRemDM );

    property DBUserName   : string read fDBUserName;
    property DBServer     : string read fDBServer;
    property DBPassword   : string read fDBPassword;
    property DBUserNameFTS: string read fDBUserNameFTS;
    property DBServerFTS  : string read fDBServerFTS;
    property DBPasswordFTS: string read fDBPasswordFTS;
    property QueueTimeOut : Integer read fQueueTimeOut;
  end;

var
  ARMTIService: TARMTIService;

implementation

uses
  Log4D
 ,IniFiles
 ,SConnect
 ,Forms;

{$R *.DFM}

const
  cReg_SecName_Conn      = 'Connection';
  cReg_ValName_Conn_Port = 'Port';
  cReg_ValName_Conn_TOut = 'TimeOut';

  cReg_SecName_Log      = 'Logon';   
  cReg_SecName_FTSLog   = 'FTSLogon';
  cReg_ValName_Log_User = 'username';
  cReg_ValName_Log_DB   = 'database';
  cReg_ValName_Log_Pass = 'password';


  cReg_SecName_Queue      = 'Queue';
  cReg_ValName_Queue_TOut = 'TimeOut';


procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ARMTIService.Controller(CtrlCode);
end;

function TARMTIService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TARMTIService.ServiceExecute(Sender: TService);
begin
  while not Terminated do
    begin
      try
        if WaitForSingleObject( fHSemQueue, INFINITE ) = WAIT_OBJECT_0 then
          begin
            if fQueueList.Count > 0 then
              if not ( fQueueList[0] as TRemDM ).Active then
                ( fQueueList[0] as TRemDM ).Active := True;
            if not ReleaseSemaphore( fHSemQueue, 1, nil ) then
              TLogLogger.GetRootLogger.Error( Format( '������ ��� �������� �������� ������� � ���������� ���������: %d', [ GetLastError ] ) );
          end;
      except
        on E : Exception do
          TLogLogger.GetRootLogger.Fatal( '������ ��� ��������� ������� ��������!', E );
      end;

      ServiceThread.ProcessRequests(False);
      Sleep(50);
    end;
end;

procedure TARMTIService.ServiceStart(Sender: TService;
  var Started: Boolean);

  var
    Ini      : TIniFile;
    iPort    : Integer;
    iTimeOut : Integer;
begin
  TLogLogger.GetRootLogger.Info('������ ������...');
  if not fWinSockLoaded then
    if not LoadWinSock2 then
      begin
        TLogLogger.GetRootLogger.Info('������ �� ��������: �� �������� WinSocket2');
        Started := False;
        Exit;
      end
    else
      fWinSockLoaded := True;

  // ��������� ���������
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format('<���� ����������: %s>', [Ini.FileName] ) );
  try
    iPort    := Ini.ReadInteger( cReg_SecName_Conn, cReg_ValName_Conn_Port, 211 );
    iTimeOut := Ini.ReadInteger( cReg_SecName_Conn, cReg_ValName_Conn_TOut, 5 );

    fDBUserName := Ini.ReadString( cReg_SecName_Log, cReg_ValName_Log_User, 'DOXOD_LS_3' );
    fDBServer   := Ini.ReadString( cReg_SecName_Log, cReg_ValName_Log_DB,   '' );
    fDBPassword := Ini.ReadString( cReg_SecName_Log, cReg_ValName_Log_Pass, '' );

    // ������ ���
    fDBUserNameFTS := Ini.ReadString( cReg_SecName_FTSLog, cReg_ValName_Log_User, 'DOXOD_LS_3' );
    fDBServerFTS   := Ini.ReadString( cReg_SecName_FTSLog, cReg_ValName_Log_DB,   '' );
    fDBPasswordFTS := Ini.ReadString( cReg_SecName_FTSLog, cReg_ValName_Log_Pass, '' );

    fQueueTimeOut := Ini.ReadInteger( cReg_SecName_Queue, cReg_ValName_Queue_TOut, 5 );

    TLogLogger.GetRootLogger.Info('  ���������:');
    TLogLogger.GetRootLogger.Info('    ����:         ' + IntToStr( iPort ));
    TLogLogger.GetRootLogger.Info('    �������:      ' + IntToStr( iTimeOut ));
    TLogLogger.GetRootLogger.Info('    ������������: ' + fDBUserName );
    TLogLogger.GetRootLogger.Info('    ��:           ' + fDBServer );
    TLogLogger.GetRootLogger.Info('    ������������ ���: ' + fDBUserNameFTS );
    TLogLogger.GetRootLogger.Info('    �� ���:           ' + fDBServerFTS );
    TLogLogger.GetRootLogger.Info('    ������� �������� ������� � �������: ' + IntToStr( fQueueTimeOut ) );
  finally
    Ini.Free;
  end;

  // ������� ������ ��������
  fQueueList := TObjectList.Create;
  fQueueList.OwnsObjects := False;
  fHSemQueue := CreateSemaphore( nil, 1, 1, nil );

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format('<������ ������� ��� ������� ��������: %d>', [fHSemQueue] ) );

  // ������� SocketServer
  fSocketServer := TSocketDispatcher.Create( Self );
  try
    with fSocketServer do
      begin
        OnAddClient    := Self.OnAddClient;
        OnRemoveClient := Self.OnRemoveClient;

        Port    := iPort;
        Timeout := iTimeOut;

        Open;
        TLogLogger.GetRootLogger.Info('������� ��������� �����������');
      end;
  except
    on E : Exception do
      begin
        TLogLogger.GetRootLogger.Error( '������ ��� �������� ������', E );
        TLogLogger.GetRootLogger.Error( '-' );
        Started := False;
        Exit;
      end;
  end;

  // ������ �������
  TLogLogger.GetRootLogger.Info('������ ��������');
  Started := True;
end;

procedure TARMTIService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
  var
    lv_Queue : TRemDM;
begin
  TLogLogger.GetRootLogger.Info( '��������� ������...' );
  // ��������� ��������� ������� (�� ����� 1 ������)
  if fQueueList.Count > 0 then
    begin
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '<������� �������� �� �����. �������� ��������� �������� � ������� 1 ������>' );
      Sleep( 60000 );
    end;
  if fQueueList.Count > 0 then
    begin
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '<������� �������� �� �����. �������� �������� �� �������>' );
      // ������� ��� ������� �� �������
      while fQueueList.Count > 0 do
        begin
          lv_Queue := fQueueList.Items[ fQueueList.Count - 1 ] as TRemDM;
          fQueueList.Remove( lv_Queue );
          lv_Queue.Free;
        end;
    end;
  fQueueList.Free;
  fQueueList := nil;
  CloseHandle( fHSemQueue );
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<�������� ������� ������� ��������>' );

  // ���������� SocketServer
  fSocketServer.Free;
  fSocketServer := nil;

  // ������ ����������
  TLogLogger.GetRootLogger.Info('������ �����������');
  Stopped := True;
end;

procedure TARMTIService.ServiceCreate(Sender: TObject);
var
 i: Integer;
 S: string;
begin
  fWinSockLoaded := False;

  //FManager := TQueryManager.Create;
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

procedure TARMTIService.ServiceDestroy(Sender: TObject);
begin
  //FreeAndNil(FManager);
end;

procedure TARMTIService.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  TLogLogger.GetRootLogger.Info('������ ��������������');
end;

procedure TARMTIService.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  TLogLogger.GetRootLogger.Info('������ ������ �������������');
end;

procedure TARMTIService.OnAddClient(Sender: TObject;
  Thread: TServerClientThread);
begin
  TLogLogger.GetRootLogger.Info( Format( '����������� �� ������� � IP: %s Port: %d', [ Thread.ClientSocket.RemoteAddress, Thread.ClientSocket.RemotePort ] ) );
end;

procedure TARMTIService.OnRemoveClient(Sender: TObject;
  Thread: TServerClientThread);
begin
  TLogLogger.GetRootLogger.Info( Format( '����������� �� ������� � IP: %s Port: %d �������', [ Thread.ClientSocket.RemoteAddress, Thread.ClientSocket.RemotePort ] ) );
end;

procedure TARMTIService.AddToQueue(AQuery: TRemDM);
begin
  if not AQuery.Active then
    if WaitForSingleObject( fHSemQueue, INFINITE ) = WAIT_OBJECT_0 then
      begin
        fQueueList.Add( AQuery );
        TLogLogger.GetRootLogger.Info( Format( '� ������� �������� ������ %s �� %s. �������� � �������: %d', [ AQuery.Key, AQuery.ConnectionName, fQueueList.Count ] ) );
        if not ReleaseSemaphore( fHSemQueue, 1, nil ) then
          TLogLogger.GetRootLogger.Error( Format( '������ ��� �������� �������� ������� � ���������� ���������: %d', [ GetLastError ] ) );
      end
  else
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( '������� �������� � ������ �������� �������� ������ ���������!' );
end;

procedure TARMTIService.RemoveFromQueue(AQuery: TRemDM);
begin
  if WaitForSingleObject( fHSemQueue, INFINITE ) = WAIT_OBJECT_0 then
    begin
      fQueueList.Remove( AQuery );
      TLogLogger.GetRootLogger.Info( Format( '�������� �� ������� ������ %s �� %s. �������� � �������: %d', [ AQuery.Key, AQuery.ConnectionName, fQueueList.Count ] ) );
      if not ReleaseSemaphore( fHSemQueue, 1, nil ) then
        TLogLogger.GetRootLogger.Error( Format( '������ ��� �������� �������� ������� � ���������� ���������: %d', [ GetLastError ] ) );
    end;
end;

end.
