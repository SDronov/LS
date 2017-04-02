unit qaTurnover1Old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDBDataFrm, dxPSCore, dxPScxCommon, dxPScxTLLnk,
  cxInplaceContainer, cxTL, cxDBTL, cxControls, cxTLData, DB, OracleData,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGraphics,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  dxLayoutControl, cxTextEdit, dxmdaset, dxtrprds, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, xlcClasses,
  xlEngine, xlReport, cxCustomData, cxStyles, cxCurrencyEdit, Menus,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns;

type
  TAccTurnOver1OldGridForm = class(TfdcCustomDBDataForm)
    dsDataN: TOracleDataSet;
    dsDataCUSTCODE: TStringField;
    dsDataDOCCODE: TStringField;
    dsDataDOCDATE: TStringField;
    dsDataINTCODE: TStringField;
    dsDataITEM: TStringField;
    dsDataCAPTION: TStringField;
    dsDataPARENT_ITEM: TStringField;
    dsDataI_S: TFloatField;
    dsDataI_T: TFloatField;
    dsDataO_T: TFloatField;
    dsDataO_S: TFloatField;
    DataSource1: TDataSource;
    tlData: TcxDBTreeList;
    cxDBTreeListITEM: TcxDBTreeListColumn;
    cxDBTreeListCAPTION: TcxDBTreeListColumn;
    cxDBTreeListPARENT_ITEM: TcxDBTreeListColumn;
    cxDBTreeListI_S: TcxDBTreeListColumn;
    cxDBTreeListI_T: TcxDBTreeListColumn;
    cxDBTreeListO_T: TcxDBTreeListColumn;
    cxDBTreeListO_S: TcxDBTreeListColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    tlDataPrintLink: TcxDBTreeListReportLink;
    acExpand: TAction;
    acCollapse: TAction;
    acPrint: TAction;
    acMakeL: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    acExport: TAction;
    dxBarButton5: TdxBarButton;
    dlgExportData: TSaveDialog;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutControl1Item1: TdxLayoutItem;
    z: TfdcObjectLookupEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsParams: TdxMemData;
    srcParams: TDataSource;
    dsParamsBDATE: TDateField;
    dsParamsEDATE: TDateTimeField;
    dsParamsCURRID: TIntegerField;
    dsDataNEDATE: TStringField;
    xlReport1: TxlReport;
    OracleDataSet1: TOracleDataSet;
    actSave: TAction;
    dxBarButton6: TdxBarButton;
    dsDataNTAG: TStringField;
    procedure acExpandExecute(Sender: TObject);
    procedure acCollapseExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure dsDataNCalcFields(DataSet: TDataSet);
    procedure dsDataNApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure tlDataCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tlDataEdited(Sender: TObject; AColumn: TcxTreeListColumn);
    procedure tlDataEditing(Sender: TObject; AColumn: TcxTreeListColumn;
      var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure acMakeLExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure dsParamsAfterOpen(DataSet: TDataSet);
    procedure dsDataNBeforeQuery(Sender: TOracleDataSet);
    procedure acMakeLUpdate(Sender: TObject);
    procedure xlReport1DataSources0BeforeDataTransfer(
      DataSource: TxlDataSource);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DoReCalc(AField: TField);
    procedure SaveAsXML(const Prefix: string; DataSet: TDataSet; Lines: TStrings);
    function MakeCaption: string;
    procedure InitReport(Report: TxlReport);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccTurnOver1OldGridForm: TAccTurnOver1OldGridForm;

implementation

uses
  MainDm, cxExportTL4Link, fdcMessages, fdcUtils, fdcObjectServices,
  DictDm, ITransportAcrh;

{$R *.dfm}

procedure FillVariablesFromDataSet(ODataSet: TOracleDataSet; DataSet: TDataSet);
var
  I: Integer;
  F: TField;
begin
  for I := 0 to ODataSet.VariableCount - 1 do    // Iterate
  begin
    F := DataSet.FindField(Copy(ODataSet.VariableName(I), 2, MaxInt));
    if F <> nil then
    begin
      ODataSet.SetVariable(I, F.AsVariant);
    end;
  end;    // for
end;

procedure TAccTurnOver1OldGridForm.acExpandExecute(Sender: TObject);
begin
  inherited;
  tlData.FullExpand;
end;

procedure TAccTurnOver1OldGridForm.acCollapseExecute(Sender: TObject);
begin
  inherited;
  tlData.FullCollapse;
end;

procedure TAccTurnOver1OldGridForm.acPrintExecute(Sender: TObject);
begin
  inherited;
  tlDataPrintLink.ReportTitle.Text := MakeCaption;
  tlDataPrintLink.Print(True, nil);
end;

function TAccTurnOver1OldGridForm.MakeCaption: string;
begin
 Result :=   Format('Оперативный баланс таможни %s за период с %s по %s (валюта %s)',
   [dsDataCUSTCODE.Value, dsParamsBDATE.AsString, dsParamsEDATE.AsString
   ,dsDataINTCODE.Value]);
end;

procedure TAccTurnOver1OldGridForm.dsDataNCalcFields(
  DataSet: TDataSet);
begin
  inherited;
//  dsDataO_S.Value := dsDataI_S.Value
//                 + (dsDataI_T.Value - dsDataO_T.Value);
end;

procedure TAccTurnOver1OldGridForm.dsDataNApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
  Applied := True;
end;

procedure TAccTurnOver1OldGridForm.tlDataCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Node <> nil) and (AViewInfo.Node.Level = 0) then
     ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
