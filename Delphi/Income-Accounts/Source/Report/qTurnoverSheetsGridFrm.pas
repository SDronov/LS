unit qTurnoverSheetsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDataFrm, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, DB, dxmdaset,
  cxControls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  dxBarExtItems, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxPC, qCustomTurnoverSheetFrm,
  xlcClasses, xlEngine, xlReport, OracleData, StdCtrls, DateUtils, Oracle,
  cxCheckBox, cxGridCustomTableView, cxGridDBBandedTableView,
  FDCCustomDataset, fdcQuery;

type
  TTurnoverSheetsGridForm = class(TfdcCustomDataForm)
    dsParams: TdxMemData;
    dsParamsBDATE: TDateField;
    dsParamsEDATE: TDateTimeField;
    dsParamsCURRID: TIntegerField;
    srcParams: TDataSource;
    actRefresh: TAction;
    btnRefresh: TdxBarButton;
    cciDateFrom: TdxBarControlContainerItem;
    dbdeDateFrom: TcxDBDateEdit;
    dbdeDateTo: TcxDBDateEdit;
    cciDateTo: TdxBarControlContainerItem;
    siDateFrom: TdxBarStatic;
    siDateTo: TdxBarStatic;
    siCurrency: TdxBarStatic;
    cciCurrency: TdxBarControlContainerItem;
    actExcelExport: TAction;
    btnExcelExport: TdxBarButton;
    pcTurnoverSheets: TcxPageControl;
    excelExportTurnoverSheet: TxlReport;
    dsetSystemParams: TOracleDataSet;
    dsetSystemParamsCUSTOMNAME: TStringField;
    dsetSystemParamsBOSSNAME: TStringField;
    dsetSystemParamsPAYBOSSNAME: TStringField;
    dsetSystemParamsCUSTOMCODE: TStringField;
    dsetSystemParamsAPPENDIX_NO: TStringField;
    dsetSystemParamsFORM_NO: TStringField;
    dsetSystemParamsACCOUNT_NAME: TStringField;
    dsetSystemParamsPERIOD: TStringField;
    siMode: TdxBarStatic;
    cciMode: TdxBarControlContainerItem;
    dsParamsMODE: TStringField;
    dsNsiTO: TOracleDataSet;
    dsetSystemParamsCURRCODE: TStringField;
    qryCheckDates: TOracleQuery;
    actIdent: TAction;
    siDetail: TdxBarStatic;
    cciDetail: TdxBarControlContainerItem;
    dsParamsISTS: TStringField;
    dbdeISTS: TcxDBCheckBox;
    cciSummarn: TdxBarControlContainerItem;
    dbdeSummarn: TcxDBCheckBox;
    dsParamsSUMMARN: TStringField;
    dsDetail: TfdcQuery;
    dsParamspDate: TDateField;
    dsParamsACCOUNT_ID: TIntegerField;
    dsParamsACCOUNT_CODE: TStringField;
    dsParamsADD_ACCOUNT_ID: TIntegerField;
    btnExpand: TdxBarButton;
    btnCollapse: TdxBarButton;
    actExpand: TAction;
    actCollapse: TAction;
    procedure dsParamsBeforeOpen(DataSet: TDataSet);
    procedure dsParamsAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actExcelExportUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dsParamsBDATEChange(Sender: TField);
    procedure dsetSystemParamsApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure actExcelExportExecute(Sender: TObject);
    procedure pcTurnoverSheetsDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure pcTurnoverSheetsChange(Sender: TObject);
    procedure dbdeDateFromPropertiesChange(Sender: TObject);
    procedure actIdentExecute(Sender: TObject);
    procedure actExpandExecute(Sender: TObject);
    procedure actCollapseExecute(Sender: TObject);
  private
    function  GetTurnoverSheetByPage ( APage : TcxTabSheet ) : TCustomTurnoverSheetForm;
    procedure ParamsChanged;
  protected
    function  AllowOldReport: boolean;
    procedure ShowDetailReport( AInputRest: Boolean);
    function  SheetIsPresent(aSheet: TTurnoverSheetFormClass): boolean;
    procedure TurnoverSheetViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  public
    procedure ShowPages;
    procedure ShowControlDetail;
  end;

