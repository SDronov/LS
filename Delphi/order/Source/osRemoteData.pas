unit osRemoteData;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ordersvr_TLB, StdVcl, Provider, DB, OracleData, Oracle, IniFiles,
  QueryList, dxmdaset, Forms, Variants;

type
  TRemoteDM = class(TRemoteDataModule, IRemoteDM)
    OracleSession: TOracleSession;
    QueryList1: TQueryList;
    sqlInsert: TsqlOp;
    sqlBeginLoad: TsqlOp;
    qryQuery: TOracleQuery;
    sqlCreateAns: TsqlOp;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    FConnectionName : string;
    FActive         : Boolean;
    FParams         : TMemIniFile;
//    FLoadId         : Real;
    FErrCode        : Integer;
    FErrMsg         : string;
    FIsResult       : Boolean;
    FTypeQuery      : string;

    FHSem           : THandle;
    //8.8.16
    fQDate          : TDateTime;
    fQInn           : string;
    //
    FInData         : TMemoryStream;
    FOutData        : TMemoryStream;

    procedure SetActive(const Value: Boolean);
    //8.8.16
    procedure GetInnDate;
    function IsELS: boolean;
    //
    function GetKey: string;

    procedure GetOutput(Lines: String);
    procedure Enqueue;

  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Query(const TypeQuery: WideString); safecall;
    procedure QueryCommit; safecall;
    procedure QueryRollback; safecall;
    procedure SetInfo(const Host, IP: WideString; Port: Integer); safecall;
    procedure GetLastError(var ErrCode: OleVariant); safecall;
    procedure GetLastErrorMsg(var Size, ErrMsg: OleVariant); safecall;
    procedure CreateOtvet(pKey, pKeyEx, pMessage :String);
    procedure ReceiveAnswer(var AMsg, AMsgSize: OleVariant); safecall;
    procedure SendData(var QMsg, QMsgSize: OleVariant); safecall;
  public
    procedure ExecuteQuery;
    property Active         : Boolean read FActive write SetActive;
    property ConnectionName : string read FConnectionName;
    property Key            : string read GetKey;
  end;

implementation

uses
  osService
 ,Log4D
 ,fdcExceptions
 ,Math
 ,StrUtils;

{$R *.DFM}

class procedure TRemoteDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRemoteDM.GetOutput(Lines: String);
var
  S: string;
  Status: Integer;
begin
  repeat
    OracleSession.DBMS_Output.Get_Line(S, Status);
    if Status <> glSuccess then
      Break;
    Lines := Lines + S + ' ';
  until False;
end;

procedure TRemoteDM.ExecuteQuery;
var
  HasError  : Integer;
//  ResultCount : Integer;
  LOBIn:  TLOBLocator;
  LOBOut: TLOBLocator;
begin
	ShortDateFormat := 'mm/dd/yyyy';
	DateSeparator := '/';
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<��������� ������� " %s ">', [FTypeQuery]));
    //8.8.16
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( fConnectionName + ' <�������� ��������� � ���>' );

  if (FtypeQuery = 'R') or (FtypeQuery = 'E') then
    begin
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
        Debug(fConnectionName +'<������ ���� R ��� E. �������� �� ��������� �������>');
      GetInnDate;
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
        Debug( Format(fConnectionName +'<��� �������: %s>', [fQInn] ) );
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
        Debug( Format(fConnectionName +'<���� �������: %s>', [DateToStr(fQDate)] ) );
      if IsELS then
        try
          with TLogLogger.GetRootLogger do
            if IsDebugEnabled then
            Debug( fConnectionName + ' <������������� � �� ���>' );
          if OracleSession.Connected then
            begin
              OracleSession.Connected := False;
              OracleSession.LogonUsername := ORDERService.DBFTSUserName;
              OracleSession.LogonDatabase := ORDERService.DBFTSServer;
              OracleSession.LogonPassword := ORDERService.DBFTSPassword;
              OracleSession.Connected := True;
            end;
        except
          on E : Exception do
            begin
              TLogLogger.GetRootLogger.Fatal( '<������ ����������� � �� ���>', E );
              raise;
            end;
        end
      else
        begin
          with TLogLogger.GetRootLogger do
            if IsDebugEnabled then
            Debug( fConnectionName + ' <�������������� � �� �������>' );
        end;
    end;
  //
  if not OracleSession.Connected then
  begin
    CreateOtvet('F','��� ������� � �� ��','��� ������� � �� ������� ������');
    Exit;
  end;

  HasError := 0;
  OracleSession.DBMS_Output.Enable();

  // ���������� �������
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<������ ���������� ������� " %s " � Oracle >', [FTypeQuery]));

  try
    //FLoadId := sqlBeginLoad.Exec;
    LOBIn := TLOBLocator.CreateTemporary( qryQuery.Session, otCLOB, True );
    LOBOut := TLOBLocator.Create( qryQuery.Session, otCLOB );
    try
      LOBIn.CopyFrom( FInData, FInData.Size );
      qryQuery.SetVariable( 'Key', GetKey );
      //qryQuery.SetVariable( 'LoadId', FLoadId );
      qryQuery.SetComplexVariable( 'InData', LOBIn );
      qryQuery.SetComplexVariable( 'OutData', LOBOut );
      qryQuery.Execute;
      if not LOBOut.IsNull then
        FOutData.CopyFrom( LOBOut, LOBOut.Size );
    finally
      LOBIn.Free;
      LOBOut.Free;
    end;

  except
    on E: Exception do
    begin
      FErrCode := 1;
      if FErrMsg = '' then fErrMsg := '������ ���������� ��� - <' + E.Message+'>';
      CreateOtvet( 'F', '������ ���������� ���', E.Message );
      OracleSession.Rollback;
      Exit;
    end;
  end;

  GetOutput(fErrMsg);
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<���������� ���������� �������  " %s " � Oracle>', [FTypeQuery]));

  if HasError = 1 then OracleSession.Rollback;
