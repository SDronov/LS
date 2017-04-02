unit qaTurnover1;

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
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxSplitter, Oracle, JvSimpleXml, dxBarExtItems, QueryList;

type
  TAccTurnOver1GridForm = class(TfdcCustomDBDataForm)
    dsDataN: TOracleDataSet;
    dsDataI_S: TFloatField;
    dsDataI_T: TFloatField;
    dsDataO_T: TFloatField;
    dsDataO_S: TFloatField;
    DataSource1: TDataSource;
    tlData: TcxDBTreeList;
    cxDBTreeListITEM: TcxDBTreeListColumn;
    cxDBTreeListCAPTION: TcxDBTreeListColumn;
    cxDBTreeListSORT_ITEM: TcxDBTreeListColumn;
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
    dsParams: TdxMemData;
    srcParams: TDataSource;
    dsParamsBDATE: TDateField;
    dsParamsEDATE: TDateTimeField;
    dsParamsCURRID: TIntegerField;
    xlReport1: TxlReport;
    actSave: TAction;
    dxBarButton6: TdxBarButton;
    dsDataNCAPTION: TStringField;
    dsDataNITEM: TStringField;
    dsDataNITEM_NO: TStringField;
    dsDataNPARENT_ITEM: TStringField;
    dsDataNCODE: TStringField;
    cxDBTreeListCODE: TcxDBTreeListColumn;
    actCreateTransaction: TAction;
    qryCreateTransaction: TOracleQuery;
    barBtnCreateTransaction: TdxBarButton;
    dsDataNSORT_ITEM: TStringField;
    dsForExport: TdxMemData;
    dsParamsPERIOD: TStringField;
    dsParamsCURR_CODE: TStringField;
    dsParamsCUSTOM_NAME: TStringField;
    dsParamsCUSTOM_CODE: TStringField;
    dsetSystemParams: TOracleDataSet;
    dsetSystemParamsCUSTOMNAME: TStringField;
    dsetSystemParamsCUSTOMCODE: TStringField;
    qryCheckBalanceCreation: TOracleQuery;
    xmlBalance: TJvSimpleXML;
    actInitialRest: TAction;
    dxBarButton7: TdxBarButton;
    actShowDocErrors: TAction;
    btnShowDocErrors: TdxBarButton;
    dsetCheckErrors: TOracleDataSet;
    cxDBDateEdit1: TcxDBDateEdit;
    bcciDateFrom: TdxBarControlContainerItem;
    bsDateFrom: TdxBarStatic;
    bsDateTo: TdxBarStatic;
    bcciDateTo: TdxBarControlContainerItem;
    cxDBDateEdit2: TcxDBDateEdit;
    bsCurrency: TdxBarStatic;
    bcciCurrency: TdxBarControlContainerItem;
    z: TfdcObjectLookupEdit;
    bsMode: TdxBarStatic;
    cbMode: TcxComboBox;
    bcciMode: TdxBarControlContainerItem;
    dsetTransactionsForXML: TOracleDataSet;
    dsDataNWINDOW_TYPE: TStringField;
    cxDBTreeListWINDOW_TYPE: TcxDBTreeListColumn;
    tlData0: TcxDBTreeList;
    cxDBTreeList1ITEM: TcxDBTreeListColumn;
    cxDBTreeList1CAPTION: TcxDBTreeListColumn;
    cxDBTreeList1BSUMMA: TcxDBTreeListColumn;
    cxDBTreeList1ISUMMA: TcxDBTreeListColumn;
    cxDBTreeList1OSUMMA: TcxDBTreeListColumn;
    cxDBTreeList1ESUMMA: TcxDBTreeListColumn;
    cxDBTreeList1CODE: TcxDBTreeListColumn;
    cxDBTreeList1SORT_ITEM: TcxDBTreeListColumn;
    cxDBTreeList1WINDOW_TYPE: TcxDBTreeListColumn;
    dsData0: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    dsrcData0: TDataSource;
    dsetCurrency: TOracleDataSet;
    dsCurrency: TDataSource;
    actOpenTurnOver: TAction;
    barBtnOpenTurnOver: TdxBarButton;
    qryGetRetType: TOracleQuery;
    dsetPeriods: TOracleDataSet;
    qlSQLResult: TQueryList;
    sqlGet_is_doc_need_activate: TsqlOp;
    dsBalansXml: TOracleDataSet;
    dsDetail: TdxBarStatic;
    bcciDetail: TdxBarControlContainerItem;
    cbDetail: TcxComboBox;
    procedure acExpandExecute(Sender: TObject);
    procedure acCollapseExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure dsDataNApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure tlDataCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tlDataEdited(Sender: TObject; AColumn: TcxTreeListColumn);
    procedure tlDataEditing(Sender: TObject; AColumn: TcxTreeListColumn;
      var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure acMakeLExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure dsParamsAfterOpen(DataSet: TDataSet);
    procedure dsDataNBeforeQuery(Sender: TOracleDataSet);
    procedure acMakeLUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCreateTransactionExecute(Sender: TObject);
    procedure acExportUpdate(Sender: TObject);
    procedure actInitialRestExecute(Sender: TObject);
    procedure actInitialRestUpdate(Sender: TObject);
    procedure tlDataDblClick(Sender: TObject);
    procedure dsDataNAfterOpen(DataSet: TDataSet);
    procedure actShowDocErrorsExecute(Sender: TObject);
    procedure actShowDocErrorsUpdate(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure dsetTransactionsForXMLBeforeQuery(Sender: TOracleDataSet);
    procedure tlData0ColumnSizeChanged(Sender, AItem: TObject);
    procedure dsData0AfterOpen(DataSet: TDataSet);
    procedure tlDataStylesGetContentStyle(Sender, AItem: TObject;
      ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure actOpenTurnOverExecute(Sender: TObject);
    procedure cxDBDateEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDBDateEdit2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
    procedure DoReCalc(AField: TField);
    procedure SaveAsXML(const Prefix: string; DataSet: TDataSet; Lines: TStrings); overload;
    procedure SaveAsXML(const AFileName : string); overload;
    procedure SaveAsXLS(const AFileName : string);
    function MakeCaption: string;
    procedure SyncColumns;
  public
    { Public declarations }
  end;

var
  AccTurnOver1GridForm: TAccTurnOver1GridForm;

implementation

uses
  MainDm, cxExportTL4Link, fdcMessages, fdcUtils, fdcObjectServices,
  DictDm, ITransportAcrh, AccInitialRestFrm, DocActivateErrorGridFrm,
  DocPackFrm, qTurnoverSheetsGridFrm, StrUtils, Math;

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

procedure TAccTurnOver1GridForm.acExpandExecute(Sender: TObject);
begin
  inherited;
  tlData.FullExpand;
end;

procedure TAccTurnOver1GridForm.acCollapseExecute(Sender: TObject);
begin
  inherited;
  tlData.FullCollapse;
end;

procedure TAccTurnOver1GridForm.acPrintExecute(Sender: TObject);
begin
  inherited;
  tlDataPrintLink.ReportTitle.Text := MakeCaption;
  tlDataPrintLink.Print(True, nil);
end;

function TAccTurnOver1GridForm.MakeCaption: string;
begin
  // by Nau
  Result := '<none>';
 Result :=   Format('Оперативный баланс таможни %s за период с %s по %s (валюта %s)',
    [MainData.GetSystemValue('CustomsCode', rvString), dsParamsBDate.AsString, dsParamsEDate.AsString, z.Text]);
{ Result :=   Format('Оперативный баланс таможни %s за период с %s по %s (валюта %s)',
   [dsDataCUSTCODE.Value, dsParamsBDATE.AsString, dsParamsEDATE.AsString
   ,dsDataINTCODE.Value]);}
end;

procedure TAccTurnOver1GridForm.dsDataNApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  inherited;
  Applied := True;
end;

procedure TAccTurnOver1GridForm.tlDataCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Node <> nil) and (AViewInfo.Node.Level = 0) then
     ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
end;

procedure TAccTurnOver1GridForm.tlDataEdited(Sender: TObject;
  AColumn: TcxTreeListColumn);
begin
  inherited;
  DoReCalc(TcxDBTreeListColumn(AColumn).DataBinding.Field);
end;

procedure TAccTurnOver1GridForm.tlDataEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  inherited;
  Allow := (TcxTreeList(Sender).FocusedNode <> nil) and
           (not TcxTreeList(Sender).FocusedNode.HasChildren) and
           (AColumn.PropertiesClassName = 'TcxCurrencyEditProperties');
end;

procedure TAccTurnOver1GridForm.DoReCalc(AField: TField);
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

procedure TAccTurnOver1GridForm.FormShow(Sender: TObject);
begin
  inherited;
  dsParams.Open;
  //-- проверка на наличие документов требущих проведения
  sqlGet_is_doc_need_activate.Exec;
  if (sqlGet_is_doc_need_activate.ParamValues['pis_doc_need_activate'] = 1) then
    begin
      fdcMessages.MessageDlg('Оперативный баланс','В системе присутствуют документы, требующие проведения!','В системе присутствуют документы, требующие проведения!', mtInformation,[mbOK],0);
    end;
  //--
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

procedure TAccTurnOver1GridForm.SaveAsXML(const Prefix: string; DataSet: TDataSet; Lines: TStrings);
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

procedure TAccTurnOver1GridForm.acMakeLExecute(Sender: TObject);
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

procedure TAccTurnOver1GridForm.actRefreshExecute(Sender: TObject);
begin
  dsParams.CheckBrowseMode;

  if dsetPeriods.Active then
    dsetPeriods.Refresh
  else
    dsetPeriods.Open;

  // Проверим период указанный пользователем
  // Период должен попадать в период действия ОДНОГО приказа
  if dsetPeriods.IsEmpty then
    raise Exception.Create( 'Нет действующего плана счетов!' );

  dsetPeriods.First;
  while not dsetPeriods.FieldByName( 'edate' ).IsNull
    and ( dsParams.FieldByName( 'bdate' ).AsDateTime > dsetPeriods.FieldByName( 'edate' ).AsDateTime )
    and not dsetPeriods.Eof do
    dsetPeriods.Next;

  if dsParams.FieldByName( 'bdate' ).AsDateTime < dsetPeriods.FieldByName( 'sdate' ).AsDateTime then
    raise Exception.CreateFmt(
        'Дата начала [%s] ранее даты начала действия плана счетов первого периода [%s]!'
       ,[ dsParams.FieldByName( 'bdate' ).AsString
         ,dsetPeriods.FieldByName( 'sdate' ).AsString ]
      );

  if     ( dsParams.FieldByName( 'bdate' ).AsDateTime >= dsetPeriods.FieldByName( 'sdate' ).AsDateTime )
     and not dsetPeriods.FieldByName( 'edate' ).IsNull
     and ( dsParams.FieldByName( 'edate' ).AsDateTime > dsetPeriods.FieldByName( 'edate' ).AsDateTime ) then
    raise Exception.CreateFmt(
        'Указанный период [%s - %s] не соответствует периоду действия плана счетов [%s - %s по приказу №%s от %s]!'
       ,[ dsParams.FieldByName( 'bdate' ).AsString
         ,dsParams.FieldByName( 'edate' ).AsString
         ,dsetPeriods.FieldByName( 'sdate' ).AsString
         ,dsetPeriods.FieldByName( 'edate' ).AsString
         ,dsetPeriods.FieldByName( 'numbegdoc' ).AsString
         ,dsetPeriods.FieldByName( 'datbegdoc' ).AsString ]
      );


  {if dsData0.Active then
    dsData0.Refresh
  else
    dsData0.Open;}

  if dsDataN.Active then
    dsDataN.Refresh
  else
    dsDataN.Open;

  SyncColumns;
end;

procedure TAccTurnOver1GridForm.actRefreshUpdate(Sender: TObject);
begin
//  inherited;

end;

procedure TAccTurnOver1GridForm.dsParamsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsetCurrency.Open;
  if not dsetCurrency.Locate( 'CODE', '643', [] ) then
    dsetCurrency.First;
  DataSet.InsertRecord([1, Date, Date, dsetCurrency.FieldByName( 'ID' ).AsFloat]);
end;

procedure TAccTurnOver1GridForm.dsDataNBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  FillVariablesFromDataSet(Sender, dsParams);
  with Sender do
    begin
      if dsParams.FieldByName('CURRID').AsInteger <> -1 then
        begin
          SetVariable( 'rur',          '' );
          SetVariable( 'curr_fields' , '' );
        end
      else
        begin
          SetVariable( 'rur',          '_rur' );
          SetVariable( 'curr_fields' , ':currid = :currid --' );
        end;
      //-- выбраный режим
      SetVariable( 'regim' , cbMode.ItemIndex );
      //-- выбраная детализация
      SetVariable( 'ists' , IfThen((cbDetail.ItemIndex<=0),'N','Y'));
      //--
    end;
end;

procedure TAccTurnOver1GridForm.acMakeLUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := TAction(Sender).Visible and dsDataN.Active;
end;

procedure TAccTurnOver1GridForm.actSaveExecute(Sender: TObject);
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
    {cxExportTL4ToXML(dlgExportData.FileName, tlData, False)}
    SaveAsXML( dlgExportData.FileName )
  else
  if ExportFormat = 'XLS' then
    if MessageDlg(
           'Сохранить в форме приложения к приказу?'
          ,'Форма сохранения баланса.'
          ,'При сохранении в форме приложения к приказу, данные будут выгружены в установленную форму.'#$D#$A +
           'В противном случае, данные будут выгружены в форме представления на экране.'
          ,mtConfirmation
          ,[mbYes, mbNo]
          ,0
         ) = mrYes then
      SaveAsXLS( dlgExportData.FileName )
    else
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

procedure TAccTurnOver1GridForm.FormCreate(Sender: TObject);
  var
    lv_MinDate : TDateTime;
begin
  inherited;
  xlReport1.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport1.XLSTemplate;

  qryCheckBalanceCreation.Execute;
  actCreateTransaction.Enabled := qryCheckBalanceCreation.GetVariable( 'res' ) = 1;

  // Минимальная дата формирования баланса - Дата переноса остатков + 1 день
  try
    lv_MinDate := StrToDate( MainData.sqlValueDateTime.Exec( 'name', 'MOVING_DATE' ) ) + 1;
  except
    on E : Exception do
      lv_MinDate := EncodeDate( 2000, 01, 01 );
  end;
  cxDBDateEdit1.Properties.MinDate := lv_MinDate;
  cxDBDateEdit2.Properties.MinDate := cxDBDateEdit1.Properties.MinDate;

  dsetCheckErrors.Open;
  //-- Заполнение режимов отображения баланса
  cbMode.Properties.Items.Add('По субсчёту ТО');
  //-- только для уровня РТУ и ФТС
  if (MainData.GetCustomsLevel < 2) then
    begin
      cbMode.Properties.Items.Add('Суммарный');
      cbMode.Properties.Items.Add('Непосредственно РТУ/ФТС');
    end;
  //-- только для уровня РТУ КНП и ФТС КНП
  if ((MainData.GetCustomsLevel = 3) or (MainData.GetCustomsLevel = 4)) then
    begin
      cbMode.Properties.Items.Add('По соглашениям');
    end;
  cbMode.ItemIndex := 0;
  cbDetail.ItemIndex := 0;
  //--
end;

procedure TAccTurnOver1GridForm.actCreateTransactionExecute(
  Sender: TObject);
begin
  if MessageDlg( 'Провести непроведённые документы?'
                ,'Провести непроведённые документы?'
                ,'Будут проведены все непроведённые документы!'
                ,mtConfirmation
                ,[mbYes, mbNo]
                ,0 ) = mrYes then
    begin
      qryCreateTransaction.Execute;
      qryCreateTransaction.Session.Commit;

      dsetCheckErrors.Refresh;

      ShowMessage( 'Документы проведены!' );
    end;
end;

procedure TAccTurnOver1GridForm.acExportUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := False;
end;

procedure TAccTurnOver1GridForm.SaveAsXML(const AFileName: string);

 { старая процедура - формирование XML через компонент (отключена в 186 сборке - 11.06.2010)
  function CorrectCurrency ( S : string ) : string;
  begin
    Result := StringReplace( StringReplace( S, #$A0, '', [rfReplaceAll] ), ',', '.', [rfReplaceAll] );
    if Result = '' then
      Result := '0.00';
  end;

  function AddRecord (
      ANode     : TJvSimpleXMLElemClassic;
      ATreeNode : TcxTreeListNode;
      ANodeName : string = 'Record'
    ) : TJvSimpleXMLElemClassic;

  begin
     Result := ANode.Items.Add( ANodeName );
     with Result.Properties do
       begin
         Add( 'ItemNo',       ATreeNode.Texts[ cxDBTreeListITEM.ItemIndex ]    );
         Add( 'ItemName',     EntityEncode( ATreeNode.Texts[ cxDBTreeListCAPTION.ItemIndex ] ) );
         Add( 'AccountCode',  ATreeNode.Texts[ cxDBTreeListCODE.ItemIndex ]    );
         Add( 'IncomingRest', CorrectCurrency( ATreeNode.Texts[ cxDBTreeListI_S.ItemIndex ] ) );
         Add( 'IncomingSum',  CorrectCurrency( ATreeNode.Texts[ cxDBTreeListI_T.ItemIndex ] ) );
         Add( 'OutgoingSum',  CorrectCurrency( ATreeNode.Texts[ cxDBTreeListO_T.ItemIndex ] ) );
         Add( 'OutgoingRest', CorrectCurrency( ATreeNode.Texts[ cxDBTreeListO_S.ItemIndex ] ) );
       end;
  end;

  procedure AddChildRecords (
      ARootXMLNode  : TJvSimpleXMLElemClassic;
      ARootTreeNode : TcxTreeListNode
    );
    var
      Node      : TJvSimpleXMLElemClassic;
      ChildsNode : TJvSimpleXMLElemClassic;
      TreeNode   : TcxTreeListNode;
  begin
    if ARootTreeNode.HasChildren then
      begin
        ChildsNode := ARootXMLNode.Items.Add( 'Childs' );
        TreeNode   := ARootTreeNode.getFirstChild;
        while Assigned( TreeNode ) do
          begin
            Node := AddRecord( ChildsNode, TreeNode );
            AddChildRecords( Node, TreeNode );

            TreeNode := ARootTreeNode.GetNextChild( TreeNode );
          end;
      end;
  end;

  var
    Node     : TJvSimpleXMLElemClassic;
    TreeNode : TcxTreeListNode;
    CurrCode : string;
}
begin
 dsBalansXml.Close;
 dsBalansXml.Open;
 TBlobField(dsBalansXml.FieldByName('xml_result')).SaveToFile(AFileName);
 dsBalansXml.Close;

 { старая процедура - формирование XML через компонент (отключена в 186 сборке - 11.06.2010)
  xmlBalance.Root.Clear;

  xmlBalance.Prolog.Clear;
  xmlBalance.Prolog.Encoding := 'windows-1251';
  xmlBalance.Prolog.AddComment( Application.Title );
  xmlBalance.Prolog.AddComment( 'Оперативный баланс' );

  if not dsetSystemParams.Active then
    dsetSystemParams.Open;

  xmlBalance.Root.Name := 'CustomsBalance';

  xmlBalance.Root.Properties.Add( 'xmlns:xsi',                     'http://www.w3.org/2001/XMLSchema-instance' );
  xmlBalance.Root.Properties.Add( 'xsi:noNamespaceSchemaLocation', 'CustomsBalanceSchema.xsd' );

  CurrCode := dsetCurrency.Lookup( 'ID', dsParams.FieldByName('CURRID').AsInteger, 'CODE' );
  xmlBalance.Root.Properties.Add( 'CustomsCode',  dsetSystemParams.FieldByName( 'CustomCode' ).AsString );
  xmlBalance.Root.Properties.Add( 'CustomsName',  EntityEncode( dsetSystemParams.FieldByName( 'CustomName' ).AsString ) );
  xmlBalance.Root.Properties.Add( 'CurrencyCode', CurrCode );
  xmlBalance.Root.Properties.Add( 'DateFrom',     FormatDateTime( 'YYYY-MM-DD', dsParams.FieldByName( 'BDATE' ).AsDateTime ) );
  xmlBalance.Root.Properties.Add( 'DateTo',       FormatDateTime( 'YYYY-MM-DD', dsParams.FieldByName( 'EDATE' ).AsDateTime ) );

  dsetTransactionsForXML.Open;

  try
    tlData.BeginUpdate;

    tlData.DataController.BeginLocate;
    TreeNode := tlData.Nodes.TopVisibleNode;
    Node := AddRecord( xmlBalance.Root, TreeNode, 'chapter0' );
    AddChildRecords( Node, TreeNode );

    TreeNode := TreeNode.getNextSibling;
    Node := AddRecord( xmlBalance.Root, TreeNode, 'chapterActive' );
    AddChildRecords( Node, TreeNode );

    TreeNode := TreeNode.getNextSibling;
    Node := AddRecord( xmlBalance.Root, TreeNode, 'chapterPassive' );
    AddChildRecords( Node, TreeNode );

    TreeNode := TreeNode.getNextSibling;
    Node := AddRecord( xmlBalance.Root, TreeNode, 'chapterZaBalance' );
    AddChildRecords( Node, TreeNode );

    if not dsetTransactionsForXML.IsEmpty then
      begin
        Node := xmlBalance.Root.Items.Add( 'Transactions' );

        dsetTransactionsForXML.First;
        while not dsetTransactionsForXML.Eof do
          begin
            with Node.Items.Add( 'Transaction' ).Properties do
              begin
                Add( 'Account',         dsetTransactionsForXML.FieldByName( 'account_code' ).AsString  );
                if not dsetTransactionsForXML.FieldByName( 'INN' ).IsNull then
                  Add( 'INN', dsetTransactionsForXML.FieldByName( 'INN' ).AsString );
                if not dsetTransactionsForXML.FieldByName( 'KPP' ).IsNull then
                  Add( 'KPP', dsetTransactionsForXML.FieldByName( 'KPP' ).AsString );
                Add( 'SubjectName',     EntityEncode( dsetTransactionsForXML.FieldByName( 'subject_name' ).AsString ) );
                Add( 'CurrencyCode',    dsetTransactionsForXML.FieldByName( 'currency_code' ).AsString );
                if not dsetTransactionsForXML.FieldByName( 'payment_type' ).IsNull then
                  Add( 'PaymentType', dsetTransactionsForXML.FieldByName( 'payment_type' ).AsString );
                if not dsetTransactionsForXML.FieldByName( 'KBK' ).IsNull then
                  Add( 'KBK', dsetTransactionsForXML.FieldByName( 'KBK' ).AsString );
                if not dsetTransactionsForXML.FieldByName( 'BIC' ).IsNull then
                  Add( 'BIC', dsetTransactionsForXML.FieldByName( 'BIC' ).AsString );
                Add( 'IsDebit',         dsetTransactionsForXML.FieldByName( 'is_debit' ).AsString      );
                Add( 'TransactionDate', FormatDateTime( 'YYYY-MM-DD', dsetTransactionsForXML.FieldByName( 'operation_date' ).AsDateTime ) );
                Add( 'TransactionSum',  CorrectCurrency( dsetTransactionsForXML.FieldByName( 'operation_sum' ).AsString ) );
                Add( 'ExchRate',        CorrectCurrency( dsetTransactionsForXML.FieldByName( 'exch_rate' ).AsString ) );
                Add( 'SumRUR',          CorrectCurrency( dsetTransactionsForXML.FieldByName( 'sum_rur' ).AsString ) );
              end;

            dsetTransactionsForXML.Next;
          end;
      end;

    xmlBalance.SaveToFile( AFileName );
  finally
    if dsetTransactionsForXML.Active then
      dsetTransactionsForXML.CloseAll;

    tlData.DataController.EndLocate;
    tlData.DataController.GotoFirst;
    tlData.EndUpdate;
  end;
}
end;

procedure TAccTurnOver1GridForm.actInitialRestExecute(Sender: TObject);

  function SearchForm ( ACurrencyID : Integer ) : TForm;
    var
      i : Integer;
  begin
    Result := nil;

    with Application.MainForm do
      for i := 0 to MDIChildCount - 1 do
        if     (MDIChildren[i] is TAccInitialRestForm)
           and ((MDIChildren[i] as TAccInitialRestForm).dsData.Params.ParamByName( 'currency_id' ).AsInteger = ACurrencyID) then
          begin
            Result := MDIChildren[i];
            break;
          end;
  end;

  var
    vParams : TfdcParams;
    vForm   : TForm;
begin
  inherited;

  vForm := SearchForm( dsParams.FieldByName( 'CURRID' ).AsInteger );
  if Assigned( vForm ) then
    vForm.Show
  else
    begin
      vParams := TfdcParams.Create(nil);
      try
        vParams.CreateParam(ftInteger, 'currency_id', ptInput).Value := dsParams.FieldByName( 'CURRID' ).AsVariant;
        GetObjectServices.ShowForm('TAccInitialRestForm', vParams, nil);
      finally
        vParams.Free;
      end;
    end;
end;

procedure TAccTurnOver1GridForm.actInitialRestUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Enabled := dsParams.Active
                             and (not dsParams.IsEmpty)
                             and (dsParams.FieldByName( 'CURRID' ).AsInteger <> -1);
end;

procedure TAccTurnOver1GridForm.tlDataDblClick(Sender: TObject);
  var
    vParams     : TfdcParams;
    vAccCode    : string;
    s           : string;
    SubjID      : string;
    vWindowType : string;
    lv_RegID    : Integer;
begin
  inherited;
  if dsDataN.Active then
  begin
  vWindowType := VarToStr( tlData.FocusedNode.Values[ cxDBTreeListWINDOW_TYPE.ItemIndex ] );

  if vWindowType = 'S' then
    // Субъекты
    begin
      vAccCode := VarToStr( tlData.FocusedNode.Parent.Values[ cxDBTreeListCODE.ItemIndex ] );
      vParams := TfdcParams.Create(nil);
      try
        SubjID := StringReplace( dsDataNITEM_NO.AsString, dsDataNPARENT_ITEM.AsString+'|', '', [] );
        if StrToInt( SubjID ) = 0 then
          SubjID := '-1';
        s := ' act.operation_date BETWEEN TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsBDATE.AsDateTime ) + ''', ''DDMMYYYY'') AND TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsEDATE.AsDateTime ) + ''', ''DDMMYYYY'') ' +
          'AND act.subject_id = ' + SubjID + ' ' +
          'AND act.account_id = ' + dsDataNPARENT_ITEM.AsString;
        if dsParamsCURRID.AsInteger <> -1 then
          s := s + ' AND act.currency_id = ' + IntToStr( dsParamsCURRID.AsInteger );
        vParams.CreateParam( ftString, 'where_section', ptInput ).Value := s;
        vParams.CreateParam( ftString, 'caption',       ptInput ).Value :=
            'субъект ' + dsDataN.FieldByName( 'caption' ).AsString + ' [' + dsDataN.FieldByName( 'CODE' ).AsString + '] ' +
            'по счёту [' + vAccCode + '] ' +
            'за период [' + FormatDateTime( 'DD.MM.YYYY', dsParamsBDATE.AsDateTime ) + '-' + FormatDateTime( 'DD.MM.YYYY', dsParamsEDATE.AsDateTime ) + ']';
        vParams.CreateParam( ftString, 'grouping',      ptInput ).Value := 'TYPENAME';

        GetObjectServices.ShowForm( 'TDocumentsGridForm', vParams, nil )
      finally
        vParams.Free;
      end;
    end

  else if vWindowType = 'K' then
    // КБК
    begin
      vAccCode := VarToStr( tlData.FocusedNode.Parent.Values[ cxDBTreeListCODE.ItemIndex ] );
      vParams := TfdcParams.Create(nil);
      try
        s := ' act.operation_date BETWEEN TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsBDATE.AsDateTime ) + ''', ''DDMMYYYY'') AND TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsEDATE.AsDateTime ) + ''', ''DDMMYYYY'') ' +
          'AND act.kbk_id IN ( SELECT k.id FROM fdc_kbk_dict_lst k WHERE k.code = ''' + dsDataN.FieldByName( 'caption' ).AsString + ''' ) ' +
          'AND act.account_id = ' + dsDataNPARENT_ITEM.AsString;
        if dsParamsCURRID.AsInteger > -1 then
          s := s + ' AND act.currency_id = ' + IntToStr( dsParamsCURRID.AsInteger );
        vParams.CreateParam( ftString, 'where_section', ptInput ).Value := s;
        vParams.CreateParam( ftString, 'caption',       ptInput ).Value :=
            'КБК ' + dsDataN.FieldByName( 'caption' ).AsString +
            'по счёту [' + vAccCode + '] ' +
            'за период [' + FormatDateTime( 'DD.MM.YYYY', dsParamsBDATE.AsDateTime ) + '-' + FormatDateTime( 'DD.MM.YYYY', dsParamsEDATE.AsDateTime ) + ']';
        vParams.CreateParam( ftString, 'grouping',      ptInput ).Value := 'TYPENAME';

        GetObjectServices.ShowForm( 'TDocumentsGridForm', vParams, nil )
      finally
        vParams.Free;
      end;
    end

  else if vWindowType = 'AC' then
    // Счета со субсчетами
    begin
      vAccCode := VarToStr( tlData.FocusedNode.Values[ cxDBTreeListCODE.ItemIndex ] );
      vParams := TfdcParams.Create(nil);
      try
        s := ' act.operation_date BETWEEN TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsBDATE.AsDateTime ) + ''', ''DDMMYYYY'') AND TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsEDATE.AsDateTime ) + ''', ''DDMMYYYY'') '+
          'AND act.account_id IN (SELECT a.id FROM fdc_acc a START WITH a.id = ' + IntToStr( dsDataN.FieldByName( 'ITEM_NO' ).AsInteger ) + ' CONNECT BY a.parent_id = PRIOR a.id)';
        if dsParamsCURRID.AsInteger <> -1 then
          s := s + ' AND act.currency_id = ' + IntToStr( dsParamsCURRID.AsInteger );
        vParams.CreateParam( ftString, 'where_section', ptInput ).Value := s;
        vParams.CreateParam( ftString, 'caption',       ptInput ).Value :=
            'по счёту [' + vAccCode + '] ' +
            'за период [' + FormatDateTime( 'DD.MM.YYYY', dsParamsBDATE.AsDateTime ) + '-' + FormatDateTime( 'DD.MM.YYYY', dsParamsEDATE.AsDateTime ) + ']';
        vParams.CreateParam( ftString, 'grouping',      ptInput ).Value := 'TYPENAME';

        GetObjectServices.ShowForm( 'TDocumentsGridForm', vParams, nil )
      finally
        vParams.Free;
      end;
    end

  else if vWindowType = 'AG' then
    // соглашения с КНП
    begin
      vAccCode := VarToStr( tlData.FocusedNode.Parent.Values[ cxDBTreeListCODE.ItemIndex ] );
      vParams := TfdcParams.Create(nil);
      try
        s := ' act.operation_date BETWEEN TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsBDATE.AsDateTime ) + ''', ''DDMMYYYY'') AND TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsEDATE.AsDateTime ) + ''', ''DDMMYYYY'') ' +
          'AND act.agreement_id = ' + AnsiMidStr(dsDataNITEM_NO.AsString,AnsiPos('|',dsDataNITEM_NO.AsString)+1,length(dsDataNITEM_NO.AsString)) + ' ' +
          'AND act.account_id IN (SELECT a.id FROM fdc_acc a START WITH a.id = ' + AnsiMidStr(dsDataNITEM_NO.AsString,1,ifthen((AnsiPos('|',dsDataNITEM_NO.AsString)=0),length(dsDataNITEM_NO.AsString),AnsiPos('|',dsDataNITEM_NO.AsString)-1)) + ' CONNECT BY a.parent_id = PRIOR a.id)';
       if dsParamsCURRID.AsInteger > -1 then
          s := s + ' AND act.currency_id = ' + IntToStr( dsParamsCURRID.AsInteger );
        vParams.CreateParam( ftString, 'where_section', ptInput ).Value := s;
        vParams.CreateParam( ftString, 'caption',       ptInput ).Value :=
            'КБК ' + dsDataN.FieldByName( 'caption' ).AsString +
            'по счёту [' + vAccCode + '] ' +
            'за период [' + FormatDateTime( 'DD.MM.YYYY', dsParamsBDATE.AsDateTime ) + '-' + FormatDateTime( 'DD.MM.YYYY', dsParamsEDATE.AsDateTime ) + ']';
        vParams.CreateParam( ftString, 'grouping',      ptInput ).Value := 'TYPENAME';

        GetObjectServices.ShowForm( 'TDocumentsGridForm', vParams, nil )
      finally
        vParams.Free;
      end;
    end

  else if vWindowType = 'SK' then
    // по субъектам и кбк
    begin
      vAccCode := VarToStr( tlData.FocusedNode.Parent.Values[ cxDBTreeListCODE.ItemIndex ] );
      vParams := TfdcParams.Create(nil);
      try
        s := ' act.operation_date BETWEEN TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsBDATE.AsDateTime ) + ''', ''DDMMYYYY'') AND TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsEDATE.AsDateTime ) + ''', ''DDMMYYYY'') ' +
          'AND act.subject_id = ' + AnsiMidStr(dsDataNPARENT_ITEM.AsString,AnsiPos('|',dsDataNPARENT_ITEM.AsString)+1,length(dsDataNPARENT_ITEM.AsString)) + ' ' +
          'AND act.kbk_id = ' + StringReplace( dsDataNITEM_NO.AsString, dsDataNPARENT_ITEM.AsString+'|', '', [] ) + ' ' +
          'AND act.account_id = ' + AnsiMidStr(dsDataNPARENT_ITEM.AsString,1,ifthen((AnsiPos('|',dsDataNPARENT_ITEM.AsString)=0),length(dsDataNPARENT_ITEM.AsString),AnsiPos('|',dsDataNPARENT_ITEM.AsString)-1));
       if dsParamsCURRID.AsInteger > -1 then
          s := s + ' AND act.currency_id = ' + IntToStr( dsParamsCURRID.AsInteger );
        vParams.CreateParam( ftString, 'where_section', ptInput ).Value := s;
        vParams.CreateParam( ftString, 'caption',       ptInput ).Value :=
            'КБК ' + dsDataN.FieldByName( 'caption' ).AsString +
            'по счёту [' + vAccCode + '] ' +
            'за период [' + FormatDateTime( 'DD.MM.YYYY', dsParamsBDATE.AsDateTime ) + '-' + FormatDateTime( 'DD.MM.YYYY', dsParamsEDATE.AsDateTime ) + ']';
        vParams.CreateParam( ftString, 'grouping',      ptInput ).Value := 'TYPENAME';

        GetObjectServices.ShowForm( 'TDocumentsGridForm', vParams, nil )
      finally
        vParams.Free;
      end;
    end

  else if vWindowType = 'AN' then
    // Счета без субсчетов
    begin
      vAccCode := VarToStr( tlData.FocusedNode.Values[ cxDBTreeListCODE.ItemIndex ] );
      vParams := TfdcParams.Create(nil);
      try
        s := ' act.operation_date BETWEEN TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsBDATE.AsDateTime ) + ''', ''DDMMYYYY'') AND TO_DATE(''' + FormatDateTime( 'DDMMYYYY', dsParamsEDATE.AsDateTime ) + ''', ''DDMMYYYY'') '+
          'AND act.account_id = ' + IntToStr( dsDataN.FieldByName( 'ITEM_NO' ).AsInteger );
        if dsParamsCURRID.AsInteger <> -1 then
          s := s + ' AND act.currency_id = ' + IntToStr( dsParamsCURRID.AsInteger );
        vParams.CreateParam( ftString, 'where_section', ptInput ).Value := s;
        vParams.CreateParam( ftString, 'caption',       ptInput ).Value :=
            'по счёту [' + vAccCode + '] ' +
            'за период [' + FormatDateTime( 'DD.MM.YYYY', dsParamsBDATE.AsDateTime ) + '-' + FormatDateTime( 'DD.MM.YYYY', dsParamsEDATE.AsDateTime ) + ']';
        vParams.CreateParam( ftString, 'grouping',      ptInput ).Value := 'TYPENAME';

        GetObjectServices.ShowForm( 'TDocumentsGridForm', vParams, nil )
      finally
        vParams.Free;
      end;
    end;
  end;