end;

procedure TAccTurnOver1OldGridForm.tlDataEdited(Sender: TObject;
  AColumn: TcxTreeListColumn);
begin
  inherited;
  DoReCalc(TcxDBTreeListColumn(AColumn).DataBinding.Field);
end;

procedure TAccTurnOver1OldGridForm.tlDataEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  inherited;
  Allow := (TcxTreeList(Sender).FocusedNode <> nil) and
           (not TcxTreeList(Sender).FocusedNode.HasChildren) and
           (AColumn.PropertiesClassName = 'TcxCurrencyEditProperties');
end;

procedure TAccTurnOver1OldGridForm.DoReCalc(AField: TField);
var
  Bookmark: TBookmark;
  ParentId: String;
  ADelta: currency;
begin
  ADelta := AField.AsCurrency - AField.OldValue;
  if ADelta = 0 then Exit;
  dsDataN.CheckBrowseMode;
  ParentId := dsDataN['PARENT_ITEM'];
  Bookmark := dsDataN.GetBookmark;
  dsDataN.DisableControls;
  try
    while dsDataN.SearchRecord('CODE', ParentId, [srFromCurrent, srBackward]	) do
    begin
      dsDataN.Edit;
      AField.Value := AField.Value + ADelta;
      ParentId := dsDataN['PARENT_ITEM'];
      dsDataN.Post;
    end;
    dsDataN.GotoBookmark(Bookmark);
  finally // wrap up
    dsDataN.EnableControls;
    dsDataN.FreeBookMark(Bookmark);
  end;    // try/finally
end;

procedure TAccTurnOver1OldGridForm.FormShow(Sender: TObject);
begin
  inherited;
  dsParams.Open;
end;

procedure TAccTurnOver1OldGridForm.acExportExecute(Sender: TObject);
begin
  FillVariablesFromDataSet(OracleDataSet1, dsParams);
  InitReport(xlReport1);
  xlReport1.Report(True);
end;

const XMLPart1 =
'<?xml version="1.0" encoding="Windows-1251" standalone="yes"?>' + #13#10 +
'<datapacket Version="2.0">' + #13#10 +
' <metadata>' + #13#10 +
'  <fields>' + #13#10 +
'   <field attrname="CUSTCODE" fieldtype="string" width="10"/>' + #13#10 +
'   <field attrname="DOCCODE" fieldtype="string" width="10"/>' + #13#10 +
'   <field attrname="BDATE" fieldtype="dateTime"/>' + #13#10 +
'   <field attrname="EDATE" fieldtype="dateTime"/>' + #13#10 +
'   <field attrname="INTCODE" fieldtype="string" width="3"/>' + #13#10 +
'   <field attrname="CODE" fieldtype="string" width="10"/>' + #13#10 +
'   <field attrname="BSUMMA" fieldtype="fixed" width="22" decimals="2"/>' + #13#10 +
'   <field attrname="ISUMMA" fieldtype="fixed" width="22" decimals="2"/>' + #13#10 +
'   <field attrname="OSUMMA" fieldtype="fixed" width="22" decimals="2"/>' + #13#10 +
'   <field attrname="ESUMMA" fieldtype="fixed" width="22" decimals="2"/>' + #13#10 +
'  </fields>' + #13#10 +
'  <params/>' + #13#10 +
' </metadata>' + #13#10 +
' <rowdata>' ;

function PrintFields(DataSet: TDataSet): string;
var
  F: TField;
  I: Integer;
