unit AdvicePayPeriodicFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdviceFrm, QueryList, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxMemo, cxTextEdit, cxPC, cxControls, cxCurrencyEdit, cxCheckBox, Menus,
  cxLookAndFeelPainters, cxButtons, ObjectFrm, OracleData;

type
  TAdvicePayPeriodicForm = class(TAdviceForm)
    dsDataCUSTOMS_CODE_8: TStringField;
    dsetPayment: TfdcQuery;
    dsPayment: TDataSource;
    dsetDecl: TfdcQuery;
    dsDecl: TDataSource;
    dsetDeclID: TFloatField;
    dsetDeclNAME: TStringField;
    dsetDeclSHORTNAME: TStringField;
    dsetDeclOBJECT_TYPE_ID: TFloatField;
    dsetDeclSTATE_ID: TFloatField;
    dsetDeclACCESSLEVEL: TFloatField;
    dsetDeclSYSNAME: TStringField;
    dsetDeclDESCRIPT: TStringField;
    dsetDeclOWNER_OBJECT_ID: TFloatField;
    dsetDeclTYPENAME: TStringField;
    dsetDeclTYPESYSNAME: TStringField;
    dsetDeclOBJECTKINDLIST: TStringField;
    dsetDeclDOC_DATE: TDateTimeField;
    dsetDeclDOC_NUMBER: TStringField;
    dsetDeclIS_ACTIVE: TStringField;
    dsetDeclACTIVATION_DATE: TDateTimeField;
    dsetDeclTYPESHORTNAME: TStringField;
    dsetDeclCUSTOMS_CODE: TStringField;
    dsetDeclREG_DATE: TDateTimeField;
    dsetDeclDECL_NO: TStringField;
    dsetDeclMODIFY_DATE: TDateTimeField;
    dsetDeclSUBJECT_ID: TFloatField;
    dsetDeclG011: TStringField;
    dsetDeclCUSTOM_MODE_ID: TFloatField;
    dsetDeclOKPO: TStringField;
    dsetDeclINN: TStringField;
    dsetDeclG12: TFloatField;
    dsetDeclCURRENCY_ID: TFloatField;
    dsetDeclG221: TStringField;
    dsetDeclG444A: TStringField;
    dsetDeclG444B: TDateTimeField;
    dsetDeclG447A: TStringField;
    dsetDeclG447B: TDateTimeField;
    dsetDeclK115: TStringField;
    dsetDeclG40: TStringField;
    dsetDeclACT_NO: TStringField;
    dsetDeclGD1: TDateTimeField;
    dsetDeclG0131: TFloatField;
    dsetDeclDECISION_CODE: TStringField;
    dsetDeclDECL_TYPESYSNAME: TStringField;
    dsetDeclDECL_KPP: TStringField;
    dsetDeclDECL_INN: TStringField;
    dsetDeclDECL_NAME: TStringField;
    dsetDeclCURR_CODE: TStringField;
    dsetDeclCURR_NAME: TStringField;
    dsetDeclCUSTOM_MODE_CODE: TStringField;
    dsetDeclCUSTOM_MODE_NAME: TStringField;
    dsetDeclERR_COUNT: TFloatField;
    dsetDeclDEBT_COUNT: TFloatField;
    dsetDeclG0131_CODE: TStringField;
    dsetDeclG01321_NAME: TStringField;
    dsetDeclAS_BIG_PAYER: TFloatField;
    dsetDeclHAS_DED: TFloatField;
    dsetPaymentID: TFloatField;
    dsetPaymentNAME: TStringField;
    dsetPaymentSHORTNAME: TStringField;
    dsetPaymentOBJECT_TYPE_ID: TFloatField;
    dsetPaymentSTATE_ID: TFloatField;
    dsetPaymentACCESSLEVEL: TFloatField;
    dsetPaymentSYSNAME: TStringField;
    dsetPaymentDESCRIPT: TStringField;
    dsetPaymentOWNER_OBJECT_ID: TFloatField;
    dsetPaymentTYPENAME: TStringField;
    dsetPaymentTYPESYSNAME: TStringField;
    dsetPaymentOBJECTKINDLIST: TStringField;
    dsetPaymentOPERATE_DATE: TDateTimeField;
    dsetPaymentDOC_NUMBER: TStringField;
    dsetPaymentIS_ACTIVE: TStringField;
    dsetPaymentDOC_NO: TStringField;
    dsetPaymentDOC_DATE: TDateTimeField;
    dsetPaymentDOC_NO2: TStringField;
    dsetPaymentDOC_DATE2: TDateTimeField;
    dsetPaymentEXEC_DATE: TDateTimeField;
    dsetPaymentPAYER_ID: TFloatField;
    dsetPaymentDOC_SUMMA: TFloatField;
    dsetPaymentSUMMA: TFloatField;
    dsetPaymentCURRENCY_ID: TFloatField;
    dsetPaymentCASHDESK_ID: TFloatField;
    dsetPaymentCARDNUM: TStringField;
    dsetPaymentPAY_TYPE_ID: TFloatField;
    dsetPaymentAGREEMENT_ID: TFloatField;
    dsetPaymentPAY_TYPE_CODE: TStringField;
    dsetPaymentINCOME_DATE: TDateTimeField;
    dsetPaymentNOTE: TStringField;
    dsetPaymentNREF: TStringField;
    dsetPaymentPAYER_NAME: TStringField;
    dsetPaymentPAYER_INN: TStringField;
    dsetPaymentPAYER_KPP: TStringField;
    dsetPaymentCASHDESK_NAME: TStringField;
    dsetPaymentCURR_NAME: TStringField;
    dsetPaymentCURR_CODE: TStringField;
    dsetPaymentREST_SUMMA: TFloatField;
    dsetPaymentLOCKED_SUMMA: TFloatField;
    dsetPaymentCOMING_DATE: TDateTimeField;
    dsetPaymentASSURE_DATE: TDateTimeField;
    dsetPaymentDESCRIPT2: TStringField;
    dsetPaymentSUBJECT_ID: TFloatField;
    dsetPaymentCURRENCY_NAME: TStringField;
    dsetPaymentACTIVATION_DATE: TDateTimeField;
    dsetDeclCURRENCY_NAME: TStringField;
    qryChargePayDecision: TfdcQuery;
    procedure dsetDeclCalcFields(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterPost(DataSet: TDataSet);
    procedure actDecisionReturnExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fDecisionForm : TObjectForm;
  protected
    function GetDecisionReturnTypeName : string; override;
    function GetDecisionReuseTypeName : string; override;
  public
    { Public declarations }
  end;

var
  AdvicePayPeriodicForm: TAdvicePayPeriodicForm;

implementation

{$R *.dfm}

uses
  fdcObjectServices
 ,MainDm
 ,fdcCustomDBDataFrm
 ,DocRManagementFrm
 ,DecisionPaybackFrm
 ,fdcCustomCardFrm
 ,DecisionPaymentFrm
 ,DecisionPaymentPeriodicFrm ;

procedure TAdvicePayPeriodicForm.dsetDeclCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName( 'currency_name' ).AsString :=
      '[' + DataSet.FieldByName( 'curr_code' ).AsString + ']  ' +
      DataSet.FieldByName( 'curr_name' ).AsString; 
end;

procedure TAdvicePayPeriodicForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if     dsData.Active
     and not dsData.IsEmpty
     and dsData.FieldByName( 'subject_id' ).IsNull then
    lciDeclarant.Enabled := True
  else
    lciDeclarant.Enabled := False;
end;

procedure TAdvicePayPeriodicForm.dsDataAfterPost(DataSet: TDataSet);
begin
  inherited;

  if     dsData.Active
     and not dsData.IsEmpty
     and dsData.FieldByName( 'subject_id' ).IsNull then
    lciDeclarant.Enabled := True
  else
    lciDeclarant.Enabled := False;
end;

procedure TAdvicePayPeriodicForm.actDecisionReturnExecute(Sender: TObject);
  var
    lv_DecisionForm : TForm;
begin
  inherited;
     ;
{  qryChargePayDecision.Params.ParamByName( 'advice_id' ).AsFloat  := dsData.FieldByName( 'id' ).AsFloat;
  qryChargePayDecision.Params.ParamByName( 'payback_id' ).AsFloat := GetDecisionID;
  qryChargePayDecision.ExecSQL;}
end;

function TAdvicePayPeriodicForm.GetDecisionReturnTypeName: string;
begin
  Result := 'DecPaybackPeriodic';
end;

function TAdvicePayPeriodicForm.GetDecisionReuseTypeName: string;
begin
  Result := 'DecisionPaymentPeriodic';
end;

procedure TAdvicePayPeriodicForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  if assigned (dsDataSUMMA_DEBT.DataSet) then
  //  dsDataSUMMA_DEBT.DataSet:= nil;
end;

initialization
  RegisterClass( TAdvicePayPeriodicForm );

end.