var
  NsiReportStartDate : TDate;
  DateFrom : TDate;

implementation

uses
  DictDm
 ,fdcUtils
 ,StrUtils
 ,MainDm
 ,qReportUtil;

{$R *.dfm}

const
  cNsiYear         = 2009;
  cNsiMonth        = 01;
  cNsiDay          = 01;
  cFldTemplateName = 'Template_Name';

procedure TTurnoverSheetsGridForm.dsParamsBeforeOpen(DataSet: TDataSet);
begin
  DictData.dsCurrency.Open;
end;

procedure TTurnoverSheetsGridForm.dsParamsAfterOpen(DataSet: TDataSet);
begin
  if not DictData.dsCurrency.Locate( 'CODE', '643', [] ) then
    DictData.dsCurrency.First;
  DataSet.InsertRecord([1, Date, Date, DictData.dsCurrency.FieldByName( 'ID' ).AsFloat, 'Обороты','N','N']);
end;

procedure TTurnoverSheetsGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  try
    NsiReportStartDate := MainData.GetSystemValue('NsiReportStartDate', rvDateTime);
  except
  end;
  dsParams.Open;
end;

procedure TTurnoverSheetsGridForm.actRefreshUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := pcTurnoverSheets.PageCount > 0;
end;

function TTurnoverSheetsGridForm.GetTurnoverSheetByPage(
  APage: TcxTabSheet): TCustomTurnoverSheetForm;
  var
    i : Integer;
begin
  Result := nil;
  for i := 0 to APage.ControlCount - 1 do
    if APage.Controls[i] is TCustomTurnoverSheetForm then
      begin
        Result := (APage.Controls[i] as TCustomTurnoverSheetForm);
        break;
      end;
end;

procedure TTurnoverSheetsGridForm.actExcelExportUpdate(Sender: TObject);
  var
    dset : TDataSet;
begin
  (Sender as TAction).Enabled := pcTurnoverSheets.PageCount > 0;
  if (Sender as TAction).Enabled and (GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage ) <> nil) then
    begin
      (Sender as TAction).Enabled := GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage ).XLSName <> '';

      if (Sender as TAction).Enabled then
        begin
          dset := GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage ).dsetData;
          (Sender as TAction).Enabled := dset.Active
                                     and not dset.IsEmpty;
        end;
    end;
end;

procedure TTurnoverSheetsGridForm.actRefreshExecute(Sender: TObject);
  var l_i: integer;
begin
  if pcTurnoverSheets.PageCount = 0 then
    Exit;

  if not AllowOldReport then
  begin
    qryCheckDates.SetVariable('bdate', dbdeDateFrom.Date);
    qryCheckDates.SetVariable('edate', dbdeDateTo.Date);
    qryCheckDates.Execute;
  end;

  dsParams.CheckBrowseMode;
  with GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage ) do
    begin
      RefreshData;
      for l_i := 0 to grdTurnoverSheetDBBandedTableView.ColumnCount -1 do
        begin
          grdTurnoverSheetDBBandedTableView.Columns[l_i].Width := grdTurnoverSheetDBBandedTableView.Columns[l_i].Width + 20;
        end;
    end;
end;

procedure TTurnoverSheetsGridForm.dsParamsBDATEChange(Sender: TField);
begin
  ParamsChanged;
end;

procedure TTurnoverSheetsGridForm.ParamsChanged;
  var
    i : Integer;
begin
  for i := 0 to pcTurnoverSheets.PageCount - 1 do
    GetTurnoverSheetByPage( pcTurnoverSheets.Pages[i] ).ParamsChanged;
end;

procedure TTurnoverSheetsGridForm.dsetSystemParamsApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  if Action = 'U' then
    Applied := True;
end;

procedure TTurnoverSheetsGridForm.actExcelExportExecute(Sender: TObject);
  var
    TurnoverSheet : TCustomTurnoverSheetForm;
    InTransaction : boolean;
