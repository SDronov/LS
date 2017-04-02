{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 6070 $
  $Author: FORS\anaumenkov $
  $Date: 2008-12-21 22:40:40 +0300 (Р’СЃ, 21 РґРµРє 2008) $
}

unit IaccLoader;

interface

uses
  DB,
  SysUtils,
  Classes,
  fdcCustomGridFrm,
  fdcQuery,
  VKDBFDataSet,
  ExtCtrls,
  {MainDM,}DataDM, 
  IniFiles,
  Oracle, qdbfload;

type
  TLoaderQueryType = (lqtInsert, lqtUpdate, lqtSearch);
  TDataSetNotifyEvent2 = procedure (ADataSet: TDataSet; AObject: TObject) of object;
  TMessageEvent = procedure (const S: string) of object;
  TLogType = (ltStart, ltMsg, ltFinish);
  TDbfForLoad = TVKDBFNTX;

  TIaccLegacyLoader = class
  private
    FLoader: TDataSetLoader;
    FSkipped: integer;
    FDBFFilter: String;
    FOnMessage: TMessageEvent;
    FOnProgress: TNotifyEvent;
    FOnFinishImport: TNotifyEvent;
    FOnError: TArrayErrorEvent;
  protected
    FDbf: TDataSet;
    function GetDataSet(const FileName: string): TDataSet; virtual;
    procedure DoOnError(Sender: TOracleQuery; Index,
      ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean); virtual;
    function GetPosition: Integer; virtual;
    function GetTotal: Integer; virtual;
    function GetSkipped: Integer; virtual;
    function GetTableName: String; virtual;
    property Loader : TDataSetLoader read FLoader;
  public
    class function FileName: String; virtual;
    class function TaskName: String; virtual;
    constructor Create; overload; virtual;
    constructor Create(AForm: TObject; const S1,s2, s3,s4: string); overload; deprecated;
    destructor Destroy; override;
    procedure Load(const FileName: string); overload; virtual;
    procedure Load; overload; deprecated;
    procedure Terminate; virtual;
    property Total: Integer read GetTotal;
    property Position: Integer read GetPosition;
    property Skipped: Integer read GetSkipped;
    property DBFFilter: String read FDBFFilter write FDBFFilter;
    property OnProgress: TNotifyEvent read FOnProgress write FOnProgress;
    property OnFinishImport: TNotifyEvent read FOnFinishImport write FOnFinishImport;
    property OnMessage: TMessageEvent read FOnMessage write FOnMessage;
    property OnError: TArrayErrorEvent read FOnError write FOnError;
  end;

  TIaccLegacyLoaderClass = class of TIaccLegacyLoader;

  TUniImporter = class
  private
    FTotal: integer;
    FSkipped: integer;
    FErrorCount: integer;
  public
    property Total: integer read FTotal write FTotal;
    property Skipped: integer read FSkipped write FSkipped;
    property ErrorCount: integer read FErrorCount write FErrorCount;
    procedure LoadFile(const DefName, FileName: string);
    procedure LoadStream(const DefName: string; Stream: TStream);
  end;

  TNsiPaymentTypeLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TCustomsLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TBrokerLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TCurrencyRateLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
    constructor Create; override;
  end;

  TCurrencyLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TBankLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TDeclarantLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TDeclarantLoaderSbjDbf = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TDeclarantAccLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TRefinancingRateLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TCustomModeLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TAdvDeclFeatureLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TKBKLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TKBKPlatLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TPassportTypeLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TCountryCodeLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TDecisionQualifierLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TRezulttoLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TAssetsDictLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TAssetsReasonLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TDebtReasonLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;

  TDebtTypesLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;


  TAssetsDecisionLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;


  TTypeCorrectionLoader = class(TIaccLegacyLoader)
  protected
    function GetTableName: String; override;
  public
    class function FileName: String; override;
    class function TaskName: String; override;
  end;


  procedure  RegisterLoader(ALoaderClass: TIaccLegacyLoaderClass; const Name: String);
  procedure  GetLoaderList(var List: TStrings);

