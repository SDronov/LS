unit ASBCElRulingsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, cxDropDownEdit, cxCalendar, ObjectGridFrm, Menus,
    TPOBaseGridFrm, cxCalc, cxCurrencyEdit, cxCheckBox;

type
  TASBCElRulingsGridForm = class(TTPOBaseGridForm)
    grdDataDBTableViewID1: TcxGridDBColumn;
    grdDataDBTableViewNAME1: TcxGridDBColumn;
    grdDataDBTableViewSHORTNAME: TcxGridDBColumn;
    grdDataDBTableViewOBJECT_TYPE_ID: TcxGridDBColumn;
    grdDataDBTableViewSTATE_ID: TcxGridDBColumn;
    grdDataDBTableViewACCESSLEVEL: TcxGridDBColumn;
    grdDataDBTableViewSYSNAME: TcxGridDBColumn;
    grdDataDBTableViewDESCRIPT1: TcxGridDBColumn;
    grdDataDBTableViewOWNER_OBJECT_ID: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME1: TcxGridDBColumn;
    grdDataDBTableViewTYPESYSNAME1: TcxGridDBColumn;
    grdDataDBTableViewMODIFY_DATE: TcxGridDBColumn;
    grdDataDBTableViewG011: TcxGridDBColumn;
    grdDataDBTableViewCUSTOM_MODE_ID: TcxGridDBColumn;
    grdDataDBTableViewOKPO: TcxGridDBColumn;
    grdDataDBTableViewINN: TcxGridDBColumn;
    grdDataDBTableViewG12: TcxGridDBColumn;
    grdDataDBTableViewCURRENCY_ID: TcxGridDBColumn;
    grdDataDBTableViewG444A: TcxGridDBColumn;
    grdDataDBTableViewG444B: TcxGridDBColumn;
    grdDataDBTableViewG447A: TcxGridDBColumn;
    grdDataDBTableViewG447B: TcxGridDBColumn;
    grdDataDBTableViewK115: TcxGridDBColumn;
    grdDataDBTableViewG40: TcxGridDBColumn;
    grdDataDBTableViewSUBJECT_ID: TcxGridDBColumn;
    grdDataDBTableViewG221: TcxGridDBColumn;
    grdDataDBTableViewCUSTOMS_CODE: TcxGridDBColumn;
    grdDataDBTableViewREG_DATE: TcxGridDBColumn;
    grdDataDBTableViewDECL_NO: TcxGridDBColumn;
    grdDataDBTableViewACT_NO: TcxGridDBColumn;
    grdDataDBTableViewGD1: TcxGridDBColumn;
    grdDataDBTableViewEXPORT_DATE: TcxGridDBColumn;
    grdDataDBTableViewTAX_EXEMPTION: TcxGridDBColumn;
    grdDataDBTableViewPAYED_MONTHS: TcxGridDBColumn;
    grdDataDBTableViewNEXT_PAY_MONTH: TcxGridDBColumn;
    dsDataANNUL_NAME: TStringField;
    dsDataANNUL_DATE: TDateTimeField;
    dsDataDATE_CREATED: TDateTimeField;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    dsDataIN_WAIT: TIntegerField;
    colIN_WAIT: TcxGridDBBandedColumn;
    dsDataAS_BIG_PAYER: TIntegerField;
    dsDataCARRIER_NAME: TStringField;
    dsDataCARRIER_INN: TStringField;
    dsDataCARRIER_KPP: TStringField;
    dsDataCARRIER_ID: TFloatField;
    colCarrier_Name: TcxGridDBBandedColumn;
    colCarrier_INN: TcxGridDBBandedColumn;
    colCarrier_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn;
    dsDataCHARGED: TFloatField;
    dsDataPAYED: TFloatField;
    grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    columnIsActive: TcxGridDBBandedColumn;
    columnActivationDate: TcxGridDBBandedColumn;
    dsDataANNUL_REASON: TStringField;
    colAnnulReason: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn;
    dsDataIS_ARCHIVE: TStringField;
    grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn;
    dsDataSSTATUS: TStringField;
    dsDataVALDOC_NUMB: TStringField;
    dsDataVALDOC_DATE: TDateField;
    dsDatasJURPERSON: TStringField;
    dsDatasPERSON_NAME: TStringField;
    dsDatainn: TStringField;
    dsDatakpp: TStringField;
    dsDatasPASSPORT: TStringField;
    dsDatasKBK: TStringField;
    dsDatanDECL_SUM: TFloatField;
    dsDatasPAYMENT: TStringField;
    dsDatasVALDOC: TStringField;
    colgrdDataDBBandedTableViewsJURPERSON: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewsPERSON_NAME: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnINN: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnKPP: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnsPASSPORT: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnsKBK: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnnDECL_SUM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumnsPAYMENT: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnsVALDOC: TcxGridDBBandedColumn;
    dsDataEXPIRYDATE: TDateTimeField;
    colgrdDataDBBandedTableViewColumnEXPIRYDATE: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewColumnsstatus: TcxGridDBBandedColumn;
    dsDataDOCNUMB: TStringField;
    dsDataDOCDATE: TDateTimeField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    dxViewType: TdxBarCombo;
    edtUIN: TcxTextEdit;
    lcSearchCriteriaItem11: TdxLayoutItem;
    FinesForm10004: TdxBarButton;
    dsFinesForm10004: TfdcQuery;
    procedure actAddExecute(Sender: TObject);
{    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
      }
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dxViewTypeChange(Sender: TObject);
    procedure FinesForm10004Click(Sender: TObject);
  private
  protected
  public
  end;

  const
  clGold = TColor($0047D5FE);
  clGoldDark = TColor($0001BDF3);
  clGreenBright = TColor($0082E887);
  clGreenDark  = TColor($0044DD4B);
  colIsArchive         = clMedGray;
  colIsArchiveSelected = clBtnFace;

