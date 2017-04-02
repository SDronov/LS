unit qInfoIncomeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, DB, xlcClasses,
  xlEngine, xlReport, dxmdaset, cxButtonEdit, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FDCCustomDataset, fdcQuery,

  qReportUtil, Oracle, fdcObjectServices, fdcCustomObjectGridFrm,
  fdcObjectCore, ObjectBufferFrm, SubjIntf;


type
  TqInfoIncomeForm = class(TfdcCustomDlgForm)
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxMemData: TdxMemData;
    xlrInfoIncome: TxlReport;
    srcData: TDataSource;
    dxMemDataSubj_Id: TFloatField;
    dxMemDataSubj_Name: TStringField;
    dsReport: TfdcQuery;
    dsHeader: TfdcQuery;
    dsReportTotal: TfdcQuery;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    actPasteFromBuffer: TAction;
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

  function ExecReport(Session : TOracleSession): boolean;

implementation

{$R *.dfm}


function ExecReport(Session : TOracleSession): boolean;
var
  F: TqInfoIncomeForm;
begin
  F := TqInfoIncomeForm.Create(nil);
  with F do
  try
    dsReport.Session := Session;
    dsHeader.Session := Session;
    dsReportTotal.Session := Session;
    LoadReportQueryEx(F, xlrInfoIncome.XLSTemplate);
    Result := (ShowModal = mrOk);
  finally
    F.Free;
  end;
end;


procedure TqInfoIncomeForm.actOkExecute(Sender: TObject);
var
  s: string;
begin
  ModalResult := mrNone;
  // --- проверка входных параметров
  if dxMemDataSubj_Id.IsNull or (dxMemDataSubj_Id.value <= 0) then
    raise exception.Create('Необходимо выбрать субъект');
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  // --- генерация отчета
  try
    dsHeader.Open;
    dsReport.Open;
    dsReportTotal.Open;
    xlrInfoIncome.Report(True);
    ModalResult := mrOk;
  except on e: exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
end;


procedure TqInfoIncomeForm.FormCreate(Sender: TObject);
begin
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDataDate_From.Value := Trunc(Now);
  dxMemDataDate_To.Value := dxMemDataDate_From.Value;
{  dxMemDataDate_From.Value := StrToDate('01.01.2000');
  dxMemDataDate_To.Value := StrToDate('01.01.2008');
{}
  xlrInfoIncome.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                               ExtractFileName(xlrInfoIncome.XLSTemplate);
end;


// ----------------------------------------------------------------------------
// --- Выбор субъекта

procedure TqInfoIncomeForm.edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  FC := TFormClass(FindClass('TSubjectFindGridForm'));
  F := FC.Create(edtSubject) as TfdcCustomObjectGridForm;
  F.SearchMode := True;
  F.SearchMultiple := False;
  F.SearchComponent := edtSubject;
  F.SearchTypeSysName := 'Declarant;Person;Broker;Bank';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchSubjFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;


procedure TqInfoIncomeForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dxMemDataSubj_Id.Value := ADragObject.SingleObject.id;
  dxMemDataSubj_Name.Value := ADragObject.SingleObject.ObjName;
end;


// ----------------------------------------------------------------------------
// --- Буфер и субъект по умолчанию

procedure TqInfoIncomeForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
end;


procedure TqInfoIncomeForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;


procedure TqInfoIncomeForm.FormShow(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSubj_Id.Value := GetActiveSubjectId;
  if dxMemDataSubj_Id.Value > 0 then
     dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
end;


end.