end;

procedure  TRemoteDM.Enqueue;
  var
    WaitTime : DWORD;
begin
  //��������� � �������
  ORDERService.AddToQueue( Self );

  // �������� ����������
  if ORDERService.QueueTimeOut = 0 then
    WaitTime := INFINITE
  else
    WaitTime := ORDERService.QueueTimeOut * 60000;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<�������� �������...>' );
  case WaitForSingleObject( fHSem, WaitTime ) of
    WAIT_OBJECT_0 : begin
                      with TLogLogger.GetRootLogger do
                        if IsDebugEnabled then
                          Debug( '<������� ������� ���������� �������>' );
                      ExecuteQuery;
                    end;

    WAIT_TIMEOUT : begin
                     TLogLogger.GetRootLogger.Info( '������ ���������� ������� �� ��������' );
                     QueryRollback;
                   end;
  end;
end;

procedure TRemoteDM.Query(const TypeQuery: WideString);
begin
  FTypeQuery := TypeQuery;

  if ( FTypeQuery = 'R' ) or ( FTypeQuery = 'T' ) then
  begin
    try
      ExecuteQuery;
    finally
      OracleSession.Rollback;
    end;
  end
  else
    Enqueue;
end;

procedure TRemoteDM.QueryCommit;
begin
  if OracleSession.Connected then
  begin
    OracleSession.Commit;
    fIsResult := True;
//    if ( FTypeQuery <> 'R' ) and ( FTypeQuery <> 'T' ) then
    ORDERService.RemoveFromQueue( Self );
    TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<������������ ���������� ������� " %s ">', [FTypeQuery]));
  end;
end;

procedure TRemoteDM.QueryRollback;
begin
  if OracleSession.Connected then
  begin
    OracleSession.Rollback;
//    if ( FTypeQuery <> 'R' ) and ( FTypeQuery <> 'T' ) and not fIsResult  then
    ORDERService.RemoveFromQueue( Self );
    fIsResult := True;
    TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<������ ���������� ������� " %s ">', [FTypeQuery]));
  end;
end;

procedure TRemoteDM.CreateOtvet(pKey, pKeyEx, pMessage :String);
begin

  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<������ : - %s>' ,[pMessage]) );

  {if not mdOtvet.IsEmpty then exit;


  mdOtvet.Open;
  mdOtvet.Insert;
  mdOtvet.Edit;
  mdOtvet.FieldByName('G_NDOK').AsString := FTPO_NUM;
  mdOtvet.FieldByName('KEY').AsString    := pKey;
  mdOtvet.FieldByName('KEY_EX').AsString := pKeyEx;
  mdOtvet.Post;

  DataSetProvider.DataSet := mdOtvet;
  mdOtvet.Open;}

end;

procedure TRemoteDM.RemoteDataModuleCreate(Sender: TObject);
begin
  fIsResult      := False;
  fActive         := False;
  fConnectionName := '<�� ����������>';
  fErrCode        := 0;
  fErrMsg         := '';

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( fConnectionName + ' <����������� � ��>' );
  try
    if  not OracleSession.Connected then
      begin
        OracleSession.LogonUsername := ORDERService.DBUserName;
        OracleSession.LogonDatabase := ORDERService.DBServer;
        OracleSession.LogonPassword := ORDERService.DBPassword;
        OracleSession.Connected := True;
      end;
  except
    on E : Exception do
      begin
        TLogLogger.GetRootLogger.Fatal( '<������ ��� ����������� � �� ��>', E );
        raise;
      end;
  end;

  FParams := TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  fInData  := TMemoryStream.Create;
  fOutData := TMemoryStream.Create;

  fHSem := CreateSemaphore( nil, 0, 1, nil );
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format('<[%s] ������ ������� ��� �������: %d>', [fConnectionName, fHSem] ) );

end;

procedure TRemoteDM.RemoteDataModuleDestroy(Sender: TObject);
begin
  CloseHandle( fHSem );

//  if (FTypeQuery <> 'R') and not fIsResult then
//  if not fIsResult then
  ORDERService.RemoveFromQueue( Self );

  if  FParams <> nil then FreeAndNil(FParams);

  FreeAndNil ( FInData );
  FreeAndNil ( FOutData );

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( fConnectionName + ' <���������� �� ��>' );

  if OracleSession.Connected then
  begin
    OracleSession.Rollback;
    OracleSession.Connected := False;
  end;
