unit SubjectFeeGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxDropDownEdit, cxCalendar, Menus, cxCalc;

type
  TSubjectFeeGridForm = class(TObjectGridForm)
    dsDataMODIFY_DATE: TDateTimeField;
    dsDataACT_NO: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_NAME: TStringField;
    grdDataDBBandedTableViewMODIFY_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACT_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    dsDataDEBT_COUNT: TFloatField;
    grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtFrom: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtTo: TcxDateEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtNo: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    dsDataCHARGED: TFloatField;
    dsDataPAYED: TFloatField;
    grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn;
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectFeeGridForm: TSubjectFeeGridForm;

implementation

uses
  fdcUtils;

{$R *.dfm}

const
  clBlueDark = TColor($00C56A31);
  clBlueLight = TColor($00F7EAD9);
  clBlueBright = TColor($00FF953D);
  clBlueSky = TColor($00EBC4A4);

  clGold = TColor($0047D5FE);
  clGoldDark = TColor($0001BDF3);

  clGreyLight = TColor($00E2EFF1);
  clGreyDark = TColor($00B9D9DD);
  clYellowLight = TColor($00E1FFFF);

  clGreenBright = TColor($0082E887);
  clGreenLight = TColor($00C9F5CB);
  clGreenObscured = TColor($00ACF0AF);
  clGreenDark = TColor($0044DD4B);

  clSilverDark = TColor($00A6A6A6);

  clLightRed = TColor($00B4B7EB);
  clLightRedFocused = TColor($00363EC9);

procedure TSubjectFeeGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: Integer;
begin
  inherited;
  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewDEBT_COUNT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
     ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clLightRedFocused, clLightRed);
     ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
  ADone := False;
end;

procedure TSubjectFeeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('INN', Trim(edtInn.Text));
  SetSearchParam('KPP', Trim(edtKpp.Text));
  SetSearchParam('ACT_NO', Trim(edtNo.Text));
  SetSearchParam('FROM_DATE', edtFrom.EditValue);
  SetSearchParam('TO_DATE', edtTo.EditValue);

end;

initialization
     RegisterClass(TSubjectFeeGridForm);

end.