begin
  if not Assigned( pcTurnoverSheets.ActivePage ) then
    Exit;

  TurnoverSheet := GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage );
  if TurnoverSheet.XLSName = '' then
    Exit;

  if not dsetSystemParams.Active then
    dsetSystemParams.Open;

  with dsetSystemParams do
    begin
      InTransaction := Session.InTransaction;
      Edit;

      FieldByName( 'Appendix_No' ).AsString  := TurnoverSheet.AppendixNo;
      FieldByName( 'Form_No' ).AsString      := TurnoverSheet.FormNo;
      FieldByName( 'Account_Name' ).AsString := 'Т.' + TurnoverSheet.AccountCode + ' "' + TurnoverSheet.AccountName + '"';
      FieldByName( 'Period' ).AsString       := 'с '   + FormatDateTime( 'DD.MM.YYYY', dsParams.FieldByName('BDATE').AsDateTime ) +
                                                ' по ' + FormatDateTime( 'DD.MM.YYYY', dsParams.FieldByName('EDATE').AsDateTime );
      Post;
      if not InTransaction then
        Session.Rollback;
    end;

  excelExportTurnoverSheet.XLSTemplate            := ExtractFilePath(Application.ExeName) + 'Report\' + TurnoverSheet.XLSName;
  excelExportTurnoverSheet.DataSources[1].DataSet := TurnoverSheet.dsetData;
  excelExportTurnoverSheet.MacroAfter             := TurnoverSheet.MacroAfter;
  excelExportTurnoverSheet.MacroBefore            := TurnoverSheet.MacroBefore;

  excelExportTurnoverSheet.Report( True );
end;

procedure TTurnoverSheetsGridForm.pcTurnoverSheetsDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
  if pcTurnoverSheets.ActivePageIndex = ATab.Index then
    Font.Style := [fsBold];
end;

procedure TTurnoverSheetsGridForm.pcTurnoverSheetsChange(Sender: TObject);
var s : string;
begin
  inherited;
  // иначе текст не влезает на закладку
  s := pcTurnoverSheets.ActivePage.Caption;
  pcTurnoverSheets.ActivePage.Caption := '';
  pcTurnoverSheets.ActivePage.Caption := s;
  //--
  ShowControlDetail;
  //--
end;


procedure TTurnoverSheetsGridForm.ShowPages;
  var
    TurnoverSheetClass : TTurnoverSheetFormClass;
    TurnoverSheet      : TCustomTurnoverSheetForm;
    Sheet              : TcxTabSheet;
    i                  : Integer;
    TemplateName       : string;
begin
  Application.ProcessMessages;
  dsParams.CheckBrowseMode;
  dsNsiTo.SetVariable('DateFrom', dsParamsBDate.Value);
  if (dsNsiTo.Active) then
    begin
      dsNsiTo.Refresh;
    end
  else
    begin
      dsNsiTo.Open;
    end;
  // -- удаление только тех форм которые не попадают в новые границы
  i := 0;
  while (i < pcTurnoverSheets.PageCount)  do
  begin
    TemplateName := GetTurnoverSheetByPage(pcTurnoverSheets.Pages[i]).TemplateName;
    if (TemplateName = '') and AllowOldReport
       or dsNsiTo.Locate(cFldTemplateName, TemplateName, []) then
      begin
        inc(i);
      end
    else
      begin
        if (pcTurnoverSheets.Pages[i] <> nil) then
          begin
            pcTurnoverSheets.Pages[i].Free;
          end;
      end;
  end;
  // -- создание новых закладок
  for i := 0 to TurnoverSheetClassList.Count - 1 do
    if not SheetIsPresent(TTurnoverSheetFormClass(TurnoverSheetClassList[i])) and
       ( not AllowOldReport and dsNsiTo.Locate(cFldTemplateName, TurnoverSheetTemplates[i], []) or
             AllowOldReport and (TurnoverSheetTemplates[i] =  '')
       ) then
    begin
      // Создается закладка Sheet (владелец SELF).
      // Затем создается форма по заданной Оборотной ведомости (владелец Sheet, на которой отображается оборотка).
      // Такая реализация позволяет освобождать память всех дочерних объектов
      // одним вызовом Free у SELF
      Sheet := TcxTabSheet.Create( Self );
      Sheet.PageControl := pcTurnoverSheets;

      TurnoverSheetClass := TTurnoverSheetFormClass(TurnoverSheetClassList[i]);
      TurnoverSheet      := TurnoverSheetClass.Create( Sheet );
      Sheet.Caption      := TurnoverSheet.Caption;

      TurnoverSheet.dsetParams   := dsParams;
      TurnoverSheet.ManualDock( Sheet );
      TurnoverSheet.WindowState  := wsNormal;
      TurnoverSheet.Align        := alClient;
      TurnoverSheet.TemplateName := TurnoverSheetTemplates[i];
      if TurnoverSheet.EnableDetailReport then
        TurnoverSheet.grdTurnoverSheetDBBandedTableView.OnCellDblClick := TurnoverSheetViewCellDblClick;
      TurnoverSheet.Show;
    end;
  dsNsiTo.Close;
  //--
  ShowControlDetail;
  //--
