unit clData;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect, ordersvr_TLB;

type
  TfdcSocketConnection = class(TSocketConnection)
  private
    fTransport : TSocketTransport;
  protected
    function CreateTransport: ITransport; override;
  public
    property Transport : TSocketTransport read fTransport;
  end;

  TLocalDM = class(TDataModule)
    dsOtvet: TClientDataSet;
    dsData: TClientDataSet;
    dsDK: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SocketConnectionAfterConnect(Sender: TObject);
    procedure SocketConnectionAfterDisconnect(Sender: TObject);
  private
    { Private declarations }
    fSocketConnection: TfdcSocketConnection;

    fInData  : TMemoryStream;
    fOutData : TMemoryStream;
    fAppSrv  : IRemoteDMDisp;
    fErrCode : HResult;
    fErrMsg  : string;
  public
    { Public declarations }
    procedure ExecQuery ( AKey : string );
    procedure CommitTransaction;
    procedure RollbackTransaction;

    property SocketConnection: TfdcSocketConnection read fSocketConnection;

    property InData  : TMemoryStream read fInData  write fInData;
    property OutData : TMemoryStream read fOutData write fOutData;

    property ErrCode : HResult read fErrCode;
    property ErrMsg  : string read fErrMsg;
  end;

var
  LocalDM: TLocalDM;

implementation

{$R *.dfm}

uses
  comConsts
 ,dxmdaset
 ,Variants
 ,Windows
 ,MidConst
 ,RTLConsts
 ,Log4D;

Const
  cBuild = '00004';

procedure TLocalDM.CommitTransaction;
begin
  if not Assigned( fAppSrv ) then
    Exit;

  fAppSrv.QueryCommit;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( '���������� �������������' );
end;

procedure TLocalDM.DataModuleCreate(Sender: TObject);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TLocalDM.DataModuleCreate> - start' );

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info('����� - ' + cBuild);

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug('�������� �������� socket - ����������');

  fSocketConnection := TfdcSocketConnection.Create( Self );
  with fSocketConnection do
    begin
      ServerGUID := '{BA47D127-6A50-4479-B9DB-981ED95FB3BA}';
      ServerName := 'ordersvr.RemoteDM';

      AfterConnect    := SocketConnectionAfterConnect;
      AfterDisconnect := SocketConnectionAfterDisconnect;
    end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug('�������� �������� soket - ���������� - ���������');

  fInData  := TMemoryStream.Create;
  fOutData := TMemoryStream.Create;
  fErrCode := cResOK;
  fErrMsg  := '';

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TLocalDM.DataModuleCreate> - exit' );
end;

procedure TLocalDM.ExecQuery( AKey: string ) ;
var
  iMsgSize    : OleVariant;
  vMsg        : OleVariant;
  vErrCode    : OleVariant;
  AMsg        : OleVariant;
  AMsgSize    : OleVariant;
  QMsg        : OleVariant;
  QMsgSize    : OleVariant;
  p           : Pointer;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TLocalDM.ExecQuery> - start' );
  try

    if fInData.Size > 0 then
    begin

      // �������� ������ �� ������

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '�������� �����' );
      fInData.Position := 0;
      QMsg := VarArrayCreate( [ 0, fInData.Size - 1 ], varByte );
      QMsgSize := VarArrayHighBound( QMsg, 1 ) - VarArrayLowBound( QMsg, 1 ) + 1; //Length( QMsg );
      p := VarArrayLock( QMsg );
      try
        fInData.ReadBuffer( p^, fInData.Size );
      finally
        VarArrayUnlock( QMsg );
      end;
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '�������� ����� - ���������' );

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '�������� ������ �� ������' );

      fAppSrv.SendData( QMsg, QMsgSize );

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '�������� ������ �� ������ - ���������' );

      // ���������� �������
      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( Format( '���������� ������� [%s] �� ������� ��', [AKey] ) );

      fAppSrv.Query( AKey );

      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( Format(  '������ [%s] �������� �� ������� ��', [AKey] ) );

      // ��������� ������
      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( '��������� ������ �� ������� ��' );

      fAppSrv.ReceiveAnswer( AMsg, AMsgSize );
      p := VarArrayLock( AMsg );
      try
        fOutData.WriteBuffer( p^, AMsgSize * SizeOf( Byte ) );
        fOutData.Position := 0;
      finally
        VarArrayUnLock( AMsg );
      end;

      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( '��������� ������ �� ������� �� - ���������' );

      // ��� ������
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '��������� ���� ������' );

      fAppSrv.GetLastError( vErrCode );
      fErrCode := vErrCode;
      fAppSrv.GetLastErrorMsg( iMsgSize, vMsg );
      fErrMsg := VarToStr( vMsg );

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '��������� ���� ������ - ���������' );
    end
      else
        TLogLogger.GetRootLogger.Info( '������ ����!' );
  except
    on E : Exception do
      begin
        TLogLogger.GetRootLogger.Fatal( '������ ��� ���������� �������', E );
        if fSocketConnection.Connected then
          fAppSrv.QueryRollback;
        if fErrCode = cResOK then
          fErrCode := cResQueryError;
      end;
  end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TLocalDM.ExecQuery> - exit' );
end;

procedure TLocalDM.DataModuleDestroy(Sender: TObject);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TLocalDM.DataModuleDestroy> - start' );

  FreeAndNil( fInData );
  FreeAndNil( fOutData );
{  if Assigned( fOutData ) then
    fOutData.Destroy;}

  if fSocketConnection.Connected then
    fSocketConnection.Close;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info('����');

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TLocalDM.DataModuleDestroy> - exit' );
end;

procedure TLocalDM.SocketConnectionAfterConnect(Sender: TObject);
begin
  fAppSrv := IRemoteDMDisp(IDispatch(fSocketConnection.AppServer));
  with fSocketConnection.Transport.Socket do
    fAppSrv.SetInfo( LocalHost, LocalAddress, LocalPort );
end;

procedure TLocalDM.RollbackTransaction;
begin
  if not Assigned( fAppSrv ) then
    Exit;

  fAppSrv.QueryRollback;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( '���������� ��������' );
end;

procedure TLocalDM.SocketConnectionAfterDisconnect(Sender: TObject);
begin
  fAppSrv := nil;
end;

{ TfdcSocketConnection }

function TfdcSocketConnection.CreateTransport: ITransport;
begin
  if SupportCallbacks then
    if not LoadWinSock2 then raise Exception.CreateRes(@SNoWinSock2);
  if (Address = '') and (Host = '') then
    raise ESocketConnectionError.CreateRes(@SNoAddress);
  fTransport := TSocketTransport.Create;
  fTransport.Host    := Host;
  fTransport.Address := Address;
  fTransport.Port    := Port;
  fTransport.InterceptGUID := InterceptGUID;
  Result := fTransport as ITransport;
end;

end.
