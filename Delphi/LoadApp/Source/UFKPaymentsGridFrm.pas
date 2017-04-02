unit UFKPaymentsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, cxCurrencyEdit, cxDropDownEdit, cxCalendar, fdcOracleSession;

type
  TUFKPaymentsGridForm = class(TfdcCustomGridForm)
    dsDataID: TFloatField;
    dsDataNAME: TStringField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    grdDataDBTableViewID: TcxGridDBColumn;
    grdDataDBTableViewNAME: TcxGridDBColumn;
    grdDataDBTableViewDOC_SUMMA: TcxGridDBColumn;
    grdDataDBTableViewSUMMA: TcxGridDBColumn;
    grdDataDBTableViewPAYER_INN: TcxGridDBColumn;
    grdDataDBTableViewPAYER_KPP: TcxGridDBColumn;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    QueryList1: TQueryList;
    sqlOp1: TsqlOp;
    actUFK: TAction;
    btnSetUFKPays: TdxBarButton;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtName: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtNomer: TcxTextEdit;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtFromDate: TcxDateEdit;
    lcSearchCriteriaItem6: TdxLayoutItem;
    edtToDate: TcxDateEdit;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtSumMin: TcxCurrencyEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    edtSumMax: TcxCurrencyEdit;
    lcSearchCriteriaItem9: TdxLayoutItem;
    Label2: TLabel;
    lcSearchCriteriaItem10: TdxLayoutItem;
    Label1: TLabel;
    lcSearchCriteriaItem11: TdxLayoutItem;
    btnSearchClear: TcxButton;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataPAYER_NAME: TStringField;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    dsDataEXEC_DATE: TDateTimeField;
    grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    dsDataIS_ARCHIVE: TStringField;
    grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn;
    actSplit: TAction;
    btnSplitUFKPays: TdxBarButton;
    dsDataDESTCUSTOMSCODE: TStringField;
    procedure actUFKExecute(Sender: TObject);
    procedure btnSearchClearClick(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actUFKUpdate(Sender: TObject);
    procedure actSplitUpdate(Sender: TObject);
    procedure actSplitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UFKPaymentsGridForm: TUFKPaymentsGridForm;

implementation

{$R *.dfm}

uses DataDM, fdcMessages, fdcCustomDBDataFrm, DateUtils, fdcUtils,
  UFKPaySplitFrm;

procedure TUFKPaymentsGridForm.actUFKExecute(Sender: TObject);
  var
    vNew_Id : Integer;
begin
  if ConfirmDlg(Format('Изменить тип ПП № %s от %s на ПП УФК?',
    [dsDataDOC_NUMBER.Value, FormatDateTime('DD.MM.YY', dsDataDOC_DATE.Value)]), '') = mrYes then
    try
      dsData.DisableControls;
      try
        MainData.pkgCommon.PackageName := 'p_Legacy_Import';
        vNew_ID := MainData.pkgCommon.CallIntegerFunction('ConvertToUFKPayment', [dsDataID.Value]);
        dsData.Session.Commit;
        RefreshData;
        if not dsData.Locate('ID', vNew_ID, []) then
          dsData.First;
      finally
        dsData.EnableControls;
      end;
    except
      dsData.Session.Rollback;
      raise;
    end;
end;

procedure TUFKPaymentsGridForm.btnSearchClearClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount-1 do
    if ( (Self.Components[i] is TcxTextEdit) or
         (Self.Components[i] is TcxDateEdit) or
         (Self.Components[i] is TcxCurrencyEdit) or
         (Self.Components[i] is TcxMaskEdit)
       ) and
       TcxTextEdit(Self.Components[i]).Enabled and
       (TcxTextEdit(Self.Components[i]).Parent = TcxButton(Sender).Parent) then
      TcxTextEdit(Self.Components[i]).Clear;
end;

procedure TUFKPaymentsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('Name', Trim(edtName.Text));
  SetSearchParam('INN', Trim(edtINN.Text));
  SetSearchParam('KPP', Trim(edtKPP.Text));
  SetSearchParam('DOC_NO', Trim(edtNomer.Text));
  SetSearchParam('FROM_DATE', edtFromDate.EditValue);
  SetSearchParam('TO_DATE', edtToDate.EditValue);
  SetSearchParam('SUM_MIN', edtSumMin.EditValue);
  SetSearchParam('SUM_MAX', edtSumMax.EditValue);
end;

const
  colIsArchive         = clMedGray;
  colIsArchiveSelected = clBtnFace;

procedure TUFKPaymentsGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: double;
  vTypeSysName: string;
  V : Variant;
begin
  inherited;

{  if AViewInfo.RecordViewInfo.Selected //or AViewInfo.RecordViewInfo.Focused
   then
      ACanvas.Canvas.Font.Color := clWhite
    else
      ACanvas.Canvas.Font.Color := clGreen;}

  // покрасить в желтый, если с даты уплаты прошло 3 года
  if (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXEC_DATE.Index] <> Null)
    and (CompareDate(IncYear(VarToDateTime(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXEC_DATE.Index]), 3), Now) < 1)
    //and (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewREST_SUMMA.Index] > 0)
    then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clYellowLight;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clYellowFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  vTypeSysName := AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewTYPESYSNAME.Index];
  if   Pos('NonID', vTypeSysName) > 0  then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clBlueLight;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clBlueSky;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  if
    VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewTYPESYSNAME.Index]) = 'PaymentOrderRestUFK' then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clLightRed;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clLightRedFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  // -- подсветка документов с null или 0-м остатком
  {V := AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewREST_SUMMA.Index];
  if (VarToStr(V) = '') or (VarAsType(V, varDouble) < 0.0) then
    ACanvas.Canvas.Font.Color := clGrayText; // TColor($00E3E3FF);}

  // --- подсветка архивных документов
  if (VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewIS_ARCHIVE.Index]) = 'Y') then
  begin
    ACanvas.Canvas.Font.Color := clBlack;
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,
      colIsArchive, colIsArchiveSelected);
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  ADone := False;
end;

