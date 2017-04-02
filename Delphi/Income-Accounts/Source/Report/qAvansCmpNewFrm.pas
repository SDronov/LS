unit qAvansCmpNewFrm;

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
  cxGraphics, cxGroupBox, cxRadioGroup, cxCheckBox, MainDM, ExtCtrls;

type

  TqAvansCmpNewForm = class(TfdcCustomDlgForm)
    xlrAvansCmp: TxlReport;
    edtSubject: TcxDBButtonEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxMemData: TdxMemData;
    dxMemDataSubj_Name: TStringField;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    dxMemDataPeriod: TStringField;
    cmbxCurrency: TfdcObjectLookupEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    srcMain: TDataSource;
    dxMemDataCurr_Id: TFloatField;
    dxMemDataSubj_Id: TFloatField;
    actPasteFromBuffer: TAction;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsHeader: TfdcQuery;
    dsCurrency: TfdcQuery;
    dxMemDataSaldoIn: TFloatField;
    dxMemDataSaldoOut: TFloatField;
    dxMemDataReport_Type: TIntegerField;
    dxMemDataIsGenReport: TIntegerField;
    chbxGenRepINN: TcxDBCheckBox;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxMemDataSUBJ_INN: TStringField;
    dsReport: TfdcQuery;
    RadioGrSelectDate: TRadioGroup;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsReport_activation_date: TfdcQuery;
    procedure actPasteFromBufferExecute(Sender: TObject);
    procedure actPasteFromBufferUpdate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  ObjectBufferFrm, SubjIntf;

const
  cDelta = 0.000001;  


function ExecReport(Session: TOracleSession): boolean;
begin
  with TqAvansCmpNewForm.Create(nil) do
  try
    // --- Init Session
    dsHeader.Session := Session;
    dsCurrency.Session := Session;
    dsReport.Session := Session;
    //--
    dxMemDataCurr_Id.AsFloat := cmbxCurrency.Properties.ListSource.DataSet.Lookup( 'CODE', '643', 'ID' );
    // --- Get Result
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


// ----------------------------------------------------------------------------
// --- Работа с буфером

procedure TqAvansCmpNewForm.actPasteFromBufferExecute(Sender: TObject);
begin
  dxMemData.Edit;
  dxMemDataSUBJ_ID.Value := ObjectBufferForm.CurObject.ID;
  dxMemDataSUBJ_NAME.Value := ObjectBufferForm.CurObject.ObjName;
end;


procedure TqAvansCmpNewForm.actPasteFromBufferUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectBufferForm) and Assigned(ObjectBufferForm.CurObject)
    and ObjectBufferForm.CurObject.IsOfType('Subject');
end;

// ----------------------------------------------------------------------------
// --- Генерация отчета

procedure TqAvansCmpNewForm.actOkExecute(Sender: TObject);
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
  // -- Get Subject Parameters
  dsHeader.Open;
  if not dsHeader.FieldByName('SUBJ_INN').IsNull then
    dxMemDataSUBJ_INN.Value := dsHeader.FieldByName('SUBJ_INN').Value;
  // --- open datasources
  //dsCurrency.Open;
  //--
  if (RadioGrSelectDate.ItemIndex > 0) then
    begin
      dsReport.SQL.Text := dsReport_activation_date.SQL.Text;
      RadioGrSelectDate.Enabled := False;
    end;
  dsReport.Open;
  //--
  MainData.RegisterEvent('REP','00004');

  // --- generate report and Get Result
  xlrAvansCmp.Report(True);
  ModalResult := mrOk;
end;

// ----------------------------------------------------------------------------
// --- Получение данных по декларанту

procedure TqAvansCmpNewForm.edtSubjectPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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


procedure TqAvansCmpNewForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dxMemDataSubj_Id.Value := ADragObject.SingleObject.Id;
  dxMemDataSubj_Name.Value := ADragObject.SingleObject.ObjName;
end;

// ----------------------------------------------------------------------------
// --- Создание и удаление формы

procedure TqAvansCmpNewForm.FormCreate(Sender: TObject);
var
  TheDate: TDate;
  fName : string;
begin
  inherited;
  // --- сохраняем имя оригинального шаблона
  BaseFileName := ExtractFilePath(Application.ExeName) + 'Report\' +
                  ExtractFileName(xlrAvansCmp.XLSTemplate);
  // --- рабочий шаблон формируем как Disk:\Path\FileName.ext -> Disk:\Path\FileName_.ext
  fName := BaseFileName;
  xlrAvansCmp.XLSTemplate := fName;
  // --- формируем параметры
  TheDate := Trunc(Now);
  dxMemData.Open;
  dxMemData.Insert;
  dxMemDataDate_From.Value := TheDate;
  dxMemDataDate_To.Value := TheDate;
  dxMemDataReport_Type.Value := 0;
  dxMemDataIsGenReport.Value := 0;
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
end;

procedure TqAvansCmpNewForm.FormDestroy(Sender: TObject);
begin
  FPayTypes.Free;
  FPayId.Free;
  inherited;
end;

procedure TqAvansCmpNewForm.FormShow(Sender: TObject);
begin
  inherited;
  dxMemData.Edit;
  dxMemDataSubj_Id.Value := GetActiveSubjectId;
  if dxMemDataSubj_Id.Value > 0 then
     dxMemDataSUBJ_NAME.Value :=  GetActiveSubjectName;
end;

end.