begin
  Result := '';
  for I := 0 to DataSet.FieldCount - 1 do    // Iterate
  begin
    F := DataSet.Fields[I];
    if F.FieldKind <> fkInternalCalc then
      Result := Result + Format(' %s="%s"', [F.FieldName, F.Text]);
  end;    // for
end;

procedure TAccTurnOver1OldGridForm.SaveAsXML(const Prefix: string; DataSet: TDataSet; Lines: TStrings);
var
  S: String;
  SavedSeparator : char;
begin
  SavedSeparator := DecimalSeparator;
  S := DataSet.Bookmark;
  try
    DataSet.DisableControls;
    DecimalSeparator := '.';
    Lines.Text := Prefix;
    DataSet.First;
    while not DataSet.Eof do
    begin
      Lines.Add(Format('  <row%s/>', [PrintFields(DataSet)]));
      DataSet.Next;
    end;
    Lines.Add(' </rowdata>');
    Lines.Add('</datapacket>');
  finally
    DecimalSeparator := SavedSeparator;
    DataSet.Bookmark := S;
    DataSet.EnableControls;
  end;
end;

procedure TAccTurnOver1OldGridForm.acMakeLExecute(Sender: TObject);
var
  Lines: TStrings;
begin
  inherited;
  Lines := TStringList.Create;
  try
    SaveAsXML(XMLPart1, dsDataN, Lines);
    MakeTransportArchive('TURN1', Lines, MakeCaption, '.xml');
  finally
    Lines.Free;
  end;
end;

procedure TAccTurnOver1OldGridForm.actRefreshExecute(Sender: TObject);
begin
  dsParams.CheckBrowseMode;
  if dsDataN.Active then dsDataN.Refresh
    else dsDataN.Open;
end;

procedure TAccTurnOver1OldGridForm.actRefreshUpdate(Sender: TObject);
begin
//  inherited;

end;

procedure TAccTurnOver1OldGridForm.dsParamsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DictData.dsCurrency.Open;
  DataSet.InsertRecord([1, Date, Date, Double(DictData.dsCurrency.Lookup('CODE', '643', 'ID'))]);
end;

procedure TAccTurnOver1OldGridForm.dsDataNBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  FillVariablesFromDataSet(Sender, dsParams);
end;

procedure TAccTurnOver1OldGridForm.acMakeLUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := TAction(Sender).Visible and dsDataN.Active;
end;

procedure TAccTurnOver1OldGridForm.xlReport1DataSources0BeforeDataTransfer(
  DataSource: TxlDataSource);
begin
  inherited;
  OracleDataSet1.SetVariable('Range', StringReplace(Copy(DataSource.Alias, 3, MaxInt), '_', '.', [rfReplaceAll	]));
  OracleDataSet1.Close;
  OracleDataSet1.Open;
end;

procedure TAccTurnOver1OldGridForm.InitReport(Report: TxlReport);
var
  ADataSource: TxlDataSource;
  I: Integer;
  List: TStrings;
begin
  XLReport1.DataSources.Clear;
  List := TStringList.Create;
  try
    List.CommaText :=
'ds1_1,ds1_2,ds1_3,ds2=rng2,ds3_1=rng3_1,ds3_2=rng3_2,ds4=rng4,ds7=rng7,ds8=rng8,ds9=rng9,ds10_1=rng10_1,ds10_2=rng10_2,ds10_3=rng10_3,ds11=rng11,ds12=rng12,ds13=rng13';
    for I := 0 to List.Count - 1 do
    begin
      ADataSource := XLReport1.DataSources.Add;
      ADataSource.DataSet := OracleDataSet1;
      ADataSource.Alias := List.Names[I];
      if ADataSource.Alias = '' then
        ADataSource.Alias := List[I]
      else
         ADataSource.Range := List.ValueFromIndex[I];
      ADataSource.OnBeforeDataTransfer := Self.xlReport1DataSources0BeforeDataTransfer;
    end;
  finally
    List.Free;
  end;
end;

procedure TAccTurnOver1OldGridForm.actSaveExecute(Sender: TObject);
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
    cxExportTL4ToHTML(dlgExportData.FileName, tlData, False)
  else
  if ExportFormat = 'XML' then
    cxExportTL4ToXML(dlgExportData.FileName, tlData, False)
  else
  if ExportFormat = 'XLS' then
    cxExportTL4ToExcel(dlgExportData.FileName, tlData, False)
  else
  if ExportFormat = 'TXT' then
    cxExportTL4ToText(dlgExportData.FileName, tlData, False)
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

procedure TAccTurnOver1OldGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport1.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport1.XLSTemplate;
end;

initialization
   RegisterClass(TAccTurnOver1OldGridForm);

end.
