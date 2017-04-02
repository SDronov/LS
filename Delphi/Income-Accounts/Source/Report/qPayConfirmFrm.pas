unit qPayConfirmFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, DB, xlcClasses, xlEngine, xlReport,
  FDCCustomDataset, fdcQuery, dxmdaset, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, Oracle, cxButtonEdit,
  fdcObjectLinkEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxSpinEdit, fdcObjectCore, Grids, DBGrids, cxListBox,
  cxStyles, cxGraphics, cxInplaceContainer, cxVGrid, cxDBVGrid, Menus,
  MainDM;
  
type
  TqPayConfirmForm = class(TfdcCustomDlgForm)
    edtSubject: TcxDBButtonEdit;
    lciSubject: TdxLayoutItem;
    dxMemData: TdxMemData;
    srcMemData: TDataSource;
    xlrPayConfirm: TxlReport;
    dxMemDataSubj_Id: TFloatField;
    dxMemDataSubj_Name: TStringField;
    dsHeader: TfdcQuery;
    dsData: TfdcQuery;
    edtDate_From: TcxDBDateEdit;
    lciDate_From: TdxLayoutItem;
    edtDate_To: TcxDBDateEdit;
    lciDate_To: TdxLayoutItem;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    actPasteFromBuffer: TAction;
    procedure actOkExecute(Sender: TObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
  public
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation


{$R *.dfm}

uses
  qReportUtil
 ,fdcObjectServices
 ,fdcCustomObjectGridFrm
 ,CustomDeclGridFrm
 ,IniFiles
 ,ObjectBufferFrm
 ,SubjIntf;


function ExecReport(Session: TOracleSession): Boolean;
var
  F : TqPayConfirmForm;
  TheDate : TDateTime;
begin
  F := TqPayConfirmForm.Create(nil);
  with F do
    try
      // --- init Session
      dsHeader.Session := Session;
      dsData.Session   := Session;
      // --- open dxMemData
      dxMemData.Open;
      dxMemData.Insert;
      // --- fill Dates
      TheDate := Now - 1;
      dxMemDataDate_From.Value := TheDate;
      dxMemDataDate_To.Value   := TheDate;
      // --- prepare Template
      xlrPayConfirm.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                                   ExtractFileName(xlrPayConfirm.XLSTemplate);
      LoadReportQueryEx(F, xlrPayConfirm.XLSTemplate);
      Result := (ShowModal = mrOk);
    finally
      F.Free;
    end;
end;

// ----------------------------------------------------------------------------
// --- Генерация отчета

procedure TqPayConfirmForm.actOkExecute(Sender: TObject);
begin
  dxMemData.CheckBrowseMode;
  // проверка введённых параметров
  if    dxMemDataSubj_Id.IsNull
     or ( dxMemDataSubj_Id.Value = 0 ) then
    raise exception.Create('Необходимо выбрать декларанта!');
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMeMDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);

  // открытие наборов данных
  dsHeader.Open;
  dsData.Open;

  // Регистрация события
  MainData.RegisterEvent('REP','00008');

  // --- Generate Report
  try
    xlrPayConfirm.Report(True);
    ModalResult := mrOk;
  except
    on e:exception do
      begin
        dxMemData.Edit;
        e.Message := ReportError + e.Message;
        raise;
      end;
  end;

  // закрыть наборы данных
  dsHeader.Close;
  dsData.Close;
end;


// ----------------------------------------------------------------------------
// --- Работа с субъектом

procedure TqPayConfirmForm.OnSearchSubjFinished( const ADragObject: TfdcDragObject);
begin
  dxMemDataSUBJ_ID.Value   := ADragObject.SingleObject.ID;
  dxMemDataSUBJ_NAME.Value := ADragObject.SingleObject.ObjName;
end;


procedure TqPayConfirmForm.edtSubjectPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  inherited;
  FC := TFormClass(FindClass('TSubjectFindGridForm'));
  F := FC.Create(edtSubject) as TfdcCustomObjectGridForm;
  F.SearchMode        := True;
  F.SearchMultiple    := False;
  F.SearchComponent   := edtSubject;
  F.SearchTypeSysName := 'Declarant;Person;Subject';
  F.ObjectServices    := GetObjectServices;
  F.OnSearchFinished  := OnSearchSubjFinished;
  F.actOpen.Visible   := False;
  F.actAdd.Visible    := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;


// ----------------------------------------------------------------------------
// --- Работа с буфером

procedure TqPayConfirmForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value   := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
end;


procedure TqPayConfirmForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;


// ----------------------------------------------------------------------------
// --- Работа с активным субъектом

procedure TqPayConfirmForm.FormShow(Sender: TObject);
begin
  inherited;
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := GetActiveSubjectId;
  if dxMemDataSUBJ_ID.Value > 0 then
     dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
end;


procedure TqPayConfirmForm.FormCreate(Sender: TObject);
begin
  inherited;

  edtDate_From.Properties.MaxDate := Trunc( Now - 1 );
  edtDate_To.Properties.MaxDate   := Trunc( Now - 1 );
end;

End.

