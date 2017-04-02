unit uDBService;

interface

uses
  SysUtils, Classes, uOptions, Oracle, DB, OracleData, uInterfaces;

type
  TdmDBService = class(TDataModule, IDBService)
    OracleSession: TOracleSession;
    qryCommon: TOracleQuery;
    dsetEnvelops: TOracleDataSet;
    qrySaveMsg: TOracleQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsetEnvelopsBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    fOptions: TieOptions;
    fFileService : IFileService;
    function GetSubsystemCodes : string;
    procedure LogOn_to_DB;
  public
    { Public declarations }
    property Options : TieOptions read fOptions write fOptions;
    property FileService : IFileService read fFileService write fFileService;

    procedure ExecRequests;
    procedure SaveMessage(AStream : TStream; const ATag : string );
  end;

var
  dmDBService: TdmDBService;

implementation

{$R *.dfm}

Uses
  Log4D;

{ TdmDBService }

procedure TdmDBService.ExecRequests;
  var
    lv_Stream : TMemoryStream;
begin
  if OracleSession.Connected then
    OracleSession.LogOff;

  if not Assigned( fOptions ) then
    raise Exception.Create( '�� ����������� ���������'#$D#$A );

  if fOptions.DataBase = '' then
    raise Exception.Create( '�� ������ �������� DataBase'#$D#$A );

  if fOptions.UserName = '' then
    raise Exception.Create( '�� ������ �������� UserName'#$D#$A );

  if fOptions.Password = '' then
    raise Exception.Create( '�� ������ �������� Password'#$D#$A );

  if not Assigned( fFileService ) then
    raise Exception.Create( '�� ������ �������� ������ [IFileService]'#$D#$A );

  try
    LogOn_to_DB;
    dsetEnvelops.Open;
    if not dsetEnvelops.IsEmpty then
      TLogLogger.GetRootLogger.Info( '�������� ���������. � ��������: ' + IntToStr( dsetEnvelops.RecordCount ) );
    while not dsetEnvelops.Eof do
      begin
        try
          TLogLogger.GetRootLogger.Info(
              '�������� ��������� ��� ' + dsetEnvelops.FieldByName( 'receiver_soft_code' ).AsString + ' ID = ' + dsetEnvelops.FieldByName( 'envelope_id' ).AsString
            );

          // ��������� ����
          lv_Stream := TMemoryStream.Create;
          try
            TBlobField( dsetEnvelops.FieldByName( 'data' ) ).SaveToStream( lv_Stream );
            fFileService.SendStream(
                lv_Stream
               ,dsetEnvelops.FieldByName( 'DstCustomCode' ).AsString
               ,dsetEnvelops.FieldByName( 'DstCustomsName' ).AsString
               ,dsetEnvelops.FieldByName( 'SrcCustomsName' ).AsString
               ,dsetEnvelops.FieldByName( 'TTT' ).AsString
               ,dsetEnvelops.FieldByName( 'receiver_soft_code' ).AsString
               ,dsetEnvelops.FieldByName( 'envelope_id' ).AsInteger
              );
          finally
            FreeAndNil( lv_Stream );
          end;
          {vXMLFileName := fOptions.CurDir + dsetEnvelops.FieldByName( 'CustomCode' ).AsString + '_' + dsetEnvelops.FieldByName( 'envelope_id' ).AsString + '.xml';
          if fOptions.Debug then
            TLogLogger.GetRootLogger.Debug(
                '���������� XML. ��� �����: ' + vXMLFileName
              );
          TBlobField( dsetEnvelops.FieldByName( 'data' ) ).SaveToFile( vXMLFileName );}

          // ���������� ������ ���������
          if fOptions.Debug then
            TLogLogger.GetRootLogger.Debug(
                '��������� ������� "����������" ���������.'
              );
          qryCommon.SQL.Clear;
          qryCommon.SQL.Add( 'UPDATE exch_messages SET status = 1 WHERE message_id = ' + dsetEnvelops.FieldByName( 'message_id' ).AsString );
          qryCommon.Execute;

          OracleSession.Commit;
        except
          OracleSession.Rollback;
          raise;
        end;

        dsetEnvelops.Next;
      end;
  finally
    if OracleSession.Connected then
      OracleSession.LogOff;
  end;
end;

procedure TdmDBService.DataModuleCreate(Sender: TObject);
begin
  fOptions := nil;
end;

function TdmDBService.GetSubsystemCodes: string;
begin
  Result := '';

  if not Assigned( fOptions ) then
    Exit;

  if fOptions.PrivilegesEnebled then
    Result := Result + ',''ASPRIVILEGES''';
  if fOptions.DebtEnebled then
    Result := Result + ',''ASDEBT''';
  if fOptions.FinesEnebled then
    Result := Result + ',''ASFINES''';
  if fOptions.CostEnebled then
    Result := Result + ',''ASKTS''';

  Result := Copy( Result, 2, Length( Result ) - 1 );
end;

procedure TdmDBService.dsetEnvelopsBeforeOpen(DataSet: TDataSet);
begin
  dsetEnvelops.SetVariable( 'SUBSYSTEM_CODES', GetSubsystemCodes );
end;

procedure TdmDBService.DataModuleDestroy(Sender: TObject);
begin
  fOptions := nil;
end;

procedure TdmDBService.SaveMessage(AStream: TStream; const ATag: string);
var
  vCLOB : TLOBLocator;
  vTag : string;
begin
  if Assigned(AStream) then
    begin
      LogOn_to_DB;
      try
        vCLOB := TLOBLocator.CreateTemporary(OracleSession, otCLOB, True);
        try
          AStream.Position := 0;
          vCLOB.CopyFrom(AStream, AStream.Size);
          if ATag = '' then
            vTag := 'IncomeExchangeService'
          else
            vTag := ATag;
          qrySaveMsg.SetVariable('VTAG', vTag);
          qrySaveMsg.SetComplexVariable('VDATA', vCLOB);
          qrySaveMsg.Execute;
          OracleSession.Commit;
        finally
          FreeAndNil(vCLOB);
        end;
      finally
        if OracleSession.Connected then
          OracleSession.LogOff;
      end;
    end;
end;

procedure TdmDBService.LogOn_to_DB;
begin
    with OracleSession, fOptions do
    begin
      if Connected then LogOff;
      LogonDatabase := DataBase;
      LogonUsername := UserName;
      LogonPassword := Password;

      LogOn;

      if not Connected then
        raise Exception.Create( '�� ������ ������������ � �� ��� "������� �����-�" � ���������� �����������'#$D#$A );

      if fOptions.Debug then
        TLogLogger.GetRootLogger.Debug(
            '����������� � �� ��� "������� �����-�" ���������'
          );
    end;

    if ( fOptions.SchemeName <> '' ) and
       ( fOptions.SchemeName <> fOptions.UserName )then
      begin
        qryCommon.SQL.Clear;
        qryCommon.SQL.Add( 'ALTER SESSION SET CURRENT_SCHEMA = ' + fOptions.SchemeName );
        qryCommon.Execute;

        if fOptions.Debug then
          TLogLogger.GetRootLogger.Debug(
              '������� ����� ��������'
            );
      end;
end;

end.
