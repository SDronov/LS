unit CashOrderByBankGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, cxCurrencyEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, QueryList,
  Menus, cxMemo, cxCalc, cxCheckBox;

type
  TCashOrderByBankGridForm = class(TPaymentOrderGridForm)
    QueryList1: TQueryList;
    sqlGetCustomID: TsqlOp;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

implementation

uses MainDm, fdcCustomDBDataFrm;

{$R *.dfm}


procedure TCashOrderByBankGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sqlGetCustomID.Exec;
  dsData.params.ParamValues['CUSTOM_ID'] := sqlGetCustomID.ParamValues['result'];
end;

procedure TCashOrderByBankGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtName.Text := '';
  edtINN.Text := '';
  edtKPP.Text := '';
end;

initialization
  RegisterClass(TCashOrderByBankGridForm);

end.
