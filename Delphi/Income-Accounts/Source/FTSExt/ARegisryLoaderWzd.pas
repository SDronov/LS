unit ARegisryLoaderWzd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, cxLookAndFeelPainters, ComCtrls,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxImage, ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons,
  cxControls, Oracle, cxProgressBar, DB, FDCCustomDataset, fdcQuery,
  cxTextEdit, cxMemo, ShlObj, cxShellCommon, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, cxShellTreeView, QueryList, cxButtonEdit, cxRadioGroup,
  BaseWizardFrm, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, dxPSTextLnk, dxPScxEditorLnks;

type
  TARegistryLoaderWzdForm = class(TBaseWizardForm)
    tabInfo: TcxTabSheet;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    barCustomDecl: TcxProgressBar;
    dxLayoutControl3Item1: TdxLayoutItem;
    dxLayoutControl3Group1: TdxLayoutGroup;
    lblTotal: TcxLabel;
    dxLayoutControl3Item3: TdxLayoutItem;
    lblDone: TcxLabel;
    dxLayoutControl3Item4: TdxLayoutItem;
    lblDubl: TcxLabel;
    dxLayoutControl3Item5: TdxLayoutItem;
    lblGood: TcxLabel;
    dxLayoutControl3Item6: TdxLayoutItem;
    lblBadINN: TcxLabel;
    dxLayoutControl3Item7: TdxLayoutItem;
    lblErrors: TcxLabel;
    dxLayoutControl3Item8: TdxLayoutItem;
    dxLayoutControl3Item2: TdxLayoutItem;
    cxLabel3: TcxLabel;
    dxLayoutControl3Item9: TdxLayoutItem;
    lblNoPayOrder: TcxLabel;
    tabReport: TcxTabSheet;
    lcReportGroup_Root: TdxLayoutGroup;
    lcReport: TdxLayoutControl;
    lcReportItem1: TdxLayoutItem;
    cxLabel4: TcxLabel;
    edtReport: TcxMemo;
    lcReportItem2: TdxLayoutItem;
    tabLoad: TcxTabSheet;
    dxLayoutControl4: TdxLayoutControl;
    barLoad: TcxProgressBar;
    cxLabel11: TcxLabel;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    edtLoadReport: TcxMemo;
    dxLayoutControl4Item1: TdxLayoutItem;
    dsNewDecl: TfdcQuery;
    QueryList1: TQueryList;
    sqlBeginLoad: TsqlOp;
    sqlEndLoad: TsqlOp;
    edtFileName: TcxButtonEdit;
    lciFile: TdxLayoutItem;
    dlgOpenFile: TOpenDialog;
    lciDetail: TdxLayoutItem;
    barDetail: TcxProgressBar;
    sqlLoadPO: TsqlOp;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    dxComponentPrinter1: TdxComponentPrinter;
    plReportLink: TcxMemoReportLink;
    actPrint: TAction;
    actSave: TAction;
    lcReportItem3: TdxLayoutItem;
    cxButton2: TcxButton;
    lcReportItem4: TdxLayoutItem;
    cxButton1: TcxButton;
    lcReportGroup1: TdxLayoutGroup;
    sqlErrList: TsqlOp;
    procedure tabInfoShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tabReportShow(Sender: TObject);
    procedure btnDirectoryClick(Sender: TObject);
    procedure btnArchiveClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cmbxPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabReportPrevExecute(Sender: TObject);
  private
    { Private declarations }
    FLastTimeUpdate: TDateTime;
    procedure OnProgress(Sender: TObject);
    procedure ClearLabel;
    procedure AddProcessInfo(const Text: string; Progress: double);
  public
    { Public declarations }
  end;


implementation

uses
  fdcCustomDlgFrm, fdcCustomTabDlgFrm, fdcUtils, Registry, fdcCustomFrm,
  IaccLoader, fdcExceptions, IaccUtils, PaysEditGridFrm, ArchUtils;

{$R *.dfm}

function GetOracleSession: TOracleSession;
var
 I: Integer;
 Comp: TComponent;
begin
  for I := 0 to  Screen.DataModuleCount - 1 do
  begin
    Comp := Screen.DataModules[I].FindComponent('Session');
    if (Comp is TOracleSession) and TOracleSession(Comp).Connected then
    begin
       Result := TOracleSession(Comp);
       Exit;
    end;
  end;
  Assert(False, 'Нельзя найти сессию');
  Result := nil;
end;

function GetAppRegistryValue(const Name: string; const Default: string = ''): String;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKeyReadOnly(TfdcCustomForm(Application.MainForm).AppRegistryKey) then
      Result := Reg.ReadString(Name);
  finally
    Reg.Free;
  end;
  if Result = '' then
     Result := Default;
