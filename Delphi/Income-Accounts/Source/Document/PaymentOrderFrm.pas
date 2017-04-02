{
  Copyright  Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15466 $
  $Author: adavletyarov $
  $Date: 2012-09-25 15:32:02 +0400 (Р’С‚, 25 СЃРµРЅ 2012) $
}
unit PaymentOrderFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, fdcObjectCore, cxCurrencyEdit,
  cxEditRepositoryItems, QueryList, cxLookAndFeelPainters, cxButtons,
  cxGraphics, Menus, cxCheckBox, SubjIntf, cxGroupBox, OracleData, fdcMessages;

type
  TPaymentOrderForm = class(TObjectForm, ISubjectHolder)
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    edtDocNo: TcxDBMaskEdit;
    lciDocNumber: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    lciDocDate: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    edtPayerINN: TcxDBMaskEdit;
    lciINN_P: TdxLayoutItem;
    edtPayerName: TfdcObjectLinkEdit;
    lciName_P: TdxLayoutItem;
    lciCurrency: TdxLayoutItem;
    edtDocSumma: TcxDBCurrencyEdit;
    lciDocSum: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    edtExecDate: TcxDBDateEdit;
    lciExecDate: TdxLayoutItem;
    tabDeduction: TcxTabSheet;
    dsDataDOC_SUMMA: TFloatField;
    dsDataREST_SUMMA: TFloatField;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    edtRestSumma: TcxDBCurrencyEdit;
    lciRestSum: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    lcGeneralGroup4: TdxLayoutGroup;
    edtBankDocNo: TcxDBMaskEdit;
    lciBankDocNo: TdxLayoutItem;
    edtBankDocDate: TcxDBDateEdit;
    lciBankDocDate: TdxLayoutItem;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    lcGeneralGroup8: TdxLayoutGroup;
    lcGeneralGroup7: TdxLayoutGroup;
    edtKPP: TcxDBMaskEdit;
    lciKPP_P: TdxLayoutItem;
    dsDataPAYER_KPP: TStringField;
    QueryList1: TQueryList;
    sqlCheckINN: TsqlOp;
    btnSaveNew: TcxButton;
    lciSaveBtn: TdxLayoutItem;
    actSaveAndClose: TAction;
    dsDataLOCKED_SUMMA: TFloatField;
    dsDataREST_SUMMA2: TFloatField;
    lcGeneralGroup5: TdxLayoutGroup;
    lciRestXSum: TdxLayoutItem;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lciLockSum: TdxLayoutItem;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    lcGeneralGroup2: TdxLayoutGroup;
    chbxAsOld: TcxCheckBox;
    lcilcAsOld: TdxLayoutItem;
    lcgNewOption: TdxLayoutGroup;
    actAsOld: TAction;
    actCreateSubj: TAction;
    dxBarButton1: TdxBarButton;
    actLink: TAction;
    dxBarButton2: TdxBarButton;
    sqlMergePP: TsqlOp;
    cmbxPayCode: TfdcObjectLookupEdit;
    lciPayTypeCode: TdxLayoutItem;
    lcGeneralGroup6: TdxLayoutGroup;
    dsDataPAY_TYPE_ID: TFloatField;
    edtDescript2: TcxDBMemo;
    lciDescript2: TdxLayoutItem;
    dsDataDESCRIPT2: TStringField;
    tabLock: TcxTabSheet;
    tabPayFor: TcxTabSheet;
    dsDataINCOME_DATE: TDateTimeField;
    edtIncomeDate: TcxDBDateEdit;
    lciIncomeDateEdt: TdxLayoutItem;
    edtNote: TcxDBMemo;
    lciNoteEdt: TdxLayoutItem;
    dsDataNOTE: TStringField;
    dsDataPF_SUMMA: TFloatField;
    dsDataPF_REST_SUMMA: TFloatField;
    dsDataPF_LOCKED_SUMMA: TFloatField;
    dsDataIS_PAYMENT_FOR: TFloatField;
    gbxPaymentFor: TcxGroupBox;
    lciPaymentFor: TdxLayoutItem;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    edtPFSumma: TcxDBTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtPFRestSumma: TcxDBTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtPFLockedSumma: TcxDBTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtSubjectName: TfdcObjectLinkEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtSubjectINN: TcxDBTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    edtSubjectKPP: TcxDBTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    dxLayoutControl1Group4: TdxLayoutGroup;
    dxLayoutControl1Group5: TdxLayoutGroup;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dsDataPF_SUBJECT_ID: TFloatField;
    dsDataPF_SUBJECT_INN: TStringField;
    dsDataPF_SUBJECT_KPP: TStringField;
    dsDataPF_SUBJECT_NAME: TStringField;
    tabConfirmation: TcxTabSheet;
    lcConfirmGroup_Root: TdxLayoutGroup;
    lcConfirm: TdxLayoutControl;
    lcgDocument: TdxLayoutGroup;
    lcgPayer: TdxLayoutGroup;
    lcgConfirm: TdxLayoutGroup;
    dsetPOConfirm: TOracleDataSet;
    dsetPOConfirmID: TFloatField;
    dsetPOConfirmNAME: TStringField;
    dsetPOConfirmSHORTNAME: TStringField;
    dsetPOConfirmOBJECT_TYPE_ID: TFloatField;
    dsetPOConfirmSTATE_ID: TFloatField;
    dsetPOConfirmACCESSLEVEL: TFloatField;
    dsetPOConfirmSYSNAME: TStringField;
    dsetPOConfirmDESCRIPT: TStringField;
    dsetPOConfirmOWNER_OBJECT_ID: TFloatField;
    dsetPOConfirmTYPENAME: TStringField;
    dsetPOConfirmTYPESYSNAME: TStringField;
    dsetPOConfirmOBJECTKINDLIST: TStringField;
    dsetPOConfirmOPERATE_DATE: TDateTimeField;
    dsetPOConfirmDOC_NUMBER: TStringField;
    dsetPOConfirmIS_ACTIVE: TStringField;
    dsetPOConfirmACTIVATION_DATE: TDateTimeField;
    dsetPOConfirmDOC_NO: TStringField;
    dsetPOConfirmDOC_DATE: TDateTimeField;
    dsetPOConfirmDOC_NO2: TStringField;
    dsetPOConfirmDOC_DATE2: TDateTimeField;
    dsetPOConfirmEXEC_DATE: TDateTimeField;
    dsetPOConfirmPAYER_ID: TFloatField;
    dsetPOConfirmDOC_SUMMA: TFloatField;
    dsetPOConfirmSUMMA: TFloatField;
    dsetPOConfirmCURRENCY_ID: TFloatField;
    dsetPOConfirmCASHDESK_ID: TFloatField;
    dsetPOConfirmCARDNUM: TStringField;
    dsetPOConfirmPAY_TYPE_ID: TFloatField;
    dsetPOConfirmAGREEMENT_ID: TFloatField;
    dsetPOConfirmPAY_TYPE_CODE: TStringField;
    dsetPOConfirmINCOME_DATE: TDateTimeField;
    dsetPOConfirmNOTE: TStringField;
    dsetPOConfirmNREF: TStringField;
    dsetPOConfirmPAYER_NAME: TStringField;
    dsetPOConfirmPAYER_INN: TStringField;
    dsetPOConfirmPAYER_KPP: TStringField;
    dsetPOConfirmCASHDESK_NAME: TStringField;
    dsetPOConfirmCURR_NAME: TStringField;
    dsetPOConfirmCURR_CODE: TStringField;
    dsetPOConfirmREST_SUMMA: TFloatField;
    dsetPOConfirmLOCKED_SUMMA: TFloatField;
    dsetPOConfirmCOMING_DATE: TDateTimeField;
    dsetPOConfirmASSURE_DATE: TDateTimeField;
    dsetPOConfirmDESCRIPT2: TStringField;
    dsetPOConfirmSUBJECT_ID: TFloatField;
    dsetPOConfirmPO_NAME: TStringField;
    dsetPOConfirmPO_INN: TStringField;
    dsetPOConfirmPO_KPP: TStringField;
    dsetPOConfirmS_NAME: TStringField;
    dsetPOConfirmS_INN: TStringField;
    dsetPOConfirmS_KPP: TStringField;
    dsetPOConfirmCONFIRMED_PAY_ID: TFloatField;
    edtCnfrmDocNumber: TcxDBTextEdit;
    lciCnfrmDocNumber: TdxLayoutItem;
    edtCnfrmDocDate: TcxDBDateEdit;
    lciCnfrmDocDate: TdxLayoutItem;
    dsPOConfirm: TDataSource;
    chBCnfrmIsActive: TcxDBCheckBox;
    lciCnfrmIsActive: TdxLayoutItem;
    lcConfirmGroup1: TdxLayoutGroup;
    edtCnfrmActivationDate: TcxDBDateEdit;
    lciCnfrmActivationDate: TdxLayoutItem;
    lcConfirmGroup2: TdxLayoutGroup;
    edtCnfrmPayerINN: TcxDBTextEdit;
    lciCnfrmPayerINN: TdxLayoutItem;
    edtCnfrmPayerKPP: TcxDBTextEdit;
    lciCnfrmPayerKPP: TdxLayoutItem;
    edtCnfrmPayerName: TcxDBTextEdit;
    lciCnfrmPayerName: TdxLayoutItem;
    lcConfirmGroup3: TdxLayoutGroup;
    edtCnfrmExecDate: TcxDBDateEdit;
    lciCnfrmExecDate: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lciCnfrmIncomeDate: TdxLayoutItem;
    edtCnfrmCurrencyCode: TcxDBTextEdit;
    lciCnfrmCurrencyCode: TdxLayoutItem;
    lcConfirmGroup4: TdxLayoutGroup;
    edtCnfrmCurrencyName: TcxDBTextEdit;
    lciCnfrmCurrencyName: TdxLayoutItem;
    lcConfirmGroup5: TdxLayoutGroup;
    edtCnfrmDocSumma: TcxDBCurrencyEdit;
    lciCnfrmDocSumma: TdxLayoutItem;
    actCancelReserve3Year: TAction;
    btnCancelReserve3Year: TdxBarButton;
    sqlCancelReserve3Year: TsqlOp;
    dxBarSubItem1: TdxBarSubItem;
    btnCorrect: TdxBarSubItem;
    btnCorrectBack: TdxBarButton;
    aCorrectBack: TAction;
    TabCorrection: TcxTabSheet;
    actCorrectSum: TAction;
    btnCorrectSum: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    aCorrectSubject: TAction;
    sqlCheckPO: TsqlOp;
    lcGeneralGroup9: TdxLayoutGroup;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataRECIPIENT_NAME: TStringField;
    dsDataRECIPIENT_INN: TStringField;
    dsDataRECIPIENT_KPP: TStringField;
    lcGeneralGroup10: TdxLayoutGroup;
    lciINN_R: TdxLayoutItem;
    edtRecipientINN: TcxDBMaskEdit;
    lciKPP_R: TdxLayoutItem;
    edtRecipientKPP: TcxDBMaskEdit;
    lcGeneralGroup11: TdxLayoutGroup;
    lciName_R: TdxLayoutItem;
    edtRecipientName: TfdcObjectLinkEdit;
    lcGeneralGroup12: TdxLayoutGroup;
    dsDataKBK: TStringField;
    edtKBK: TcxDBTextEdit;
    lciKBK: TdxLayoutItem;
    dsDataDESTCUSTOMSCODE: TStringField;
    edtDestCustomsCode: TcxDBMaskEdit;
    lciDestCustomsCode: TdxLayoutItem;
    sqlHasPaymentFor: TsqlOp;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    chBIS_ACTIVE: TcxDBCheckBox;
    lcGeneralItem1: TdxLayoutItem;
    lcGrpBank: TdxLayoutGroup;
    edtACTIVATION_DATE: TcxDBDateEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGrpActivationDate: TdxLayoutGroup;
    tabDocPack: TcxTabSheet;
    tabBankInfo: TcxTabSheet;
    lcBankInfoGroup_Root: TdxLayoutGroup;
    lcBankInfo: TdxLayoutControl;
    lcgBankInfoDoc: TdxLayoutGroup;
    lcgBankInfoPayer: TdxLayoutGroup;
    lcgBankInfoRecipient: TdxLayoutGroup;
    lcgBankInfoVals: TdxLayoutGroup;
    dsDataVAL_PAYMENT_REASON: TStringField;
    dsDataVAL_DOC_NUMBER: TStringField;
    dsDataVAL_PAYMENT_TYPE: TStringField;
    edtBankInfoDocNumber: TcxDBTextEdit;
    lciBankInfoDocNumber: TdxLayoutItem;
    edtBankInfoDocDate: TcxDBDateEdit;
    lciBankInfoDocDate: TdxLayoutItem;
    edtBankInfoExecDate: TcxDBDateEdit;
    lciBankInfoExecDate: TdxLayoutItem;
    edtBankInfoPayerName: TcxDBTextEdit;
    lciBankInfoPayerName: TdxLayoutItem;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataBIK_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    dsDataNAME_K: TStringField;
    dsDataINN_K: TStringField;
    dsDataKPP_K: TStringField;
    dsDataBIC_K: TStringField;
    dsDataACCOUNT_K: TStringField;
    edtBankInfoPayerINN: TcxDBTextEdit;
    lciBankInfoPayerINN: TdxLayoutItem;
    edtBankInfoPayerKPP: TcxDBTextEdit;
    lciBankInfoPayerKPP: TdxLayoutItem;
    lcBankInfoGroup1: TdxLayoutGroup;
    edtBankInfoPayerBIK: TcxDBTextEdit;
    lciBankInfoPayerBIK: TdxLayoutItem;
    edtBankInfoPayerAccount: TcxDBTextEdit;
    lciBankInfoPayerAccount: TdxLayoutItem;
    lcBankInfoGroup2: TdxLayoutGroup;
    edtBankInfoRecepientName: TcxDBTextEdit;
    lciBankInfoRecepientName: TdxLayoutItem;
    edtBankInfoRecepientINN: TcxDBTextEdit;
    lciBankInfoRecepientINN: TdxLayoutItem;
    edtBankInfoRecepientKPP: TcxDBTextEdit;
    lciBankInfoRecepientKPP: TdxLayoutItem;
    lcBankInfoGroup3: TdxLayoutGroup;
    edtBankInfoRecepientBIK: TcxDBTextEdit;
    lciBankInfoRecepientBIK: TdxLayoutItem;
    edtBankInfoRecepientAccount: TcxDBTextEdit;
    lciBankInfoRecepientAccount: TdxLayoutItem;
    lcBankInfoGroup4: TdxLayoutGroup;
    edtBankInfoPaymentInfo: TcxDBMemo;
    lciBankInfoPaymentInfo: TdxLayoutItem;
    adtBankInfoPaymentReason: TcxDBTextEdit;
    lciBankInfoValPaymentReason: TdxLayoutItem;
    edtBankInfoValPaymentType: TcxDBTextEdit;
    lciBankInfoValPaymentType: TdxLayoutItem;
    edtBankInfoValDocNumber: TcxDBTextEdit;
    lciBankInfoValDocNumber: TdxLayoutItem;
    lcBankInfoGroup5: TdxLayoutGroup;
    edtBankInfoValDocDate: TcxDBDateEdit;
    lciBankInfoValDocDate: TdxLayoutItem;
    lcBankInfoGroup6: TdxLayoutGroup;
    dsDataVAL_DOC_DATE: TDateTimeField;
    tabRest: TcxTabSheet;
    dsDataIS_TS: TStringField;
    lciIsTS: TdxLayoutItem;
    cxDBIsTS: TcxDBCheckBox;
    dsDataCUSTOMS_NAME: TStringField;
    edtCustomsName: TcxDBTextEdit;
    lciCustomsName: TdxLayoutItem;
    lcgCustoms: TdxLayoutGroup;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    actCorrectPOCustomCode: TAction;
    qlSQLResult: TQueryList;
    sqlisdoccanident: TsqlOp;
    sqlRemovePaymentOrderfromPack: TsqlOp;
    tabActDeduction: TcxTabSheet;
    lciUIN: TdxLayoutItem;
    edtUIN: TcxDBTextEdit;
    lciUIN2: TdxLayoutItem;
    edtUIN2: TcxDBTextEdit;
    procedure tabDeductionShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure edtRecipientNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtPayerINNPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edtKPPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actSaveAndCloseExecute(Sender: TObject);
    procedure dsDataDOC_DATEValidate(Sender: TField);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure actCreateSubjUpdate(Sender: TObject);
    procedure actCreateSubjExecute(Sender: TObject);
    procedure actLinkUpdate(Sender: TObject);
    procedure actLinkExecute(Sender: TObject);
    procedure tabLockShow(Sender: TObject);
    procedure tabPayForShow(Sender: TObject);
    procedure tabConfirmationShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCancelReserve3YearExecute(Sender: TObject);
    procedure actCancelReserve3YearUpdate(Sender: TObject);
    procedure aCorrectBackExecute(Sender: TObject);
    procedure TabCorrectionShow(Sender: TObject);
    procedure actCorrectSumExecute(Sender: TObject);
    procedure aCorrectSubjectExecute(Sender: TObject);
    procedure edtPayerNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure tabDocPackShow(Sender: TObject);
    procedure tabBankInfoShow(Sender: TObject);
    procedure tabRestShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCorrectPOCustomCodeExecute(Sender: TObject);
    procedure actCorrectPOCustomCodeUpdate(Sender: TObject);
    procedure tabActDeductionShow(Sender: TObject);
  private
    FDeductionForm   : TForm;
    FReserveForm     : TForm;
    FPaymentForForm  : TForm;
    FConfirmForm     : TForm;
    FCorrectGridForm : TForm;
    FDocPackGridForm : TForm;
    FRestGridForm    : TForm;
    FActDedGridForm  : TForm;
    procedure OnLinkFinished(const ADragObject: TfdcDragObject);
  public
    procedure LoadLayout; override;
    function GetSubjectINN: String;virtual;
    function GetSubjectId: Double;
    function GetSubjectKPP: String; virtual;
    function GetSubjectName: String; virtual;
    function PayTypeIs ( const ATypes: string ) : Boolean;
  end;