implementation

uses
  Dialogs,
  Forms;

var
  FList: TStrings;

procedure  RegisterLoader(ALoaderClass: TIaccLegacyLoaderClass; const Name: String);
begin
  if FList.IndexOfObject(TObject(ALoaderClass)) = -1 then
  begin
     FList.AddObject(Name, TObject(ALoaderClass));
  end;
end;

procedure  GetLoaderList(var List: TStrings);
var
  i : integer;
  Query: TfdcQuery;
begin
  try
    try
      Query := TfdcQuery.Create(nil);
      Query.Session := MainData.Session;
      Query.SQL.Text := 'begin :i ::= fdc_Loader_Get_Visible(pLoaderName => :pLoaderName); end;';
      Query.ParamByName('pLoaderName').DataType := ftString;
      Query.ParamByName('i').DataType := ftInteger;
      i := 0;
      while (i < FList.Count) do
      begin
        Query.ParamByName('pLoaderName').AsString := TIaccLegacyLoaderClass(FList.Objects[i]).ClassName;
        Query.ExecSQL;
        if (Query.ParamByName('i').AsInteger = 0) then
          FList.Delete(i)
        else
          Inc(i);
      end;
    finally
      Query.Free;
    end;
  except on e: exception do begin
    ShowMessage('ошибка загрузки списка загрузчиков: ' + e.Message);
  end; end;
  if (List = nil) then
    List := TStringList.Create;
  List.Assign(FList);
end;

constructor TIaccLegacyLoader.Create;
begin
  FLoader := TDataSetLoader.Create(MainData.Session);
  FLoader.DoCommitBtwStep := True;
  FLoader.RecordsInStep := 100;
end;

function TIaccLegacyLoader.GetPosition: Integer;
begin
  Result := FLoader.CurrentCnt;
end;

destructor TIaccLegacyLoader.Destroy;
begin
  FreeAndNil(FLoader);
  inherited;
end;

procedure TIaccLegacyLoader.Terminate;
begin
  FLoader.Terminate;
end;

class function TIaccLegacyLoader.FileName: String;
begin
  Result := '';
end;

function TIaccLegacyLoader.GetTotal: Integer;
begin
  Result := FLoader.TotalCnt;
end;

function TIaccLegacyLoader.GetSkipped: Integer;
begin
  Result := FSkipped;
end;

procedure TIaccLegacyLoader.Load(const FileName: string);
var
  DataSet: TDataSet;
begin
  FLoader.OnError := DoOnError;
  DataSet := GetDataSet(FileName);
  try
    FLoader.Load(DataSet,  GetTableName);
  finally
    DataSet.Free;
  end;
end;

constructor TIaccLegacyLoader.Create(AForm: TObject; const S1, s2, s3,
  s4: string);
begin

end;

procedure TIaccLegacyLoader.Load;
begin

end;

function TIaccLegacyLoader.GetDataSet(const FileName: string): TDataSet;
begin
  Result := TVKDBFNTX.Create(nil);
  try
    TVKDBFNTX(Result).SetDeleted := True;
    TVKDBFNTX(Result).BufferSize := 4096 * 10;
    TVKDBFNTX(Result).DBFFileName := FileName;
    TVKDBFNTX(Result).SetDeleted := True;
    TVKDBFNTX(Result).OEM := True;
    TVKDBFNTX(Result).TrimCType := True;
    with TVKDBFNTX(Result).AccessMode do
      AccessMode := AccessMode and not fmShareExclusive and not fmShareDenyWrite or fmShareDenyNone;
    try
      TVKDBFNTX(Result).Open;
    except
      on E: EVkDbfFileOpenError do
      begin
        raise Exception.CreateFmt('Невозможно открыть файл %s.'#13#10
          + 'Возможно, он открыт другим приложением.',
            [TVKDBFNTX(Result).DBFFileName]);
      end
      else
        raise;
    end;
  except
    Result.Free;
    raise;
  end; // try/except
