unit PaymentOrderDebitFrm;

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
  TPaymentOrderDebitForm = class(TPaymentOrderForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentOrderDebitForm: TPaymentOrderDebitForm;

implementation

{$R *.dfm}

procedure TPaymentOrderDebitForm.FormShow(Sender: TObject);
begin
  inherited;
  tabRest.TabVisible := False;
end;

end.