var
  PaymentOrderForm: TPaymentOrderForm;

implementation

uses fdcCustomObjectFrm, MainDm, fdcCustomCardFrm, DictDm, CheckUtils, FormUtils,
  DateUtils, Math, fdcCustomDataFrm, fdcUtils, fdcObjectServices,
  CorrectionPOBackFrm, fdcCustomObjectGridFrm, CorrectionPOSumFrm,
  CorrectionPOSubjectFrm, fdcCustomDBDataFrm, CorrectPOCustomCodeFrm;


{$R *.dfm}

procedure TPaymentOrderForm.tabDeductionShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FDeductionForm) then
    FDeductionForm := ObjectServices.ShowForm('TPayOrderDeductionGridForm', Params, TWinControl(Sender));
end;

function TPaymentOrderForm.PayTypeIs ( const ATypes: string) : Boolean;
  var
    vTypeList : TStringList;
begin
  if Pos(';', ATypes) > 0 then
    begin
      vTypeList := TStringList.Create;
      try
        vTypeList.Delimiter := ';';
        vTypeList.DelimitedText := ATypes;
        Result := (vTypeList.IndexOf(dsDataTYPESYSNAME.Value) > -1);
      finally
        vTypeList.Free;
      end;
    end
  else
    Result := (dsDataTYPESYSNAME.Value = ATypes);