end;

procedure TIaccLegacyLoader.DoOnError(Sender: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
begin
 if assigned(OnError) then
    OnError(Sender, Index, ErrorCode, ErrorMessage, Continue);
 if not Continue then
    Terminate;
end;

function TIaccLegacyLoader.GetTableName: String;
begin
  Result := '';
end;

{ TBrokerLoader }

class function TBrokerLoader.FileName: String;
begin
  Result := 'tbrok.dbf';
end;

function TBrokerLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_TBROK_LST';
end;

class function TBrokerLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Broker';
end;

{ TCustomsLoader }

class function TCustomsLoader.FileName: String;
begin
  Result := 'ktam.dbf';
end;

function TCustomsLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_KTAM_LST';
end;

{ TCurrencyRateLoader }

// const ARRAY_SIZE = 300;

function TCurrencyRateLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_VALUTA_LST';
end;


class function TCurrencyRateLoader.FileName : String;
begin
  Result := 'VALUTA.DBF';
end;

class function TCustomsLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Customs';
end;

{ TCurrencyLoader }

class function TCurrencyLoader.FileName: String;
begin
  Result := 'valname.dbf';
end;

function TCurrencyLoader.GetTableName: String;
begin
  Result := 'dbf_nsi_valname_lst';
end;

class function TCurrencyLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Valuta';
end;

{ TBankLoader }

class function TBankLoader.FileName: String;
begin
  Result := 'banklist.dbf';
end;

class function TDeclarantLoader.FileName: String;
begin
  Result := 'reg_ti.dbf';
end;

function TBankLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_BANKLIST_LST';
end;

class function TBankLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Bank';
end;

{ TUniImporter }

procedure TUniImporter.LoadFile(const DefName, FileName: string);
var
  IniFile: TIniFile;
  TableName: String;
  ColMap: String;
  LoadInfo: TLoadInfo;
begin
  IniFile := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\LoadApp.ini');
  try
    TableName := IniFile.ReadString(DefName, 'tablename', '');
    Assert(TableName <> '', Format('Не задано имя целевой таблицы для %s', [DefName]));
    ColMap := IniFile.ReadString(DefName, 'fields', '');
    MainData.LoadDbf(FileName, TableName, ColMap, @LoadInfo);
    FTotal := LoadInfo.Done;
    FSkipped := LoadInfo.SkipCount;
    FErrorCount := LoadInfo.ErrorCount;
  finally
    IniFile.Free;
  end;
end;

procedure TUniImporter.LoadStream(const DefName: string; Stream: TStream);
var
  IniFile: TIniFile;
  TableName: String;
  ColMap: String;
  LoadInfo: TLoadInfo;
begin
  IniFile := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\LoadApp.ini');
  try
    TableName := IniFile.ReadString(DefName, 'tablename', '');
    Assert(TableName <> '', Format('Не задано имя целевой таблицы для %s', [DefName]));
    ColMap := IniFile.ReadString(DefName, 'fields', '');
    MainData.LoadStream(Stream, TableName, ColMap, @LoadInfo);
    FTotal := LoadInfo.Done;
    FSkipped := LoadInfo.SkipCount;
    FErrorCount := LoadInfo.ErrorCount;
  finally
    IniFile.Free;
  end;
end;

{ TNsiPaymentTypeLoader }

class function TNsiPaymentTypeLoader.FileName: String;
begin
  Result := 'tamplat.dbf';
end;

function TNsiPaymentTypeLoader.GetTableName: String;
begin
  Result := 'dbf_nsi_tamplat_lst';
end;

class function TNsiPaymentTypeLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_PaymentType';
end;

{ TRefinancingRateLoader }
class function TRefinancingRateLoader.FileName: String;
begin
  Result := 'prcb.dbf';
end;

function TRefinancingRateLoader.GetTableName: String;
begin
  Result := 'dbf_nsi_prcb_lst';
end;

class function TRefinancingRateLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_CBRate';
end;

{ TDeclarantLoader }

function TDeclarantLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_REG_TI_LST';
end;

constructor TCurrencyRateLoader.Create;
begin
  inherited;
  FLoader.RecordsInStep := 1000;
end;

class function TIaccLegacyLoader.TaskName: String;
begin
  Result := '';
end;

class function TCurrencyRateLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_CurrRate';
end;

class function TDeclarantLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Declarant';
end;

// --- DeclarantLoaderSbjDbf

function TDeclarantLoaderSbjDbf.GetTableName: String;
begin
  Result := 'DBF_NSI_SBJ_LST';
end;


class function TDeclarantLoaderSbjDbf.FileName: String;
begin
  Result := 'sbj.dbf';
end;


class function TDeclarantLoaderSbjDbf.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Declarant';
end;


// ----------------------------------------------------------------------------

// --- DeclarantAccLoader
function TDeclarantAccLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_REG_S_LST';
end;


class function TDeclarantAccLoader.FileName: String;
begin
  Result := 'reg_s.dbf';
end;


class function TDeclarantAccLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Declarant';
end;




{ TCustomModeLoader }

class function TCustomModeLoader.FileName: String;
begin
  Result := 'otamreg.dbf';
end;

function TCustomModeLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_OTAMREG_LST';
end;

class function TCustomModeLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_CustomMode';
end;

{ TAdvDeclFeatureLoader }

class function TAdvDeclFeatureLoader.FileName: String;
begin
  Result := 'inf1td.dbf';
end;

function TAdvDeclFeatureLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_INF1TD_LST';
end;

class function TAdvDeclFeatureLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_AdvDeclFeature';
end;

{ TKBKPlatLoader }

class function TKBKPlatLoader.FileName: String;
begin
  Result := 'finbg.dbf';
end;

function TKBKPlatLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_FINBG_LST';
end;

class function TKBKPlatLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_KBKPayment';
end;

{ TKBKLoader }

class function TKBKLoader.FileName: String;
begin
  Result := 'nsi_kbk.dbf';
end;

function TKBKLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_KBK_LST';
end;

class function TKBKLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_KBK';
end;


{ TPassportTypeLoader }

function TPassportTypeLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_NS_DUL_LST';
end;

class function TPassportTypeLoader.FileName: String;
begin
  Result := 'ns_dul.dbf';
end;

class function TPassportTypeLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_PassportType';
end;


{ TCountryCodeLoader }

function  TCountryCodeLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_OKSMT_LST';
end;

class function  TCountryCodeLoader.FileName: String;
begin
  Result := 'oksmt.dbf';
end;

class function  TCountryCodeLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_CountryCode';
end;


{ TDecisionQualifier }

function TDecisionQualifierLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_RESHEN_LST';
end;

class function TDecisionQualifierLoader.FileName: String;
begin
  Result := 'RESHEN.DBF';
end;

class function TDecisionQualifierLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Decision_Qualifier';
end;


{ TRezultto }

function TRezulttoLoader.GetTableName: String;
begin
  Result := 'DBF_REZULTTO_LST';
end;

class function TRezulttoLoader.FileName: String;
begin
  Result := 'REZULTTO.DBF';
end;

class function TRezulttoLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Decision_Qualifier';
end;


{ TAssetsDict }

function TAssetsDictLoader.GetTableName: String;
begin
  Result := 'DBF_ASSETS_DICT_LST';
end;

class function TAssetsDictLoader.FileName: String;
begin
  Result := 'Assets_Dict.dbf';
end;

class function TAssetsDictLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Assets_Dict';
end;

{ TAssetsReason }

function TAssetsReasonLoader.GetTableName: String;
begin
  Result := 'DBF_ASSETS_REASON_LST';
end;

class function TAssetsReasonLoader.FileName: String;
begin
  Result := 'Assets_Reason.dbf';
end;

class function TAssetsReasonLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Assets_Reason';
end;


{ TDebtReason }

function   TDebtReasonLoader.GetTableName: String;
begin
  Result := 'DBF_DEBT_REASON_LST';
end;

class function TDebtReasonLoader.FileName: String;
begin
  Result := 'Debt_Reason.dbf';
end;

class function TDebtReasonLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Debt_Reason';
end;


{ TDebtTypes }

function TDebtTypesLoader.GetTableName: String;
begin
  Result := 'DBF_DEBT_TYPES_LST';
end;

class function TDebtTypesLoader.FileName: String;
begin
  Result := 'Debt_Types.dbf';
end;

class function TDebtTypesLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Debt_Types';
end;



{ TAssetsDecision }

function TAssetsDecisionLoader.GetTableName: String;
begin
  Result := 'DBF_ASSETS_DECISION_LST';
end;

class function TAssetsDecisionLoader.FileName: String;
begin
  Result := 'Assets_Decision.dbf';
end;

class function TAssetsDecisionLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Assets_Decision';
end;

function TTypeCorrectionLoader.GetTableName: String;
begin
  Result := 'DBF_NSI_TYPE_CORRECTION_LST';
end;

class function TTypeCorrectionLoader.FileName: String;
begin
  Result := 'Type_Correction.dbf';
end;

class function TTypeCorrectionLoader.TaskName: String;
begin
  Result := 'Tsk_ImportNSI_Type_Correction';
end;


initialization
  FList := TStringList.Create;
  RegisterLoader(TBankLoader, 'Банки');
  RegisterLoader(TBrokerLoader, 'Брокеры');
  RegisterLoader(TCurrencyLoader, 'Валюты');
  RegisterLoader(TCurrencyRateLoader, 'Курсы валют');
  RegisterLoader(TCustomsLoader, 'Таможни');
  RegisterLoader(TDeclarantLoader, 'Участники ВЭД');
  RegisterLoader(TDeclarantLoaderSbjDbf, 'Участники ВЭД из ЦРСВЭД');
  RegisterLoader(TDeclarantAccLoader, 'Счета участников ВЭД');
  RegisterLoader(TNsiPaymentTypeLoader, 'Виды платежей');
  RegisterLoader(TCustomModeLoader, 'Таможенные режимы');
  RegisterLoader(TAdvDeclFeatureLoader, 'Виды таможенных деклараций');
//  RegisterLoader(TNsiSubjectCategoryLoader, 'Категории субъектов');
  RegisterLoader(TRefinancingRateLoader, 'Ставки ЦБ');
  RegisterLoader(TKBKLoader, 'КБК');
//  RegisterLoader(TKBKPlatLoader, 'КБК и Виды платежей');
  RegisterLoader(TPassportTypeLoader, 'Виды документов, удостоверяющих личность');
  RegisterLoader(TCountryCodeLoader, 'Коды стран');
  RegisterLoader(TDecisionQualifierLoader, 'Решения, принимаемые ТО (RESHEN.DBF)');
  RegisterLoader(TRezulttoLoader, 'Решения, принимаемые ТО (REZULTTO.DBF)');
  RegisterLoader(TAssetsDictLoader, 'Справочник возвратов\зачетов');
  RegisterLoader(TAssetsReasonLoader, 'Основания для возвратов\зачетов');
  RegisterLoader(TAssetsDecisionLoader, 'Решения ТО по ДС');
  RegisterLoader(TDebtTypesLoader, 'Типы задолженности');
  RegisterLoader(TDebtReasonLoader, 'Причины возникновения задолженности');
  RegisterLoader(TTypeCorrectionLoader, 'Типы корректировки ГТД');

finalization
  FreeAndNil(FList);

end.
