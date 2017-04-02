{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomGridFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit fdcCustomGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomFrm, cxContainer, cxEdit, dxLayoutLookAndFeels,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxGrid,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxControls, Menus,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridRows,
  cxGridDBTableView, FDCCustomDataset, FDCQuery, Oracle, FDCOracleSession,
  ImgList, cxFilterControl, cxDBFilterControl, dxStatusBar, ExtCtrls,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxExport, dxBar, cxExportGrid4Link, Clipbrd, StdCtrls,
  fdcCustomDBDataFrm, cxProgressBar, dxLayoutControl, cxSplitter, ComCtrls,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons, fdcParamsHolder,
  cxGridBandedTableView, cxGridDBBandedTableView;

type

  {
    базовая табличная форма

    Для включения механизма ограничения максимального
    числа записей в результате необходимо наличие
    параметра MaxRecordCount в компоненте dsData.
    Для этого в форме-наследнике достаточно включить
    следующее условие в текст SQL запроса:
      rownum <= :MaxRecordCount
  }
  TForEachMethod = procedure (AGridTableView: TcxGridTableView; AIndex,
    ACount: integer; var ADescr: string; var ABreak: boolean) of object;
  TfdcCustomGridForm = class(TfdcCustomDBDataForm)
    StatusBar: TdxStatusBar;
    StatusBarContainer0: TdxStatusBarContainerControl;
    lblRecordCount: TcxLabel;
    StatusBarContainer1: TdxStatusBarContainerControl;
    lblQueryTime: TcxLabel;
    edtMaxRecordCount: TcxSpinEdit;
    actChangeMaxRecordCount: TAction;
    StatusBarContainer2: TdxStatusBarContainerControl;
    dlgExportData: TSaveDialog;
    actSaveToFile: TAction;
    actCopySelection: TAction;
    actCopyAll: TAction;
    actFilterByCell: TAction;
    actClearFilter: TAction;
    actFilterExcludeCell: TAction;
    actCancelFilter: TAction;
    actFilterDialog: TAction;
    actAutoFilter: TAction;
    btnAutoFilter: TdxBarButton;
    btnCopySelection: TdxBarButton;
    GridPopupMenu: TcxGridPopupMenu;
    dxBarDockControl1: TdxBarDockControl;
    actAutoPreview: TAction;
    pnlMaxRecordCoundExceeded: TPanel;
    imgMaxRecordCoundExceeded: TImage;
    lblMaxRecordCoundExceeded: TcxLabel;
    StatusBarContainer3: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    pnlProgress: TPanel;
    lblProgress: TcxLabel;
    pnlWorkspace: TPanel;
    pnlSearchCriteria: TPanel;
    lcSearchCriteriaGroup_Root: TdxLayoutGroup;
    lcSearchCriteria: TdxLayoutControl;
    actSwitchSearchCriteria: TAction;
    btnSwitchSearchCriteria: TdxBarButton;
    actViewToolBar: TAction;
    actViewStatusBar: TAction;
    btnView: TdxBarSubItem;
    btnFilter: TdxBarSubItem;
    btnCopyAll: TdxBarButton;
    btnSaveToFile: TdxBarButton;
    btnViewToolBar: TdxBarButton;
    btnViewStatusBar: TdxBarButton;
    btnAutoPreview: TdxBarButton;
    btnFilterByCell: TdxBarButton;
    btnFilterExcludeCell: TdxBarButton;
    btnFilterDialog: TdxBarButton;
    btnCancelFilter: TdxBarButton;
    btnClearFilter: TdxBarButton;
    splSearchCriteria: TSplitter;
    pnlGrid: TPanel;
    grdData: TcxGrid;
    grdDataDBTableView: TcxGridDBTableView;
    grdDataLevel: TcxGridLevel;
    actSearchOk: TAction;
    btnSearchOk: TdxBarButton;
    actSearchCancel: TAction;
    btnSearchCancel: TdxBarButton;
    btnSearch: TcxButton;
    lciSearchBtn: TdxLayoutItem;
    actSearch: TAction;
    pmnGridDataDBBandedTableView: TdxBarPopupMenu;
    pnlSearchCriteriaCaption: TPanel;
    grdDataDBBandedTableView: TcxGridDBBandedTableView;
    lblSearchCriteriaCaption: TLabel;
    imgSearchCriteriaCaption: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure lblRecordCountClick(Sender: TObject);
    procedure edtMaxRecordCountPropertiesEditValueChanged(Sender: TObject);
    procedure edtMaxRecordCountKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtMaxRecordCountExit(Sender: TObject);
    procedure edtMaxRecordCountPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edtMaxRecordCountEditing(Sender: TObject; var CanEdit: Boolean);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdDataLayoutChanged(Sender: TcxCustomGrid; AGridView: TcxCustomGridView);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure actChangeMaxRecordCountUpdate(Sender: TObject);
    procedure actChangeMaxRecordCountExecute(Sender: TObject);
    procedure actSaveToFileUpdate(Sender: TObject);
    procedure actSaveToFileExecute(Sender: TObject);
    procedure actCopySelectionUpdate(Sender: TObject);
    procedure actCopySelectionExecute(Sender: TObject);
    procedure actCopyAllUpdate(Sender: TObject);
    procedure actCopyAllExecute(Sender: TObject);
    procedure actFilterByCellUpdate(Sender: TObject);
    procedure actFilterByCellExecute(Sender: TObject);
    procedure actFilterExcludeCellExecute(Sender: TObject);
    procedure actClearFilterUpdate(Sender: TObject);
    procedure actClearFilterExecute(Sender: TObject);
    procedure actCancelFilterUpdate(Sender: TObject);
    procedure actCancelFilterExecute(Sender: TObject);
    procedure actFilterDialogExecute(Sender: TObject);
    procedure actAutoFilterUpdate(Sender: TObject);
    procedure actAutoFilterExecute(Sender: TObject);
    procedure actFilterDialogUpdate(Sender: TObject);
    procedure actAutoPreviewUpdate(Sender: TObject);
    procedure actAutoPreviewExecute(Sender: TObject);
    procedure actSwitchSearchCriteriaUpdate(Sender: TObject);
    procedure actSwitchSearchCriteriaExecute(Sender: TObject);
    procedure actViewToolBarUpdate(Sender: TObject);
    procedure actViewToolBarExecute(Sender: TObject);
    procedure actViewStatusBarUpdate(Sender: TObject);
    procedure actViewStatusBarExecute(Sender: TObject);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
    procedure actSearchCancelUpdate(Sender: TObject);
    procedure actSearchCancelExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { saves old max record count value while editing }
    FSaveMaxRecordCountValue: integer;
    { saves search criteria panel align while hiding }
    FSaveSearchCriteriaAlign: TAlign;
    { searching mode flag }
    FSearchMode: boolean;
    { search source component }
    FSearchComponent: TComponent;
    { multiple records searching flag }
    FSearchMultiple: boolean;
    { search finished event }
    FOnSearchFinished: TForEachMethod;

    function GetGridsLayoutRegistryKey: string;
    function GetActiveGridTableView: TcxGridTableView;
    function GetSearchActive: boolean;
    function HasRecordCountConstraint: boolean;
    procedure CreateFilterCriteria(Excluding: boolean);
    procedure SwitchSearchCriteriaPanel(ASwitchOn: boolean);
    procedure UpdateRowCountPanel;
    procedure UpdateQueryTimePanel;
    procedure UpdateMaxRecordCoundExceededPanel;
    procedure UpdateStatusPanels;

    procedure SetSearchMode(const Value: boolean);
    procedure SetSearchComponent(const Value: TComponent);
    procedure SetSearchMultiple(const Value: boolean);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetCursorHitTest: TcxCustomGridHitTest;
    function IsCursorUnderData: boolean;
    procedure SetSearchParam(AParamName: string; AValue: Variant);
    procedure ActivateSearchSourceForm;
    property SearchActive: boolean read GetSearchActive;
  public
    { load form layout }
    procedure LoadLayout; override;
    { save form layout }
    procedure SaveLayout; override;
    { iterate through the selected records list }
    procedure IterateRecords(ADoSomething: TForEachMethod; ASelectedRecords: boolean;
      AShowProgress: boolean);
    { show simple progress }
    procedure ShowProgress(AText: string);
    { hide simple progress }
    procedure HideProgress;
    { show advanced progress }
    procedure ShowProgressEx;
    { set advanced progress }
    procedure SetProgressEx(AText: string; APercent: integer);
    { hide advanced progress }
    procedure HideProgressEx;

    property GridsLayoutRegistryKey: string read GetGridsLayoutRegistryKey;
    property ActiveGridTableView: TcxGridTableView read GetActiveGridTableView;
    property SearchMode: boolean read FSearchMode write SetSearchMode;
    property SearchComponent: TComponent read FSearchComponent write SetSearchComponent;
    property SearchMultiple: boolean read FSearchMultiple write SetSearchMultiple;
    property OnSearchFinished: TForEachMethod read FOnSearchFinished write FOnSearchFinished;
  end;

implementation

uses fdcUtils, fdcMessages, fdcCustomDataFrm, DateUtils;

{$R *.dfm}

const
  SGrids = 'Grids';

function TimeStampToString(ATimeStamp: TDateTime): string;
var
  Hours, Mins, Secs, MSecs: word;
begin
  DecodeTime(ATimeStamp, Hours, Mins, Secs, MSecs);
  Secs := Secs + Round(MSecs/1000);
  Result :=
    IfElse(Hours > 0, IntToStr(Hours) + 'час. ', '') +
    IfElse(Mins  > 0, IntToStr(Mins) + 'мин. ', '') +
    IfElse(Secs  > 0, IntToStr(Secs) + 'сек. ', '');
end;

function TfdcCustomGridForm.GetGridsLayoutRegistryKey: string;
begin
  Result := FormLayoutRegistryKey + '\' + SGrids;
end;

function TfdcCustomGridForm.GetActiveGridTableView: TcxGridTableView;
begin
  if grdData.ActiveView is TcxGridTableView then
    Result := grdData.ActiveView as TcxGridTableView
  else
    Result := nil;
end;

function TfdcCustomGridForm.GetSearchActive: boolean;
begin
  Result :=
    actSwitchSearchCriteria.Visible and
    actSwitchSearchCriteria.Checked;
end;

function TfdcCustomGridForm.HasRecordCountConstraint: boolean;
begin
  { record count constraint exists only if
    MaxRecordCount param presents in the query }
  Result := Assigned(dsData.Params.FindParam('MaxRecordCount'));
end;

procedure TfdcCustomGridForm.CreateFilterCriteria(Excluding: boolean);
var
  Filter: TcxDataFilterCriteria;
  OperatorKind: TcxFilterOperatorKind;
  Column: TcxGridColumn;
  Value: Variant;
begin
  { get filter data }
  with ActiveGridTableView do
  begin
    Filter := DataController.Filter;
    Column := Controller.FocusedColumn;
    Value  := Controller.FocusedRow.Values[Column.Index];
  end;

  { apply filter }
  Filter.BeginUpdate;
  try
    Filter.Root.Clear;
    if not Excluding then
      OperatorKind := foEqual
    else
      OperatorKind := foNotEqual;
    Filter.Root.AddItem(Column, OperatorKind, Value, VarToStr(Value));
  finally
    Filter.EndUpdate;
  end;
  Filter.Active := True;
end;

procedure TfdcCustomGridForm.SwitchSearchCriteriaPanel(ASwitchOn: boolean);
begin
  if not ASwitchOn then
  begin
    FSaveSearchCriteriaAlign := pnlSearchCriteria.Align;
    splSearchCriteria.Align := alNone;
    pnlSearchCriteria.Align := alNone;
    splSearchCriteria.Visible := False;
    pnlSearchCriteria.Visible := False;
  end
  else
  begin
    pnlSearchCriteria.Align := FSaveSearchCriteriaAlign;
    splSearchCriteria.Align := FSaveSearchCriteriaAlign;
    pnlSearchCriteria.Visible := True;
    splSearchCriteria.Visible := True;
  end;
end;

procedure TfdcCustomGridForm.UpdateRowCountPanel;
var
  RecCountStr: string;
begin
  with ActiveGridTableView.DataController do
  begin
    RecCountStr := IfElse(dsData.Active,
      IntToStr(FilteredRecordCount), '');
    lblRecordCount.Caption := 'Всего: ' + RecCountStr;  
    if SearchActive then
      lblRecordCount.Caption := 'Найдено: ' + RecCountStr;
    if (Filter.Active) and
       (Filter.FilterText <> '') then
      lblRecordCount.Caption := 'Отобрано: ' + RecCountStr;
    lblRecordCount.Style.Font.Color := IfElse(not dsData.StoppedOnMax, clWindowText, clRed);
  end;

  if HasRecordCountConstraint then begin
    lblRecordCount.Cursor := crIBeam;
    lblRecordCount.Hint := 'Нажмите чтобы изменить ограничение количества записей в результате|Количество записей в результате';
  end else begin
    lblRecordCount.Cursor := crDefault;
    lblRecordCount.Hint := 'Количество записей в результате';
  end;
end;

procedure TfdcCustomGridForm.UpdateQueryTimePanel;
var
  LastQueryTimeStr: string;
begin
  lblQueryTime.Caption := IfElse(dsData.Active, TimeToStr(Now), '');
  LastQueryTimeStr := TimeToStr(LastQueryTime);
  if LastQueryTimeStr <> TimeToStr(0) then
    lblQueryTime.Caption := lblQueryTime.Caption +
      ' (' + LastQueryTimeStr + ')';
end;

procedure TfdcCustomGridForm.UpdateMaxRecordCoundExceededPanel;
begin
  pnlMaxRecordCoundExceeded.Visible := dsData.StoppedOnMax;
  if pnlMaxRecordCoundExceeded.Visible then
    pnlMaxRecordCoundExceeded.BringToFront
  else
    pnlMaxRecordCoundExceeded.SendToBack;
end;

procedure TfdcCustomGridForm.UpdateStatusPanels;
begin
  UpdateRowCountPanel;
  UpdateQueryTimePanel;
  UpdateMaxRecordCoundExceededPanel;
end;

procedure TfdcCustomGridForm.SetSearchMode(const Value: boolean);
begin
  FSearchMode := Value;
  SwitchSearchCriteriaPanel(FSearchMode);
  if FSearchMode then
    ActiveGridTableView.OptionsSelection.CellSelect := False;
end;

procedure TfdcCustomGridForm.SetSearchComponent(const Value: TComponent);
begin
  if Assigned(FSearchComponent) then
    FSearchComponent.RemoveFreeNotification(Self);
  FSearchComponent := Value;
  if Assigned(FSearchComponent) then
    FSearchComponent.FreeNotification(Self);
end;

procedure TfdcCustomGridForm.SetSearchMultiple(const Value: boolean);
begin
  FSearchMultiple := Value;
  ActiveGridTableView.OptionsSelection.MultiSelect := FSearchMultiple;
end;

procedure TfdcCustomGridForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent = SearchComponent) and
     (Operation = opRemove) then
    Close;