end;

procedure TTurnoverSheetsGridForm.ShowControlDetail;
begin
  //--
  if (pcTurnoverSheets.ActivePage <> nil) then
    begin
      if (GetTurnoverSheetByPage(pcTurnoverSheets.ActivePage) <> nil) then
      if (GetTurnoverSheetByPage(pcTurnoverSheets.ActivePage).pvisible_detail) then
        begin
          siDetail.Visible := ivAlways;
          cciDetail.Visible := ivAlways;
          dbdeISTS.Visible := true;
          cciSummarn.Visible := IfElse((MainData.GetCustomsLevel < 2),ivAlways,ivNever);
          dbdeSummarn.Visible := IfElse((MainData.GetCustomsLevel < 2),true,false);
        end
      else
        begin
          siDetail.Visible := ivNever;
          dbdeISTS.Visible := false;
          cciDetail.Visible := ivNever;
          dbdeSummarn.Visible := false;
          cciSummarn.Visible := ivNever;
        end;
    end;
  //--
end;

procedure TTurnoverSheetsGridForm.dbdeDateFromPropertiesChange(Sender: TObject);
begin
  if (dsParams.State = dsEdit) then
    begin
      dsParams.Post;
    end;
  DateFrom := dsParamsBDate.Value;
  ShowPages;
end;

function  TTurnoverSheetsGridForm.SheetIsPresent(aSheet: TTurnoverSheetFormClass): boolean;
var
  i : integer;
begin
  Result := False;
  for i := 0 to pcTurnoverSheets.PageCount-1 do
    if GetTurnoverSheetByPage(pcTurnoverSheets.Pages[i]).ClassType = aSheet then
    begin
      Result := True;
      Break;
    end;
end;

function  TTurnoverSheetsGridForm.AllowOldReport: boolean;
begin
  Result := (dsParamsBDate.Value < NsiReportStartDate);
end;

procedure TTurnoverSheetsGridForm.actIdentExecute(Sender: TObject);
begin
  ShowMessage( GetTurnoverSheetByPage ( pcTurnoverSheets.ActivePage ).ClassName );
end;

procedure TTurnoverSheetsGridForm.TurnoverSheetViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  col: TcxGridDBBandedColumn;
begin
  if Assigned(ACellViewInfo.Item) and
    (ACellViewInfo.Item is TcxGridDBBandedColumn) then
    begin
      col := ACellViewInfo.Item as TcxGridDBBandedColumn;
      if AnsiStartsText('IN_SUMMA', col.DataBinding.FieldName) or
         AnsiStartsText('OUT_SUMMA', col.DataBinding.FieldName) then
        begin
          ShowDetailReport(AnsiStartsText('IN_SUMMA', col.DataBinding.FieldName));
          AHandled := True;
        end;
    end;
end;

procedure TTurnoverSheetsGridForm.ShowDetailReport( AInputRest: Boolean);
  var
    TurnoverSheet : TCustomTurnoverSheetForm;
    InTransaction : boolean;
    vFileName: TFileName;