end;


procedure TPaymentOrderForm.dsDataAfterOpen(DataSet: TDataSet);
var
  IsNotPaymentOrderPayback : boolean;
begin
  IsNotPaymentOrderPayback := not PayTypeIs('Payment_Order_PayBack');
  tabDeduction.TabVisible := IsNotPaymentOrderPayback;
  tabLock.TabVisible := IsNotPaymentOrderPayback;

  if not IsNew and dsDataPAYER_ID.IsNull then
  begin
    lciName_P.Tag := 11;
    lciKPP_P.Tag  := 11;
    lciINN_P.Tag  := 11;
  end
  else
  begin
    lciName_P.Tag := 13;
    lciKPP_P.Tag  := 13;
    lciINN_P.Tag  := 13;
  end;
  if dsDataREST_SUMMA.Value <> ifthen(dsDataSUMMA.IsNull,dsDataDOC_SUMMA.Value,dsDataSUMMA.Value) then
    begin
    dsDataPAYER_ID.ReadOnly := True;
    dsDataDOC_DATE.ReadOnly := True;
    end;
  inherited;
  lcgNewOption.Visible := IsNew;

  sqlHasPaymentFor['result'] := 0;
  tabPayFor.TabVisible := sqlHasPaymentFor.Exec = 1;

  tabConfirmation.TabVisible := not IsNew
                         and PayTypeIs( 'CashOrder;CashOrderBank;CashOrderCustoms;CustomCheque;AggrPayment' );
  // Корректировка  - LSTST-2094 -
  aCorrectBack.Enabled := (PayTypeIs('CashlessPaymentOrder') and (dsDataIS_ACTIVE.Value<>'A'));
  aCorrectSubject.Enabled := not IsNew and
                            ((PayTypeIs('CashlessPaymentOrder;PaymentOrderReuse') and (dsDataIS_ACTIVE.Value<>'A')) or
                              ( PayTypeIs('CashOrderCustoms;CashOrderBank;CustomCheque') and
                                dsDataSUMMA.IsNull
                              )
                            );

  actCorrectSum.Visible :=  not IsNew and
                            PayTypeIs('CashOrderCustoms;CashOrderBank') and
                            dsDataSUMMA.IsNull;
  // если все корректировки недоступны спрячем меню
  btnCorrect.Visible := ivAlways;
  if not actCorrectSum.Visible and
     not aCorrectBack.Enabled and
     not aCorrectSubject.Enabled then
    btnCorrect.Visible := ivNever;
