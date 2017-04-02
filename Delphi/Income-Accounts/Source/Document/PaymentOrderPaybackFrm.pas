unit PaymentOrderPaybackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  QueryList, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar,
  ImgList, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, StdCtrls, dxLayoutControl, cxGroupBox, cxCheckBox, cxButtons,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxCurrencyEdit, cxDBEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, OracleData, PaymentOrderDebitFrm;

type
  TPayment_Order_PaybackForm = class(TPaymentOrderDebitForm)
    dsDataSEQ_PAYMENT: TStringField;
    dsDataKIND_PAYMENT: TStringField;
    edtSeqPayment: TcxDBMaskEdit;
    lcGeneralItem9: TdxLayoutItem;
    edtKindPayment: TcxDBMaskEdit;
    lcGeneralItem11: TdxLayoutItem;
    lcGeneralGroup13: TdxLayoutGroup;
    sqlGetSysName: TsqlOp;
    dsDataKBKCODE_ID: TFloatField;
    dsDataNLS: TStringField;
    lciBank: TdxLayoutGroup;
    lcBank: TdxLayoutItem;
    fdcBank: TfdcObjectLinkEdit;
    dsDecision: TDataSource;
    lcAccount: TdxLayoutItem;
    edtAccount: TcxDBMaskEdit;
    lcBic: TdxLayoutItem;
    edtBic: TcxDBMaskEdit;
    lcGeneralGroup14: TdxLayoutGroup;
    lcCorrAccount: TdxLayoutItem;
    edtCorrAccount: TcxDBMaskEdit;
    dsDataDEC_PAY_ID: TFloatField;
    sqlDecision: TfdcQuery;
    sqlDecisionBANK_ID: TFloatField;
    sqlDecisionDECISION_BIC: TStringField;
    sqlDecisionDECISION_BANK_NAME: TStringField;
    sqlDecisionDECISION_CORR_ACCOUNT: TStringField;
    sqlDecisionDECISION_ACCOUNT: TStringField;
    sqlDecisionDECISION_PERSONAL_ACCOUNT: TStringField;
    actOpenDecision: TAction;
    dsDataRECIPIENT_NAME_BANK: TStringField;
    dsDataDOC_DATE_UFK: TDateTimeField;
    dsDataDOC_NUMBER_UFK: TStringField;
    lcGeneralItem3: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem4: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralGroup15: TdxLayoutGroup;
    lcGeneralGroup16: TdxLayoutGroup;
    dxBarButton6: TdxBarButton;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actOpenDecisionExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
  private
    procedure checkStringFields;
  public
  end;

implementation

uses DictDm, fdcUtils, fdcMessages;

{$R *.dfm}

procedure TPayment_Order_PaybackForm.dsDataAfterOpen(DataSet: TDataSet);
var i       :integer;
begin
  inherited;
   sqlGetSysname.Exec('ID',[dsDataID.Value]);

   if not DictData.dsCurrency.Active then  DictData.dsCurrency.Open;
  // Запретить переходы между статусами 'Получен' и "Отказ'!!!
  // If sqlGetSysname.ParamValues['SYSNAME'] = 'DecPaybackTimeOut' then
   for i:= 0 to btnStateTransit.ItemLinks.Count - 1 do
    if (btnStateTransit.ItemLinks[i].Item.Caption = 'Получен -> Отказ')  then
      begin
        btnStateTransit.ItemLinks[i].Item.Enabled := False;
        Break;
      end;
  if not dsData.FieldByName( 'DEC_PAY_ID' ).IsNull then
    begin
      sqlDecision.ParamByName('pId').AsInteger:=dsData.FieldByName( 'DEC_PAY_ID' ).AsInteger;
      sqlDecision.Open;
    end;
end;

procedure TPayment_Order_PaybackForm.FormShow(Sender: TObject);
begin
  inherited;
   lciRestSum.Visible 		:= False;
   lcGeneralGroup2.Visible := False;
   lciPayTypeCode.Visible 	:= False;
   lciDescript2.Visible 	:= False;
   lciSumma.Visible			:= False;
end;

procedure TPayment_Order_PaybackForm.actOpenDecisionExecute(
  Sender: TObject);
begin
  inherited;
  if not (    dsData.Active
          and not dsData.IsEmpty) then
    Exit;

  ObjectServices.OpenObject( dsData.FieldByName('DEC_PAY_ID').AsInteger, nil );

end;

procedure TPayment_Order_PaybackForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
   lciRestSum.Visible 		:= False;
   lcGeneralGroup2.Visible := False;
   lciPayTypeCode.Visible 	:= False;
   lciDescript2.Visible 	:= False;
   lciSumma.Visible			:= False;
end;


procedure TPayment_Order_PaybackForm.checkStringFields;
const
 cUserHint = 'Необходима замена недопустимых символов!';
 cUserWarn =
 'Внимание! В текстовых полях Заявки находятся недопустимые символы!'#13#10+
 'Выгрузка этой Заявки в реестр будет запрещена до замены недопустимых символов!';
var msgList: TStrings;
begin
 msgList:= nil;
 fdcUtils.checkIllegalChars( dsData, msgList );

 if assigned(msgList) and (msgList.Count > 0) then
   ShowMessage( cUserWarn, cUserHint, msgList.Text );

 if assigned(msgList) then
   freeAndNil(msgList);
end;

procedure TPayment_Order_PaybackForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
  checkStringFields;
end;

initialization
    RegisterClass(TPayment_Order_PaybackForm);

end.