end;

function TfdcCustomGridForm.GetCursorHitTest: TcxCustomGridHitTest;
var
  CursorPos: TPoint;
begin
  GetCursorPos(CursorPos);
  CursorPos := grdData.ScreenToClient(CursorPos);
  Result := grdData.ActiveView.GetHitTest(CursorPos);
end;

function TfdcCustomGridForm.IsCursorUnderData: boolean;
begin
  Result := GetCursorHitTest.HitTestCode in [htRecord, htCell, htPreview];
end;

procedure TfdcCustomGridForm.SetSearchParam(AParamName: string;
  AValue: Variant);
var
  Param: TParam;
begin
  inherited;
  Param := dsData.Params.FindParam(AParamName);
  if Assigned(Param) then
    if SearchActive then
      Param.Value := AValue
    else
      Param.Clear;
end;

procedure TfdcCustomGridForm.ActivateSearchSourceForm;
begin
  if Assigned(SearchComponent) and
     Assigned(SearchComponent.Owner) and
     (SearchComponent.Owner is TForm) and
     (SearchComponent.Owner as TForm).Visible then
  begin
    (SearchComponent.Owner as TForm).BringToFront;
    (SearchComponent.Owner as TForm).Refresh;
  end;
end;

procedure TfdcCustomGridForm.LoadLayout;
var
  i: integer;