end;

procedure TPaymentOrderForm.edtRecipientNameBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
  begin
     dsDataRECIPIENT_INN.Clear;
     dsDataRECIPIENT_KPP.Clear;
  end
  else
  begin
    dsData['RECIPIENT_INN'] := AObject.FieldValues['INN'];
    dsData['RECIPIENT_KPP'] := AObject.FieldValues['KPP'];
  end;
  Modify(nil);
end;

procedure TPaymentOrderForm.edtPayerINNPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S, S_KPP: String;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
        CheckINN(S);
    if (Sender as TComponent).Tag = 0 then
      S_KPP := dsDATAPayer_KPP.Value
    else
      S_KPP := dsDataRECIPIENT_KPP.Value;

    sqlCheckINN.Exec('INN;KPP', [S, S_KPP]);
  except
   on E: Exception do
   begin
     Error := True;
     ErrorText := E.Message;
   end;
  end;
end;

procedure TPaymentOrderForm.edtKPPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S, S_INN: String;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
        CheckKPP(S);
    if (Sender as TComponent).Tag = 0 then
      S_INN := dsDataPAYER_INN.Value
    else
      S_INN := dsDataRECIPIENT_INN.Value;

    sqlCheckINN.Exec('INN;KPP', [S_INN, S]);
  except
   on E: Exception do
   begin
     Error := True;
     ErrorText := E.Message;
   end;
  end;
