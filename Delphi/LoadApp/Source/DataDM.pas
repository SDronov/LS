unit DataDM;

interface

uses
  SysUtils, Classes, Graphics, DB, VKDBFDataSet, Oracle, fdcOracleSession, QueryList,
  OracleMonitor, OracleData, FDCCustomDataset, fdcQuery, IniFiles, PropSetIntf,
  fdcUtils;

type

  TLoadInfo =  record
    Total:  integer;
    Done :  integer;
    ErrorCount: integer;
    NewCount:  integer;
    ModifyCount: integer;
    SkipCount: integer;
  end;

  PLoadInfo = ^TLoadInfo;

  TMainData = class(TDataModule)
    QueryList1: TQueryList;
    sqlMergePP: TsqlOp;
    VKDBFNTX: TVKDBFNTX;
    Session: TfdcOracleSession;
    sqlAddGTD: TsqlOp;
    sqlAddCharge1: TsqlOp;
    sqlAddDeclPayment1: TsqlOp;
    sqlGtd2Plat: TsqlOp;
    sqlIsEmpty: TsqlOp;
    sqlClear: TsqlOp;
    sqlConvert: TsqlOp;
    sqlGetErrors: TsqlOp;
    sqlMergePP2_: TsqlOp;
    sqlInLegPay: TsqlOp;
    sqlGTDIn: TsqlOp;
    qryGTD: TOracleQuery;
    qryGoods: TOracleQuery;
    qryGtd2Plt: TOracleQuery;
    sqlAddLegPay: TsqlOp;
    qryConvert: TOracleQuery;
    qryAddLegPay: TOracleQuery;
    sqlGetProcInfo: TsqlOp;
    qryError: TOracleQuery;
    sqlRollback: TsqlOp;
    sqlPlDOK: TsqlOp;
    sqlGetMoveDate: TsqlOp;
    qryCanLoad: TOracleQuery;
    dsCheckTask: TfdcQuery;
    qryLoadFile: TOracleQuery;
    dsRegEvent: TfdcQuery;
    sqlSetLoadMode: TsqlOp;
    QueryList: TQueryList;
    sqlSetKind: TsqlOp;
    sqlvaluebool: TsqlOp;
    sqlvaluestring: TsqlOp;
    sqlvaluenumber: TsqlOp;
    sqlvaluedatetime: TsqlOp;
    sqlGetProps: TsqlOp;
    sqlSetSchema: TsqlOp;
    sqlOrgProps: TsqlOp;
    sqlGetServerDate: TsqlOp;
    sqlSetAccDate: TsqlOp;
    sqlGetUserLogin: TsqlOp;
    sqlUserChangePassword: TsqlOp;
    sqlSetExpDate: TsqlOp;
    sqlGetUserExpDate: TsqlOp;
    pkgCommon: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure SessionAfterLogOn(Sender: TOracleSession);
  private
    FCustomsLevel : Integer;
    FCustomsID          : Integer;
    FCustomsCode        : string;
    FSoftCustomsCode    : string;
    FForceDrop          : boolean;
    FDataBasePrevVer    : boolean;
    procedure ReadSchemaParams;
    procedure InternalLoad(Op: TSqlOp; IniMem: TMemIniFile; const ASectionName: String = '';
      const APropName: String = '');

  public
    function IsExportMode: Boolean;
    function IsImportMode: Boolean;
    function GetCustomsID: integer;
    function GetCustomsLevel: integer;
    function GetCustomsCode: string;
    function GetSoftCustomsCode: string;
    function EnableForceDropObject: boolean;
    function GetServerDate: TDateTime;
    function GetConnectionString: string;
    function GetSystemValue(const Name: string; AValueType: TRegValueType): Variant; overload;
    function GetSystemValue(const Name: string; AValueType: TRegValueType; const DefValue: Variant): Variant; overload;
    function MovePP(DataSet: TDataSet; UseRest: Boolean = False): double;
    function MoveSoftLandPP(DataSet: TDataSet; UseRest: Boolean = False): double;
    function MoveGTD(DataSet: TDataSet): double;