end;

procedure TAccTurnOver1GridForm.dsDataNAfterOpen(DataSet: TDataSet);
  var
    TreeNode : TcxTreeListNode;
begin
  inherited;

  TreeNode := tlData.Nodes.TopVisibleNode;
  repeat
    TreeNode.Expand( False );
    TreeNode := TreeNode.getNextSibling;
  until not Assigned( TreeNode );
end;

procedure TAccTurnOver1GridForm.SaveAsXLS(const AFileName: string);

  procedure FillAndPostRecord(
      ATreeNode : TcxTreeListNode
    );
  begin
    dsForExport.Append;
    dsForExport.FieldByName( cxDBTreeListITEM.DataBinding.FieldName    ).Value := ATreeNode.Values[ cxDBTreeListITEM.ItemIndex    ];
    dsForExport.FieldByName( cxDBTreeListCAPTION.DataBinding.FieldName ).Value := ATreeNode.Values[ cxDBTreeListCAPTION.ItemIndex ];
    dsForExport.FieldByName( cxDBTreeListCODE.DataBinding.FieldName    ).Value := ATreeNode.Values[ cxDBTreeListCODE.ItemIndex    ];
    dsForExport.FieldByName( cxDBTreeListI_S.DataBinding.FieldName     ).Value := ATreeNode.Values[ cxDBTreeListI_S.ItemIndex     ];
    dsForExport.FieldByName( cxDBTreeListI_T.DataBinding.FieldName     ).Value := ATreeNode.Values[ cxDBTreeListI_T.ItemIndex     ];
    dsForExport.FieldByName( cxDBTreeListO_T.DataBinding.FieldName     ).Value := ATreeNode.Values[ cxDBTreeListO_T.ItemIndex     ];
    dsForExport.FieldByName( cxDBTreeListO_S.DataBinding.FieldName     ).Value := ATreeNode.Values[ cxDBTreeListO_S.ItemIndex     ];
    dsForExport.Post;
  end;

  procedure AddChildRecords (
      ARootTreeNode : TcxTreeListNode
    );
    var
      TreeNode : TcxTreeListNode;
  begin
    if ARootTreeNode.HasChildren then
      begin
        TreeNode := ARootTreeNode.getFirstChild;
        while Assigned( TreeNode ) do
          begin
            FillAndPostRecord ( TreeNode );
            AddChildRecords( TreeNode );

            TreeNode := ARootTreeNode.GetNextChild( TreeNode );
          end;
      end;
  end;

  var
    TreeNode : TcxTreeListNode;
