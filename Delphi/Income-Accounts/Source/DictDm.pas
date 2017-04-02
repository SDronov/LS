unit DictDm;

interface

uses
  SysUtils, Classes, DB, FDCCustomDataset, fdcQuery, dxmdaset,
  dxLayoutLookAndFeels, cxEdit, cxEditRepositoryItems, cxStyles,
  cxContainer, OracleData, cxClasses, cxTL;

type
  TDictData = class(TDataModule)
    dsCurrency: TOracleDataSet;
    dsCurrencyID: TFloatField;
    dsCurrencyCODE: TStringField;
    dsCurrencyNAME: TStringField;
    dsCurrencyACODE: TStringField;
    srcCurrency: TDataSource;
    dsCustomMode: TOracleDataSet;
    srcCustomMode: TDataSource;
    dsCustomModeCODE: TStringField;
    dsCustomModeNAME: TStringField;
    dsCustomModeID: TFloatField;
    srcCustomDir: TDataSource;
    dsCustomDir: TdxMemData;
    dsCustomDirCODE: TStringField;
    dsCustomDirNAME: TStringField;
    LayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    LayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel;
    LayoutOfficeLookAndFeel: TdxLayoutOfficeLookAndFeel;
    LayoutWebLookAndFeel: TdxLayoutWebLookAndFeel;
    LayoutWebToolLookAndFeel: TdxLayoutWebLookAndFeel;
    cxStyleRepository1: TcxStyleRepository;
    cxCurrentField: TcxStyle;
    cxEditRepository: TcxEditRepository;
    repCurrencyItem: TcxEditRepositoryCurrencyItem;
    dsPayTypes: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    srcPayTypes: TDataSource;
    DefaultEditStyleController: TcxDefaultEditStyleController;
    OfficeEditStyleController: TcxEditStyleController;
    WebEditStyleController: TcxEditStyleController;
    dsAdvDeclFeature: TOracleDataSet;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    srcAdvDeclFeature: TDataSource;
    ssTreeList: TcxTreeListStyleSheet;
    cxStyle1: TcxStyle;
    dsAgreements: TOracleDataSet;
    FloatField3: TFloatField;
    StringField6: TStringField;
    srcAgreements: TDataSource;
    dsPayTypesSDATE: TDateTimeField;
    dsPayTypesEDATE: TDateTimeField;
    dsCustomModeSDATE: TDateTimeField;
    dsCustomModeEDATE: TDateTimeField;
    dsAdvDeclFeatureSDATE: TDateTimeField;
    dsAdvDeclFeatureEDATE: TDateTimeField;
    dsPassportType: TOracleDataSet;
    dsCountryCode: TOracleDataSet;
    srcPassportType: TDataSource;
    srcCountryCode: TDataSource;
    dsPassportTypeID: TFloatField;
    dsPassportTypeNAME: TStringField;
    dsPassportTypeCODE: TStringField;
    dsPassportTypeCODE2: TStringField;
    dsCountryCodeID: TFloatField;
    dsCountryCodeCODE: TStringField;
    dsCountryCodeNAME: TStringField;
    dsCountryCodeCODE2: TStringField;
    dsCountryCodeSDATE: TDateTimeField;
    dsCountryCodeEDATE: TDateTimeField;
    dsDecisionQualifier: TOracleDataSet;
    srcDecisionQualifier: TDataSource;
    dsDecisionQualifierNAME: TStringField;
    dsDecisionQualifierCODE: TStringField;
    styleOddContent: TcxStyle;
    dsDebtTypes: TOracleDataSet;
    dsDebtReason: TOracleDataSet;
    dsAssetsDict: TOracleDataSet;
    dsAssetsReason: TOracleDataSet;
    srcDebtTypes: TDataSource;
    srcDebtReason: TDataSource;
    srcAssetsDict: TDataSource;
    srcAssetsReason: TDataSource;
    dsAssetsDecision: TOracleDataSet;
    srcAssetsDecision: TDataSource;
    dsCurrencyIS_USABLE: TStringField;
    cxRedStyle: TcxStyle;
    cxInfoBkStyle: TcxStyle;
    dsSudReason: TOracleDataSet;
    srcSudReason: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsPayTypesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dsCustomModeFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dsAdvDeclFeatureFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dsCurrencyAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fRUR_ID : Double;

    FFontChange: TNotifyEvent;
    procedure OnFontChange(Sender: TObject);
  public
    { Public declarations }
    function GetCurrencyRUR : Double;
  end;

var
  DictData: TDictData;

implementation

uses MainDm, Graphics, SubjIntf, Variants;

{$R *.dfm}

procedure TDictData.OnFontChange(Sender: TObject);
begin
  if assigned(FFontChange) then
       FFontChange(Sender);
  ssTreeList.Styles.Content.Font.Assign(TFont(Sender));
end;

procedure TDictData.DataModuleCreate(Sender: TObject);
begin
  FFontChange := DictData.LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font.OnChange;
  DictData.LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font.OnChange := OnFontChange;

  fRUR_ID := -1;
end;

procedure TDictData.dsPayTypesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  ADate: TDateTime;
begin
  ADate := GetActiveDocumentDate;
  Accept := (dsPayTypesSDATE.Value <= ADate) and (dsPayTypesEDATE.Value >= ADate);
end;

procedure TDictData.dsCustomModeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  ADate: TDateTime;
begin
  ADate := GetActiveDocumentDate;
  Accept := (dsCustomModeSDATE.Value <= ADate) and (dsCustomModeEDATE.Value >= ADate);
end;

procedure TDictData.dsAdvDeclFeatureFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  ADate: TDateTime;
begin
  ADate := GetActiveDocumentDate;
  Accept := (dsAdvDeclFeatureSDATE.Value <= ADate) and (dsAdvDeclFeatureEDATE.Value >= ADate);
end;

function TDictData.GetCurrencyRUR: Double;
begin
  Result := fRUR_ID;
end;

procedure TDictData.dsCurrencyAfterOpen(DataSet: TDataSet);
  var
    id : Variant;
begin
  id := DataSet.Lookup( 'code', '643', 'id' );
  if VarIsNull( id ) then
    fRUR_ID := -1
  else
    fRUR_ID := id;
end;

end.
