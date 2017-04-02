unit CorrectionPOBackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionPOFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, cxGraphics,
  cxCurrencyEdit, OracleData, ObjectFrm, fdcObjectCore, QueryList;

type
  TCorrectionPOBackForm = class(TCorrectionPOForm)
    dsDataREASON_BACK: TStringField;
    lcgReasonBack: TdxLayoutGroup;
    edtReasonBack: TcxDBComboBox;
    lcGeneralItem1: TdxLayoutItem;
    lcgDeclarant: TdxLayoutGroup;
    lciDeclName: TdxLayoutItem;
    edtDeclarant: TfdcObjectLinkEdit;
    lciDeclInn: TdxLayoutItem;
    edtDeclINN: TcxDBMaskEdit;
    lciDeclKpp: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lcGeneralGroup3: TdxLayoutGroup;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    qlCorrectionBack: TQueryList;
    sqlGetDecision: TsqlOp;
    lciOldDeclName: TdxLayoutItem;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lcGeneralGroup5: TdxLayoutGroup;
    lcGeneralGroup4: TdxLayoutGroup;
    dsDataOLDPAYERID: TFloatField;
    dsDataOLDPAYERNAME: TStringField;
    dsDataOLDPAYERINN: TStringField;
    dsDataOLDPAYERKPP: TStringField;
    dsGetSum: TDataSource;
    odsGetSum: TOracleDataSet;
    odsGetSumSUMMA: TFloatField;
    edtSumma: TcxDBCurrencyEdit;
    lcSumma: TdxLayoutItem;
    procedure edtDeclarantBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure actSaveExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionPOBackForm: TCorrectionPOBackForm;

implementation

uses
  fdcObjectServices,
  DecisionPaybackFrm, fdcCustomCardFrm;

{$R *.dfm}
procedure TCorrectionPOBackForm.edtDeclarantBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
  begin
     dsDataSUBJECT_INN.Clear;
     dsDataSUBJECT_KPP.Clear;
  end
  else
  begin
    dsData['SUBJECT_INN'] := AObject.FieldValues['INN'];
    dsData['SUBJECT_KPP'] := AObject.FieldValues['KPP'];
  end;
  Modify(nil);
end;

procedure TCorrectionPOBackForm.actSaveExecute(Sender: TObject);
var
    fDecisionForm  : TForm;
    fDecisionID    : Integer;
begin
  inherited;
  RefreshData;
  if dsInsert.ParamByName('reason_back').AsString = 'Ошибка инспектора' then
    begin
        fDecisionID := sqlGetDecision.Exec( 'pID', [dsInsert.ParamByName('ID').AsInteger] );
        fDecisionForm :=  TObjectForm(GetObjectServices.OpenObject( fDecisionID, nil ));
    end;
end;

procedure TCorrectionPOBackForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsDataSUBJECT_ID.ReadOnly  :=  not dsDataSUBJECT_ID.IsNull;
  dsDataREASON_BACK.ReadOnly :=  not dsDataREASON_BACK.IsNull;
  edtDeclarant.Enabled       :=  not dsDataSUBJECT_ID.ReadOnly;
  edtReasonBack.Enabled      :=  not dsDataREASON_BACK.ReadOnly;
  odsGetSum.SetVariable('pId',dsDataID.Value);
  if odsGetSum.Active then odsGetSum.Close;
  odsGetSum.Open;
end;

initialization
  RegisterClass(TCorrectionPoBackForm);
end.
