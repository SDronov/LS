unit PaymentOrderPaybackControlGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderPaybackGridFrm, PaymentOrderGridFrm, cxGraphics,
  Menus, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, cxCheckBox, cxCalendar,
  QueryList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxMemo, cxCurrencyEdit,
  cxDropDownEdit, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, dxBarExtItems, xlcClasses,
  xlEngine, xlReport, Oracle;

type
  TPaymentOrderPaybackControlGridForm = class(TPayment_Order_PaybackGridForm)
    barEdtDays: TdxBarSpinEdit;
    dsDataDATE_LAST_DOC: TDateTimeField;
    dsDataREG_RET_DOC_SEND: TDateTimeField;
    dsDataACTIVATION_DATE_Y: TDateTimeField;
    grdDataDBBandedTableViewACTIVATION_DATE_Y: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_LAST_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_RET_DOC_SEND: TcxGridDBBandedColumn;
    dsDataDATE_COURT: TDateTimeField;
    grdDataDBBandedTableViewDATE_COURT: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentOrderPaybackControlGridForm: TPaymentOrderPaybackControlGridForm;

implementation

{$R *.dfm}

procedure TPaymentOrderPaybackControlGridForm.dsDataBeforeOpen(
  DataSet: TDataSet);
begin
  dsData.Params.ParamByName( 'days' ).AsInteger := barEdtDays.IntValue;

  inherited;
end;

initialization
  RegisterClass ( TPaymentOrderPaybackControlGridForm );

end.
