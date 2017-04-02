unit CorrectPOCustomCodeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit, QueryList, fdcMessages,
  cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, OracleData, fdcObjectCore;

type
  TCorrectPOCustomCodeForm = class(TDocumentForm)
    dsDataPAYMENT_ID: TFloatField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDOC_SOURCE_NAME: TStringField;
    dsDataREASON_CORRECT: TStringField;
    dsDataCUSTOMCODE_OLD_ID: TFloatField;
    dsDataCUSTOMCODE_OLD: TStringField;
    dsDataCUSTOMCODE_NEW_ID: TFloatField;
    dsDataCUSTOMCODE_NEW: TStringField;
    dsDataUSER_ID: TFloatField;
    dsDataUSER_NAME: TStringField;
    dsDataDOCUMENT_BASE: TStringField;
    dsDataPAYMENT_NUMBER: TStringField;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataPAYMENT_DOC_SUMMA: TFloatField;
    lcgDocumentBase: TdxLayoutGroup;
    lcieditDocBase: TdxLayoutItem;
    editDocBase: TcxDBTextEdit;
    lcgReasonCorrect: TdxLayoutGroup;
    lcieditReasonCorrect: TdxLayoutItem;
    editReasonCorrect: TcxDBMemo;
    lcgCustomsCode: TdxLayoutGroup;
    actOpenPaymentOrder: TAction;
    btnOpenPaymentOrder: TdxBarButton;
    qlSQLResult: TQueryList;
    sqlisdoccanident: TsqlOp;
    lcieditCustomcodeOld: TdxLayoutItem;
    editCustomcodeOld: TcxDBLookupComboBox;
    lcieditCustomcodeNew: TdxLayoutItem;
    editCustomcodeNew: TcxDBLookupComboBox;
    dsetCustoms: TOracleDataSet;
    dsetCustomsID: TFloatField;
    dsetCustomsCUSTOMS_CODE_8: TStringField;
    dsetCustomsNAME: TStringField;
    dsetCustomsDT_END: TDateField;
    dsCustoms: TDataSource;
    procedure actOpenPaymentOrderExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure editCustomcodeNewPropertiesInitPopup(Sender: TObject);
    procedure editCustomcodeNewPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectPOCustomCodeForm: TCorrectPOCustomCodeForm;

implementation

uses fdcCustomDataFrm, MainDm, fdcCustomObjectFrm, MainFrm,
  PaymentOrderFrm;

{$R *.dfm}

procedure TCorrectPOCustomCodeForm.actOpenPaymentOrderExecute(
  Sender: TObject);
begin
  if (dsData.Active and not dsData.IsEmpty) then
    begin
      ObjectServices.OpenObject( dsData.FieldByName('PAYMENT_ID').AsInteger, nil );
    end;
end;

procedure TCorrectPOCustomCodeForm.actSaveExecute(Sender: TObject);
  var lv_isnew: Boolean;
      lv_form: TForm;
      lv_fdc_object: TfdcObject;
begin
  lv_isnew:= GetIsNew;
  lv_form:= nil;
  lv_fdc_object:= nil;
  if (lv_isnew) then
    begin
      if (fdcMessages.MessageDlg('Решение о повторной идентификации платежного поручения','Вы уверены, что хотите повторно идентифицировать платёжное поручение?','Вы уверены, что хотите повторно идентифицировать платёжное поручение?',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
        begin
          dsInsert.Params.ParamValues['preasoncorrect'] := trim(editReasonCorrect.Text);
          dsInsert.Params.ParamValues['ppaymentid'] := ParamsHolder.Params.ParamValues['PAYMENT_ID'];
          dsInsert.Params.ParamValues['pcustomcodenewid'] := editCustomcodeNew.EditValue;
          inherited;
          //--  reopen form payment
          lv_form := ObjectServices.FindObject(ParamsHolder.Params.ParamValues['PAYMENT_ID']);
          if Assigned(lv_form) then
            begin
              TPaymentOrderForm(lv_form).Close;
            end;
          //--
          lv_fdc_object:= MainForm.ObjectFactory.FindObject(ParamsHolder.Params.ParamValues['PAYMENT_ID']);
          if Assigned(lv_fdc_object) then
            begin
              FreeAndNil(lv_fdc_object);
            end;
          //--
          actOpenPaymentOrder.Execute;
          //--
        end;
    end;
end;

procedure TCorrectPOCustomCodeForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if not(DataSet.Eof) then
    begin
      ParamsHolder.Params.ParamValues['PAYMENT_ID'] := DataSet.FieldValues['PAYMENT_ID'];
    end;
end;

procedure TCorrectPOCustomCodeForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  if not dsetCustoms.Active then
    begin
      dsetCustoms.Open;
    end;
  inherited;
end;

procedure TCorrectPOCustomCodeForm.editCustomcodeNewPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  dsetCustoms.Filtered := True;
end;

procedure TCorrectPOCustomCodeForm.editCustomcodeNewPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  dsetCustoms.Filtered := False;
end;

initialization
  RegisterClass(TCorrectPOCustomCodeForm);

end.