//    function AddDeclCharge(const DeclID: double; DataSet: TDataSet): double;
    function CanLoad(aDate: TDateTime): boolean;
    function LoadDbf(const FileName, TableName, ColMap: string; LoadInfo: PLoadInfo): integer;
    function LoadStream(Stream: TStream; const TableName, ColMap: string; LoadInfo: PLoadInfo): integer;
    function CheckTask(const TaskName: String; doRaise : boolean = False): Boolean;
    // Регистрация события
    function GetUserExpDate: string;
    procedure RegisterEvent(TypeCode:String; EvtNum:String;
      Param1:String = ''; Param2:String = ''; Param3:String = ''; Param4:String = ''; Param5:String = '');
    procedure GetDBAppParams(IniMem: TMemIniFile; const ASectionName: String = '';
      const APropName: String = '');
  end;

Const
  clYellowLight     : TColor = $00BFFFFF;
  clYellowFocused   : TColor = $0000A4A4;
  clBlueDark        : TColor = $00C56A31;
  clBlueLight       : TColor = $00F7EAD9;
  clBlueBright      : TColor = $00FF953D;
  clBlueSky         : TColor = $00EBC4A4;

  clGold            : TColor = $0047D5FE;
  clGoldDark        : TColor = $0001BDF3;

  clGreyLight       : TColor = $00E2EFF1;
  clGreyDark        : TColor = $00B9D9DD;

  clGreenBright     : TColor = $0082E887;
  clGreenLight      : TColor = $00C9F5CB;
  clGreenObscured   : TColor = $00ACF0AF;
  clGreenDark       : TColor = $0044DD4B;

  clSilverDark      : TColor = $00A6A6A6;

  clLightRed        : TColor = $00B4B7EB;
  clLightRedFocused : TColor = $00363EC9;

var
  cCustomLevel_FTS     :Integer = 0;
  cCustomLevel_RTU     :Integer = 1;
  cCustomLevel_T       :Integer = 2;
  cCustomLevel_KNP_FTS :Integer = 3;
  cCustomLevel_KNP_RTU :Integer = 4;
  MainData: TMainData;

implementation

uses Forms, AppInf, Variants, Windows, fdcMessages, StrUtils;


{$R *.dfm}


procedure TMainData.DataModuleCreate(Sender: TObject);
begin
  SetAppSession(Session);
end;

function TMainData.GetUserExpDate: string;
begin
  Result := sqlGetUserExpDate.Exec;
end;

function TMainData.MoveGTD(DataSet: TDataSet): double;
begin
  sqlAddGTD.DataSet := DataSet;
  sqlMergePP['result'] := 0.0;
  Result := sqlAddGTD.Exec;
end;

function TMainData.MovePP(DataSet: TDataSet; UseRest: Boolean = False): double;
begin
  sqlMergePP.DataSet := DataSet;
  // остатки - код #4
//  if UseRest then sqlMergePP.ParamValues['psumma'] := DataSet['summa']
//    else sqlMergePP.ParamValues['psumma'] := Null;
  if DataSet['ST2'] <> 4 then sqlMergePP['psumma'] := DataSet['ost']
    else sqlMergePP['psumma'] := Null;
  sqlMergePP.ParamValues['result'] := 0.0;
  Result := sqlMergePP.Exec;
//  if sqlMergePP['errtext'] <> '' then
//      Result := 0;
end;

function TMainData.MoveSoftLandPP(DataSet: TDataSet;
  UseRest: Boolean): double;
var
  S: String;
begin
  Assert(False, 'SoftLand - не поддерживается');
//  S := DataSet['DESTMEMO'];
//  sqlMergePP2.DataSet := DataSet;
//  Result := sqlMergePP2.Exec('memo', s);
end;