begin
  if dsForExport.Active then
    dsForExport.Close;
  if dsForExport.FieldDefs.Count > 0 then
    dsForExport.FieldDefs.Clear;
  dsForExport.CreateFieldsFromDataSet( dsDataN );
  dsForExport.Open;

  dsParams.Edit;
  dsetCurrency.Locate( 'ID', dsParams.FieldByName('CurrID').Value, [] );
  dsParams.FieldByName( 'CURR_CODE' ).AsString := dsetCurrency.FieldByName( 'CODE' ).AsString;
  dsParams.FieldByName( 'PERIOD' ).AsString    := 'с ' + dsParams.FieldByName( 'BDATE' ).AsString + ' по ' + dsParams.FieldByName( 'EDATE' ).AsString;

  if not dsetSystemParams.Active then
    dsetSystemParams.Open;

  dsParams.FieldByName( 'CUSTOM_CODE' ).AsString := dsetSystemParams.FieldByName( 'CUSTOMCODE' ).AsString;
  dsParams.FieldByName( 'CUSTOM_NAME' ).AsString := dsetSystemParams.FieldByName( 'CUSTOMNAME' ).AsString;
  dsParams.Post;

  try
    try
      tlData.BeginUpdate;

      tlData.DataController.BeginLocate;
      TreeNode := tlData.Nodes.TopVisibleNode;
      while Assigned( TreeNode ) do
        begin
          if TreeNode.Values[ cxDBTreeListITEM.ItemIndex ] = '0' then
            FillAndPostRecord( TreeNode );
          AddChildRecords ( TreeNode );
          if TreeNode.Values[ cxDBTreeListITEM.ItemIndex ] <> '0' then
            FillAndPostRecord( TreeNode );

          TreeNode := TreeNode.getNextSibling;
        end;

      xlReport1.ReportTo('', AFileName);
    finally
      tlData.DataController.EndLocate;
      tlData.DataController.GotoFirst;
      tlData.EndUpdate;
    end;
  finally
    if dsForExport.Active then
      dsForExport.Close;
    dsForExport.FieldDefs.Clear;
  end;