begin
  inherited;
  for i:=0 to grdData.ViewCount-1 do
    grdData.Views[i].RestoreFromRegistry(
      GridsLayoutRegistryKey, False, False,
      [gsoUseFilter, gsoUseSummary],
      grdData.Views[i].Name);
end;

procedure TfdcCustomGridForm.SaveLayout;
var
  i: integer;
begin
  inherited;
  for i:=0 to grdData.ViewCount-1 do
    grdData.Views[i].StoreToRegistry(
      GridsLayoutRegistryKey,True,
      [gsoUseFilter, gsoUseSummary],
      grdData.Views[i].Name);
end;

procedure TfdcCustomGridForm.IterateRecords(ADoSomething: TForEachMethod;
  ASelectedRecords: boolean; AShowProgress: boolean);
var
  i: integer;
  SavePosition: TBookmark;
  BreakProcess: boolean;
  ProgressDescr: string;
  RecCount: integer;
begin
  inherited;
  if not Assigned(ADoSomething) then Exit;

  BreakProcess := False;
  ProgressDescr := '';
  with ActiveGridTableView.ViewData,
       ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do begin
    { save current position }
    SavePosition := dsData.GetBookmark;
    try
      { get iteration count }
      RecCount := IfElse(ASelectedRecords,
        SelectedRecordCount, RecordCount);
      { show progress }
      if AShowProgress then
        ShowProgressEx;
      { iterate through selected records }
      for i:=0 to RecCount-1 do begin
        { go to the record }
        if ASelectedRecords then
          FocusedRecord := SelectedRecords[i]
        else
          FocusedRecord := Records[i];
        { execute specified method }
        ADoSomething(ActiveGridTableView, i, RecCount, ProgressDescr, BreakProcess);
        { check form destroying }
        if csDestroying in ComponentState then
          Exit;
        { break process if nessesary }
        if BreakProcess then Break;
        { update progress }
        if AShowProgress then
          SetProgressEx(ProgressDescr, (i+1)*100 div RecCount);
      end;
      { return to the saved position }
      dsData.GotoBookmark(SavePosition);
    finally
      if not (csDestroying in ComponentState) then
      begin
        { hide progress }
        HideProgressEx;
        { free temporary bookmark }
        dsData.FreeBookmark(SavePosition);
      end;  
    end;
  end;