begin
  if not Assigned( pcTurnoverSheets.ActivePage ) then
    Exit;

  TurnoverSheet := GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage );
  excelExportTurnoverSheet.XLSTemplate            := ExtractFilePath(Application.ExeName) + 'Report\' + TurnoverSheet.XLSDetailName;
  if not FileExists(excelExportTurnoverSheet.XLSTemplate) then
      raise Exception.CreateFmt('Не найден шаблон отчета [%s]!', [excelExportTurnoverSheet.XLSTemplate]);

  if not (dsParams.State in [dsEdit, dsInsert]) then dsParams.Edit;
  dsParamsACCOUNT_CODE.Value := TurnoverSheet.AccountCode;
  dsParamsACCOUNT_ID.Value := TurnoverSheet.GetAccountID(TurnoverSheet.AccountCode);
  dsParamsADD_ACCOUNT_ID.Value := TurnoverSheet.GetAddAccountID;
  if AInputRest then
    dsParamspDate.Value := dsParamsBDATE.Value
  else
    dsParamspDate.Value := dsParamsEDATE.Value + 1;
  dsParams.Post;
  DateFrom := dsParamsBDate.Value;

  if not dsetSystemParams.Active then
    dsetSystemParams.Open;

  with dsetSystemParams do
    begin
      InTransaction := Session.InTransaction;
      Edit;

      FieldByName( 'Appendix_No' ).AsString  := TurnoverSheet.AppendixNo;
      FieldByName( 'Form_No' ).AsString      := TurnoverSheet.FormNo;
      FieldByName( 'Account_Name' ).AsString := 'Т.' + TurnoverSheet.AccountCode + ' "' + TurnoverSheet.AccountName + '"';
      FieldByName( 'Period' ).AsString       := 'с '   + FormatDateTime( 'DD.MM.YYYY', dsParams.FieldByName('BDATE').AsDateTime ) +
                                                ' по ' + FormatDateTime( 'DD.MM.YYYY', dsParams.FieldByName('EDATE').AsDateTime );
      Post;
      if not InTransaction then
        Session.Rollback;
    end;

  LoadReportQueryEx(Self, excelExportTurnoverSheet.XLSTemplate);
  if Trim(dsDetail.SQL.Text) <> EmptyStr then
    excelExportTurnoverSheet.DataSources[1].DataSet := dsDetail;
  excelExportTurnoverSheet.ParamByName['Detail_Header'].AsString :=
    Format('%s остатки по счету %s - %s',
           [IfThen(AInputRest, 'Входящие', 'Исходящие'),
            'Т.' + TurnoverSheet.AccountCode,
            ' "' + TurnoverSheet.AccountName + '"' ]
          );
  excelExportTurnoverSheet.ParamByName['IS_TS'].AsString := IfThen(dsParamsISTS.Value = 'Y', 'Да', 'Нет');
  excelExportTurnoverSheet.ParamByName['IS_SUMMARY'].AsString := IfThen(dsParamsSUMMARN.Value = 'Y', 'Да', 'Нет');

  excelExportTurnoverSheet.Report( True );
  if dsDetail.Active then dsDetail.Close;
  dsDetail.SQL.Clear;
end;

procedure TTurnoverSheetsGridForm.actExpandExecute(Sender: TObject);
begin
  if pcTurnoverSheets.PageCount = 0 then
    Exit;

  with GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage ) do
    begin
      grdTurnoverSheetDBBandedTableView.ViewData.Expand(True);
    end;
end;

procedure TTurnoverSheetsGridForm.actCollapseExecute(Sender: TObject);
begin
  if pcTurnoverSheets.PageCount = 0 then
    Exit;

  with GetTurnoverSheetByPage( pcTurnoverSheets.ActivePage ) do
    begin
     grdTurnoverSheetDBBandedTableView.ViewData.Collapse(True);
    end;
end;

initialization
  NsiReportStartDate := EncodeDate(cNsiYear, cNsiMonth, cNsiDay);
  RegisterClass ( TTurnoverSheetsGridForm );


end.