end;

procedure TPaymentOrderForm.actSaveAndCloseExecute(Sender: TObject);
begin
  inherited;
  SaveData;
  Close;
end;

procedure TPaymentOrderForm.dsDataDOC_DATEValidate(Sender: TField);
begin
  inherited;
  dsDataEXEC_DATE.Value := dsDataDOC_DATE.Value;
  //Устаревший код chbxAsOld.Visible := dsDataDOC_DATE.Value < MainData.GetSystemValue('MOVING_DATE', rvFloat, 0);
end;

procedure TPaymentOrderForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
  begin
   (* Устаревший кодif chbxAsOld.Visible and chbxAsOld.Checked then
    begin
       dsDataSUMMA.Value := 0;
       dsDataDOC_NO2.Value := dsDataDOC_NO.Value;
       dsDataDOC_DATE2.Value := dsDataDOC_DATE.Value;
     end
     else *)
       begin
        dsDataSUMMA.Clear;
        dsDataDOC_NO2.Clear;
        dsDataDOC_DATE2.Clear;
      end;
  end;
end;

procedure TPaymentOrderForm.actCreateSubjUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible := not IsNew and dsDataPAYER_ID.IsNull;
end;

type
  TApplication_ = class(TComponent)
  protected
    FHandle: HWnd;
    FBiDiMode: TBiDiMode;
    FBiDiKeyboard: string;
    FNonBiDiKeyboard: string;
    FObjectInstance: Pointer;
    FMainForm: TForm;
    FMouseControl: TControl;
    FHelpSystem : IInterface;
    FHelpFile: string;
    FHint: string;
    FHintActive: Boolean;
    FUpdateFormatSettings: Boolean;
    FUpdateMetricSettings: Boolean;
    FShowMainForm: Boolean;
    FHintColor: TColor;
    FHintControl: TControl;
    FHintCursorRect: TRect;
    FHintHidePause: Integer;
    FHintPause: Integer;
    FHintShortCuts: Boolean;
    FHintShortPause: Integer;
    FHintWindow: THintWindow;
    FShowHint: Boolean;
    FTimerMode: TTimerMode;
    FTimerHandle: Word;
    FTitle: string;
    FTopMostList: TList;
    FTopMostLevel: Integer;
    FIcon: TIcon;
    FTerminate: Boolean;
    FActive: Boolean;
    FAllowTesting: Boolean;
    FTestLib: THandle;
    FHandleCreated: Boolean;
    FRunning: Boolean;
    FWindowHooks: TList;
    FWindowList: Pointer;
    FDialogHandle: HWnd;
    FAutoDragDocking: Boolean;
    FModalLevel: Integer;
  end;

