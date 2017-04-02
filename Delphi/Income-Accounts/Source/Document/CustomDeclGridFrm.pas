{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision:667 $
  $Author: amikhaylin $
  $Date: 2010-06-30 17:42:34 +0400 (РЎСЂ, 30 РёСЋРЅ 2010) $
}
unit CustomDeclGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxDBEdit,
  cxDropDownEdit, cxCalendar, Menus, CDeclBaseGridFrm, cxCurrencyEdit,
  cxCalc, cxCheckBox, QueryList, cxGrid;

const
  clGreenBright = TColor($0082E887);
  clGreenLight = TColor($00C9F5CB);
  clGreenObscured = TColor($00ACF0AF);
  clGreenDark = TColor($0044DD4B);

  clSilverDark = TColor($00A6A6A6);

  clLightRed = TColor($00B4B7EB);
  clLightRedFocused = TColor($00363EC9);


type
  TCustomDeclGridForm = class(TCDeclBaseGridForm)
    dsDataG011: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCUSTOM_MODE_CODE: TStringField;
    dsDataDECL_MODE: TStringField;
    dsDataAS_BIG_PAYER: TFloatField;
    dsDataG0131_CODE: TStringField;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOM_MODE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_MODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewAS_BIG_PAYER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewG0131_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJKINDLABEL: TcxGridDBBandedColumn;
    dsDatacharged: TFloatField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    dsDatapayed: TFloatField;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    dsDataGD1: TDateTimeField;
    grdDataDBBandedTableViewGD1: TcxGridDBBandedColumn;
    dsDataIS_CLOSED: TFloatField;
    colIsClosed: TcxGridDBBandedColumn;
    dsDataIS_ARCHIVE: TStringField;
    columnIS_ARCHIVE: TcxGridDBBandedColumn;
    dsDataIS_CORR: TStringField;
    grdDataDBBandedTableViewIS_CORR: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNotPrivileges: TcxGridDBBandedColumn;
    dsDataNotPrivileges: TIntegerField;
    dsDataAdvicePrivileges: TIntegerField;
    grdDataDBBandedTableViewAdvicePrivileges: TcxGridDBBandedColumn;
    dsDataDECISION_DATE: TDateTimeField;
    grdDataDBBandedTableViewDECISION_DATE: TcxGridDBBandedColumn;
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actAddExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

implementation

uses MainDm, fdcUtils, fdcCustomDBDataFrm, fdcCustomObjectGridFrm,
  fdcCustomDataFrm, fdcCustomGridFrm;

{$R *.dfm}

const
  colIsArchive         = clMedGray;
  colIsArchiveSelected = clBtnFace;

procedure TCustomDeclGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: Integer;
begin
  inherited;

  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[colIsClosed.Index], varInteger);
  if (val = 1) then
  begin
    ACanvas.Canvas.Font.Color := clBlack;
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
      clRed, clFuchsia);
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewAS_BIG_PAYER.Index], varInteger);
  if (val = 1) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        clGreenDark, clGreenBright);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  // --- подсветка архивных документов
  if (VarAsType(AViewInfo.GridRecord.Values[columnIs_Archive.Index], varString) = 'Y') then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        colIsArchive, colIsArchiveSelected);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  ADone := False;
end;

procedure TCustomDeclGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject(SupportedTypeSysName, False, Params));
end;

procedure TCustomDeclGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSubsParam('enable_order', MainData.GetEnableOrder);

end;

procedure TCustomDeclGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  if (Self.Owner.Name = 'MainForm') then
    begin
      actSwitchSearchCriteria.Execute;
      edtFrom.EditValue := Date - 7;
      edtTo.EditValue := Date;
    end;
end;
initialization
    RegisterClass(TCustomDeclGridForm);

end.
