unit srDeclBack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, srReport, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, DB, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBarExtItems, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridDBTableView, cxGrid, StdCtrls,
  dxLayoutControl, cxButtons, ExtCtrls, cxProgressBar, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCurrencyEdit;

type
  TsrDeclBackGridForm = class(TsrReportGridForm)
    dsDataITEM_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    dsDataBDATE: TDateTimeField;
    dsDataREASON_NAME: TStringField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataCHANGE_DESC: TStringField;
    dsDataCUR_CODE: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataID: TFloatField;
    grdDataDBBandedTableViewITEM_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHANGE_DESC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  srDeclBackGridForm: TsrDeclBackGridForm;

implementation

{$R *.dfm}

procedure TsrDeclBackGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('dat1').Value := edtFrom.Date;
  dsData.ParamByName('dat2').Value := edtTo.Date;
end;

initialization
   RegisterClass(TsrDeclBackGridForm);

end.
