unit PaymentOrderConfirmFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxCurrencyEdit;

type
  TPaymentOrderConfirmForm = class(TDocumentForm)
    dsDataOPERATE_DATE: TDateTimeField;
    dsDataDOC_NO: TStringField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCASHDESK_ID: TFloatField;
    dsDataCARDNUM: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataNOTE: TStringField;
    dsDataNREF: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    dsDataCASHDESK_NAME: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataREST_SUMMA: TFloatField;
    dsDataLOCKED_SUMMA: TFloatField;
    dsDataCOMING_DATE: TDateTimeField;
    dsDataASSURE_DATE: TDateTimeField;
    dsDataDESCRIPT2: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataPO_NAME: TStringField;
    dsDataPO_INN: TStringField;
    dsDataPO_KPP: TStringField;
    dsDataS_NAME: TStringField;
    dsDataS_INN: TStringField;
    dsDataS_KPP: TStringField;
    dsDataCONFIRMED_PAY_ID: TFloatField;
    lcgPayer: TdxLayoutGroup;
    edtPayerINN: TcxDBTextEdit;
    lciPayerINN: TdxLayoutItem;
    edtPayerKPP: TcxDBTextEdit;
    lciPayerKPP: TdxLayoutItem;
    edtPayerName: TcxDBTextEdit;
    lciPayerName: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    lcgConfirmation: TdxLayoutGroup;
    edtExecDate: TcxDBDateEdit;
    lciExecDate: TdxLayoutItem;
    edtDocSumma: TcxDBCurrencyEdit;
    lciDocSumma: TdxLayoutItem;
    edtCurrencyCode: TcxDBTextEdit;
    lciCurrencyCode: TdxLayoutItem;
    edtCurrencyName: TcxDBTextEdit;
    lciCurrencyName: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    edtIncomeDate: TcxDBTextEdit;
    lciIncomeDate: TdxLayoutItem;
    lcGeneralGroup5: TdxLayoutGroup;
    lcGeneralGroup6: TdxLayoutGroup;
    actOpenConfirmed: TAction;
    barBtnOpenConfirmed: TdxBarButton;
    procedure actOpenConfirmedExecute(Sender: TObject);
    procedure actOpenConfirmedUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentOrderConfirmForm: TPaymentOrderConfirmForm;

implementation

uses fdcCustomObjectFrm, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TPaymentOrderConfirmForm.actOpenConfirmedExecute(
  Sender: TObject);
begin
  ObjectServices.OpenObject( dsData.FieldByName( 'CONFIRMED_PAY_ID' ).AsFloat, nil );
end;

procedure TPaymentOrderConfirmForm.actOpenConfirmedUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and ( dsData.FieldByName( 'CONFIRMED_PAY_ID' ).AsFloat <> dsData.ParamByName( 'id' ).AsFloat );
end;

initialization
  RegisterClass( TPaymentOrderConfirmForm );

end.