end;

procedure TfdcCustomGridForm.ShowProgress(AText: string);
begin
  imgMaxRecordCoundExceeded.Visible := False;
  pnlProgress.Visible := True;
  pnlProgress.BringToFront;
  lblProgress.Caption := AText;
  lblProgress.Refresh;
end;

procedure TfdcCustomGridForm.HideProgress;
begin
  imgMaxRecordCoundExceeded.Visible := True;
  pnlProgress.Visible := False;
  pnlProgress.SendToBack;
  lblProgress.Caption := '';
  lblProgress.Refresh;
end;

procedure TfdcCustomGridForm.ShowProgressEx;
begin
  ShowProgress('');
  ProgressBar.Visible := True;
  ProgressBar.Properties.Max := 100;
  SetProgressEx('', 0);
end;

procedure TfdcCustomGridForm.SetProgressEx(AText: string; APercent: integer);
begin
  ProgressBar.Position := APercent;
  ProgressBar.Refresh;
  lblProgress.Caption := AText;
  lblProgress.Refresh;
end;

procedure TfdcCustomGridForm.HideProgressEx;
begin
  HideProgress;
  ProgressBar.Visible := False;
end;

procedure TfdcCustomGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  { init default values }
  FSaveMaxRecordCountValue := 0;
  FSearchMode := False;
  FSearchMultiple := False;
  //FSaveSearchCriteriaPanelHeight := pnlSearchCriteria.Height;

  { init search criteria panel }
  SwitchSearchCriteriaPanel(SearchActive);
