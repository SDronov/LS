unit osScktSrv;

interface

uses
  Classes, SysUtils, Windows, Messages,
  ScktComp, SConnect, ActiveX, MidConst, WinSock;

type
  TNotifyClient = procedure (Sender: TObject; Thread: TServerClientThread) of object;

{ TSocketDispatcher }
  TSocketDispatcher = class;

{ TSocketDispatcherThread }
  TSocketDispatcherThread = class(TServerClientThread, ISendDataBlock)
  private
    FRefCount: Integer;
    FInterpreter: TDataBlockInterpreter;
    FTransport: ITransport;
    FInterceptGUID: string;
    FLastActivity: TDateTime;
    FTimeout: TDateTime;
    FRegisteredOnly: Boolean;
  protected
    SocketDispatcher: TSocketDispatcher;
    function CreateServerTransport: ITransport; virtual;
    procedure AddClient;
    procedure RemoveClient;
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { ISendDataBlock }
    function Send(const Data: IDataBlock; WaitForResult: Boolean): IDataBlock; stdcall;
  public
    constructor Create(AOwner: TSocketDispatcher; CreateSuspended: Boolean;
      ASocket: TServerClientWinSocket; const InterceptGUID: string;
      Timeout: Integer; RegisteredOnly: Boolean);
    procedure ClientExecute; override;
    property LastActivity: TDateTime read FLastActivity;
  end;

{ TSocketDispatcher }
  TSocketDispatcher = class(TServerSocket)
  private
    FInterceptGUID: string;
    FTimeout: Integer;
    FRegisteredOnly: Boolean;
    FOnRemoveClient: TNotifyClient;
    FOnAddClient: TNotifyClient;
    procedure GetThread(Sender: TObject; ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
  published
    constructor Create(AOwner: TComponent); override;
    property InterceptGUID: string read FInterceptGUID write FInterceptGUID;
    property Timeout: Integer read FTimeout write FTimeout;
    property RegisteredOnly: Boolean read FRegisteredOnly write FRegisteredOnly;
    property OnAddClient: TNotifyClient read FOnAddClient write FOnAddClient;
    property OnRemoveClient: TNotifyClient read FOnRemoveClient write FOnRemoveClient;
  end;


implementation

uses
  Log4D;

{ TSocketDispatcherThread }

constructor TSocketDispatcherThread.Create(AOwner: TSocketDispatcher;
  CreateSuspended: Boolean; ASocket: TServerClientWinSocket;
  const InterceptGUID: string; Timeout: Integer; RegisteredOnly: Boolean);
begin
  SocketDispatcher := AOwner;
  FInterceptGUID := InterceptGUID;
  FTimeout := EncodeTime(Timeout div 60, Timeout mod 60, 0, 0);
  FLastActivity := Now;
  FRegisteredOnly := RegisteredOnly;
  inherited Create(CreateSuspended, ASocket);
end;

function TSocketDispatcherThread.CreateServerTransport: ITransport;
var
  SocketTransport: TSocketTransport;
begin
  SocketTransport := TSocketTransport.Create;
  SocketTransport.Socket := ClientSocket;
  SocketTransport.InterceptGUID := FInterceptGUID;
  Result := SocketTransport as ITransport;
end;

procedure TSocketDispatcherThread.AddClient;
begin
  with SocketDispatcher do
    if Assigned(OnAddClient) then OnAddClient(SocketDispatcher, Self);
end;

procedure TSocketDispatcherThread.RemoveClient;
begin
  with SocketDispatcher do
    if Assigned(OnRemoveClient) then OnRemoveClient(SocketDispatcher, Self);
end;

{ TSocketDispatcherThread.IUnknown }

function TSocketDispatcherThread.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

function TSocketDispatcherThread._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TSocketDispatcherThread._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

{ TSocketDispatcherThread.ISendDataBlock }

function TSocketDispatcherThread.Send(const Data: IDataBlock;
  WaitForResult: Boolean): IDataBlock;
begin
  FTransport.Send(Data);
  if WaitForResult then
    while True do
    begin
      Result := FTransport.Receive(True, 0);
      if Result = nil then break;
      if (Result.Signature and ResultSig) = ResultSig then
        break else
        FInterpreter.InterpretData(Result);
    end;
end;

procedure TSocketDispatcherThread.ClientExecute;
var
  Data: IDataBlock;
  msg: TMsg;
  Obj: ISendDataBlock;
  Event: THandle;
  WaitTime: DWord;
begin
  CoInitialize(nil);
  try
    Synchronize(AddClient);
    FTransport := CreateServerTransport;
    try
      Event := FTransport.GetWaitEvent;
      PeekMessage(msg, 0, WM_USER, WM_USER, PM_NOREMOVE);
      GetInterface(ISendDataBlock, Obj);
      if FRegisteredOnly then
        FInterpreter := TDataBlockInterpreter.Create(Obj, SSockets) else
        FInterpreter := TDataBlockInterpreter.Create(Obj, '');
      try
        Obj := nil;
        if FTimeout = 0 then
          WaitTime := INFINITE else
          WaitTime := 60000;
        while not Terminated and FTransport.Connected do
        try
          case MsgWaitForMultipleObjects(1, Event, False, WaitTime,
           QS_ALLEVENTS) of
            WAIT_OBJECT_0:
            begin
              WSAResetEvent(Event);
              Data := FTransport.Receive(False, 0);
              if Assigned(Data) then
              begin
                FLastActivity := Now;
                FInterpreter.InterpretData(Data);
                Data := nil;
                FLastActivity := Now;
              end;
            end;
            WAIT_OBJECT_0 + 1:
              while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
                DispatchMessage(msg);
            WAIT_TIMEOUT:
              if (FTimeout > 0) and ((Now - FLastActivity) > FTimeout) then
                FTransport.Connected := False;
          end;
        except
          FTransport.Connected := False;
        end;
      finally
        FInterpreter.Free;
        FInterpreter := nil;
      end;
    finally
      FTransport := nil;
    end;
  finally
    CoUninitialize;
    Synchronize(RemoveClient);
  end;
end;


{ TSocketDispatcher }

constructor TSocketDispatcher.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ServerType := stThreadBlocking;
  OnGetThread := GetThread;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Создан диспетчер сообщений>' );
end;

procedure TSocketDispatcher.GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Создаётся поток для подключения ' + ClientSocket.RemoteAddress + '>' );

  SocketThread := TSocketDispatcherThread.Create(Self, False, ClientSocket,
    InterceptGUID, Timeout, RegisteredOnly);

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Создан поток для подключения>' );
end;

end.