function AddParam(AParams: TParams; const Name: string; const Value: Variant): TParam;
begin
  Result := TParam(AParams.Add);
  try
    Result.ParamType := ptInputOutput;
    Result.Name := Name;
    Result.Value := Value;
  except
    Result.Free;
    raise;
  end;
end;

procedure TPaymentOrderForm.actCreateSubjExecute(Sender: TObject);
var
  AForm: TObjectForm;
  Params: TfdcParams;
  F: TField;
begin
  inherited;
  Params := TfdcParams.Create(nil);
  try
    AddParam(Params, 'new name', dsDataPAYER_NAME.Value);
    AddParam(Params, 'new inn', dsDataPAYER_INN.Value);
    AddParam(Params, 'new kpp', dsDataPAYER_KPP.Value);
    Inc(TApplication_(Application).FModalLevel);
    try
      AForm := ObjectServices.CreateObject('Subject', True, Params) as TObjectForm;
      if assigned(AForm) and not AForm.IsNew then
      begin
        dsDataPAYER_ID.Value := AForm.ID;
        dsDataPAYER_NAME.Clear;
        dsDataPAYER_NAME.Value := AForm.dsDataNAME.Value;
        F := AForm.dsData.FindField('INN');
        if F <> nil  then
          dsDataPAYER_INN.Value := F.AsString;

        F := AForm.dsData.FindField('KPP');
        if F <> nil then
           dsDataPAYER_KPP.Value := F.AsString;
      end;
    finally
       Dec(TApplication_(Application).FModalLevel);
    end;
  finally
     Params.Free;
  end;
end;

procedure TPaymentOrderForm.LoadLayout;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
   BarManager.SaveToStream(Stream);
   inherited;
   Stream.Position := 0;
   BarManager.LoadFromStream(Stream);
  finally
   Stream.Free;
  end;
end;

function TPaymentOrderForm.GetSubjectId: Double;
begin
  Result := dsDataPAYER_ID.Value;
end;

function TPaymentOrderForm.GetSubjectINN: String;
begin
  Result := dsDataPAYER_INN.Value;
end;

function TPaymentOrderForm.GetSubjectKPP: String;
begin
  Result := dsDataPAYER_KPP.Value;
end;

function TPaymentOrderForm.GetSubjectName: String;
begin
  Result := dsDataPAYER_NAME.Value;
end;

procedure TPaymentOrderForm.actLinkUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Visible := not IsNew and (dsDataSUMMA.IsNull);
end;

procedure SetParamValue(Params: TParams; const AParamName: string; const AValue: Variant);
var
  AParam: TParam;
begin
  AParam := Params.FindParam(AParamName);
  if AParam = nil then
  begin
    AParam := TParam(Params.Add);
    AParam.Name := AParamName;
  end;
  AParam.Value := AValue;
end;

procedure TPaymentOrderForm.actLinkExecute(Sender: TObject);
var
  Params: TfdcParams;
begin
  inherited;
  Params := TfdcParams.Create(nil);
  try
   SetParamValue(Params, 'NA', 3);
   SetParamValue(Params, 'CURRENCY_ID', dsDataCURRENCY_ID.Value);
   SetParamValue(Params, 'QBE_DOC_SUMMA', dsDataDOC_SUMMA.Value);
   SetParamValue(Params, 'ALLOW_UNCERTAIN', True);
   SetParamValue(Params, 'PAYER_ONLY', True);
   ObjectServices.SearchObject('TPaymentOrderGridForm', 'PaymentOrder', 0, Params, nil, false, OnLinkFinished);
  finally
    Params.Free;
  end;
