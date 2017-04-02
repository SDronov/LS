unit CancelDecisionPaybackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocRManagementFrm, QueryList, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxDBEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls, fdcObjectCore, OracleData,
  cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxCurrencyEdit, cxCheckBox;

type
  TCancelDecisionPaybackForm = class(TDocRManagementForm)
    tabPaymentOrderPayBack: TcxTabSheet;
    dsDataDEC_PAY_ID: TFloatField;
    dsDataDEC_DATE: TDateTimeField;
    dsDataDEC_NUMBER: TStringField;
    dsDataDEC_SUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDEC_CURR_CODE: TStringField;
    dsDataDEC_CURR_NAME: TStringField;
    lcGeneralGroup2: TdxLayoutGroup;
    lciDecDocNumber: TdxLayoutItem;
    edtDecisionDocNumber: TcxDBTextEdit;
    lciDecDocData: TdxLayoutItem;
    edtDecisionDocDate: TcxDBDateEdit;
    OdsGetDecision: TOracleDataSet;
    OdsGetDecisionID: TFloatField;
    OdsGetDecisionNAME: TStringField;
    OdsGetDecisionSHORTNAME: TStringField;
    OdsGetDecisionOBJECT_TYPE_ID: TFloatField;
    OdsGetDecisionSTATE_ID: TFloatField;
    OdsGetDecisionACCESSLEVEL: TFloatField;
    OdsGetDecisionSYSNAME: TStringField;
    OdsGetDecisionDESCRIPT: TStringField;
    OdsGetDecisionOWNER_OBJECT_ID: TFloatField;
    OdsGetDecisionTYPENAME: TStringField;
    OdsGetDecisionTYPESYSNAME: TStringField;
    OdsGetDecisionOBJECTKINDLIST: TStringField;
    OdsGetDecisionDOC_DATE: TDateTimeField;
    OdsGetDecisionDOC_NUMBER: TStringField;
    OdsGetDecisionIS_ACTIVE: TStringField;
    OdsGetDecisionACTIVATION_DATE: TDateTimeField;
    OdsGetDecisionREASON_ID: TFloatField;
    OdsGetDecisionSUBJECT_ID: TFloatField;
    OdsGetDecisionAPP_NUMBER: TStringField;
    OdsGetDecisionAPP_DATE: TDateTimeField;
    OdsGetDecisionAPP_DATE_INCOME: TDateTimeField;
    OdsGetDecisionSUMMA: TFloatField;
    OdsGetDecisionBANK_DATE: TDateTimeField;
    OdsGetDecisionCURRENCY_ID: TFloatField;
    OdsGetDecisionDESTSUB_ID: TFloatField;
    OdsGetDecisionACCOUNT: TStringField;
    OdsGetDecisionBANK_ID: TFloatField;
    OdsGetDecisionSIGN_DATE: TDateTimeField;
    OdsGetDecisionSIGNED_BY: TStringField;
    OdsGetDecisionSIGNED_BY_CHIEF: TStringField;
    OdsGetDecisionSIGNED_BY_CHIEF_UDF: TStringField;
    OdsGetDecisionDECL_NAME: TStringField;
    OdsGetDecisionDECL_INN: TStringField;
    OdsGetDecisionDECL_KPP: TStringField;
    OdsGetDecisionDECL_OKPO: TStringField;
    OdsGetDecisionDECL_ADDRESS: TStringField;
    OdsGetDecisionDECL_NAME_DEST: TStringField;
    OdsGetDecisionDECL_INN_DEST: TStringField;
    OdsGetDecisionDECL_KPP_DEST: TStringField;
    OdsGetDecisionDECL_OKPO_DEST: TStringField;
    OdsGetDecisionDECL_ADDRESS_DEST: TStringField;
    OdsGetDecisionDECL_BANK_DEST: TStringField;
    OdsGetDecisionDECL_ADR_BANK_DEST: TStringField;
    OdsGetDecisionBIC: TStringField;
    OdsGetDecisionKBKCODE_ID: TFloatField;
    OdsGetDecisionKBKCODE: TStringField;
    dsGetDecision: TDataSource;
    lciDecSumma: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lcGeneralGroup3: TdxLayoutGroup;
    lciCurrent: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    lciCancelReason: TdxLayoutItem;
    edtCancelReason: TcxDBMemo;
    lciCancelLevel: TdxLayoutItem;
    edtCancelLevel: TcxDBTextEdit;
    dsDataCANCELLEVEL: TStringField;
    dsDataCANCELREASON: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    procedure tabPaymentOrderPayBackShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabPaymentOrderShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelDecisionPaybackForm: TCancelDecisionPaybackForm;

implementation

uses ObjectFrm, fdcCustomObjectFrm, fdcCustomObjectGridFrm,MainDm, DictDm;

{$R *.dfm}
const
  cTPaymentOrderPaybackGridForm = 'TPayment_Order_PaybackGridForm';

procedure TCancelDecisionPaybackForm.tabPaymentOrderPayBackShow(Sender: TObject);
begin
  if not Assigned(FPaymentOrderPaybackGridForm) then begin
    Params.ParamValues['Form'] := Integer(Self);
    FPaymentOrderPaybackGridForm := ShowForm(cTPaymentOrderPaybackGridForm, Params, tabPaymentOrderPayback);
    TObjectForm(FPaymentOrderPaybackGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FPaymentOrderPaybackGridForm));
    TfdcCustomObjectGridForm(FPaymentOrderPaybackGridForm).actAdd.Visible:= False;
    TfdcCustomObjectGridForm(FPaymentOrderPaybackGridForm).actDelete.Visible:= False;
  end;
  (FPaymentOrderPaybackGridForm as TfdcCustomObjectGridForm).RefreshData;
end;

procedure TCancelDecisionPaybackForm.FormShow(Sender: TObject);
begin
  inherited;
  actNew.Visible         := False;
  actNew.Enabled         := False;
  actPrint.Visible       := False;
  actPrint.Enabled       := False;
  actChangeState.Enabled := False;
  actChangeState.Enabled := False;
  edtCancelReason.Enabled := (dsDataEXT_ID.AsInteger = dsDataID.AsInteger);
end;

procedure TCancelDecisionPaybackForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
    OdsGetDecision.SetVariable('pId',dsDataDEC_PAY_ID.Value);
    if OdsGetDecision.Active then
       OdsGetDecision.Close;
    OdsGetDecision.Open;
end;

procedure TCancelDecisionPaybackForm.tabPaymentOrderShow(Sender: TObject);
begin
  if not Assigned(FPaymentOrderGridForm) then begin
    Params.ParamValues['Form'] := Integer(Self);
    Params.ParamValues['ID'] := self.dsDataDEC_PAY_ID.Value;
    FPaymentOrderGridForm := ShowForm('TPaybackPaymentOrderGridForm', Params, tabPaymentOrder);
    TObjectForm(FPaymentOrderGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FPaymentOrderGridForm));
    TfdcCustomObjectGridForm(FPaymentOrderGridForm).actAdd.Visible:= False;
    TfdcCustomObjectGridForm(FPaymentOrderGridForm).actDelete.Visible:= False;
  end;
end;

initialization
  RegisterClass(TCancelDecisionPaybackForm);

end.
