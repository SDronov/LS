unit qPaymentOrderFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, FDCCustomDataset, fdcQuery, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, Oracle, fdcObjectCore, DictDM,
  Menus, cxGraphics;

type
  TqPaymentOrderForm = class(TfdcCustomDlgForm)
    dxMemData: TdxMemData;
    xlrPaymentOrder: TxlReport;
    dsInnKpp: TfdcQuery;
    dsReport: TfdcQuery;
    dxMemDataSubj_Id: TFloatField;
    dxMemDataSubj_Name: TStringField;
    dxMemDataCurr_Id: TFloatField;
    cmbxCurrency: TfdcObjectLookupEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    srcMain: TDataSource;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    actPasteFromBuffer: TAction;
    dxMemDataPeriod: TStringField;
    dxMemDataDateFrom: TDateField;
    dxMemDataDateTo: TDateField;
    dxMemDataSubjInnKpp: TStringField;
    dsCurrency: TfdcQuery;
    dxMemDataCurrCode: TStringField;
    dsTotal: TfdcQuery;
    cmbxPaymentType: TfdcObjectLookupEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxMemDataPayTypeId: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetInnKpp;
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
  public
  end;

  function ExecReport(Session: TOracleSession): boolean;

implementation

uses
  fdcCustomObjectGridFrm,
  fdcObjectServices,
  SubjIntf,
  qReportUtil,
  ObjectBufferFrm,
  MainDM;

{$R *.dfm}


function ExecReport(Session: TOracleSession): boolean;
var
  F : TqPaymentOrderForm; 
begin
  F := TqPaymentOrderForm.Create(nil);
  with F do
  try
    // --- init dxMemData
    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDateFrom.Value := Now;
    dxMemDataDateTo.Value := dxMemDataDateFrom.Value;
    dxMemDataSubj_Id.Clear;
    dxMemDataCurr_Id.Clear;
    dxMemDataSubjInnKpp.Clear;
    dxMemDataCurrCode.Clear;
    // --- init dataset
    dsInnKpp.Session := Session;
    dsReport.Session := Session;
    dsCurrency.Session := Session;
    dsTotal.Session := Session;
    // --- Загружаем SQL
    LoadReportQueryEx(F, xlrPaymentOrder.XLSTemplate);
    // --- show form   
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


// ----------------------------------------------------------------------------
// Создание, отображение и удаление формы
procedure TqPaymentOrderForm.FormCreate(Sender: TObject);
begin
  inherited;
  // --- Get template file
  xlrPaymentOrder.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\'+
                                 ExtractFileName(xlrPaymentOrder.XLSTemplate);
end;


procedure TqPaymentOrderForm.FormShow(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := GetActiveSubjectId;
  if dxMemDataSUBJ_ID.Value > 0 then
  begin
     dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
     GetInnKpp;
  end;
end;


// ----------------------------------------------------------------------------
// --- Генерация отчета

procedure TqPaymentOrderForm.actOkExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  // --- установить Subj_Id в NULL перед запросом
  if (dxMemDataSubj_Id.Value = 0) then
    dxMemDataSubj_Id.Clear;
  // --- проверка даты
  if (dxMemDataDateFrom.IsNull and not dxMemDataDateTo.IsNull) or
     (not dxMemDataDateFrom.IsNull and dxMemDataDateTo.IsNull) then
    raise exception.Create('Необходимо либо полностью ввести период либо опустить его');
  // --- формируем строку периода
  if dxMemDataDateFrom.IsNull then
    dxMemDataPeriod.Value := ''
  else
  begin
    dxMemDataPeriod.Value := 'с  ' + dxMemDataDateFrom.AsString +
                             '  по  ' + dxMemDataDateTo.AsString;
    CmpDate(dxMemDataDateFrom.Value, dxMemDataDateTo.Value);
  end;
  // --- проверка на ввод всех данных
  dxMemData.UpdateRecord;
  if (dxMemDataDateFrom.IsNull and
      dxMemDataDateTo.IsNull and
      dxMemDataSubj_Id.IsNull and
      dxMemDataPayTypeId.IsNull and
      dxMemDataCurr_Id.IsNull) then
    raise exception.Create('Необходимо задать параметры отчета');
  // --- установить валюту
  if (not dxMemDataCurr_Id.IsNull) then
  begin
    dsCurrency.Open;
    dxMemDataCurrCode.Value := dsCurrency.FieldByName('Code').AsString;
    dsCurrency.Close;
  end;

  MainData.RegisterEvent('REP','00009');

  // --- Generate report
  dsReport.Open;
  dsTotal.Open;
  xlrPaymentOrder.Report(True);
  // --- close all
  dsReport.Close;
  dsTotal.Close;
  // --- GetResult
  ModalResult := mrOk;
end;



// ----------------------------------------------------------------------------
// --- Работа с буфером

procedure TqPaymentOrderForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
  GetInnKpp;
end;

procedure TqPaymentOrderForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;


// ----------------------------------------------------------------------------
// --- Получить данные по субъекту
                                

procedure TqPaymentOrderForm.edtSubjectPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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


procedure TqPaymentOrderForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dxMemDataSubj_Id.Value := ADragObject.SingleObject.id;
  dxMemDataSubj_Name.Value := ADragObject.SingleObject.ObjName;
  GetInnKpp;
end;

// --- получить ИНН\КПП субъекта
procedure TqPaymentOrderForm.GetInnKpp;
begin
  dsInnKpp.Open;
  dxMemDataSubjInnKpp.Value := dsInnKpp.FieldByName('InnKpp').AsString;
  dsInnKpp.Close;
end;


end.

