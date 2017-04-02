unit PayOrderInPackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCheckBox, OracleData, cxCurrencyEdit, cxMemo;

type
  TPayOrderInPackGridForm = class(TObjectGridForm)
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataREST_SUMMA: TFloatField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataLOCKED_SUMMA: TFloatField;
    dsDataASSURE_DATE: TDateTimeField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataIS_ACTIVE: TStringField;
    dsDataSTATE_SYSNAME: TStringField;
    dsDataSTATE_NAME: TStringField;
    dsDataIS_ARCHIVE: TStringField;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn;
    actInclude: TAction;
    actIncludeAll: TAction;
    actRemove: TAction;
    actRemoveAll: TAction;
    dsSelData: TOracleDataSet;
    dsSelDataID: TFloatField;
    dsSelDataNAME: TStringField;
    dsSelDataSHORTNAME: TStringField;
    dsSelDataOBJECT_TYPE_ID: TFloatField;
    dsSelDataSTATE_ID: TFloatField;
    dsSelDataSYSNAME: TStringField;
    dsSelDataDESCRIPT: TStringField;
    dsSelDataOWNER_OBJECT_ID: TFloatField;
    dsSelDataTYPENAME: TStringField;
    dsSelDataTYPESYSNAME: TStringField;
    dsSelDataDOC_DATE: TDateTimeField;
    dsSelDataDOC_NUMBER: TStringField;
    dsSelDataIS_ACTIVE: TStringField;
    dsSelDataACTIVATION_DATE: TDateTimeField;
    dsSelDataSUMMA: TFloatField;
    SelGridPanel: TPanel;
    grdDataSel: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    grdSelDataDBBandedTableView: TcxGridDBBandedTableView;
    cxGridLevel1: TcxGridLevel;
    Splitter1: TSplitter;
    srcSelData: TDataSource;
    dxBarDockControl2: TdxBarDockControl;
    btnInclude: TdxBarButton;
    btnIncludeAll: TdxBarButton;
    btnRemove: TdxBarButton;
    btnRemoveAll: TdxBarButton;
    dsSelDataEXEC_DATE: TDateTimeField;
    dsSelDataNAME_P: TStringField;
    dsSelDataINN_P: TStringField;
    dsSelDataKPP_P: TStringField;
    dsSelDataDOC_SUMMA: TFloatField;
    dsSelDataDOC_NO2: TStringField;
    dsSelDataDOC_DATE2: TDateTimeField;
    dsSelDataNAME_K: TStringField;
    dsSelDataINN_K: TStringField;
    dsSelDataKPP_K: TStringField;
    dsSelDataNOTE: TStringField;
    dsSelDataINCOME_DATE: TDateTimeField;
    dsSelDataVAL_PAYMENT_REASON: TStringField;
    dsSelDataVAL_DOC_NUMBER: TStringField;
    dsSelDataVAL_DOC_DATE: TDateTimeField;
    dsSelDataVAL_PAYMENT_TYPE: TStringField;
    dsSelDataDESTCUSTOMSCODE: TStringField;
    dsSelDataKBK: TStringField;
    grdSelDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewINN_P: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewINN_K: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewVAL_PAYMENT_REASON: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewVAL_DOC_NUMBER: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewVAL_DOC_DATE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewVAL_PAYMENT_TYPE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    grdSelDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    pmnSelDataDBBandedTableView: TdxBarPopupMenu;
    SelGridPopupMenu: TcxGridPopupMenu;
    grdSelDataDBBandedTableViewID: TcxGridDBBandedColumn;
    dsDataDESTCUSTOMSCODE: TStringField;
    grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    dsDataKBK: TStringField;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    dsDataNOTE: TStringField;
    grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure actOpenExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actIncludeExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actIncludeAllExecute(Sender: TObject);
    procedure actRemoveAllExecute(Sender: TObject);
    procedure MovePanelButtonEnable(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure HideSelGridPanel; // скрыть контролы для входящих реестров
  end;

var
  PayOrderInPackGridForm: TPayOrderInPackGridForm;

implementation

{$R *.dfm}
uses DateUtils, fdcUtils, MainDM, fdcCustomDBDataFrm, fdcCustomDataFrm,
  fdcCustomGridFrm;
procedure TPayOrderInPackGridForm.actOpenExecute(Sender: TObject);
begin
  Params.ParamByName('pf_subject_Id').Value := null;
  ObjectServices.OpenObject(dsDataID.Value, Params);
end;

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
  clYellowFocused = TColor($0000A4A4);

  clGreenBright = TColor($0082E887);
  clGreenLight = TColor($00C9F5CB);
  clGreenObscured = TColor($00ACF0AF);
  clGreenDark = TColor($0044DD4B);

  clSilverDark = TColor($00A6A6A6);

  clLightRed = TColor($00B4B7EB);
  clLightRedFocused = TColor($00363EC9);

  colIsArchive         = clMedGray;
  colIsArchiveSelected = clBtnFace;

procedure TPayOrderInPackGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  val: double;
  vTypeSysName: string;
  V : variant;
begin
  inherited;
if
    VarIsNull(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewASSURE_DATE.Index]) then
  begin
    if AViewInfo.RecordViewInfo.Selected {or AViewInfo.RecordViewInfo.Focused}
      then
      ACanvas.Canvas.Font.Color := clWhite
    else
      ACanvas.Canvas.Font.Color := clGreen;
  end;

  // покрасить в желтый, если с даты уплаты прошло 3 года
  if (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXEC_DATE.Index] <> Null)
    and (CompareDate(IncYear(VarToDateTime(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewEXEC_DATE.Index]), 3), Now) < 1)
    and (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewREST_SUMMA.Index] > 0) then
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
    VarToStr(AViewInfo.GridRecord.Values[grdDataDBBandedTableViewSTATE_SYSNAME.Index]) = 'PaymentOrderNew' then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clLightRed;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clLightRedFocused;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;

  // -- подсветка документов с null или 0-м остатком
  V := AViewInfo.GridRecord.DisplayTexts[grdDataDBBandedTableViewREST_SUMMA.Index];
  if (VarToStr(V) = '') or (VarAsType(V, varDouble) < 0.0) then
    ACanvas.Canvas.Font.Color := clGrayText; // TColor($00E3E3FF);

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