end;

procedure TAccTurnOver1GridForm.actShowDocErrorsExecute(Sender: TObject);
begin
  GetObjectServices.ShowForm('TDocActivateErrorGridForm', nil, nil);
end;

procedure TAccTurnOver1GridForm.actShowDocErrorsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsetCheckErrors.Active
                             and not dsetCheckErrors.IsEmpty;
end;

procedure TAccTurnOver1GridForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := dsDataN.Active
                             and not dsDataN.IsEmpty;
end;

procedure TAccTurnOver1GridForm.dsetTransactionsForXMLBeforeQuery(
  Sender: TOracleDataSet);
  var
    i : Integer;
begin
  for i := 0 to Sender.VariableCount - 1 do
    Sender.SetVariable( i, dsDataN.GetVariable( Sender.VariableName( i ) ) );
end;

procedure TAccTurnOver1GridForm.SyncColumns;
  var
    i : Integer;
begin
  Exit;

  for i := 0 to tlData0.ColumnCount - 1 do
    if tlData0.Columns[i].Visible then
      with tlData.DataController.GetItemByFieldName( tlData0.Columns[i].DataBinding.FieldName ) as TcxDBTreeListColumn do
        Width := tlData0.Columns[i].Width;
end;

procedure TAccTurnOver1GridForm.tlData0ColumnSizeChanged(Sender,
  AItem: TObject);
