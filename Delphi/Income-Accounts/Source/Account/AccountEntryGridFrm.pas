unit AccountEntryGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus;

type
  TAccountEntryGridForm = class(TObjectGridForm)
    dsDataITEM_DATE: TDateTimeField;
    dsDataDEBNO: TStringField;
    dsDataDEB_INN: TStringField;
    dsDataDEB_P: TStringField;
    dsDataCRENO: TStringField;
    dsDataCRE_INN: TStringField;
    dsDataCRE_P: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCODE: TStringField;
    grdDataDBBandedTableViewITEM_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEBNO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEB_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEB_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCRENO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCRE_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCRE_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn;
    dsDataOBJECT_NAME: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    dsDataDECL_GOODS: TStringField;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    procedure grdDataDBBandedTableViewSelectionChanged(
      Sender: TcxCustomGridTableView);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountEntryGridForm: TAccountEntryGridForm;

implementation

uses MainDm, fdcCustomGridFrm;

{$R *.dfm}

procedure TAccountEntryGridForm.grdDataDBBandedTableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  Summa: double;
  I: Integer;
begin
  inherited;
  if Sender.Controller.SelectedRecordCount > 1 then
  begin
    Summa := 0.0;
    for I := 0 to Sender.Controller.SelectedRecordCount - 1 do
    begin
      Summa := Summa +
         Sender.Controller.SelectedRecords[I].Values[grdDataDBBandedTableViewSUMMA.Index];
    end;
    ShowProgress(Format('Сумма по выбранным строкам = %s', [FormatFloat(',0.00', Summa)]));
  end
  else HideProgress;
end;

initialization
    RegisterClass(TAccountEntryGridForm);

end.
