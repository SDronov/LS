unit TPOLoadWizardFrm;
{TODO  iacc00000381}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, cxLookAndFeelPainters, ComCtrls,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxImage, ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons,
  cxControls, Oracle, cxProgressBar, DB, FDCCustomDataset, fdcQuery,
  cxTextEdit, cxMemo, ShlObj, cxShellCommon, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, cxShellTreeView, QueryList, cxButtonEdit, cxRadioGroup,
  cxCheckBox, cxGroupBox, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPSTextLnk, dxPScxEditorLnks, BaseWizardFrm,
  ztvregister, ztvBase, ztvUnArj, Log4D;

type
  TTPOLoaderForm = class(TBaseWizardForm)
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
    gbxFormat: TcxRadioGroup;
    dxLayoutControl2Item5: TdxLayoutItem;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    actSave: TAction;
    actPrint: TAction;
    lcReportItem3: TdxLayoutItem;
    cxButton2: TcxButton;
    lcReportItem4: TdxLayoutItem;
    cxButton1: TcxButton;
    lcReportGroup1: TdxLayoutGroup;
    SaveDialog1: TSaveDialog;
    dxComponentPrinter1: TdxComponentPrinter;
    plReportLink: TcxMemoReportLink;
    UnARJ1: TUnARJ;
    sqlGetDBFErrors: TsqlOp;
    sqlGetDBFErrorCount: TsqlOp;
    procedure tabInfoShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
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
    procedure ClearLabel;
    procedure AddProcessInfo(Progress: double);
    procedure AddLog(const HeaderText, MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    procedure AddLog(const MessText: String; LogLevel: TLogLevel; AddToScreen: Boolean = True; AddToLog: Boolean = True; ChangeLastLine : Boolean = False); overload;
    function ParseError(const Error: String): String; overload;
  public
    { Public declarations }
  end;


function  ImportTPO(Session: TOracleSession): Boolean;

implementation

uses
  fdcCustomDlgFrm, fdcCustomTabDlgFrm, fdcUtils, Registry, fdcCustomFrm,
  IaccLoader, fdcExceptions, IaccUtils, MainDM, ArchUtils;

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

function  ImportTPO(Session: TOracleSession): Boolean;
var
  F: TTPOLoaderForm;
begin
  try
    MainData.CheckTask('Tsk_ImportDoc_TPO', True);
  except on e: exception do begin
    e.Message := '������������ �� ����� ����� �� ������ ��� : ' + e.Message;
    raise;
  end end;

  // ��� ��������
  TLogPropertyConfigurator.Configure(ExtractFilePath(ParamStr(0)) + 'iaccdocload.log4d');

  F := TTPOLoaderForm.Create(nil);
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

procedure TTPOLoaderForm.tabInfoShow(Sender: TObject);
begin
  inherited;
  ClearLabel;
end;

procedure TTPOLoaderForm.ClearLabel;
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

procedure TTPOLoaderForm.actOkUpdate(Sender: TObject);
begin
  inherited;

end;
//  TAction(Sender).Enabled := not tabInfo.Showing and  DirectoryExists(cmbxPath.Text);

procedure TTPOLoaderForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth +  Panel1.Width;
  cmbxPath.Text := GetAppRegistryValue('LastTPODir', 'C:\');
  if fdcUtils.ReadRegistryValue(AppRegistryKey, 'LastTPOChoice', rvBoolean) = False then
  begin
    btnArchive.Checked := True;
    lciFile.Enabled := True;
    lciDirectory.Enabled := False;
  end;
end;

procedure TTPOLoaderForm.actCancelUpdate(Sender: TObject);
begin
  inherited;
//  TAction(Sender).Caption := IfElse(tabInfo.Showing, '�������', '������');
end;

procedure TTPOLoaderForm.AddProcessInfo(Progress: double);
begin
  barLoad.Position := barLoad.Position + Progress;
  UpdateWindow(Handle);
  Application.HandleMessage;
end;

const TPOFiles : array[0..10] of string = (
 'tpo.dbf'
,'tpo_doc.dbf'
,'tpo_itp.dbf'
//,'tpo_tdo.dbf'
,'pltperio.dbf'
,'tpo_dop.dbf'
,'goods.dbf'
,'tpo_aud.dbf'
,'fizlic.dbf'
,'okpo.dbf'
,'tpo_tdop.dbf'
,'tpo_plt.dbf'
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

procedure TTPOLoaderForm.tabGeneralNextExecute(Sender: TObject);
const
  FilesSet : array[boolean] of PArrayOfString = (@TPOFiles, @TPOFilesEx);
var
  Importer     : TUniImporter;
  MissingFiles : String;
  i,j          : Integer;
  StartTime    : TDateTime;
  DirName      : String;
  LoadSessionId: double;
  TotalDecl    : integer;      // ����� ��� (���-�� ����� ������� � tpo.dbf)
  BadOthers    : Integer;      // ��������� � ��������
  NotLoaded    : Integer;      // �� ��������� ��-������
  Query        : TOracleQuery;
//  ErrorCount   : Integer;

  procedure LoadDBF(const DBFName: String);
  var
    i          : integer;
    ErrorCount : Integer;
  begin
    AddLog(Format('  ���� %s...', [DBFName]), Log4d.Debug);
    AddProcessInfo(100/(3*8));
    Importer.LoadFile(DBFName, Format('%s\%s', [DirName, DBFName]));
    AddLog('  ', Format('  ���� %s: ����� ����� %d, ����� %d, c �������� %d',
      [DBFName, Importer.Total, Importer.Skipped, Importer.ErrorCount]), Log4d.Debug, True, True, True);
    ErrorCount := sqlGetDBFErrorCount.Exec;
    for i := 1 to ErrorCount do
      AddLog('    ' + sqlGetDBFErrors.Exec('nError', i), Log4d.Error);
  end;

begin
  dxLayoutControl1Group8.Enabled := False;
  // ��������� ���������� �� ���������� ���. �������������
  MainData.pkgCommon.PackageName := 'p_Params';
  MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['N'] );
  try
    try
      AddLog('', Log4d.Info, False);
      AddLog('--------------------------------------------------------------------', Log4d.Info, False);
      AddLog('�������� ���', Log4d.Info, False);
      AddLog('������ ����������: ', fdcUtils.GetAppVersion, Log4d.Debug, False);

      if btnDirectory.Checked then begin
        if not DirectoryExists(cmbxPath.Text) then
          GlobalExceptionHandler(nil, '������ �������� ������� ������ ���������� ��������� �������',
            Format('������� %s �� ����������', [cmbxPath.Text]),
            'TPOLoadWizardFrm', 'TTPOLoaderForm', 'tabGeneralNextExecute');
        AddLog('����� ��������: ', cmbxPath.Text, Log4d.Debug, False);
        DirName := cmbxPath.Text;
      end else begin
        if not FileExists(edtFileName.Text) then
          GlobalExceptionHandler(nil, '������ �������� ����� ���������� ��������� �������',
            Format('���� %s �� ����������', [edtFileName.Text]),
            'TPOLoadWizardFrm', 'TTPOLoaderForm', 'tabGeneralNextExecute');
        AddLog('����� ��������� ������: ', edtFileName.Text, Log4d.Debug, False);
        DirName := GetAppTempDir;
        ExtractArchive('*.*', DirName, edtFileName.Text);
      end;

      if gbxFormat.ItemIndex = 0 then begin
        MissingFiles := CheckFiles(DirName, TPOFilesEx);
        AddLog('������� ������ ������ ��� ', Log4d.Debug, False)
      end else begin
        MissingFiles := CheckFiles(DirName, TPOFiles);
        AddLog('���������� ������ ������ ��� ', Log4d.Debug, False)
      end;
      if MissingFiles <> '' then
        GlobalExceptionHandler(nil, '��������� ����� ���',
          IfElse(btnDirectory.Checked,
            Format('� �������� %s ��� ������ %s', [cmbxPath.Text, MissingFiles]),
            Format('� ������ %s ��� ������ %s', [edtFileName.Text, MissingFiles])),
          'TPOLoadWizardFrm', 'TTPOLoaderForm', 'tabGeneralNextExecute');

      edtLoadReport.Lines.Clear;
      barLoad.Position := 0;
      barDetail.Position := 0;
      barCustomDecl.Position := 0;
      PageControl.SelectNextPage(True, True);
      StartTime := Now;

      LoadSessionId := sqlBeginLoad.Exec;

      try
        AddLog('�������� �� ���:', Log4d.Debug);
        AddProcessInfo(0);
        Importer := TUniImporter.Create;
        try
          for I := Low(TPOFiles) to High(TPOFiles) do begin
            if gbxFormat.ItemIndex = 0 then
              LoadDBF(TPOFilesEx[I])
            else
              LoadDBF(TPOFiles[I]);
            if I = 0 then
              TotalDecl := Importer.Total - Importer.Skipped;
          end;
        finally
          Importer.Free;
        end;

        AddLog('', Log4d.Debug, True, False);
        AddProcessInfo(0);
        barDetail.Position := 0;
        AddLog('��������� ����������� ���������� ��������� �������:', Log4d.Debug);
        AddProcessInfo(0);
        NotLoaded := 0;
        BadOthers := 0;
        dsNewDecl.ParamByName('LOAD_ID').Value := LoadSessionId;
        dsNewDecl.Open;
        try
          while not dsNewDecl.Eof do begin
            lciDetail.Caption := Format('��� %d �� %d', [dsNewDecl.RecNo, TotalDecl]);
            AddLog(Format('  ��� %s...', [dsNewDecl.FieldValues['tpo_name']]), Log4d.Debug);
            AddProcessInfo((200.0/3.0)/TotalDecl);
            Query := nil;
            sqlLoadDecl.Exec;

            if sqlLoadDecl['errtext'] <> '' then begin
              Inc(NotLoaded);
              AddLog(Format('    � �������� �������� ��� %s ��������� ���������� ������:',
                [dsNewDecl.FieldValues['tpo_name']]), Log4d.Error);
              AddLog(Format('    %s', [ParseError(sqlLoadDecl['errtext'])]), Log4d.Error);
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
        finally
          dsNewDecl.Close;
        end;

        sqlEndLoad.Exec('ploadlog', LoadSessionId);

        QueryList1.Session.Commit;

        AddLog(Format('����� �������: %d',             [TotalDecl]),                         Log4d.Info);
        AddLog(Format('��������� ��� ����o�: %d',      [TotalDecl - BadOthers - NotLoaded]), Log4d.Info);
        AddLog(Format('��������� � ��������: %d',      [BadOthers]),                         Log4d.Info);
        AddLog(Format('�� ��������� ��-�� ����o�: %d', [NotLoaded]),                         Log4d.Info);
        AddLog(Format('����� �������� %s',             [TimeToStr(Now - StartTime)]),        Log4d.Info);
        SetAppRegistryValue('LastTPODir', cmbxPath.Text);
        SetAppRegistryValue('LastTPOChoice', btnDirectory.Checked);
        PageControl.SelectNextPage(True, True);
      except
        QueryList1.Session.Rollback;
        PageControl.ActivePage := tabGeneral;
        raise;
      end;
    except
      on E: EfdcException do begin
        AddLog('�������� ��� ��������. ', E.UserMessage + '. ' + E.UserHint, Log4d.Error);
        raise;
      end;
      on E: Exception do begin
        AddLog('�������� ��� ��������. ', ParseError(E.Message), Log4d.Error);
        raise;
      end;
    end;
  finally
    dxLayoutControl1Group8.Enabled := True;
    actNext.Enabled := True;
    actPrev.Enabled := True;
    actOk.Enabled := True;
    // ��������� ���������� �� ���������� ���. �������������
    MainData.pkgCommon.PackageName := 'p_Params';
    MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['Y'] );
  end;
end;

procedure TTPOLoaderForm.tabReportShow(Sender: TObject);
begin
  inherited;
  edtReport.Lines.Assign(edtLoadReport.Lines);
end;

procedure TTPOLoaderForm.btnDirectoryClick(Sender: TObject);
begin
  inherited;
  lciDirectory.Enabled := True;
  lciFile.Enabled := False;
end;

procedure TTPOLoaderForm.btnArchiveClick(Sender: TObject);
begin
  inherited;
  lciDirectory.Enabled := False;
  lciFile.Enabled := True;
end;

procedure TTPOLoaderForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  dlgOpenFile.Filter := GetUnArchiveFilter;
  if dlgOpenFile.Execute then
     edtFileName.Text := dlgOpenFile.FileName;
end;

procedure TTPOLoaderForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
      edtReport.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TTPOLoaderForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.CurrentLink.Print(True, nil);
end;

procedure TTPOLoaderForm.cmbxPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Dir: string;
begin
  inherited;
  Dir := cmbxPath.Text;
  if SelectDirectoryEx('', '', Dir) then
        cmbxPath.Text := Dir;
end;

procedure TTPOLoaderForm.tabReportPrevExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabGeneral;
end;

procedure TTPOLoaderForm.AddLog(const MessText: String;
  LogLevel: TLogLevel; AddToScreen, AddToLog, ChangeLastLine: Boolean);
begin
  if AddToLog then
    TLogLogger.GetRootLogger.Log(LogLevel, MessText);
  if AddToScreen then
    if ChangeLastLine then
      edtLoadReport.Lines[edtLoadReport.Lines.Count - 1] := MessText
    else
      edtLoadReport.Lines.Add(MessText);
end;

procedure TTPOLoaderForm.AddLog(const HeaderText, MessText: String;
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

function TTPOLoaderForm.ParseError(const Error: String): String;
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
  RegisterClass(TTPOLoaderForm);

end.