function TMainData.CanLoad(aDate: TDateTime): boolean;
begin
  try
    qryCanLoad.SetVariable('pDate', aDate);
    qryCanLoad.Execute;
    if (qryCanLoad.GetVariable('CanLoad') = 0) then
      if (MessageBox(MB_APPLMODAL
                     ,PChar(Format('%s'#13#10'Выполнить перенос остатков?', [qryCanLoad.GetVariable('pText')]))
                     ,PChar('Внимание')
                     ,MB_YESNO or MB_ICONQUESTION) = idYes) then
        Result := True
      else
        Result := False
    else
      Result := True;
  except
    Result := True;
  end;
end;

function TMainData.LoadDbf(const FileName, TableName, ColMap: string; LoadInfo: PLoadInfo): integer;
var
  F: TFileStream;
begin
  F := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    Result := LoadStream(F, TableName, ColMap, LoadInfo);
  finally
    F.Free;
  end;
end;

function TMainData.LoadStream(Stream: TStream; const TableName,
  ColMap: string; LoadInfo: PLoadInfo): integer;
var
  LOB: TLOBLocator;
begin
  LOB := TLOBLocator.CreateTemporary(Session, otBLOB, True);
  try
    LOB.CopyFrom(Stream, Stream.Size - Stream.Position);
    Lob.Trim;
    qryLoadFile.SetComplexVariable('file', LOB);
    qryLoadFile.SetVariable('TableName', TableName);
    qryLoadFile.SetVariable('ColMap', ColMap);
    qryLoadFile.Execute;
    Result := qryLoadFile.GetVariable('result');
    if LoadInfo <> nil then
    begin
      LoadInfo.Total := qryLoadFile.GetVariable('v1');
      LoadInfo.Done := qryLoadFile.GetVariable('v2');
      LoadInfo.ErrorCount := qryLoadFile.GetVariable('v3');
      LoadInfo.NewCount := qryLoadFile.GetVariable('v4');
      LoadInfo.ModifyCount := qryLoadFile.GetVariable('v5');
      LoadInfo.SkipCount := qryLoadFile.GetVariable('v6');
    end;
  finally
      LOB.Free;
  end;
end;

function TMainData.CheckTask(const TaskName: String; doRaise : boolean = False): Boolean;
begin
   dsCheckTask.ParamByName('taskname').Value := TaskName;
   try
     dsCheckTask.ExecSQL;
     Result := True;
   except
     if doRaise then
       raise
     else
     begin
       Application.HandleException(Self);
       Result := False;
     end;
   end;
end;

// Регистрация события
procedure TMainData.RegisterEvent(TypeCode:String; EvtNum:String;
  Param1:String = ''; Param2:String = ''; Param3:String = ''; Param4:String = ''; Param5:String = '');
begin
  dsRegEvent.ParamByName('TypeCode').AsString := TypeCode;
  dsRegEvent.ParamByName('EvtNum').AsString := EvtNum;
  if Param1 = ''
  then dsRegEvent.ParamByName('P1').Clear
  else dsRegEvent.ParamByName('P1').AsString := Param1;
  if Param2 = ''
  then dsRegEvent.ParamByName('P2').Clear
  else dsRegEvent.ParamByName('P2').AsString := Param2;
  if Param3 = ''
  then dsRegEvent.ParamByName('P3').Clear
  else dsRegEvent.ParamByName('P3').AsString := Param3;
  if Param4 = ''
  then dsRegEvent.ParamByName('P4').Clear
  else dsRegEvent.ParamByName('P4').AsString := Param4;
  if Param5 = ''
  then dsRegEvent.ParamByName('P5').Clear
  else dsRegEvent.ParamByName('P5').AsString := Param5;

  dsRegEvent.ExecSQL;
end;

procedure TMainData.GetDBAppParams(IniMem: TMemIniFile; const ASectionName,
  APropName: String);
begin
  InternalLoad(sqlGetProps, IniMem, ASectionName, APropName);
end;

procedure TMainData.InternalLoad(Op: TSqlOp; IniMem: TMemIniFile; const ASectionName,
  APropName: String);
var
  Query: TOracleQuery;
begin
  IniMem.Clear;
  try
    Query := Op.Query('s;n', [ASectionName, APropName]);
    while not Query.Eof do
    begin
      IniMem.WriteString(Query.FieldAsString(0)
                         ,Query.FieldAsString(1)
                         ,Query.FieldAsString(2)
                         );
      Query.Next;
    end;
  except
  	on E:Exception do
     begin
       SetPropLoader(nil);
//       raise;
     end;
  end;  // try/except
end;

function TMainData.GetCustomsLevel: Integer;
begin
  Result := FCustomsLevel;
end;

function TMainData.GetCustomsCode: string;
begin
  Result := FCustomsCode;
end;

function TMainData.GetSoftCustomsCode: string;
begin
  Result := FSoftCustomsCode;
end;

function TMainData.GetCustomsID: integer;
begin
  Result := FCustomsID;
end;

function TMainData.EnableForceDropObject: boolean;
begin
  Result := FForceDrop;
end;

function TMainData.IsExportMode: Boolean;
begin
  Result := FDataBasePrevVer;
end;

function TMainData.IsImportMode: Boolean;
begin
  Result := not IsExportMode;
end;

procedure TMainData.SessionAfterLogOn(Sender: TOracleSession);
begin
  if Sender.Connected then
    ReadSchemaParams;
end;

procedure TMainData.ReadSchemaParams;
var
  pVal, pVer: string;

begin
  try
    pVer := GetSystemValue('Version', rvString);
    FDataBasePrevVer := ( LeftStr( pVer, 2) = '6.' );
  except
    on E: Exception do
      ErrorDlg(Exception.CreateFmt('Не удается прочитать версию системы! [%s]', [E.Message]));
  end;
  if IsImportMode then
    begin
      pkgCommon.PackageName := 'p_Params';
      FCustomsID       := pkgCommon.GetIntegerVariable( 'cCustomsId'       );
      FCustomsLevel    := pkgCommon.GetIntegerVariable( 'cCustomLevel'     );
      FCustomsCode     := pkgCommon.GetStringVariable ( 'cCustomCode'      );
      FSoftCustomsCode := pkgCommon.GetStringVariable ( 'cSoftCustomsCode' );
      pVal             := pkgCommon.GetStringVariable ( 'ForceDropObject'  );
      FForceDrop       := IfElse(pVal = 'Y', True, False );
      pkgCommon.PackageName := 'p_Consts';
      cCustomLevel_FTS     := pkgCommon.GetIntegerVariable( 'cCustomLevel_FTS'     );
      cCustomLevel_RTU     := pkgCommon.GetIntegerVariable( 'cCustomLevel_RTU'     );
      cCustomLevel_T       := pkgCommon.GetIntegerVariable( 'cCustomLevel_T'       );
      cCustomLevel_KNP_FTS := pkgCommon.GetIntegerVariable( 'cCustomLevel_KNP_FTS' );
      cCustomLevel_KNP_RTU := pkgCommon.GetIntegerVariable( 'cCustomLevel_KNP_RTU' );
    end;
end;
function TMainData.GetSystemValue(const Name: string;
  AValueType: TRegValueType): Variant;
begin
  Result := GetSystemValue(Name, AValueType, NULL);
end;

function TMainData.GetSystemValue(const Name: string;
  AValueType: TRegValueType; const DefValue: Variant): Variant;
var
  Op : TsqlOp;
begin
  case AValueType of
    rvBoolean  :  begin
                    Result := False;
                    Op := sqlvaluebool;
                  end;
    rvInteger  :  begin
                    Result := 0.0;
                    Op := sqlvaluenumber;
                  end;
    rvFloat    :  begin
                    Result := now;
                    Op := sqlvaluedatetime;
                  end;
    rvString   :  begin
                    Result := '';
                    Op := sqlvaluestring;
                  end;
    rvDateTime :  begin
                    Result := now;
                    Op := sqlvaluedatetime;
                  end;
  else
    Op := nil;
  end;

  Op['RESULT'] := Result;
  try
    Result := Op.Exec('NAME', Name);
  except
    Result := DefValue;
  end;
end;


function TMainData.GetServerDate: TDateTime;
begin
  sqlGetServerDate['RESULT'] := Now;
  Result := sqlGetServerDate.Exec;
end;

function TMainData.GetConnectionString: string;
begin
  Result := Session.LogonUsername+'/'+Session.LogonPassword+'@'+Session.LogonDatabase;
end;

end.
