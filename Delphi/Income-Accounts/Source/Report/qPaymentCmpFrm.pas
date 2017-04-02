unit qPaymentCmpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, xlcClasses, xlEngine, xlReport, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDBEdit, cxDropDownEdit, cxCalendar, DB,
  dxmdaset, FDCCustomDataset, fdcQuery, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, Oracle, ComObj,
  fdcCustomObjectGridFrm, fdcObjectCore, fdcObjectServices, Menus,
  cxGraphics, cxGroupBox, cxRadioGroup;

type

  TqPaymentCmpForm = class(TfdcCustomDlgForm)
    xlrPaymentCmp: TxlReport;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxMemData: TdxMemData;
    dxMemDataSubj_Name: TStringField;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    dsReport: TfdcQuery;
    dsValue: TfdcQuery;
    dsSaldoIn: TfdcQuery;
    dxMemDataPeriod: TStringField;
    dsSaldoOut: TfdcQuery;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    srcMain: TDataSource;
    dxMemDataCurr_Id: TFloatField;
    dxMemDataSubj_Id: TFloatField;
    actPasteFromBuffer: TAction;
    dxMemDataCustomsName: TStringField;
    dxMemDataCustomInn: TStringField;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsHeader: TfdcQuery;
    dxMemDataRep_Day: TStringField;
    dxMemDataRep_Month: TStringField;
    dxMemDataRep_Year: TStringField;
    dxMemDataReport: TdxMemData;
    dsCurrency: TfdcQuery;
    dsOnlyPays: TfdcQuery;
    dxMemDataSaldoIn: TFloatField;
    dxMemDataSaldoOut: TFloatField;
    dxMemDataReport_Type: TIntegerField;
    gbxType: TcxDBRadioGroup;
    dxLayoutControl1Item5: TdxLayoutItem;
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PrepareReport;
    procedure PrepareTemplate;
    procedure FormShow(Sender: TObject);
  private
    FPayTypes    : TStringList;
    FPayId       : TStringList;
    BaseSQL      : string;
    BaseFileName : string;
  public
  end;