begin
  SyncColumns;
end;

procedure TAccTurnOver1GridForm.dsData0AfterOpen(DataSet: TDataSet);
  var
    TreeNode : TcxTreeListNode;
begin
  TreeNode := tlData0.Nodes.TopVisibleNode;
  repeat
    TreeNode.Expand( False );
    TreeNode := TreeNode.getNextSibling;
  until not Assigned( TreeNode );
end;

procedure TAccTurnOver1GridForm.tlDataStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
  // Выделить красным цветом отрицат.значения (входящего и исходящего остатка), 1-й уровень - желтым
  if Assigned(AItem) and
     Assigned(ANode) and
     (AItem is TcxDBTreeListColumn) and
  	  ((AItem as TcxDBTreeListColumn).Properties is TcxCurrencyEditProperties)and
     not VarIsNull((AItem as TcxDBTreeListColumn).Values[ANode.RecordIndex]) and
    ((AItem as TcxDBTreeListColumn).Values[ANode.RecordIndex] < 0) and
    (((AItem as TcxDBTreeListColumn).DataBinding.FieldName = 'BSUMMA') or ((AItem as TcxDBTreeListColumn).DataBinding.FieldName = 'ESUMMA')) then
    begin
      if     (   (AItem = cxDBTreeListI_T)
              or (AItem = cxDBTreeListO_T))
         and (   (    (ANode.Level = 1)
                  and (cxDBTreeListITEM.Values[ANode.Parent.RecordIndex] = '0.0'))
              or (    (ANode.Level = 0)
                  and (cxDBTreeListITEM.Values[ANode.RecordIndex] = '0.0')))
         and (cxDBTreeListI_T.Values[ANode.RecordIndex] = cxDBTreeListO_T.Values[ANode.RecordIndex]) then
        if ANode.Level = 1 then
          AStyle := DictData.cxInfoBkStyle
        else
          AStyle := DictData.cxStyle1
      else
        AStyle := DictData.cxRedStyle
    end
  else
    if Assigned(ANode) and (ANode.Level = 1) then
      AStyle := DictData.cxInfoBkStyle
    else
      AStyle := DictData.cxStyle1;