end;

procedure SetAppRegistryValue(const Name: String; const Value: Variant);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(TfdcCustomForm(Application.MainForm).AppRegistryKey, True) then
    begin
      case VarType(Value) of
       varString: Reg.WriteString(Name, Value);
       varInteger: Reg.WriteInteger(Name, Value);
       varBoolean: Reg.WriteBool(Name, Value);
      end;
    end;
  finally
    Reg.Free;
  end;
end;


procedure IncLabel(ALabel: TcxLabel; const IncVal: Integer = 1);
begin
  ALabel.Caption := IntToStr(StrToIntDef(ALabel.Caption, 0) + IncVal);
end;

{ TARegisryLoaderWzdForm }

procedure TARegistryLoaderWzdForm.tabInfoShow(Sender: TObject);
begin
  inherited;
  ClearLabel;
end;

procedure TARegistryLoaderWzdForm.ClearLabel;
begin
  lblTotal.Caption := '0';
  lblDone.Caption := '0';
  lblDubl.Caption := '0';
  lblGood.Caption := '0';
  lblBadINN.Caption := '0';
  lblErrors.Caption := '0';
  lblNoPayOrder.Caption := '0';
  barCustomDecl.Position := 0.0;
end;

procedure TARegistryLoaderWzdForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth +  Panel1.Width;
//  if fdcUtils.ReadRegistryValue(AppRegistryKey, 'LastPOChoice', rvBoolean) = False then
//  begin
//    btnArchive.Checked := True;
//    lciFile.Enabled := True;
//    lciDirectory.Enabled := False;
//  end;
end;

procedure TARegistryLoaderWzdForm.AddProcessInfo(const Text: string; Progress: double);
begin
  edtLoadReport.Lines.Add(Text);
  barLoad.Position := barLoad.Position + Progress;
  UpdateWindow(Handle);
  Application.HandleMessage;
end;

const DKFiles : array[0..3] of string = (
                                  'R_SGL1.dbf',
                                  'R_SGL2.dbf',
                                  'R_SGL3.dbf',
                                  'R_SGL4.dbf'
                                  );

