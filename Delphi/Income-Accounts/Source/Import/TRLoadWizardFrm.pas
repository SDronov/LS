unit TRLoadWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, cxLookAndFeelPainters, ComCtrls,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxImage, ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons,
  cxControls, Oracle, cxProgressBar, DB, FDCCustomDataset, fdcQuery,
  cxTextEdit, cxMemo, ShlObj, cxShellCommon, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, cxShellTreeView, QueryList, cxButtonEdit, cxRadioGroup,
  cxCheckBox, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, dxPSTextLnk, dxPScxEditorLnks, BaseWizardFrm, Log4d;

type
  TTRLoaderForm = class(TBaseWizardForm)
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
    cmbxPath: TcxButtonEdit;
    lciDirectory: TdxLayoutItem;
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
    sqlLoadDecl: TsqlOp;
    sqlBeginLoad: TsqlOp;
    sqlEndLoad: TsqlOp;
    btnDirectory: TcxRadioButton;
    dxLayoutControl2Item1: TdxLayoutItem;
    btnArchive: TcxRadioButton;
    dxLayoutControl2Item4: TdxLayoutItem;
    edtFileName: TcxButtonEdit;
    lciFile: TdxLayoutItem;
    dlgOpenFile: TOpenDialog;
    lciDetail: TdxLayoutItem;
    barDetail: TcxProgressBar;
    sqlGetErrors: TsqlOp;
    chbxExternal: TcxCheckBox;
    dxLayoutControl2Item3: TdxLayoutItem;
    dxLayoutControl2Item5: TdxLayoutItem;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    dxComponentPrinter1: TdxComponentPrinter;
    plReportLink: TcxMemoReportLink;
    actPrint: TAction;
    actSave: TAction;
    lcReportItem3: TdxLayoutItem;
    cxButton1: TcxButton;
    lcReportItem4: TdxLayoutItem;
    cxButton2: TcxButton;
    lcReportGroup1: TdxLayoutGroup;
    procedure tabInfoShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure tabReportShow(Sender: TObject);
    procedure btnDirectoryClick(Sender: TObject);
    procedure btnArchiveClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cmbxPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabReportPrevExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ClearLabel;
    procedure AddProcessInfo(Progress: double);
    procedure AddLog(const HeaderText, MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    procedure AddLog(const MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    function ParseError(const Error: String): String; overload;
  public
    { Public declarations }
  end;


function  ImportTR(Session: TOracleSession): Boolean;

implementation

uses
  fdcCustomDlgFrm, fdcCustomTabDlgFrm, fdcUtils, Registry, fdcCustomFrm,
  IaccLoader, fdcExceptions, IaccUtils, MainDm, ArchUtils;

{$R *.dfm}

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

function  ImportTR(Session: TOracleSession): Boolean;
var
  F: TTRLoaderForm;
begin
  try
    MainData.CheckTask('Tsk_ImportDoc_TR', True);
  except on e: exception do begin
    e.Message := 'Пользователь не имеет права на импорт ТР : ' + e.Message;
    raise;
  end end;

  // лог загрузки
  TLogPropertyConfigurator.Configure(ExtractFilePath(ParamStr(0)) + 'iaccdocload.log4d');

  F := TTRLoaderForm.Create(nil);
  try
//    F.dsLoadDecl.Session := Session;
    F.dsNewDecl.Session := Session;
    F.QueryList1.Session := Session;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

{ TDeclLoaderForm }

procedure IncLabel(ALabel: TcxLabel; const IncVal: Integer = 1);
begin
  ALabel.Caption := IntToStr(StrToIntDef(ALabel.Caption, 0) + IncVal);
end;

procedure TTRLoaderForm.tabInfoShow(Sender: TObject);
begin
  inherited;
  ClearLabel;
end;

procedure TTRLoaderForm.ClearLabel;
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

procedure TTRLoaderForm.actOkUpdate(Sender: TObject);
begin
  inherited;

end;
//  TAction(Sender).Enabled := not tabInfo.Showing and  DirectoryExists(cmbxPath.Text);

procedure TTRLoaderForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth +  Panel1.Width;
  cmbxPath.Text := GetAppRegistryValue('LastTRDir', 'C:\');
  if fdcUtils.ReadRegistryValue(AppRegistryKey, 'LastTRChoice', rvBoolean) = False then
  begin
    btnArchive.Checked := True;
    lciFile.Enabled := True;
    lciDirectory.Enabled := False;
  end;
end;

procedure TTRLoaderForm.actCancelUpdate(Sender: TObject);
begin
  inherited;
//  TAction(Sender).Caption := IfElse(tabInfo.Showing, 'Закрыть', 'Отмена');
end;

procedure TTRLoaderForm.AddProcessInfo(Progress: double);
begin
  barLoad.Position := barLoad.Position + Progress;
  UpdateWindow(Handle);
  Application.HandleMessage;
end;

const TPOFiles : array[0..10] of string = (
 'rtpo.dbf'
,'rtpo_doc.dbf'
,'rtpo_itp.dbf'
//,'tpo_tdo.dbf'
,'rpltperi.dbf'
,'rtpo_dop.dbf'
,'rgoods.dbf'
,'rtpo_aud.dbf'
,'rfizlic.dbf'
,'rokpo.dbf'
,'rtpo_tdo.dbf'
,'rtpo_plt.dbf'
);

const TPOFilesEx : array[0..10] of string = (
 'ftpo.dbf'
,'ftpo_doc.dbf'
,'ftpo_itp.dbf'
//,'tpo_tdo.dbf'
,'fpltperi.dbf'
,'ftpo_dop.dbf'
,'fgoods.dbf'
,'ftpo_aud.dbf'
,'ffizlic.dbf'
,'fokpo.dbf'
,'ftpo_tdo.dbf'
,'ftpo_plt.dbf'
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

type
  TUniImporter_ = class(TUniImporter);
  ArrayOfString = array of string;
  PArrayOfString = ^ArrayOfString;

procedure TTRLoaderForm.tabGeneralNextExecute(Sender: TObject);
const
  FilesSet : array[boolean] of PArrayOfString = (@TPOFiles, @TPOFilesEx);
var
  Importer     : TUniImporter;
  MissingFiles : String;
  I            : Integer;
  StartTime    : TDateTime;
  DirName      : string;
  LoadSessionId: double;
  Query        : TOracleQuery;
  LoadId       : double;
  TotalDecl    : integer;      // всего ТПО (кол-во новых записей в tpo.dbf)
  BadOthers    : Integer;      // загружено с ошибками
  NotLoaded    : Integer;      // не загружено из-ошибок

  procedure LoadDBF(const DBFName: String);
  begin
    AddLog(Format('  Файл %s...', [DBFName]), Log4D.Debug);
    AddProcessInfo(100/(3*8));
//    if FileExists(DirName + '\' + TPOFiles[I]) then
       Importer.LoadFile(DBFName, Format('%s\%s', [DirName, DBFName]))
//    else
//    begin
//     TUniImporter_(Importer).FTotal := 0;
//     TUniImporter_(Importer).FSkipped := 0;
//    end;

  end;

begin
  // Установка разрешения на обновления мат. представления
  MainData.pkgCommon.PackageName := 'p_Params';
  MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['N'] );
  dxLayoutControl1Group8.Enabled := False;
  try
    try
      AddLog('', Log4d.Info, False);
      AddLog('--------------------------------------------------------------------', Log4d.Info, False);
      AddLog('Загрузка ТР', Log4d.Info, False);
      AddLog('Версия приложения: ', fdcUtils.GetAppVersion, Log4d.Debug, False);

      if btnDirectory.Checked then begin
        if not DirectoryExists(cmbxPath.Text) then
          GlobalExceptionHandler(nil, 'Выбран неверный каталог файлов таможенных расписок',
            Format('Каталог %s не существует', [cmbxPath.Text]),
            'TRLoadWizardFrm', 'TTRLoaderForm', 'tabGeneralNextExecute');
        AddLog('Выбор каталога: ', cmbxPath.Text, Log4d.Debug, False);
        DirName := cmbxPath.Text;
      end else begin
        if not FileExists(edtFileName.Text) then
          GlobalExceptionHandler(nil, 'Выбран неверный архив таможенных приходных ордеров',
            Format('Файл %s не существует', [edtFileName.Text]),
            'TRLoadWizardFrm', 'TTRLoaderForm', 'tabGeneralNextExecute');
        AddLog('Выбор файлового архива: ', edtFileName.Text, Log4d.Debug, False);
        DirName := GetAppTempDir;
        ExtractArchive('*.*', DirName, edtFileName.Text);
      end;

      if chbxExternal.Checked then
        MissingFiles := CheckFiles(DirName, TPOFilesEx)
      else
        MissingFiles := CheckFiles(DirName, TPOFiles);

      if MissingFiles <> '' then
        GlobalExceptionHandler(nil, 'Пропущены файлы ТР',
          IfElse(btnDirectory.Checked,
            Format('В каталоге %s нет файлов %s', [cmbxPath.Text, MissingFiles]),
            Format('В архиве %s нет файлов %s', [edtFileName.Text, MissingFiles])),
          'TRLoadWizardFrm', 'TTRLoaderForm', 'tabGeneralNextExecute');
      edtLoadReport.Lines.Clear;
      barLoad.Position := 0;
      barDetail.Position := 0;
      barCustomDecl.Position := 0;
      PageControl.SelectNextPage(True, False);

      StartTime := Now;

      LoadSessionId := sqlBeginLoad.Exec;

      try
        AddLog('Загрузка БД ТР', Log4d.Debug);
        AddProcessInfo(0);
        Importer := TUniImporter.Create;
        try
          for I := Low(TPOFiles) to High(TPOFiles) do begin
            if chbxExternal.Checked then
              LoadDBF(TPOFilesEx[I])
            else
              LoadDBF(TPOFiles[I]);
            if I = 0 then
              TotalDecl := Importer.Total - Importer.Skipped;
            AddLog('  ', Format('  Файл %s: всего строк %d дубли %d',
              [IfElse(chbxExternal.Checked, TPOFilesEx[i], TPOFiles[i]),
              Importer.Total, Importer.Skipped]), Log4d.Debug, True, True, True);
          end;
        finally
          Importer.Free;
        end;

//        QueryList1.Session.Commit;


        AddLog('', Log4d.Debug, True, False);
        AddProcessInfo(0);
        barDetail.Position := 0;
        AddLog('Обработка загруженных таможенных расписок:', Log4d.Debug);
        AddProcessInfo(0);
        NotLoaded := 0;
        BadOthers := 0;
        dsNewDecl.ParamByName('LOAD_ID').Value := LoadSessionId;
        dsNewDecl.Open;
        try
          while not dsNewDecl.Eof do begin
            lciDetail.Caption := Format('ТР %d из %d', [dsNewDecl.RecNo, TotalDecl]);
            AddLog(Format('  ТР %s...', [dsNewDecl.FieldValues['tpo_name']]), Log4d.Debug);
            AddProcessInfo((200.0/3.0)/TotalDecl);
            //      dsLoadDecl.ExecSQL;
            LoadId := sqlLoadDecl.Exec;
            if sqlLoadDecl['errtext'] <> '' then begin
              Inc(NotLoaded);
              AddLog(Format('    В процессе загрузки ТР %s произошла внутренняя ошибка:',
                [dsNewDecl.FieldValues['tpo_name']]), Log4d.Error);
              AddLog(Format('    %s', [ParseError(sqlLoadDecl['errtext'])]), Log4d.Error);
            end else begin
              Query := sqlGetErrors.Query('ID', LoadId);
              if not Query.Eof then
                Inc(BadOthers);
              while not Query.Eof do begin
                AddLog('    ' + query.FieldAsString('name'), Log4d.Error);
                Query.Next;
              end;
            end;
            barDetail.Position := barDetail.Position + 1;
            dsNewDecl.Next;
          end;
        finally
          dsNewDecl.Close;
        end;

        sqlEndLoad.Exec('ploadlog', LoadSessionId);

        QueryList1.Session.Commit;
        AddLog(Format('Всего записей: %d',             [TotalDecl]),                         Log4d.Info);
        AddLog(Format('Загружены без ошибoк: %d',      [TotalDecl - BadOthers - NotLoaded]), Log4d.Info);
        AddLog(Format('Загружены с ошибками: %d',      [BadOthers]),                         Log4d.Info);
        AddLog(Format('Не загружено из-за ошибoк: %d', [NotLoaded]),                         Log4d.Info);
        AddLog(Format('Время загрузки %s',             [TimeToStr(Now - StartTime)]),        Log4d.Info);
        SetAppRegistryValue('LastTRDir', cmbxPath.Text);
        SetAppRegistryValue('LastTRChoice', btnDirectory.Checked);
        PageControl.SelectNextPage(True, True);
      except
        QueryList1.Session.Rollback;
        PageControl.ActivePage := tabGeneral;
        raise;
      end;
    except
      on E: EfdcException do begin
        AddLog('Загрузка ТР прервана. ', E.UserMessage + '. ' + E.UserHint, Log4d.Error);
        raise;
      end;
      on E: Exception do begin
        AddLog('Загрузка ТР прервана. ', ParseError(E.Message), Log4d.Error);
        raise;
      end;
    end;
  finally
    dxLayoutControl1Group8. Enabled := True;
    actNext.Enabled := True;
    actPrev.Enabled := True;
    actOk.Enabled := True;
    // Установка разрешения на обновления мат. представления
    MainData.pkgCommon.PackageName := 'p_Params';
    MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['Y'] );
  end;
end;

procedure TTRLoaderForm.tabReportShow(Sender: TObject);
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

procedure TTRLoaderForm.btnDirectoryClick(Sender: TObject);
begin
  inherited;
  lciDirectory.Enabled := True;
  lciFile.Enabled := False;
end;

procedure TTRLoaderForm.btnArchiveClick(Sender: TObject);
begin
  inherited;
  lciDirectory.Enabled := False;
  lciFile.Enabled := True;
end;

procedure TTRLoaderForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  dlgOpenFile.Filter := GetUnArchiveFilter;
  if dlgOpenFile.Execute then
     edtFileName.Text := dlgOpenFile.FileName;
end;

procedure TTRLoaderForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.CurrentLink.Print(True, nil);
end;

procedure TTRLoaderForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
      edtReport.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TTRLoaderForm.cmbxPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Dir: string;
begin
  inherited;
  Dir := cmbxPath.Text;
  if SelectDirectoryEx('', '', Dir) then
        cmbxPath.Text := Dir;
end;

procedure TTRLoaderForm.tabReportPrevExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabGeneral;
end;

procedure TTRLoaderForm.AddLog(const MessText: String; LogLevel: TLogLevel;
  AddToScreen, AddToLog, ChangeLastLine: Boolean);
begin
  if AddToLog then
    TLogLogger.GetRootLogger.Log(LogLevel, MessText);
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

procedure TTRLoaderForm.AddLog(const HeaderText, MessText: String;
  LogLevel: TLogLevel; AddToScreen, AddToLog, ChangeLastLine: Boolean);
begin
  if AddToLog then
    TLogLogger.GetRootLogger.Log(LogLevel, HeaderText + MessText);
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

function TTRLoaderForm.ParseError(const Error: String): String;
var
  UserMessage, UserHint: String;
  E : Exception;
begin
  E := Exception.Create(Error);
  fdcExceptions.ParseError(E, UserMessage, UserHint);
  if Error = UserHint then UserHint := '';
  E.Free;
  Result := UserMessage + '. ' + UserHint;
end;

initialization
    RegisterClass(TTRLoaderForm);

end.