function ExecReport(Session: TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  fdcUtils,
  DateUtils,
  qReportUtil,
  ExcelXP,
  ObjectBufferFrm,
  SubjIntf,
  MainDM;

const
  cDelta = 0.000001;  


function ExecReport(Session: TOracleSession): boolean;
begin
  with TqPaymentCmpForm.Create(nil) do
  try
    // --- Init Session
    dsHeader.Session := Session;
    dsSaldoIn.Session := Session;
    dsSaldoOut.Session := Session;
    dsValue.Session := Session;
    dsReport.Session := Session;
    dsCurrency.Session := Session;
    dsOnlyPays.Session := Session;
    // --- Get Result
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


// ----------------------------------------------------------------------------
// --- Работа с буфером

procedure TqPaymentCmpForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value := ObjectBufferForm.CurObject.ObjName;
end;


procedure TqPaymentCmpForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;

// ----------------------------------------------------------------------------
// --- Генерация отчета

procedure TqPaymentCmpForm.actOkExecute(Sender: TObject);
var
  TheDate: TDateTime;
begin
  dxMemData.UpdateRecord;
  // если не присваивать, то при возникновении ошибки форма закрывается
  // хотя btnOk.ModalResult = mrNone
  ModalResult := mrNone;
  // --- Needly Check's
  dxMemData.UpdateRecord;
  if dxMemDataCurr_Id.IsNull then
    raise exception.Create('Необходимо выбрать валюту');
  if (dxMemDataSubj_Id.Value = 0) or dxMemDataSubj_Id.IsNull then
    raise exception.Create('Необходимо выбрать субъекта');
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  // --- GetPeriod
  dxMemDataPeriod.Value := 'с  ' + dxMemDataDate_From.AsString +
                           '  по  ' + dxMemDataDate_To.AsString;
  // --- Get Report Date
  TheDate := dxMemDataDate_To.Value;
  dxMemDataRep_Day.AsInteger := DayOf(TheDate);
  dxMemDataRep_Month.AsString := GetMonthStr(MonthOf(TheDate));
//  dxMemDataRep_Year.AsString := Copy(IntToStr(YearOf(TheDate)), 4, 1);
  dxMemDataRep_Year.AsInteger := YearOf(TheDate);
  // --- Get Sys values
  dsValue.Open;
  dsValue.First;
  while not dsValue.Eof do
  begin
    if (UpperCase(dsValue.FieldByName('SysName').AsString) = 'CUSTOMSNAME') then
      dxMemDataCustomsName.AsString := dsValue.FieldByName('StringValue').AsString
    else if (UpperCase(dsValue.FieldByName('SysName').AsString) = 'CUSTOMINN') then
      dxMemDataCustomInn.AsString := dsValue.FieldByName('StringValue').AsString;
    dsValue.Next;
  end;
  dsValue.Close;
  // --- Prepare Report
  PrepareReport;
  PrepareTemplate;
  // --- open datasources
  dxMemDataReport.Open;
  dsHeader.Open;
  dsCurrency.Open;
  dsSaldoIn.Open;
  dsSaldoOut.Open;

  MainData.RegisterEvent('REP','00014');

  // --- generate report and Get Result
  xlrPaymentCmp.Report(True);
  ModalResult := mrOk;
end;

// ----------------------------------------------------------------------------
// --- Получение данных по декларанту

procedure TqPaymentCmpForm.edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  inherited;
  FC := TFormClass(FindClass('TSubjectFindGridForm'));
  F := FC.Create(edtSubject) as TfdcCustomObjectGridForm;
  F.SearchMode := True;
  F.SearchMultiple := False;
  F.SearchComponent := edtSubject;
  F.SearchTypeSysName := 'Declarant;Person;Bank;Subject';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchSubjFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;


procedure TqPaymentCmpForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dxMemDataSubj_Id.Value := ADragObject.SingleObject.Id;
  dxMemDataSubj_Name.Value := ADragObject.SingleObject.ObjName;
end;

// ----------------------------------------------------------------------------
// --- Создание и удаление формы

procedure TqPaymentCmpForm.FormCreate(Sender: TObject);
var
  TheDate: TDate;
  fName : string;
begin
  inherited;
  // --- сохраняем имя оригинального шаблона
  BaseFileName := ExtractFilePath(Application.ExeName) + 'Report\' +
                  ExtractFileName(xlrPaymentCmp.XLSTemplate);
  // --- рабочий шаблон формируем как Disk:\Path\FileName.ext -> Disk:\Path\FileName_.ext
  fName := BaseFileName;
  Insert('_', fName, LastDelimiter('.', fName));
  fName := GetAppTempDir + '\' + ExtractFileName(fName);
  xlrPaymentCmp.XLSTemplate := fName;
  // --- формируем параметры
  TheDate := Trunc(Now);
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDataDate_From.Value := TheDate;
  dxMemDataDate_To.Value := TheDate;
  dxMemDataReport_Type.Value := 0;
  // --- PayTypes
  FPayTypes := TStringList.Create;
  FPayTypes.Duplicates := DupIgnore;
  FPayTypes.Sorted := True;
  FPayTypes.CaseSensitive := False;
  // --- PayId
  FPayId := TStringList.Create;
  FPayId.Duplicates := DupIgnore;
  FPayId.Sorted := True;
  FPayId.CaseSensitive := False;
  // --- load Query's
  LoadReportQueryEx(Self, BaseFileName);
  BaseSQL := dsOnlyPays.SQL.Text;
end;


procedure TqPaymentCmpForm.FormDestroy(Sender: TObject);
begin
  FPayTypes.Free;
  FPayId.Free;
  inherited;
end;

// ----------------------------------------------------------------------------
// --- Создание полей для отчета

procedure TqPaymentCmpForm.PrepareReport;
var
  i, j, k    : integer;
  FieldStr   : TStringField;
  FieldFloat : TFloatField;
  FieldInt   : TIntegerField;
  GtdName    : String;
  doPost     : boolean;
  Excel      : OleVariant;
  WorkSheet  : OleVariant;
  oRng       : OleVariant;
  s, s2      : string;
begin
  inherited;
  dxMemDataReport.Active := False;
  // --- удаляем все поля, чтобы сформировать все с нуля
  while (dxMemDataReport.FieldCount > 0) do
    dxMemDataReport.Fields[0].Free;
  dxMemDataReport.FieldDefs.Clear;
  // --- подготавливаем список FPayTypes,
  // --- в который вносятся все виды платежей которые будут в отчете
  FPayTypes.Clear;
  dsReport.Open;
  dsReport.First;
  while not dsReport.Eof do
  begin
    if (abs(dsReport.FieldByName('Summa').AsFloat) > cDelta) then
      FPayTypes.Add(dsReport.FieldByName('Payment_Type').AsString);
    dsReport.Next;
  end;
  // добавляем поля к dxMemDataReport
  for i := 0 to FPayTypes.Count-1 do
  begin
    FieldFloat := TFloatField.Create(dxMemDataReport);
    FieldFloat.FieldName := 'PT' + FPayTypes.Strings[i];
    FieldFloat.DataSet := dxMemDataReport;
    dxMemDataReport.FieldDefs.Add(FieldFloat.FieldName, FieldFloat.DataType);
  end;
  // --- создание полей отчета в dxMemDataReport
  // --- Pay_No
  FieldInt := TIntegerField.Create(dxMemDataReport);
  FieldInt.FieldName := 'Pay_No';
  FieldInt.DataSet := dxMemDataReport;
  dxMemDataReport.FieldDefs.Add(FieldInt.FieldName, FieldInt.DataType);
  // --- Doc_No
  FieldStr := TStringField.Create(dxMemDataReport);
  FieldStr.FieldName := 'Doc_No';
  FieldStr.Size := 64;
  FieldStr.DataSet := dxMemDataReport;
  dxMemDataReport.FieldDefs.Add(FieldStr.FieldName, FieldStr.DataType);
  // --- Po_Summa
  FieldFloat := TFloatField.Create(dxMemDataReport);
  FieldFloat.FieldName := 'Po_Summa';
  FieldFloat.DataSet := dxMemDataReport;
  dxMemDataReport.FieldDefs.Add(FieldFloat.FieldName, FieldFloat.DataType);
  // --- Name
  FieldStr := TStringField.Create(dxMemDataReport);
  FieldStr.FieldName := 'Name';
  FieldStr.Size := 64;
  FieldStr.DataSet := dxMemDataReport;
  dxMemDataReport.FieldDefs.Add(FieldStr.FieldName, FieldStr.DataType);
  // --- Summa
  FieldFloat := TFloatField.Create(dxMemDataReport);
  FieldFloat.FieldName := 'Summa';
  FieldFloat.DataSet := dxMemDataReport;
  dxMemDataReport.FieldDefs.Add(FieldFloat.FieldName, FieldFloat.DataType);
  // --- Total
  FieldFloat := TFloatField.Create(dxMemDataReport);
  FieldFloat.FieldName := 'TotalSumma';
  FieldFloat.DataSet := dxMemDataReport;
  dxMemDataReport.FieldDefs.Add(FieldFloat.FieldName, FieldFloat.DataType);
  // --- заполнение dxMemDataReport: Выбор платежек со списаниями
  dxMemDataReport.Open;
  FPayId.Clear;  
  doPost := False;
  GtdName := '';
  k := 0;
  dsReport.First;
  while not dsReport.Eof do
  begin
    if not dsReport.FieldByName('Doc_No').IsNull then
    begin
      doPost := True;
      dxMemDataReport.Append;
      for i := 0 to FPayTypes.Count-1 do
        dxMemDataReport.FieldByName('PT' + FPayTypes.Strings[i]).AsFloat := 0;
      Inc(k);
      dxMemDataReport.FieldByName('Pay_No').AsInteger := k;
      dxMemDataReport.FieldByName('Doc_No').AsString := dsReport.FieldByName('Doc_No').AsString;
      dxMemDataReport.FieldByName('Po_Summa').AsFloat := dsReport.FieldByName('Po_Summa').AsFloat;
      dxMemDataReport.FieldByName('Name').AsString := dsReport.FieldByName('Name').AsString;
      dxMemDataReport.FieldByName('TotalSumma').AsFloat := 0;
      GtdName := dsReport.FieldByName('Name').AsString;
    end;
    if (GtdName <> dsReport.FieldByName('Name').AsString) then
    begin
      doPost := True;
      dxMemDataReport.Append;
      for i := 0 to FPayTypes.Count-1 do
        dxMemDataReport.FieldByName('PT' + FPayTypes.Strings[i]).AsFloat := 0;
      dxMemDataReport.FieldByName('Name').AsString := dsReport.FieldByName('Name').AsString;
      dxMemDataReport.FieldByName('TotalSumma').AsFloat := 0;
      GtdName := dsReport.fieldByName('Name').AsString;
    end;
    if not dsReport.FieldByName('pay_order_id').IsNull then
      FPayId.Append(dsReport.FieldByName('pay_order_id').AsString);
    if (dxMemDataReport.FieldDefs.IndexOf('PT' + dsReport.FieldByName('Payment_Type').AsString) > -1) then
      dxMemDataReport.FieldByName('PT' + dsReport.FieldByName('Payment_Type').AsString).AsFloat :=
        dxMemDataReport.FieldByName('PT' + dsReport.FieldByName('Payment_Type').AsString).AsFloat +
        dsReport.FieldByName('Summa').AsFloat;
    dxMemDataReport.FieldByName('TotalSumma').AsFloat := dxMemDataReport.FieldByName('TotalSumma').AsFloat +
                                                         dsReport.FieldByName('Summa').AsFloat;
    dsReport.Next;                                                         
  end;
  if doPost then
    dxMemDataReport.Post;
  dsReport.Close;
  // --- формирование SQL для выбора платежек без списаний
  j := 0;
  s := '';
  s2 := '';
  for i := 0 to FPayId.Count - 1 do
  begin
    Inc(j);
    s := s + ',' + FPayId.Strings[i];
    if (j >= SQLIdCount) then
    begin
      s2 := s2 + ' and not a.pay_order_id in (' + copy(s, 2, MaxInt) + ') ';
      j := 0;
      s := '';
    end;
  end;
  if (s <> '') then
    s2 := s2 + ' and not a.pay_order_id in (' + copy(s, 2, MaxInt) + ') ';
  dsOnlyPays.SQL.Text := Format(BaseSQL, [s2]);
  dsOnlyPays.Params.ParseSQL(dsOnlyPays.SQL.Text, True);
  // --- выбор и добавление платежек без списаний в отчет
  dsOnlyPays.Open;
  dsOnlyPays.First;
  while not dsOnlyPays.Eof do
  begin
    dxMemDataReport.Append;
    dxMemDataReport.FieldByName('Doc_No').AsString := dsOnlyPays.FieldByName('Doc_No').AsString;
    dxMemDataReport.FieldByName('Po_Summa').AsFloat := dsOnlyPays.FieldByName('Po_Summa').AsFloat;
    dxMemDataReport.Post;
    dsOnlyPays.Next;
  end;
  dsOnlyPays.Close;
end;


procedure TqPaymentCmpForm.PrepareTemplate;
var
  Excel : OleVariant;
  Ws    : OleVariant;
  aFileName : OleVariant;
  SaveChanges : OleVariant;  
  lcid  : integer;
  i, j : integer;
  d    : integer;
  h, l, r, rh : integer;
  DoClose : boolean;
const
  cLeft = 52;
  cTop = 14;
  cWidth = 83;
begin
  // --- подготовка Excel темплейта
  Excel := CreateOleObject('Excel.Application');
  DoClose := True;
  SaveChanges := False;   
  try
    // --- отключаем сообщения и события для ускорения работы
    Excel.DisplayAlerts := False;
    Excel.EnableEvents := False;
    // --- подключаемся к Excel и загружаем шаблон
    aFileName := BaseFileName;
    Excel.WorkBooks.Add(aFileName);
    Ws := Excel.ActiveWorkBook.WorkSheets[1];
    // ---
    h := cTop;
    l := cLeft;
    rh := l + cWidth;
    // --- подготавливаем шаблон под наши данные
    Ws.Range[Ws.Cells[h,l], Ws.Cells[h+2,rh]].UnMerge;    // отменяем объединение
    Ws.Range[Ws.Cells[h,l], Ws.Cells[h+2,rh]].ClearContents;
    if (FPayTypes.Count > 0) then
    begin
      d := cWidth div FPayTypes.Count - 1;                // вычисляем дельту
      for i := 0 to FPayTypes.Count-1 do
      begin
        r := l + d;
//        if (r > rh) then
//          r := rh;
        if (i = FPayTypes.Count-1) then
          r := rh;
        for j := 0 to 2 do
        begin
          Ws.Range[Ws.Cells[h+j,l], Ws.Cells[h+j,r]].Select;
          Excel.Selection.Merge;
          if (j = 0) then
            Excel.Selection.FormulaR1C1 := FPayTypes.Strings[i]
          else if (j = 1) then
            Excel.Selection.FormulaR1C1 := '=aReport_PT' + FPayTypes.Strings[i]
          else if (j = 2) then
            Excel.Selection.FormulaR1C1 := 'Sum';
        end;
        l := r + 1;
      end;
    end
    else
      for j := 0 to 2 do
        Ws.Range[Ws.Cells[h+j, l],Ws.Cells[h+j, rh]].Merge;
    // --- выставляем границы у ячеек в шапке
    l := cLeft;
    Ws.Range[Ws.Cells[h,l], Ws.Cells[h,rh]].Select;
    Excel.Selection.HorizontalAlignment := xlCenter;
    for i := 7 to 11 do
      if (i <> xlEdgeLeft) and (i <> xlEdgeRight) then
      try
        Excel.Selection.Borders[i].LineStyle := xlDot;
        Excel.Selection.Borders[i].Weight := xlThin;
        Excel.Selection.Borders[i].ColorIndex := xlAutomatic;
      except end;
    // --- выставляем границы у ячеек в области данных
    Ws.Range[Ws.Cells[h+1,l], Ws.Cells[h+2,rh]].Select;
{    Excel.Selection.HorizontalAlignment := xlRight;
    Excel.Selection.IndentLevel := 1;
    Ws.Range[Ws.Cells[h+1,l], Ws.Cells[h+2,rh]].NumberFormat := '#.##0.00$';       // виснет на этой строке, поэтому форматирование было перенесено в шаблон
{}    
    for i := 7 to 12 do
      if (i <> xlEdgeBottom) then
      try
        Excel.Selection.Borders[i].Weight := xlThin;
        Excel.Selection.Borders[i].LineStyle := xlContinuous;
        Excel.Selection.Borders[i].ColorIndex := xlAutomatic;
      except end;
    // --- Сохраняем шаблон
    aFileName := xlrPaymentCmp.XLSTemplate;
    Excel.WorkBooks[1].SaveAs(aFileName);
    Excel.ActiveWorkBook.Close;
    DoClose := False;
  finally
    // --- включаем сообщения и события, выходим из Excel
    if DoClose then
      Excel.WorkBooks[1].Close(SaveChanges);
    Excel.DisplayAlerts := True;
    Excel.EnableEvents := True;
    Excel.Quit;
  end; 
end;



procedure TqPaymentCmpForm.FormShow(Sender: TObject);
begin
  inherited;
  dxMemData.Edit;
  dxMemDataSubj_Id.Value := GetActiveSubjectId;
  if dxMemDataSubj_Id.Value > 0 then
     dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
end;

end.