end;

procedure TfdcCustomGridForm.FormShow(Sender: TObject);
begin
  inherited;

  { update status panels }
  UpdateStatusPanels;
end;

procedure TfdcCustomGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if edtMaxRecordCount.Focused then
    grdData.SetFocus;
  if HasRecordCountConstraint then begin
    { XXX }
    { inrement MaxRecordCount param value by one to force
      dataset to respond on max record exceeding }
    dsData.ParamByName('MaxRecordCount').AsInteger := edtMaxRecordCount.Value + 1;
    dsData.MaxRecords := edtMaxRecordCount.Value;
  end else begin
    dsData.MaxRecords := 0;
  end;                
end;

procedure TfdcCustomGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  UpdateStatusPanels;
end;

procedure TfdcCustomGridForm.actChangeMaxRecordCountUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    HasRecordCountConstraint;
end;

procedure TfdcCustomGridForm.actChangeMaxRecordCountExecute(Sender: TObject);
begin
  inherited;
  lblRecordCount.Visible := False;
  edtMaxRecordCount.Visible := True;
  edtMaxRecordCount.Text := edtMaxRecordCount.Value;
  edtMaxRecordCount.SetFocus;
end;

procedure TfdcCustomGridForm.edtMaxRecordCountEditing(Sender: TObject; var CanEdit: Boolean);
begin
  inherited;
  FSaveMaxRecordCountValue := edtMaxRecordCount.Value;