function CheckFiles(const DirName: string; const FileNames: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(FileNames) to High(FileNames) do
  begin
    if not FileExists(DirName + '\' + FileNames[I]) then
       Result := Result + ',' + FileNames[I];
  end;
  Result := Copy(Result, 2, MaxInt);
end;

procedure TARegistryLoaderWzdForm.tabGeneralNextExecute(Sender: TObject);
var
  Importer: TUniImporter;
  LoadSessionId: double;
  MissingFiles: String;
  I,J: Integer;
  StartTime: TDateTime;
  AFileName: string;
  DirName: string;
  Query: TOracleQuery;

  procedure LoadDBF(const DBFName: String);
  begin
    AddProcessInfo(Format('  Файл %s...', [DBFName]), 100/(3*8));
    Importer.LoadFile(DBFName, Format('%s\%s', [DirName, DBFName]));
  end;

begin
  dxLayoutControl1Group8.Enabled := False;
  try
    edtLoadReport.Lines.Clear;
    PageControl.SelectNextPage(True, False);

    for J := 0 to dlgOpenFile.Files.Count - 1 do
    begin
//    if btnDirectory.Checked then
//    begin
//     if not DirectoryExists(cmbxPath.Text) then
//       GlobalExceptionHandler(nil, 'Выбран неверный каталог файлов платежных поручений',
//       Format('Каталог %s нет существует', [cmbxPath.Text]),
//       'PaysLoadWizardFrm', 'TPaysLoaderForm', 'tabGeneralExecute');
//      DirName := cmbxPath.Text;
//    end
//    else
    begin
      AFileName := dlgOpenFile.Files[J] (*edtFileName.Text*);
      if not FileExists(AFileName) then
         GlobalExceptionHandler(nil, 'Выбран неверный архив платежных поручений',
         Format('Файл %s не существует', [AFileName]),
         'PaysLoadWizardFrm', 'TPaysLoaderForm', 'tabGeneralExecute');
       ClearDir(GetAppTempDir, 'R_SGL?.dbf');
       DirName := IncludeTrailingPathDelimiter(GetAppTempDir) + ExtractFileName(AFileName);
       ExtractArchive('*.*', DirName, AFileName);
    end;

    MissingFiles := CheckFiles(DirName, DKFiles);
    if MissingFiles <> '' then
       GlobalExceptionHandler(nil, 'Пропущены файлы платежных документов',
//       IfElse(btnDirectory.Checked,
//       Format('В каталоге %s нет файлов %s', [cmbxPath.Text, MissingFiles]),
       Format('В архиве %s нет файлов %s', [AFileName, MissingFiles])
//       )
       ,
       'PaysLoadWizardFrm', 'TPaysLoaderForm', 'tabGeneralExecute');

    StartTime := Now;

    LoadSessionId := sqlBeginLoad.Exec;

    try
    AddProcessInfo(Format('Загрузка реестров КНП из архива %s', [ExtractFileName(AFileName)]),0);
    Importer := TUniImporter.Create;
      try
        for I := Low(DKFiles)  to High(DKFiles) do
        begin
          LoadDBF(DKFiles[I]);
          edtLoadReport.Lines[edtLoadReport.Lines.Count -1] :=
          Format('%s всего строк %d из них дубли %d', [edtLoadReport.Lines[edtLoadReport.Lines.Count -1],
                      Importer.Total, Importer.Skipped]);
        end;
      finally
        Importer.Free;
      end;

    AddProcessInfo('',0);

    AddProcessInfo('Обработка реестра:',0);
    sqlLoadPO.Exec('loadid', LoadSessionId);
    Query := sqlErrList.Query('ID', sqlLoadPO['Result']);
    while not Query.Eof do
    begin
      AddProcessInfo(Query.FieldAsString('NAME'), 0);
      Query.Next;
    end;
  //  edtLoadReport.Lines.Add(Format('Всего платежных поручений: %d', [Integer(sqlLoadPO['ptotal'])]));
  //  edtLoadReport.Lines.Add(Format(' Повторяющихся: %d', [Integer(sqlLoadPO['pduppo'])]));
  //  edtLoadReport.Lines.Add(Format(' С не известным плательщиком: %d', [Integer(sqlLoadPO['pbadpayer'])]));

    sqlEndLoad.Exec('ploadlog', LoadSessionId);
    QueryList1.Session.Commit; // Rollback;
    edtLoadReport.Lines.Add(Format('Время загрузки %s', [TimeToStr(Now - StartTime)]));
//    SetAppRegistryValue('LastPODir', cmbxPath.Text);
//    SetAppRegistryValue('LastPOChoice', btnDirectory.Checked);
    except
       QueryList1.Session.Rollback;
       PageControl.ActivePage := tabGeneral;
       raise;
    end;
   end; //for
  finally
    dxLayoutControl1Group8.Enabled := True;
    actNext.Enabled := True;
    actPrev.Enabled := True;
    actOk.Enabled := True;
  end;
  PageControl.SelectNextPage(True);
end;

procedure TARegistryLoaderWzdForm.tabReportShow(Sender: TObject);
begin
  inherited;
  edtReport.Lines.Assign(edtLoadReport.Lines);

(*
  edtReport.Lines.Insert(0, 'Ошибки:');
  edtReport.Lines.Insert(0,'Прочие ошибки: ' + lblErrors.Caption);
  edtReport.Lines.Insert(0,'Нет плат. поручений: ' + lblNoPayOrder.Caption);
  edtReport.Lines.Insert(0,'Неверен код ИНН: ' + lblBadINN.Caption);
  edtReport.Lines.Insert(0,'Хороших: ' + lblGood.Caption);
  edtReport.Lines.Insert(0,'Повторяющихся: ' + lblDubl.Caption);
  edtReport.Lines.Insert(0,'Всего записей: ' + lblTotal.Caption);
*)
end;

procedure TARegistryLoaderWzdForm.btnDirectoryClick(Sender: TObject);
begin
  inherited;
//  lciDirectory.Enabled := True;
//  lciFile.Enabled := False;
end;

procedure TARegistryLoaderWzdForm.btnArchiveClick(Sender: TObject);
begin
  inherited;
//  lciDirectory.Enabled := False;
//  lciFile.Enabled := True;
end;

procedure TARegistryLoaderWzdForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if dlgOpenFile.Execute then
     edtFileName.Text := dlgOpenFile.Files.CommaText;
end;

procedure TARegistryLoaderWzdForm.OnProgress(Sender: TObject);
begin
end;

procedure TARegistryLoaderWzdForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.CurrentLink.Print(True, nil);
end;

procedure TARegistryLoaderWzdForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
      edtReport.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TARegistryLoaderWzdForm.cmbxPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Dir: string;
begin
  inherited;
//  Dir := cmbxPath.Text;
//  if SelectDirectoryEx('', '', Dir, 0) then
//        cmbxPath.Text := Dir;
end;

procedure TARegistryLoaderWzdForm.tabReportPrevExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabGeneral;
end;

procedure TARegistryLoaderWzdForm.FormCreate(Sender: TObject);
begin
  inherited;
  QueryList1.Session := GetOracleSession;
  dsNewDecl.Session := QueryList1.Session;
end;

initialization
    RegisterClass(TARegistryLoaderWzdForm);

end.
