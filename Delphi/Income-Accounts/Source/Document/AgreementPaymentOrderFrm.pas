unit AgreementPaymentOrderFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderFrm, QueryList, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxButtons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit, cxDBEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, cxGraphics, Menus, cxLookAndFeelPainters,
  OracleData, cxGroupBox, PaymentOrderCreditFrm;

type
  TAgreementPaymentOrderForm = class(TPaymentOrderCreditForm)
    cmbxAgreementID: TfdcObjectLookupEdit;
    lciAgreementID: TdxLayoutItem;
    dsDataAGREEMENT_ID: TFloatField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses DictDm, MainDm;

{$R *.dfm}

procedure TAgreementPaymentOrderForm.FormShow(Sender: TObject);
begin
  inherited;
  tabRest.TabVisible := False;
end;

initialization
    RegisterClass(TAgreementPaymentOrderForm);

end.
