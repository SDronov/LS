unit PaymentOrderRestCustomsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderCreditFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  OracleData, QueryList, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDBEdit, dxLayoutControl,
  cxGroupBox, cxCheckBox, cxButtons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls;

type
  TPaymentOrderRestCustomsForm = class(TPaymentOrderCreditForm)
    lciedtLastUse: TdxLayoutItem;
    edtLastUse: TcxDBDateEdit;
    dsDataLAST_USE: TDateTimeField;
    dsDataLAST_USE_PRESENT: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentOrderRestCustomsForm: TPaymentOrderRestCustomsForm;

implementation

{$R *.dfm}

initialization
    RegisterClass(TPaymentOrderRestCustomsForm);

end.