end;

procedure TRemoteDM.SetInfo(const Host, IP: WideString; Port: Integer);
begin
  fConnectionName := '[' + Host + '_' + IP + '_' + IntToStr(Port) + ']';
  TLogLogger.GetRootLogger.Info( Format( '<������ ����������������� ���: %s>', [fConnectionName] ) );
end;

procedure TRemoteDM.SetActive(const Value: Boolean);
begin
  fActive := Value;

  if fActive then
    if not ReleaseSemaphore( fHSem, 1, nil ) then
      begin
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
            Debug( Format( '������ ��� �������� �������� ������� � ���������� ���������: %d', [ Windows.GetLastError ] ) );
        fActive := False;
      end;
end;

function TRemoteDM.GetKey: string;
begin
  Result := FTypeQuery;
end;
//8.8.16
procedure TRemoteDM.GetInnDate;
var
  ik1 : string;
  iDates : String;
  fInnb, fInne, fDteb, fDtee: integer;
begin
  SetString(ik1, nil, FInData.Size);
  FInData.Read(Pointer(ik1)^, FInData.Size);
  FInData.Position := 0;
  if (FtypeQuery = 'R') then
    begin
      fInnb := Pos('<fdl:INN>',ik1);
      fInne := Pos('</fdl:INN>',ik1);
      if (fInnb > 0) and (fInne > 0) then
        begin
          fQInn := Trim(Copy(ik1, fInnb +9, fInne - fInnb-9));
          fQDate := Now;
        end
      else
        fQInn := '';
    end;
  if (FtypeQuery = 'E') then
    begin
      fInnb := Pos('<INN>',ik1);
      fInne := Pos('</INN>',ik1);
      if (fInnb > 0) and (fInne > 0) then
        begin
          fQInn := Trim(Copy(ik1, fInnb +5, fInne - fInnb-5));
          fDteb := Pos('<DAT_TPO>',ik1);
          fDtee := Pos('</DAT_TPO>',ik1)-15;
          if (fDteb > 0) and (fDtee > 0) then
            begin
              iDates := Trim(Copy(ik1, fDteb +9, fDtee - fDteb-9));
              iDates := Copy(iDates,6,2)+'/'+Copy(iDates,9,2)+'/'+Copy(iDates,1,4);
              fQDate := StrToDate(iDates);
            end
          else
            fQDate := Now;
        end
      else
        fQInn := '';
    end;
end;

function TRemoteDM.IsELS: boolean;
vaR
  iExst   : integer;
begin
  iExst := ORDERService.InnKppList.IndexOf(fQInn);
    if (iExst>=0) then
      begin
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
          Debug(fConnectionName + '<��� ������� ������ � ������ ���>');
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
          Debug(fConnectionName + '<���� �������� � ���� ���: ' + ORDERService.DateList[iExst] + ' >');
      if (fQDate >= StrToDate(ORDERService.DateList[iExst])) then
        begin
          with TLogLogger.GetRootLogger do
            if IsDebugEnabled then
            Debug(fConnectionName + '<���� ������� ��������� ���� � ������ ���>');
          Result := true
        end
      else
        begin
          with TLogLogger.GetRootLogger do
            if IsDebugEnabled then
            Debug(fConnectionName + '<���� ������� �� ��������� ���� � ������ ���>');
          Result := false
        end;
      end
    else
      begin
        Result := false;
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
          Debug(fConnectionName + '<��� ������� �� ������ � ������ ���>');
      end;
end;
//
procedure TRemoteDM.GetLastError(var ErrCode: OleVariant);
begin
  ErrCode := FErrCode;
end;

procedure TRemoteDM.GetLastErrorMsg(var Size, ErrMsg: OleVariant);
begin
  Size := Length( FErrMsg );
  ErrMsg := FErrMsg;
end;

procedure TRemoteDM.ReceiveAnswer(var AMsg, AMsgSize: OleVariant);
var
  p : Pointer;
begin
  FOutData.Position := 0;
  AMsg := VarArrayCreate( [ 0, FOutData.Size - 1 ], varByte );
  AMsgSize := VarArrayHighBound( AMsg, 1 ) - VarArrayLowBound( AMsg, 1 ) + 1;
  p := VarArrayLock( AMsg );
  try
    FOutData.ReadBuffer( p^, FOutData.Size );
  finally
    VarArrayUnlock( AMsg );
  end;

  // ���������� �������
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<����� �� ������ " %s " ������� �������>', [FTypeQuery]));
end;

procedure TRemoteDM.SendData(var QMsg, QMsgSize: OleVariant);
var
  p : Pointer;
begin
  p := VarArrayLock( QMsg );
  try
    FInData.Position := 0;
    FInData.WriteBuffer( p^, QMsgSize * SizeOf( Byte ) );
    FInData.Position := 0;
  finally
    VarArrayUnLock( QMsg );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRemoteDM,
    Class_RemoteDM, ciMultiInstance, tmApartment);
end.
