unit PersonGridFrm;

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
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TPersonGridForm = class(TObjectGridForm)
    dsDataSURNAME: TStringField;
    dsDataFIRSTNAME: TStringField;
    dsDataMIDDLENAME: TStringField;
    dsDataOGRN: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataOKPO: TStringField;
    dsDataBIC: TStringField;
    dsDataBIRTHDATE: TDateTimeField;
    dsDataBIRTHYEAR: TIntegerField;
    dsDataBIRTHLOCATION: TStringField;
    dsDataOPF_DICT_ID: TFloatField;
    dsDataOPF_NAME: TStringField;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIRTHYEAR: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIRTHDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIRTHLOCATION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFIRSTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMIDDLENAME: TcxGridDBBandedColumn;
    actHighlightLat: TAction;
    miHighlightLat: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    procedure actHighlightLatExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PersonGridForm: TPersonGridForm;

implementation

uses fdcUtils;
{$R *.dfm}

procedure TPersonGridForm.actHighlightLatExecute(Sender: TObject);
begin
  inherited;
  actHighlightLat.Checked := not actHighlightLat.Checked;
  grdDataDBBandedTableView.ViewChanged;
end;

procedure TPersonGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if actHighlightLat.Checked then
     if (AViewInfo.Item = grdDataDBBandedTableViewNAME)
          or (AViewInfo.Item = grdDataDBBandedTableViewSHORTNAME) then
        begin
          ADone := FALSE;
          try
            HighlightEAlpha(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[AViewInfo.Item.Index]),
                            ACanvas.Canvas, AViewInfo.Bounds, clRed, [fsBold]);
          finally
            ADone := TRUE;
          end;
        end;
end;

initialization
  RegisterClass(TPersonGridForm);

end.