end;

procedure TfdcCustomGridForm.edtMaxRecordCountPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  grdData.SetFocus;
  RefreshData;
end;

procedure TfdcCustomGridForm.edtMaxRecordCountPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if Error then begin
    InfoDlg(
      'Введено некорректное значение',
      Format('Зачение %d должно быть в пределах от %d до %d. Введите значение в указанных границах.',
        [integer(DisplayValue),
         Round(edtMaxRecordCount.Properties.MinValue),
         Round(edtMaxRecordCount.Properties.MaxValue)]),
      '');
    DisplayValue := FSaveMaxRecordCountValue;
    Error := False;
  end;
end;

procedure TfdcCustomGridForm.edtMaxRecordCountKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_Escape then begin
    { XXX }
    { decrement MaxRecordCount param value by one cause
      of parameter incrementing when dataset opens }
    edtMaxRecordCount.Value := dsData.ParamByName('MaxRecordCount').AsInteger - 1;
    grdData.SetFocus;
  end;
  { add length constraint }
  if Length(edtMaxRecordCount.Text) >
     Length(IntToStr(Round(edtMaxRecordCount.Properties.MaxValue)))
  then
    Key := 0;
end;

procedure TfdcCustomGridForm.edtMaxRecordCountExit(Sender: TObject);
begin
  inherited;
  edtMaxRecordCount.Visible := False;
  lblRecordCount.Visible := True;
end;

procedure TfdcCustomGridForm.lblRecordCountClick(Sender: TObject);
begin
  inherited;
  actChangeMaxRecordCount.Execute;
end;

procedure TfdcCustomGridForm.actSaveToFileUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (ActiveGridTableView.DataController.RowCount > 0);
end;

procedure TfdcCustomGridForm.actSaveToFileExecute(Sender: TObject);
var
  ExportFormat: string;