end;

procedure FreeFDCObject(AnObject: TfdcObject);
var
   AObjForm: TfdcCustomObjectForm;
    function FindObjectForm(AID: double): TfdcCustomObjectForm;
    var
      i: integer;
    begin
      Result := nil;
      for i := 0 to Application.MainForm.MDIChildCount - 1 do
        if (Application.MainForm.MDIChildren[i] is TfdcCustomObjectForm) and
          ((Application.MainForm.MDIChildren[i] as TfdcCustomObjectForm).ID = AID) then
        begin
          Result := Application.MainForm.MDIChildren[i] as TfdcCustomObjectForm;
          Exit;
        end;
    end;
begin
  AObjForm := FindObjectForm(AnObject.ID);
  if assigned(AObjForm) then
  begin
    AObjForm.RefreshWaiters;
    AObjForm.Close;
    AObjForm.Free;
  end;
  AnObject.Free;
end;

procedure TPaymentOrderForm.OnLinkFinished(
  const ADragObject: TfdcDragObject);
begin
  try
    sqlMergePP.Exec('mid', ADragObject.SingleObject.ID);
    dsData.Session.Commit;
    FreeFDCObject(ADragObject.SingleObject);
    RefreshData;
    RefreshWaiters;
  except
    dsData.Session.Rollback;
    raise;
  end;
end;

procedure TPaymentOrderForm.tabLockShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FReserveForm) then
    begin
      FReserveForm := ObjectServices.ShowForm('TReservedByPaymentGridForm', Params, TWinControl(Sender));
      TObjectForm(FReserveForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(FReserveForm));
    end;
end;

procedure TPaymentOrderForm.tabPayForShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FPaymentForForm) then
    FPaymentForForm := ObjectServices.ShowForm('TPayForGridForm', Params, TWinControl(Sender));
end;

procedure TPaymentOrderForm.tabConfirmationShow(Sender: TObject);
begin
  dsetPOConfirm.SetVariable( 'ID', ID );
  if dsetPOConfirm.Active then
    dsetPOConfirm.Refresh
  else
    dsetPOConfirm.Open;
end;

procedure TPaymentOrderForm.FormCreate(Sender: TObject);
begin
  inherited;
  fConfirmForm := nil;
  FDocPackGridForm := nil;
  FRestGridForm := nil;
end;

procedure TPaymentOrderForm.actCancelReserve3YearExecute(Sender: TObject);
begin
  inherited;
  sqlCancelReserve3Year.Exec;
  RefreshData;
  RefreshWaiters;
end;

procedure TPaymentOrderForm.actCancelReserve3YearUpdate(Sender: TObject);
begin
  inherited;
  actCancelReserve3Year.Enabled := dsStateSYSNAME.Value = 'PaymentOrderBlocked';
end;


procedure TPaymentOrderForm.aCorrectBackExecute(Sender: TObject);
  var
    lv_CorrectForm : TForm;
begin
  // Проверка на наличие списаний и блокировок по платежке
  sqlCheckPO.Exec('pID;TypeSysName',[Self.dsData.FieldByName( 'id' ).AsFloat, Self.dsData.FieldByName( 'TypeSysName' ).AsString]);

  lv_CorrectForm := GetObjectServices.CreateObject( 'CorrectionPOBack', False, nil );
  with lv_CorrectForm as TCorrectionPOBackForm do
    begin

      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;

      end;
  RefreshData;
end;

procedure TPaymentOrderForm.TabCorrectionShow(Sender: TObject);
begin
  if not Assigned(FCorrectGridForm) then begin
    Params.ParamValues['pDocID'] := self.dsDataID.Value;
    FCorrectGridForm := ShowForm('TCorrectionPOGridForm', Params, tabCorrection);
    TObjectForm(FCorrectGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FCorrectGridForm));
    TfdcCustomObjectGridForm(FCorrectGridForm).actAdd.Visible:= False;
  end;
end;

procedure TPaymentOrderForm.actCorrectSumExecute(Sender: TObject);
  var
    lv_CorrectForm : TForm;
begin
  lv_CorrectForm := GetObjectServices.CreateObject( 'CorrectionPOSum', False, nil );
  with lv_CorrectForm as TCorrectionPOSumForm do
    begin
      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
      dsData.FieldByName( 'OLD_SUMMA' ).AsFloat := Self.dsData.FieldByName( 'DOC_SUMMA' ).AsFloat;
    end;
  RefreshData;
end;

procedure TPaymentOrderForm.aCorrectSubjectExecute(Sender: TObject);
  var
    lv_CorrectForm : TForm;
begin
  // Проверка на наличие списаний и блокировок по платежке
  sqlCheckPO.Exec('pID',Self.dsData.FieldByName( 'id' ).AsFloat);

  lv_CorrectForm := GetObjectServices.CreateObject( 'CorrectionPoSubject', False, nil );
  with lv_CorrectForm as TCorrectionPOSubjectForm do
    begin

      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
    end;
  RefreshData;
