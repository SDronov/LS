unit qAvansRashodNewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, DB, FDCCustomDataset, fdcQuery, dxmdaset,
  xlcClasses, xlEngine, xlReport, Oracle, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxDBEdit, cxDropDownEdit, cxCalendar, cxGroupBox,
  cxRadioGroup, cxListBox, ExtCtrls, cxListBoxEx, cxCheckBox, fdcObjectCore,
  xlReportG2, Menus;

type
  TqAvansRashodNewForm = class(TfdcCustomDlgForm)
    dsSysValues: TfdcQuery;
    dxMemData: TdxMemData;
    srcdsMain: TDataSource;
    dxMemDataBossName: TStringField;
    dxMemDataCustomsName: TStringField;
    edtSubject: TcxDBButtonEdit;
    lciSubject: TdxLayoutItem;
    edtDate_From: TcxDBDateEdit;
    lciDate_From: TdxLayoutItem;
    lciDate_To: TdxLayoutItem;
    dxMemDataSubj_Id: TFloatField;
    dxMemDataSubj_Name: TStringField;
    edtDate_To: TcxDBDateEdit;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    dsHeader: TfdcQuery;
    dxMemDataRest: TStringField;
    xlrAvansLong: TxlReport;
    dxMemDataPeriod: TStringField;
    actPasteFromBuffer: TAction;
    dsLong: TfdcQuery;
    dxMemDatadlgDate_From: TDateField;
    dxMemDatadlgDate_To: TDateField;
    lcgDate: TdxLayoutGroup;
    dxMemDataDate_Now: TDateField;
    chbxINN: TcxDBCheckBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxMemDataINNReport: TIntegerField;
    dxMemDataSubj_INN: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject;  AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    BaseSQLLong   : string;
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
  public
  end;


  function  ExecReport(Session: TOracleSession): Boolean;


implementation

{$R *.dfm}

uses
  qReportUtil,
  fdcObjectServices,
  fdcCustomObjectGridFrm,
  CustomDeclGridFrm,
  PaymentOrderGridFrm,
  IniFiles, ObjectBufferFrm, SubjIntf, MainDm;


function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqAvansRashodNewForm;
begin
  F := TqAvansRashodNewForm.Create(nil);
  with F do
  try
    // --- init Sessions
    dsSysValues.Session := Session;
    dsHeader.Session := Session;
    dsLong.Session := Session;
    // --- prepare Template
    xlrAvansLong.XLSTemplate  := ExtractFilePath(Application.ExeName) + 'Report\' +
                                 ExtractFileName(F.xlrAvansLong.XLSTemplate);
    LoadReportQueryEx(F, xlrAvansLong.XLSTemplate);
    BaseSQLLong := dsLong.SQL.Text;
    Result := (F.ShowModal = mrOk);
  finally
    F.Free;
  end;
end;


procedure TqAvansRashodNewForm.actOkExecute(Sender: TObject);
var
  i : integer;
  s : string;
  // 0 - comment po
  // 1 - list po
begin
  dxMemDataDate_Now.Value := Trunc( Now );
  dxMemData.UpdateRecord;
  // --- check input params
  if (dxMemDataSubj_Id.IsNull or (dxMemDataSubj_ID.Value <= 0)) then
    raise exception.Create('Не выбран декларант');
  //--
  dsHeader.Close;
  dsLong.Close;
  //--
  dxMemDataDate_From.Value :=dxMemDatadlgDate_From.Value;
  dxMemDataDate_To.Value   := dxMemDatadlgDate_To.Value;
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  dsLong.SQL.Text := Format(BaseSQLLong, ['--', 'NULL']);
  dsLong.Params.ParseSQL(dsLong.SQL.Text, True);
  //--

  // --- заполнение полей из системных значений
  dsSysValues.Open;
  dsSysValues.First;
  while not dsSysValues.Eof do
    begin
      if (dsSysValues.FieldByName('SysName').AsString = 'BossName') then
        dxMemDataBossName.AsString := dsSysValues.FieldByName('StringValue').AsString
      else if (dsSysValues.FieldByName('SysName').AsString = 'CustomsName') then
        dxMemDataCustomsName.AsString := dsSysValues.FieldByName('StringValue').AsString;
      dsSysValues.Next;
    end;
  dsSysValues.Close;
  // --- формирование строки периода
  dxMemDataPeriod.AsString := 'c ' + dxMemDataDate_From.AsString + '  по  ' + dxMemDataDate_To.AsString;

  // --- генерация отчета
  try
    dsHeader.Open;
    dsLong.Open;
    xlrAvansLong.Report(True);

    MainData.RegisterEvent('REP','00002');

    ModalResult := mrOk;
  except
    on e: exception do
      begin
        e.Message := ReportError + e.Message;
        raise;
      end;
  end;
end;


// ----------------------------------------------------------------------------
// --- Буфер

procedure TqAvansRashodNewForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and  Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;


procedure TqAvansRashodNewForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value :=  ObjectBufferForm.CurObject.ObjName;
end;


// ----------------------------------------------------------------------------
// --- Работа с формой

procedure TqAvansRashodNewForm.FormCreate(Sender: TObject);
begin
  inherited;
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDatadlgDate_From.Value := trunc( Now - 1 );
  dxMemDatadlgDate_To.Value := dxMemDatadlgDate_From.Value;
  dxMemDataINNReport.Value := 0;

  edtDate_From.Properties.MaxDate := trunc( Now - 1 );
  edtDate_To.Properties.MaxDate   := trunc( Now - 1 );
end;


// ----------------------------------------------------------------------------
// --- Добавление данных в отчет

// --- данные по субъекту

procedure TqAvansRashodNewForm.edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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

procedure TqAvansRashodNewForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dxMemDataSubj_Id.Value := ADragObject.SingleObject.id;
  dxMemDataSubj_Name.Value := ADragObject.SingleObject.ObjName;
  chbxINN.Enabled := (VarToStr(ADragObject.SingleObject.FieldValues['INN']) <> EmptyStr);
  if not chbxINN.Enabled then
    chbxINN.Checked := False;
end;

// ----------------------------------------------------------------------------
// --- авто подставка активного субъекта

procedure TqAvansRashodNewForm.FormShow(Sender: TObject);
begin
  inherited;
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := GetActiveSubjectId;
  if GetActiveSubjectINN = EmptyStr then
    begin
      chbxINN.Checked := False;
      chbxINN.Enabled := False;
    end;
  if dxMemDataSUBJ_ID.Value > 0 then
     dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
end;


End.