begin
  inherited;

  if not dlgExportData.Execute then Exit;

  { get file extension }
  ExportFormat := ExtractFileExt(dlgExportData.FileName);

  { remove first dot }
  ExportFormat := AnsiUpperCase(Copy(ExportFormat, 2, Length(ExportFormat)));

  { export data using selected format }
  if ExportFormat = 'HTML' then
    ExportGrid4ToHTML(dlgExportData.FileName, grdData)
  else
  if ExportFormat = 'XML' then
    ExportGrid4ToXML(dlgExportData.FileName, grdData)
  else
  if ExportFormat = 'XLS' then
    ExportGrid4ToExcel(dlgExportData.FileName, grdData)
  else
  if ExportFormat = 'TXT' then
    ExportGrid4ToText(dlgExportData.FileName, grdData)
  else begin
    ShowMessage(Format('Формат %s не поддерживается', [ExportFormat]));
    Exit;
  end;

  { try to show saved file }
  if MessageDlg(
    'Сохранение завершено. Открыть созданный файл?',
    'Результат сохранен в файл ' + dlgExportData.FileName + '. ' +
    'Если Вы хотите просмотреть созданный файл нажмите "Да", иначе нажмите "Нет".',
    '', mtInformation, [mbYes, mbNo], 0) = mrYes then
    ShellOpen(dlgExportData.FileName);
end;

procedure TfdcCustomGridForm.actCopySelectionUpdate(Sender: TObject);
begin
  inherited;
  with ActiveGridTableView do
    (Sender as TAction).Enabled := (Sender as TAction).Visible and
       (
         { single record selection }
         (
           (not OptionsSelection.MultiSelect) and
           (Controller.SelectedRowCount = 1)
         ) or
         { multiple records selection }
         (
           (OptionsSelection.MultiSelect) and
           (Controller.SelectedRowCount > 0)
         )
       );
end;

procedure TfdcCustomGridForm.actCopySelectionExecute(Sender: TObject);
begin
  inherited;
  with ActiveGridTableView,
       ActiveGridTableView.Controller do
    { copy selected cell value to clipboard }
    if (OptionsSelection.CellSelect) and
       (
         (not OptionsSelection.MultiSelect) or
         (Controller.SelectedRecordCount = 1)
       ) then
      Clipboard.AsText := FocusedRow.Values[FocusedColumn.Index]
    { copy selected rows to clipboard }
    else
      CopyToClipboard(False);
end;

procedure TfdcCustomGridForm.actCopyAllUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (ActiveGridTableView.DataController.RowCount > 0);
end;

procedure TfdcCustomGridForm.actCopyAllExecute(Sender: TObject);
begin
  inherited;
  { copy all data to clipboard }
  ActiveGridTableView.CopyToClipboard(True)
end;

procedure TfdcCustomGridForm.actFilterByCellUpdate(Sender: TObject);
begin
  inherited;
  with ActiveGridTableView.Controller do
    (Sender as TAction).Enabled := (Sender as TAction).Visible and
       Assigned(FocusedColumn) and
       Assigned(FocusedRecord);
end;

procedure TfdcCustomGridForm.actFilterByCellExecute(Sender: TObject);
begin
  inherited;
  CreateFilterCriteria(False);
end;

procedure TfdcCustomGridForm.actFilterExcludeCellExecute(Sender: TObject);
begin
  inherited;
  CreateFilterCriteria(True);
end;

procedure TfdcCustomGridForm.actCancelFilterUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    ActiveGridTableView.DataController.Filter.Active;
end;

procedure TfdcCustomGridForm.actCancelFilterExecute(Sender: TObject);
begin
  inherited;
  ActiveGridTableView.DataController.Filter.Active := False;
end;

procedure TfdcCustomGridForm.actClearFilterUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (ActiveGridTableView.DataController.Filter.FilterText <> '');
end;

procedure TfdcCustomGridForm.actClearFilterExecute(Sender: TObject);
begin
  inherited;
  ActiveGridTableView.DataController.Filter.Root.Clear;
end;

