unit CustomDeclTempAdmGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomDeclGridFrm, DB, FDCCustomDataset, fdcQuery, cxGraphics,
  Menus, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalc, QueryList, cxCheckBox, cxCurrencyEdit;

type
  TCustomDeclTempAdmGridForm = class(TCustomDeclGridForm)
    dsDataPAYED_MONTHS: TIntegerField;
    dsDataEXPORT_DATE: TDateTimeField;
    grdDataDBBandedTableViewEXPORT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYED_MONTHS: TcxGridDBBandedColumn;
    dsDataTAX_EXEMPTION: TIntegerField;
    grdDataDBBandedTableViewLAST_PAYED_MONTH: TcxGridDBBandedColumn;
    dsDataTAX_EXEMPTION_STRING: TStringField;
    dsDataLAST_PAYED_MONTH: TDateTimeField;
    dsDataLAST_PAYED_MONTH_STRING: TStringField;
    dsDataREALLY_PAYED_MONTHS: TFloatField;
    dsDataG37: TStringField;
    colProcedure: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    QL: TQueryList;
    sqlGetMaxMonths: TsqlOp;
    colIS_ACTIVE: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateField;
    grdDataDBBandedTableViewTAX_EXEMPTION_STRING: TcxGridDBBandedColumn;
    dsDataIS_PROLONG: TIntegerField;
    grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn;
    dsDataTODAY_SUMMA: TFloatField;
    grdDataDBBandedTableViewTODAY_SUMMA: TcxGridDBBandedColumn;
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
  public
  end;

implementation

uses
  fdcCustomDBDataFrm
 ,fdcCustomGridFrm
 ,fdcUtils
 ,DateUtils
 ,CDeclBaseGridFrm
 ,MainDM;

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


procedure TCustomDeclTempAdmGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val, lv_TodaySumma: Variant;
  EndDate: Variant;
begin
  inherited;
  val := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewLAST_PAYED_MONTH.Index];
  lv_TodaySumma := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewTODAY_SUMMA.Index];
  EndDate := AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXPORT_DATE.Index];
  if not VarIsNull(Val) and (VarAsType(Val, varDate) < StartOfTheMonth(Date))
    and (EndOfTheMonth(VarAsType(Val, varDate)) < VarAsType(EndDate, varDate))
    and (not VarIsNull(lv_TodaySumma) and (VarAsType(lv_TodaySumma, varDouble)) <> 0) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        clGoldDark, clGold);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end
  else if VarIsNull(EndDate) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        clBlueSky, clBlueLight);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[colIsClosed.Index], varInteger);
  if (val = 1) then
  begin
    ACanvas.Canvas.Font.Color := clBlack;
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
      clRed, clFuchsia);
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;


  ADone := False;
end;

procedure TCustomDeclTempAdmGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsData.ParamByName('MAX_MONTHS').AsInteger := sqlGetMaxMonths.Exec;
end;

procedure TCustomDeclTempAdmGridForm.actAddExecute(Sender: TObject);
begin
  if MainData.GetCustomsCode <> '10005000' then
    begin
      ShowMessage('Данная функция доступна только после согласования с ГУФТДиТР ФТС России!');
      Exit;
    end;
  inherited;
end;

initialization
  RegisterClass(TCustomDeclTempAdmGridForm);
end.

