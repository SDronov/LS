unit srPeriodPmnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, srReport, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBarExtItems, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, dxmdaset, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxCurrencyEdit, Oracle;

type
  TsrPeriodPmntGridForm = class(TsrReportGridForm)
    grdDataDBBandedTableViewpd_doc_date: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewdecl_name: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewmin_payment_month: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewmax_payment_month: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewrur_summa: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewusd_summa: TcxGridDBBandedColumn;
    grdDataDBBandedTableVieweur_summa: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewpd_payment_type: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewdecl_inn: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TsrPeriodPmntGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('dat1').Value := edtFrom.Date;
  dsData.ParamByName('dat2').Value := edtTo.Date;
end;

initialization
     RegisterClass(TsrPeriodPmntGridForm);

end.