implementation

uses MainDm, fdcUtils;

{$R *.dfm}

//const
//  clBlueDark = TColor($00C56A31);
//  clBlueLight = TColor($00F7EAD9);
//  clBlueBright = TColor($00FF953D);
//  clBlueSky = TColor($00EBC4A4);
//
//  clGold = TColor($0047D5FE);
//  clGoldDark = TColor($0001BDF3);
//
//  clGreyLight = TColor($00E2EFF1);
//  clGreyDark = TColor($00B9D9DD);
//  clYellowLight = TColor($00E1FFFF);
//
//  clGreenBright = TColor($0082E887);
//  clGreenLight = TColor($00C9F5CB);
//  clGreenObscured = TColor($00ACF0AF);
//  clGreenDark = TColor($0044DD4B);
//
//  clSilverDark = TColor($00A6A6A6);
//
//  clLightRed = TColor($00B4B7EB);
//  clLightRedFocused = TColor($00363EC9);

procedure TASBCElRulingsGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject(SupportedTypeSysName, False, Params));
end;
(*
procedure TASBCElRulingsGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: Integer;
  Charged, Payed, Err: double;
begin
  inherited;

  val := VarAsType(AViewInfo.GridRecord.DisplayTexts[colIN_WAIT.Index], varInteger);
  if val > 0 then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
     ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
     clGoldDark, clGold);
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
  if (VarAsType(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewIS_ARCHIVE.Index], varString) = 'Y') then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
        colIsArchive, colIsArchiveSelected);
      ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  if VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewCHARGED.Index])
  then Charged := 0
  else Charged := VarAsType(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewCHARGED.Index], varDouble);

  if VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewPAYED.Index])
  then Payed := 0
  else Payed := VarAsType(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewPAYED.Index], varDouble);

  if VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewERR_COUNT.Index])
  then Err := 0
  else Err := VarAsType(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewERR_COUNT.Index], varDouble);

  if (Charged > Payed) and (Err = 0) and (val <> 1) then
  begin
		ACanvas.Canvas.Font.Color := clBlack;
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused, clFuchsia, clRed);
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

end;

*)
procedure TAsbcElRulingsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin

  SetSubsParam('viewtype', dxViewType.ItemIndex);
  dsData.ParamByName('NA').Value := dxViewType.ItemIndex;

  inherited;
  SetSearchParam('UIN',edtUIN.EditValue);
end;

procedure TASBCElRulingsGridForm.dxViewTypeChange(Sender: TObject);
begin
  dsData.ParamByName('NA').Value := dxViewType.ItemIndex;
  RefreshData;
end;

procedure TASBCElRulingsGridForm.FinesForm10004Click(Sender: TObject);
begin
  inherited;
  dsFinesForm10004.ExecSQL;
  MessageDlg('Формирование отчета для "АПС Штрафы" завершено', mtInformation, [mbOK], 0)
end;

initialization
   RegisterClass(TASBCElRulingsGridForm);

end.
