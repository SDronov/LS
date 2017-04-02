unit qDebetCreditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, Oracle, fdcObjectCore, FDCCustomDataset,
  fdcQuery, Menus, cxGraphics;

type
  TqDebetCreditForm = class(TfdcCustomDlgForm)
    cmbxCurrency: TfdcObjectLookupEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxMemData: TdxMemData;
    xlrDebetCredit: TxlReport;
    srcMain: TDataSource;
    dxMemDataSubj_Name: TStringField;
    dxMemDataSubj_Id: TFloatField;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxMemDataCurr_Id: TFloatField;
    actPasteFromBuffer: TAction;
    dxMemDataDateFrom: TDateField;
    dxMemDataDateTo: TDateField;
    dsInnKpp: TfdcQuery;
    dxMemDataSubjInnKpp: TStringField;
    dxMemDataPeriod: TStringField;
    dsCurrency: TfdcQuery;
    dsReport: TfdcQuery;
    dsOnlyPays: TfdcQuery;
    dxMemDataRest_Begin_Total: TFloatField;
    dxMemDataSumma_Total: TFloatField;
    dxMemDataRest_End_Total: TFloatField;
    dxMemDataComing_Total: TFloatField;
    dxMemDataPo_Total: TFloatField;
    procedure actOkExecute(Sender: TObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure GetPayed(Query : TfdcQuery);
    procedure CalcTotal(Query : TfdcQuery);
  private
    BaseSQL : string;
  public
  end;

  function ExecReport(Session: TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  fdcCustomObjectGridFrm,
  fdcObjectServices,
  SubjIntf,
  qReportUtil,  
  ObjectBufferFrm,
  MainDM;


function ExecReport(Session: TOracleSession): boolean;
var
  TheDate : TDate;
  F : TqDebetCreditForm;
begin
  F := TqDebetCreditForm.Create(nil);
  with F do
  try
    // --- открываем dxMemData
    dxMemData.Open;
    dxMemData.Insert;
    // --- Инициализация времени
    TheDate := Now;
    dxMemDataDateFrom.Value := TheDate;
    dxMemDataDateTo.Value := TheDate;
    // --- Инициализация Сессий
    dsInnKpp.Session := Session;
    dsCurrency.Session := Session;
    dsReport.Session := Session;
    dsOnlyPays.Session := Session;
//    dsIncomeFounds.Session := Session;
    // --- Ищем путь к шаблону отчета
    xlrDebetCredit.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                                  ExtractFileName(xlrDebetCredit.XLSTemplate);
    // --- Загружаем SQL
    LoadReportQueryEx(F, xlrDebetCredit.XLSTemplate);
    BaseSQL := dsOnlyPays.SQL.Text;
    //--
    dxMemDataCurr_Id.AsFloat := cmbxCurrency.Properties.ListSource.DataSet.Lookup( 'CODE', '643', 'ID' );
    // --- показываем форму
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


procedure TqDebetCreditForm.actOkExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  dxMemData.UpdateRecord;
  // --- проверки
  if dxMemDataSubj_Id.IsNull or (dxMemDataSubj_Id.Value = 0) then
    raise exception.Create('Необходимо выбрать субъекта');
  if dxMemDataCurr_Id.IsNull then
    raise exception.Create('Необходимо выбрать валюту');
  CmpDate(dxMemDataDateFrom, dxMemDataDateTo);
  // --- подготовка данных
  dxMemDataPeriod.Value := 'с  ' + dxMemDataDateFrom.AsString + '  по  ' + dxMemDataDateTo.AsString;
  dxMemDataRest_Begin_Total.Value := 0;
  dxMemDataRest_End_Total.Value := 0;
  dxMemDataSumma_Total.Value := 0;
  dxMemDataComing_Total.Value := 0;
  dxMemDataPo_Total.Value := 0;
  // --- создание отчета и возврат результата
  dsCurrency.Open;
  dsReport.Open;
  GetPayed(dsReport);
  dsOnlyPays.Open;
//  dsIncomeFounds.Open;
  // --- вычисляем остатки
  CalcTotal(dsReport);
  CalcTotal(dsOnlyPays);

  MainData.RegisterEvent('REP','00010');

  // --- generate report
  xlrDebetCredit.Report(True);
  // --- close datasets
  dsCurrency.Close;
  dsReport.Close;
  dsOnlyPays.Close;
//  dsIncomeFounds.Close;
  // --- get Result
  ModalResult := mrOk;
end;


// ----------------------------------------------------------------------------
// --- поиск субъекта

procedure TqDebetCreditForm.edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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


procedure TqDebetCreditForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dxMemDataSubj_Id.Value := ADragObject.SingleObject.id;
  dxMemDataSubj_Name.Value := ADragObject.SingleObject.ObjName;
  dsInnKpp.Open;
  dxMemDataSubjInnKpp.Value := dsInnKpp.FieldByName('InnKpp').AsString;
  dsInnKpp.Close; 
end;


// ----------------------------------------------------------------------------
// --- Вставка данных из буфера

procedure TqDebetCreditForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
end;


procedure TqDebetCreditForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;


// ----------------------------------------------------------------------------
// --- Автоматическая вставка субъекта

procedure TqDebetCreditForm.FormShow(Sender: TObject);
begin
  inherited;
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := GetActiveSubjectId;
  if dxMemDataSUBJ_ID.Value > 0 then
  begin
    dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
    dsInnKpp.Open;
    dxMemDataSubjInnKpp.Value := dsInnKpp.FieldByName('InnKpp').AsString;
    dsInnKpp.Close;
  end;
end;


procedure TqDebetCreditForm.GetPayed(Query : TfdcQuery);
var
  s, s2 : string;
  i, j  : integer;
  FPayId : TStringList;
begin
  // --- init FPayId
  FPayId := TStringList.Create;
  FPayId.Duplicates := DupIgnore;
  FPayId.Sorted := True;
  FPayId.CaseSensitive := False;
  FPayId.Clear;
  // --- get payed
  Query.First;
  while not Query.Eof do
  begin
    if not Query.FieldByName('Pay_Order_Id').IsNull then
      FPayID.Append(Query.FieldByName('Pay_Order_Id').AsString);
    Query.Next;
  end;
  Query.First;
  // --- init variables
  s2 := '';
  s := '';
  i := 0;
  j := 0;
  // --- get string
  for i := 0 to FPayId.Count-1 do
  begin
    s := s + ',' + FPayID.Strings[i];
    Inc(j);
    if (j = SQLIdCount) then
    begin
      s2 := s2 + ' and a.pay_order_id not in (' + copy(s, 2, MaxInt) + ') ';
      j := 0;
      s := '';
    end;
  end;
  FPayId.Free;
  if (s <> '') then
    s2 := s2 + ' and a.pay_order_id not in (' + copy(s, 2, MaxInt) + ') ';
  dsOnlyPays.SQL.Text := Format(BaseSQL, [s2]);
  dsOnlyPays.Params.ParseSQL(dsOnlyPays.SQL.Text, True);
end;


procedure TqDebetCreditForm.CalcTotal(Query : TfdcQuery);
begin
  Query.First;
  while not Query.Eof do
  begin
    dxMemDataRest_Begin_Total.Value := dxMemDataRest_Begin_Total.Value + Query.FieldByName('po_rest_summa_begin').AsFloat;
    dxMemDataRest_End_Total.Value := dxMemDataRest_End_Total.Value + Query.FieldByName('po_rest_summa_end').AsFloat;
    dxMemDataSumma_Total.Value := dxMemDataSumma_Total.Value + Query.FieldByName('Summa').AsFloat;
    dxMemDataComing_Total.Value := dxMemDataComing_Total.Value + Query.FieldByName('Coming_Summa').AsFloat;
    dxMemDataPo_Total.Value := dxMemDataPo_Total.Value + Query.FieldByName('Po_Summa').AsFloat;
    Query.Next;
  end;
  Query.First;
end;


end.