end;

procedure TAccTurnOver1GridForm.actOpenTurnOverExecute(Sender: TObject);
  var
    f : TForm;
begin
  inherited;

  f := GetObjectServices.ShowForm('TTurnoverSheetsGridForm', nil, nil);

  with TTurnoverSheetsGridForm(f).dsParams do
    begin
      Edit;
      FieldByName( 'bdate' ).AsDateTime := dsParams.FieldByName( 'bdate' ).AsDateTime;
      Edit;
      FieldByName( 'edate' ).AsDateTime := dsParams.FieldByName( 'edate' ).AsDateTime;
      Post;
    end;
end;

procedure TAccTurnOver1GridForm.cxDBDateEdit1PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  Error := DisplayValue < cxDBDateEdit1.Properties.MinDate;
  if Error then
    begin
      ErrorText    := 'Начальная дата формирования оперативного баланса не может быть ранее даты переноса остатков: ' + DateToStr( cxDBDateEdit1.Properties.MinDate - 1 ) + '!';
      DisplayValue := cxDBDateEdit1.Properties.MinDate;
    end;
end;

procedure TAccTurnOver1GridForm.cxDBDateEdit2PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  Error := DisplayValue < cxDBDateEdit1.EditingValue;
  if Error then
    begin
      ErrorText    := 'Конечная дата формирования оперативного баланса не может быть ранее начальной: ' + DateToStr( cxDBDateEdit1.EditingValue ) + '!';
      DisplayValue := cxDBDateEdit1.EditingValue;
    end;
end;

initialization
   RegisterClass(TAccTurnOver1GridForm);

end.