procedure TUFKPaymentsGridForm.actUFKUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Pos('PaymentOrderRest', grdDataDBBandedTableViewTYPESYSNAME.EditValue ) = 0);
end;

procedure TUFKPaymentsGridForm.actSplitUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled := (grdDataDBBandedTableViewTYPESYSNAME.EditValue = 'PaymentOrderRestUFK');
end;

procedure TUFKPaymentsGridForm.actSplitExecute(Sender: TObject);
  var
    i : Integer;
    BM: TBookmark;
begin
  UFKPaySplitForm := TUFKPaySplitForm.Create(Application);
  with UFKPaySplitForm do
  try
    UFKPaymentId := dsDataID.AsInteger;
    UFKPaySum    := dsDataSUMMA.Value;
    if UFKPaySplitForm.ShowModal = mrOk then
      begin
        MainData.pkgCommon.PackageName := 'p_PO_RESTUFK';
        dsetSumByCust.CheckBrowseMode;
        dsetSumByCust.First;
        while not dsetSumByCust.Eof do
          begin
            if dsetSumByCustCUSTOMSCODE.Value = dsDataDESTCUSTOMSCODE.Value then
              BM := dsetSumByCust.GetBookmark // Отложить обработку
            else
              MainData.pkgCommon.CallIntegerFunction('Split', [UFKPaymentId, dsetSumByCustCUSTOMSCODE.Value, dsetSumByCustEDITSUMMA.Value ]);
            dsetSumByCust.Next;
          end;
        if Assigned(BM) then // Реальный остаток на пп должен быть равен  dsetSumByCustEDITSUMMA.Value, этот вызов только ради проверки
          begin
            dsetSumByCust.GotoBookmark(BM);
            MainData.pkgCommon.CallIntegerFunction('Split', [UFKPaymentId, dsetSumByCustCUSTOMSCODE.Value, dsetSumByCustEDITSUMMA.Value ]);
          end;
        MainData.session.commit;
      end;
  finally
    FreeAndNil(UFKPaySplitForm);
  end;
end;

procedure TUFKPaymentsGridForm.FormShow(Sender: TObject);
begin
  inherited;
  actSplit.Visible := (MainData.GetCustomsLevel = cCustomLevel_RTU); // Разрешить только для уровня РТУ 
end;

procedure TUFKPaymentsGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Action = caFree then
    UFKPaymentsGridForm := nil;
end;

end.
