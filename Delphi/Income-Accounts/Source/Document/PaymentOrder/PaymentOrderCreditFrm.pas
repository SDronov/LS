unit PaymentOrderCreditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  OracleData, QueryList, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDBEdit, dxLayoutControl,
  cxGroupBox, cxCheckBox, cxButtons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls;

type
  TPaymentOrderCreditForm = class(TPaymentOrderForm)
    dsDataKBK_OLD: TStringField;
    dsDataDESTCUSTOMSCODE_OLD: TStringField;
    edtDestOld: TcxDBTextEdit;
    lciDestOld: TdxLayoutItem;
    edtKBKOld: TcxDBTextEdit;
    lciKBKOld: TdxLayoutItem;
    tabPaymentOrderNonId: TcxTabSheet;
    dsDataDOC_NUMBER: TStringField;
    dsDataNREF: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataNLS: TStringField;
    dsDataPAYMENT_ORDER_NON_ID: TFloatField;
    procedure tabPaymentOrderNonIdShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FPaymentOrderNonIDForm: TForm;
  public
    { Public declarations }
  end;

var
  PaymentOrderCreditForm: TPaymentOrderCreditForm;

implementation

uses fdcCustomDBDataFrm
    ,ObjectFrm
    ,fdcCustomObjectFrm
    ,MainFrm
    ,fdcObjectCore;

{$R *.dfm}

procedure TPaymentOrderCreditForm.tabPaymentOrderNonIdShow(
  Sender: TObject);
begin
  if not(Assigned(FPaymentOrderNonIDForm))
     and
     not(dsData.FieldByName('payment_order_non_id').IsNull) then
    begin
      FPaymentOrderNonIDForm := MainForm.ShowFormObject(dsData.FieldByName('payment_order_non_id').AsFloat,tabPaymentOrderNonId);
      TObjectForm(FPaymentOrderNonIDForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(FPaymentOrderNonIDForm));
    end;
end;

procedure TPaymentOrderCreditForm.FormCreate(Sender: TObject);
begin
  inherited;
  FPaymentOrderNonIDForm := nil;
end;

procedure TPaymentOrderCreditForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tabPaymentOrderNonId.TabVisible := not(dsData.FieldByName('payment_order_non_id').IsNull);
end;

end.