procedure TfdcCustomGridForm.grdDataLayoutChanged(Sender: TcxCustomGrid; AGridView: TcxCustomGridView);
begin
  inherited;
  UpdateRowCountPanel;
end;

procedure TfdcCustomGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  inherited;
  //if IsCursorUnderData then
  //  actSearchOk.Execute;
end;

procedure TfdcCustomGridForm.actFilterDialogUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     (ActiveGridTableView.DataController.RecordCount > 0);
end;

procedure TfdcCustomGridForm.actFilterDialogExecute(Sender: TObject);
begin
  inherited;
  ActiveGridTableView.Filtering.RunCustomizeDialog;
end;

procedure TfdcCustomGridForm.actAutoFilterUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (ActiveGridTableView.DataController.RecordCount > 0);
  (Sender as TAction).Checked := ActiveGridTableView.OptionsCustomize.ColumnFiltering;
end;

procedure TfdcCustomGridForm.actAutoFilterExecute(Sender: TObject);
begin
  inherited;
  with ActiveGridTableView.OptionsCustomize do
    ColumnFiltering := not ColumnFiltering;
end;

procedure TfdcCustomGridForm.actAutoPreviewUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (ActiveGridTableView.DataController.RecordCount > 0);
  (Sender as TAction).Checked := ActiveGridTableView.Preview.Visible;
end;

procedure TfdcCustomGridForm.actAutoPreviewExecute(Sender: TObject);
begin
  inherited;
  with ActiveGridTableView do
    Preview.Visible := not Preview.Visible;
end;

procedure TfdcCustomGridForm.actSwitchSearchCriteriaUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible;
  (Sender as TAction).Checked := pnlSearchCriteria.Visible;
end;

procedure TfdcCustomGridForm.actSwitchSearchCriteriaExecute(Sender: TObject);
begin
  inherited;
  SwitchSearchCriteriaPanel(not pnlSearchCriteria.Visible);
  RefreshData;
end;

procedure TfdcCustomGridForm.actViewToolBarUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (BarManager.Bars.Count > 0);
  (Sender as TAction).Checked := (BarManager.Bars.Count > 0) and
     BarManager.Bars[0].Visible;
end;

procedure TfdcCustomGridForm.actViewToolBarExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i:=0 to BarManager.Bars.Count-1 do
    BarManager.Bars[i].Visible := not BarManager.Bars[i].Visible;
end;

procedure TfdcCustomGridForm.actViewStatusBarUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Checked := StatusBar.Visible;
end;

procedure TfdcCustomGridForm.actViewStatusBarExecute(Sender: TObject);
begin
  inherited;
  StatusBar.Visible := not StatusBar.Visible;
end;

procedure TfdcCustomGridForm.actSearchOkUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Visible := SearchMode;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    SearchMode and
    (
      { single search }
      (
        (not SearchMultiple) and
        (ActiveGridTableView.Controller.SelectedRecordCount = 1)
      ) or

      { multiple search }
      (
        (SearchMultiple) and
        (ActiveGridTableView.Controller.SelectedRecordCount > 0)
      )
    );
end;

procedure TfdcCustomGridForm.actSearchOkExecute(Sender: TObject);
begin
  inherited;
  ActivateSearchSourceForm;
  IterateRecords(FOnSearchFinished, True, False);
  Close;
end;

procedure TfdcCustomGridForm.actSearchCancelUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Visible := SearchMode;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    SearchMode;
end;

procedure TfdcCustomGridForm.actSearchCancelExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfdcCustomGridForm.actSearchExecute(Sender: TObject);
begin
  inherited;
  ShowProgress('Поиск данных...');
  try
    RefreshData;
  finally
    HideProgress;
  end;
end;

procedure TfdcCustomGridForm.actRefreshExecute(Sender: TObject);
begin
  ShowProgress('Чтение данных...');
  try
    inherited;
  finally
    HideProgress;
  end;
end;

procedure TfdcCustomGridForm.edtSearchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and
     (Key = vk_Return) then
    actSearch.Execute;
end;

end.
