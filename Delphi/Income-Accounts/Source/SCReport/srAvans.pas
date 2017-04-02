unit srAvans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, srReport, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBarExtItems, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCurrencyEdit, Oracle;

type
  TsrAvansGridForm = class(TsrReportGridForm)
    dsDataSUBJ_ID: TFloatField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    dsDataSUBJ_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataSUMMA: TFloatField;
    colSubj_Inn: TcxGridDBBandedColumn;
    colSubj_Kpp: TcxGridDBBandedColumn;
    colSubj_Name: TcxGridDBBandedColumn;
    colCurr_Code: TcxGridDBBandedColumn;
    colSumma: TcxGridDBBandedColumn;
    dsDataID: TFloatField;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure grdDataDBBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
  public
  end;

implementation

{$R *.dfm}


procedure TsrAvansGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('Make_Date').Value := edtFrom.Date;
end;

procedure TsrAvansGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtTo.Visible := ivNever;
end;

procedure TsrAvansGridForm.grdDataDBBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actOpenExecute(Sender);
end;

initialization
   RegisterClass(TsrAvansGridForm);

end.
