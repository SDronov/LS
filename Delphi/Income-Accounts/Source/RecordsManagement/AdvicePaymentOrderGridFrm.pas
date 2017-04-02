unit AdvicePaymentOrderGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManPaymentOrderGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, QueryList, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxLayoutControl, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit,
  cxSpinEdit, cxLabel, dxStatusBar, PaymentOrderGridFrm, cxCheckBox;

type
  TAdvicePaymentOrderGridForm = class(TPaymentOrderGridForm)
    dsDataPAYMENT_SUMMA: TFloatField;
    colPaymentSumma: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormShow(Sender: TObject);
  private
  public
  end;

implementation

uses fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TAdvicePaymentOrderGridForm.FormShow(Sender: TObject);
begin
  inherited;
  cmbxViewMode.Visible := ivNever;
  actAdd.Visible := False;
  actDelete.Visible := False;
end;

initialization
  RegisterClass(TAdvicePaymentOrderGridForm);

end.