procedure TPayOrderInPackGridForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
                    
  if ParamByName('PackEnableEdit').AsBoolean then
    dsSelData.Refresh;
end;

procedure TPayOrderInPackGridForm.actIncludeExecute(Sender: TObject);
var i :integer;
    s :string;
begin
  if grdSelDataDBBandedTableView.Controller.SelectedRowCount = 1 then
     s:= 'Добавить документ ' + dsSelData.FieldByName( 'doc_number' ).AsString + ' от ' + FormatDateTime( 'DD.MM.YYYY', dsSelData.FieldByName( 'DOC_DATE' ).AsDateTime ) + ' в реестр?'
    else
     s:= 'Добавить выбранные('+IntToStr(grdSelDataDBBandedTableView.Controller.SelectedRowCount)+'шт.) документы в реестр?';
  if MessageDlg( s,
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
      MainData.pkgCommon.PackageName := 'p_DocPack_Payments';
      with  grdSelDataDBBandedTableView.Controller do
       if SelectedRowCount > 0 then
        for i := 0 to SelectedRecordCount-1 do
          MainData.pkgCommon.CallProcedure('AddDoc', [ ParamByName( 'id' ).AsInteger, SelectedRecords[i].Values[grdSelDataDBBandedTableViewID.Index] ] );
      RefreshData;
    end;
end;

procedure TPayOrderInPackGridForm.actRemoveExecute(Sender: TObject);
var i :integer;
    s :string;
begin
  if grdDataDBBandedTableView.Controller.SelectedRowCount = 1 then
     s:= 'Исключить документ ' + dsData.FieldByName( 'doc_no' ).AsString + ' от ' + FormatDateTime( 'DD.MM.YYYY', dsData.FieldByName( 'DOC_DATE' ).AsDateTime ) + ' из реестра?'
    else
     s:= 'Исключить выбранные('+IntToStr(grdDataDBBandedTableView.Controller.SelectedRowCount)+'шт.) документы из реестра?';
  if MessageDlg( s,
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
     MainData.pkgCommon.PackageName := 'p_DocPack_Payments';
      with  grdDataDBBandedTableView.Controller do
      if SelectedRowCount > 0 then
        for i := 0 to SelectedRecordCount-1 do
        begin
          MainData.pkgCommon.CallProcedure( 'RemoveDoc', [ ParamByName( 'id' ).AsInteger, SelectedRecords[i].Values[grdDataDBBandedTableViewID.Index] ] );
        end;
      RefreshData;
    end;
end;

procedure TPayOrderInPackGridForm.actIncludeAllExecute(Sender: TObject);
var i:integer;
begin
  if MessageDlg( 'Добавить все документы в реестр?',
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
      MainData.pkgCommon.PackageName := 'p_DocPack_Payments';
      dsSelData.DisableControls;
      try
        dsSelData.First;
        for i :=0 to dsSelData.RecordCount-1 do
        begin
          MainData.pkgCommon.CallProcedure( 'AddDoc', [ ParamByName( 'id' ).AsInteger, dsSelData.FieldByName( 'ID' ).AsInteger ] );
          dsSelData.Next;
        end;
      finally
        dsSelData.EnableControls;
      end;
      RefreshData;
    end;
end;

procedure TPayOrderInPackGridForm.actRemoveAllExecute(Sender: TObject);
var i: integer;
begin
  if MessageDlg( 'Исключить все документы  из реестра?',
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    begin
      MainData.pkgCommon.PackageName := 'p_DocPack_Payments';
      dsData.DisableControls;
      try
        dsData.First;
        for i :=0 to dsData.RecordCount-1 do
        begin
          MainData.pkgCommon.CallProcedure( 'RemoveDoc', [ ParamByName( 'id' ).AsInteger, dsData.FieldByName( 'ID' ).AsInteger ] );
          dsData.Next;
        end;
      finally
        dsData.EnableControls;
      end;
      RefreshData;
    end;
end;

procedure TPayOrderInPackGridForm.MovePanelButtonEnable(Sender: TObject);
begin
  actInclude.Enabled:= not dsSelData.IsEmpty and (grdSelDataDBBandedTableView.Controller.SelectedRowCount > 0);
  actIncludeAll.Enabled:= not dsSelData.IsEmpty;
  actRemove.Enabled:= not dsData.IsEmpty and (grdDataDBBandedTableView.Controller.SelectedRowCount > 0);
  actRemoveAll.Enabled:= not dsData.IsEmpty;
end;

procedure TPayOrderInPackGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

//  if SelGridPanel.Visible then
  if ParamByName('PackEnableEdit').AsBoolean then
    begin
      dsSelData.SetVariable('CUSTOMSCODE', Params.ParamValues['CUSTOMS_CODE']);
      if dsSelData.Active then
        dsSelData.Refresh
      else
        dsSelData.Open;
    end;
end;

procedure TPayOrderInPackGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  actDelete.Visible := MainData.EnableForceDropObject;
end;

procedure TPayOrderInPackGridForm.HideSelGridPanel;
begin
  SelGridPanel.Visible := False;
  actInclude.Visible := False;
  actIncludeAll.Visible := False;
  actRemove.Visible := False;
  actRemoveAll.Visible := False;
  Splitter1.Enabled := False;
  Splitter1.Visible := False;
  grdData.Align := alNone;
  grdData.Align := alClient;
end;

initialization
  RegisterClass(TPayOrderInPackGridForm);
end.