end;

procedure TPaymentOrderForm.edtPayerNameBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
  begin
     dsDataPAYER_INN.Clear;
     dsDataPAYER_KPP.Clear;
  end
  else
  begin
    dsData['PAYER_INN'] := AObject.FieldValues['INN'];
    dsData['PAYER_KPP'] := AObject.FieldValues['KPP'];
  end;
  Modify(nil);
end;

procedure TPaymentOrderForm.tabDocPackShow(Sender: TObject);
begin
  if not Assigned( FDocPackGridForm ) then
    FDocPackGridForm := ShowForm( 'TDocPackByPOGridForm', Params, tabDocPack );
end;

procedure TPaymentOrderForm.tabBankInfoShow(Sender: TObject);
begin
  inherited;
  UpdateLayoutControl( False, lcBankInfo );
end;

procedure TPaymentOrderForm.tabRestShow(Sender: TObject);
begin
  if not Assigned( FRestGridForm ) then
    begin
      FRestGridForm := ShowForm( 'TRestByPOGridForm', Params, tabRest );
      TObjectForm(FRestGridForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(FRestGridForm));
    end;
end;

procedure TPaymentOrderForm.FormShow(Sender: TObject);
begin
  inherited;

  dsDataIS_TS.ReadOnly   := not dsDataIS_TS.IsNull;

  if dsDataIS_TS.ReadOnly then begin
    cxDBIsTS.Tag := 33;
  end;
  //--
  actCorrectPOCustomCode.Visible := (MainData.GetCustomsLevel in [0..1]);
end;

procedure TPaymentOrderForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  dsDataIS_TS.ReadOnly   := not dsDataIS_TS.IsNull;

  if dsDataIS_TS.ReadOnly then begin
    cxDBIsTS.Tag := 33;
  end;
end;

procedure TPaymentOrderForm.actCorrectPOCustomCodeExecute(Sender: TObject);
  var lv_CorrectForm : TForm;
      lv_sign: Integer;
begin
  if (MainData.GetCustomsLevel in [0..1]) then
    begin
      //-- проверка возможности повторной идентификации
      sqlisdoccanident.ParamValues['ppaymentid'] := Self.dsData.FieldByName( 'id' ).AsFloat;
      sqlisdoccanident.Exec;
      lv_sign := sqlisdoccanident.ParamValues['lresult'];
      case lv_sign of
        0..1: begin
               if (lv_sign = 1) then
                 begin
                  if (fdcMessages.MessageDlg('Решение о повторной идентификации платежного поручения','Данное платёжное поручение имеет связь с реестром. Вы уверены, что хотите исключить данное платёжное поручение из реестра?','Данное платёжное поручение имеет связь с реестром. Вы уверены, что хотите исключить данное платёжное поручение из реестра?',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                   begin
                     sqlRemovePaymentOrderfromPack.ParamValues['ppaymentid'] := Self.dsData.FieldByName( 'id' ).AsFloat;
                     sqlRemovePaymentOrderfromPack.Exec;
                     lv_sign := 0;
                    end;
                 end;
               if (lv_sign = 0) then
                 begin
                   lv_CorrectForm := GetObjectServices.CreateObject( 'CorrectPoCustomCode', False, nil );
                   with lv_CorrectForm as TCorrectPoCustomCodeForm do
                     begin
                       dsData.FieldByName( 'PAYMENT_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
                       dsData.FieldByName( 'DOCUMENT_BASE' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
                       ParamsHolder.Params.ParamValues['PAYMENT_ID'] := Self.dsData.FieldByName( 'id' ).AsFloat;
                     end;
                   RefreshData;
                 end;
             end;
        2: begin
             fdcMessages.MessageDlg('Решение о повторной идентификации платежного поручения','Невозможно создать решение о повторной идентификации, так как платежное поручение отправлено на нижестоящий ТО','Невозможно создать решение о повторной идентификации, так как платежное поручение отправлено на нижестоящий ТО', mtInformation,[mbOK],0);
           end
        else fdcMessages.MessageDlg('Решение о повторной идентификации платежного поручения','Неожиданное значение функции проверки "'+inttostr(lv_sign)+'"','Неожиданное значение функции проверки "'+inttostr(lv_sign)+'"', mtError,[mbOK],0);
      end;
      //--
    end;
end;

procedure TPaymentOrderForm.actCorrectPOCustomCodeUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (MainData.GetCustomsLevel in [0..1]);
end;

procedure TPaymentOrderForm.tabActDeductionShow(Sender: TObject);
begin
  inherited;
  if not Assigned( FActDedGridForm ) then
    begin
      FActDedGridForm := ShowForm( 'TPOActDedGridForm', Params, tabActDeduction );
      TObjectForm(FActDedGridForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(FActDedGridForm));
    end;
end;

initialization
    RegisterClass(TPaymentOrderForm);

end.

