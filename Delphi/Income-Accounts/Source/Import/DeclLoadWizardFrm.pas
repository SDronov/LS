unit DeclLoadWizardFrm;

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
  dxPSCore, dxPSTextLnk, dxPScxEditorLnks, Log4D;

type
  TDeclLoaderForm = class(TBaseWizardForm)
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
    sqlNewDecl: TsqlOp;
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
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    actSave: TAction;
    actPrint: TAction;
    SaveDialog1: TSaveDialog;
    lcReportItem3: TdxLayoutItem;
    cxButton1: TcxButton;
    lcReportItem4: TdxLayoutItem;
    cxButton2: TcxButton;
    lcReportGroup1: TdxLayoutGroup;
    dxComponentPrinter1: TdxComponentPrinter;
    plReportLink: TcxMemoReportLink;
    sqlLoadKts: TsqlOp;
    dsNewKts: TfdcQuery;
    sqlEndLoadKts: TsqlOp;
    dsNewKtd: TfdcQuery;
    sqlLoadKtd: TsqlOp;
    procedure tabInfoShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tabReportShow(Sender: TObject);
    procedure btnDirectoryClick(Sender: TObject);
    procedure btnArchiveClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure cmbxPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabReportPrevExecute(Sender: TObject);
  private
    { Private declarations }
    fAbsentFiles, fPresentFiles: TStrings;
    procedure ClearLabel;
    procedure AddProcessInfo(Progress: double);
    procedure AddLog(const HeaderText, MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    procedure AddLog(const MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    function ParseError(const Error: String): String; overload;
    function checkedProceedLoading(aFolder:string; aStr:TStrings): boolean;
  protected
  public
    procedure BeforeDestruction; override;

  end;

function  ImportCustomDecl(Session: TOracleSession): Boolean;

implementation

uses
  fdcCustomDlgFrm, fdcCustomTabDlgFrm, fdcUtils, Registry, fdcCustomFrm,
  IaccLoader, fdcExceptions, IaccUtils, MainDm, ArchUtils,
  fdcMessages;

{$R *.dfm}

const DKFiles : array[0..25] of string = (
                                  'dclhead.dbf',  { 0 }
                                  'dcltovar.dbf', { 1 }
                                  'dk_pp.dbf',    { 2 }
                                  'dclsumpp.dbf', { 3 }
                                  'dkkupl.dbf',   { 4 }
                                  'dk1.dbf',      { 5 }
                                  'dcltechd.dbf', { 6 }
                                  'dclpredd.dbf', { 7 }
                                  'dkisch.dbf',   { 8 }
                                  'dcltrans.dbf', { 9 }
                                  'dclplatr.dbf', { 10 }
                                  'dclplatv.dbf', { 11 }
                                  'dclslotm.dbf', { 12 }
//                                  'dclusl.dbf',   { 13 }
                                  'dkoprp.dbf',   { 14 }
                                  'ktchead.dbf',  { 15 }
                                  'ktcpltiz.dbf', { 16 }
                                  'ktctovIz.dbf', { 17 }
                                  'dcldog.dbf',   { 18 }
                                  'dcltovg.dbf',  { 19 }
                                  'dclkmp.dbf',   { 20 }
                                  'ktdhead.dbf',  { 21 }
                                  'ktdplbiz.dbf', { 22 }
                                  'ktdpltiz.dbf', { 23 }
                                  'ktdsumpp.dbf', { 24 }
                                  'ktdtovar.dbf', { 25 }
                                  'ktdtovg.dbf'   { 26 }
                                  );


procedure createFileLists(const aDirName: string; const aFiles: array of string;
                                          var aPresentFiles, aAbsentFiles: TStrings);
procedure chkStr(var aStr: TStrings);
begin
 if Assigned(aStr) then
   aStr.Clear
 else
   aStr:= TStringList.Create;
 aStr.Delimiter:= ';' ;
end;
var
 i: integer;
begin
 chkStr(aPresentFiles);
 chkStr(aAbsentFiles);
 for i:= Low(aFiles) to High(aFiles) do
   if FileExists( IncludeTrailingPathDelimiter(aDirName) + aFiles[i] ) then
     aPresentFiles.Add(aFiles[i])
   else
     aAbsentFiles.Add(aFiles[i]);
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

function  ImportCustomDecl(Session: TOracleSession): Boolean;
var
  F: TDeclLoaderForm;
begin
  // лог загрузки
  TLogPropertyConfigurator.Configure(ExtractFilePath(ParamStr(0)) + 'iaccdocload.log4d');

  F := TDeclLoaderForm.Create(nil);
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

procedure TDeclLoaderForm.tabInfoShow(Sender: TObject);
begin
  inherited;
  ClearLabel;
end;

procedure TDeclLoaderForm.ClearLabel;
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

procedure TDeclLoaderForm.actOkUpdate(Sender: TObject);
begin
  inherited;

end;
//  TAction(Sender).Enabled := not tabInfo.Showing and  DirectoryExists(cmbxPath.Text);

procedure TDeclLoaderForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth +  Panel1.Width;
  cmbxPath.Text := GetAppRegistryValue('LastDKDir', 'C:\');
  if fdcUtils.ReadRegistryValue(AppRegistryKey, 'LastDKChoice', rvBoolean) = False then
  begin
    btnArchive.Checked := True;
    lciFile.Enabled := True;
    lciDirectory.Enabled := False;
  end;
end;

procedure TDeclLoaderForm.AddLog(const HeaderText, MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False);
begin
  if AddToLog then
    TLogLogger.GetRootLogger.Log(LogLevel, HeaderText + MessText);
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

procedure TDeclLoaderForm.AddLog(const MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False);
begin
  if AddToLog then
    TLogLogger.GetRootLogger.Log(LogLevel, MessText);
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

procedure TDeclLoaderForm.AddProcessInfo(Progress: double);
begin
  barLoad.Position := barLoad.Position + Progress;
  UpdateWindow(Handle);
  Application.HandleMessage;
end;

function TDeclLoaderForm.checkedProceedLoading(aFolder:string; aStr:TStrings): boolean;
begin
 Result:= (aStr.Count = 0);
 if (not Result) then
{mrNO}
 Result:=( mrYES = WarningDlg(
    'Не все файлы документов контроля присутствуют в каталоге '+ aFolder ,
    'Продолжить загрузку?',
    'Отсутствуют файлы: '+ aStr.DelimitedText ) );
end;

procedure TDeclLoaderForm.tabGeneralNextExecute(Sender: TObject);
var
  Importer      : TUniImporter;
  LoadSessionId : double;
  TotalDecl     : integer;
  TotalKts      : integer;
  I             : Integer;
  StartTime     : TDateTime;
  Query         : TOracleQuery;
  BadOthers     : Integer;
  NotLoaded     : Integer;
  NotLoadedKts  : Integer;
  TotalKtd      : Integer;
  DirName       : String;
  LoadedFile    : String;

  function LoadDBF(const DBFNames: String): String;
  var
    FullName    : String;
    i           : Integer;
    SL          : TStringList;
  begin
    SL := TStringList.Create;
    SL.Delimiter := ';';
    SL.DelimitedText := DBFNames;
    Result := '';
    for i := 0 to SL.Count - 1 do begin
      FullName := Format('%s\%s', [DirName, SL[i]]);
      if FileExists(FullName) then begin
        AddLog(Format('  Файл %s...', [SL[i]]), Log4d.Debug);
        AddProcessInfo(100/(3*8));
        Importer.LoadFile(SL[i], FullName);
        Result := SL[i];
      end;
    end;
    SL.Free;
  end;

begin
  // Установка разрешения на обновления мат. представления
  MainData.pkgCommon.PackageName := 'p_Params';
  MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['N'] );
  NotLoaded := 0;
  dxLayoutControl1Group8.Enabled := False;
  try
    try
      AddLog('', Log4d.Info, False);
      AddLog('--------------------------------------------------------------------', Log4d.Info, False);
      AddLog('Загрузка ДТ', Log4d.Info, False);
      AddLog('Версия приложения: ', fdcUtils.GetAppVersion, Log4d.Debug, False);

      if btnDirectory.Checked then begin
        if not DirectoryExists(cmbxPath.Text) then
          GlobalExceptionHandler(nil, 'Выбран неверный каталог файлов документов контроля',
            Format('Каталог %s не существует', [cmbxPath.Text]),
            'DeclLoadWizardFrm', 'TDeclLoaderForm', 'tabGeneralExecute');
        AddLog('Выбор каталога: ', cmbxPath.Text, Log4d.Debug, False);
        DirName := cmbxPath.Text;
      end else begin
        if not FileExists(edtFileName.Text) then
          GlobalExceptionHandler(nil, 'Выбран неверный архив документов контроля',
            Format('Файл %s не существует', [edtFileName.Text]),
            'PaysLoadWizardFrm', 'TPaysLoaderForm', 'tabGeneralExecute');
        AddLog('Выбор файлового архива: ', edtFileName.Text, Log4d.Debug, False);
        DirName := GetAppTempDir;
        ExtractArchive('*.*', DirName, edtFileName.Text);
      end;

      createFileLists( DirName, DKFiles, fPresentFiles, fAbsentFiles );
      if (not checkedProceedLoading(DirName, fAbsentFiles)) then
        Abort;

      edtLoadReport.Lines.Clear;
      barLoad.Position := 0;
      barDetail.Position := 0;
      barCustomDecl.Position := 0;
      PageControl.SelectNextPage(True, False);

      StartTime := Now;

      LoadSessionId := sqlBeginLoad.Exec;
      TotalDecl := 0;
      try
        AddLog('Загрузка БД документов контроля:', Log4d.Debug);
        AddProcessInfo(0);
        Importer := TUniImporter.Create;
        try
          for I := 0 to fPresentFiles.Count-1 do begin
            LoadedFile := LoadDBF(fPresentFiles[i]);
            if LoadedFile <> '' then begin
              if i = 0 then
                TotalDecl := Importer.Total - Importer.Skipped;
              AddLog('  ', Format('  Файл %s: всего строк %d дубли %d',
                [LoadedFile, Importer.Total, Importer.Skipped]), Log4d.Debug,
                True, True, True);
            end;
          end;
        finally
          Importer.Free;
        end;

        AddLog('', Log4d.Debug, True, False);
        AddProcessInfo(0);
        barDetail.Properties.Max := TotalDecl;
        barDetail.Position := 0;
        BadOthers := 0;

        //  QueryList1.Session.Commit;

        AddLog('Обработка загруженных документов контроля:', Log4d.Debug);
        AddProcessInfo(0);
        dsNewDecl.ParamByName('LOAD_ID').Value := LoadSessionId;
        dsNewDecl.Open;
        try
          while not dsNewDecl.Eof do begin
            lciDetail.Caption := Format('ДТ %d из %d', [dsNewDecl.RecNo, TotalDecl]);
            AddLog(Format('  ДТ %s...', [dsNewDecl.FieldValues['gtd_name']]), Log4d.Debug);
            AddProcessInfo((200.0/3.0)/TotalDecl);
           // Query := nil;
            sqlLoadDecl.Exec;
            if sqlLoadDecl['errtext'] <> '' then begin
              Inc(NotLoaded);
              AddLog(Format('    В процессе загрузки ДТ %s произошла внутренняя ошибка:',
                [dsNewDecl.FieldValues['gtd_name']]), Log4d.Error);
              AddLog(Format('    %s', [ParseError(sqlLoadDecl['errtext'])]), Log4d.Error);
              AddLog(Format('    %s', [sqlLoadDecl['errtext']]), Log4d.All, False); // вывод полного текста ошибки (только в логфайле при включенном уровне логирования ALL)
            end else begin
              Query := sqlGetErrors.Query('ID', sqlLoadDecl['result']);
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
          AddLog(Format('Всего записей ДТ: %d', [TotalDecl]), Log4d.Info);
        finally
          dsNewDecl.Close;
        end;

        TotalKts     := 0;
        NotLoadedKts := 0;
        dsNewKts.ParamByName('LOAD_ID').Value := LoadSessionId;
        dsNewKts.Open;
        try
          while not dsNewKts.Eof do
          begin
            sqlLoadKts.Exec;
            if sqlLoadKts['errtext'] <> '' then
             begin
              Inc(NotLoadedKts);
              AddLog(Format('    В процессе загрузки КТС %s произошла внутренняя ошибка:'
              ,[dsNewKts.FieldValues['gtd_name']]), Log4d.Error);
              AddLog(Format('    %s', [ParseError(sqlLoadKts['errtext'])]), Log4d.Error);
              AddLog(Format('    %s', [sqlLoadKts['errtext']]), Log4d.All, False); // вывод полного текста ошибки (только в логфайле при включенном уровне логирования ALL)
             end
             else
              TotalKts:=TotalKts+sqlLoadDecl['result'];
            dsNewKts.Next;
          end;

          AddLog(Format('Всего записей КТС: %d', [TotalKts]), Log4d.Info);
        finally
          dsNewKts.Close;
        end;

        TotalKtd     := 0;
        //NotLoadedKtd := 0;
        dsNewKtd.ParamByName('LOAD_ID').Value := LoadSessionId;
        dsNewKtd.Open;
        try
          while not dsNewKtd.Eof do
          begin
            sqlLoadKtd.Exec;
            if sqlLoadKtd['errtext'] <> '' then
             begin
              //Inc(NotLoadedKtd);
              AddLog(Format('    В процессе загрузки КДТ %s произошла внутренняя ошибка:'
              ,[dsNewKtd.FieldValues['gtd_name']]), Log4d.Error);
              AddLog(Format('    %s', [ParseError(sqlLoadKtd['errtext'])]), Log4d.Error);
              AddLog(Format('    %s', [sqlLoadKtd['errtext']]), Log4d.All, False); // вывод полного текста ошибки (только в логфайле при включенном уровне логирования ALL)
             end
             else
              TotalKtd := TotalKtd + sqlLoadDecl['result'];
            dsNewKtd.Next;
          end;

          AddLog(Format('Всего записей КДТ: %d', [TotalKtd]), Log4d.Info);
        finally
          dsNewKtd.Close;
        end;

        sqlEndLoadKts.Exec;
        sqlEndLoad.Exec('ploadlog', LoadSessionId);
        QueryList1.Session.Commit; // Rollback;
        AddLog(Format('Загружены без ошибoк: %d', [TotalDecl-BadOthers-NotLoaded+TotalKts]), Log4d.Info);
        AddLog(Format('Загружены с ошибками: %d', [BadOthers]), Log4d.Info);
        AddLog(Format('Не загружено из-за ошибoк: %d', [NotLoaded+NotLoadedKts]), Log4d.Info);

        //  edtLoadReport.Lines.Add(Format('Неверен код ИНН: %d', [dsNewDecl.RecNo]));
        //  edtLoadReport.Lines.Add(Format('Нет плат. поручений: %d', [dsNewDecl.RecNo]));
        //  edtLoadReport.Lines.Add(Format('Прочие ошибки: %d', [dsNewDecl.RecNo]));
        AddLog(Format('Время загрузки %s', [TimeToStr(Now - StartTime)]), Log4d.Info);
        SetAppRegistryValue('LastDKDir', cmbxPath.Text);
        SetAppRegistryValue('LastDKChoice', btnDirectory.Checked);
      except
        QueryList1.Session.Rollback;
        PageControl.ActivePage := tabGeneral;
        raise;
      end;
    except
      on E: EfdcException do begin
        AddLog('Загрузка ДТ прервана. ', E.UserMessage + '. ' + E.UserHint, Log4d.Error);
        raise;
      end;
      on E: Exception do begin
        AddLog('Загрузка ДТ прервана. ', ParseError(E.Message), Log4d.Error);
        raise;
      end;
    end;
  finally
    dxLayoutControl1Group8.Enabled := True;
    actNext.Enabled := True;
    actPrev.Enabled := True;
    actOk.Enabled := True;
    // Установка разрешения на обновления мат. представления
    MainData.pkgCommon.PackageName := 'p_Params';
    MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['Y'] );
  end;
  PageControl.SelectNextPage(True);
end;

procedure TDeclLoaderForm.tabReportShow(Sender: TObject);
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

procedure TDeclLoaderForm.btnDirectoryClick(Sender: TObject);
begin
  inherited;
  lciDirectory.Enabled := True;
  lciFile.Enabled := False;
end;

procedure TDeclLoaderForm.btnArchiveClick(Sender: TObject);
begin
  inherited;
  lciDirectory.Enabled := False;
  lciFile.Enabled := True;
end;

procedure TDeclLoaderForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  dlgOpenFile.Filter := GetUnArchiveFilter;
  if dlgOpenFile.Execute then
     edtFileName.Text := dlgOpenFile.FileName;
end;

(*procedure TDeclLoaderForm.OnProgress(Sender: TObject);
begin
end;*)

procedure TDeclLoaderForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
      edtReport.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TDeclLoaderForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.CurrentLink.Print(True, nil);
end;

procedure TDeclLoaderForm.cmbxPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Dir: string;
begin
  inherited;
  Dir := cmbxPath.Text;
  if SelectDirectoryEx('', '', Dir, 0) then
        cmbxPath.Text := Dir;
end;

procedure TDeclLoaderForm.tabReportPrevExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabGeneral;
end;

function TDeclLoaderForm.ParseError(const Error: String): String;
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


procedure TDeclLoaderForm.BeforeDestruction;
begin
  inherited;
  if Assigned(fAbsentFiles) then
    fAbsentFiles.Free;
  if Assigned(fPresentFiles) then
    fPresentFiles.Free;
end;

initialization
    RegisterClass(TDeclLoaderForm);
end.
