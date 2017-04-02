unit DLWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, cxLookAndFeelPainters, cxMemo, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxImage, ExtCtrls,
  dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  AppEvnts, Menus, ComCtrls, ShlObj, cxShellCommon,
  cxDropDownEdit, cxShellComboBox, InLoader, cxGraphics, ztvregister,
  ztvBase, ztvUnRar, Oracle, QueryList, fdcCustomGridFrm, cxGridTableView;

type
 TLoadMode = ( lmDocPackPayments = 7, lmRestCustomsPays = 8 );
   //lmDocPackPayments - Выписка
   //lmRestCustomsPays - ПП по остаткам тпможни

   
  TDLLoaderForm = class(TBaseWizardForm)
    tabProcess: TcxTabSheet;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    dxLayoutControl3Item1: TdxLayoutItem;
    barPos: TcxProgressBar;
    dxLayoutControl3Item2: TdxLayoutItem;
    lblTotal: TcxLabel;
    dxLayoutControl3Item3: TdxLayoutItem;
    lblPostion: TcxLabel;
    tabResult: TcxTabSheet;
    dxLayoutControl3Item4: TdxLayoutItem;
    btnStop: TcxButton;
    dxLayoutControl3Group1: TdxLayoutGroup;
    dxLayoutControl3Item5: TdxLayoutItem;
    cxLabel5: TcxLabel;
    dxLayoutControl4Group_Root: TdxLayoutGroup;
    dxLayoutControl4: TdxLayoutControl;
    dxLayoutControl4Item1: TdxLayoutItem;
    cxLabel6: TcxLabel;
    dxLayoutControl4Item2: TdxLayoutItem;
    cxMemo1: TcxMemo;
    ApplicationEvents1: TApplicationEvents;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    edtFileName: TcxButtonEdit;
    dxLayoutControl2Item4: TdxLayoutItem;
    dlgOpenFile: TOpenDialog;
    UnRar1: TUnRar;
    QueryList1: TQueryList;
    sqlStat: TsqlOp;
    sqlStart: TsqlOp;
    sqlGetErrors: TsqlOp;
    qryGetErrors: TOracleQuery;
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tabResultShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabResultPrevExecute(Sender: TObject);
    procedure tabResultPrevUpdate(Sender: TObject);
  private
    { Private declarations }
    FLoader: TInLoader;
    FMessages: TStrings;
    FLoadMode: TLoadMode;
    FGridForm: TfdcCustomGridForm;

    procedure DoLoadFile;
    procedure DoImportData(ADisableControls : Boolean = True);
    procedure DoImportPO(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure OnFinishLoad(Sender: TObject);
    procedure OnMessage(const S: string);
  public

    destructor Destroy; override;
    property LoadMode : TLoadMode read FLoadMode write FLoadMode;
    property GridForm: TfdcCustomGridForm read FGridForm write FGridForm;
  end;

implementation

uses fdcCustomTabDlgFrm, fdcMessages, DataDM, FileCtrl,
  ActiveX, DBFLoader, math, cxGridDBBandedTableView;

{$R *.dfm}

type
  TLoaderThread = class(TThread)
  private
    FLoader: TInLoader;
  protected
    procedure Execute; override;
  end;

{ TLoaderThread }

procedure TLoaderThread.Execute;
begin
  inherited;
//  try
    FLoader.DoLoad;
//  except
//    Synchronize();
//  end;
end;

{ TDLLoaderForm }

destructor TDLLoaderForm.Destroy;
begin
  FLoader.Free;
  inherited;
end;

procedure TDLLoaderForm.tabGeneralNextExecute(Sender: TObject);
begin
  if FileExists(edtFileName.Text) then
    DoLoadFile
  else
    ErrorDlg(Exception.CreateFmt('Файл [%s] не найден!',[edtFileName.Text]));
end;

procedure TDLLoaderForm.DoLoadFile;
var
  Thread: TLoaderThread;
begin
  EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
    MF_GRAYED);
  dxLayoutControl1Group8.Visible := False;
  try
    FMessages.Clear;
    lblTotal.Caption := '';
    lblPostion.Caption := '';
    barPos.Position := 0;
    PageControl.ActivePage := tabProcess;
    FLoader := TDBFLoader.Create(edtFileName.Text, Ord(FLoadMode) );
    FLoader.OnMessage := OnMessage;
    Thread := TLoaderThread.Create(True);
    Thread.FreeOnTerminate := True;
    Thread.FLoader := FLoader;
    Thread.OnTerminate := OnFinishLoad;
    sqlStart.Exec;
    OnMessage(Format('%s Начало загрузки',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    Thread.Resume;
  finally
    //    Close;
  end;
end;

procedure TDLLoaderForm.tabResultPrevExecute(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

procedure TDLLoaderForm.DoImportData(ADisableControls : Boolean = True);
var
  Query : TOracleQuery;
  vCnt, vCntErr : Integer;

  procedure DoImportAll;
  var
    LastDate: TDateTime;
    cntTotal, cntPos : Integer;
  begin
    MainData.qryConvert.SetVariable('pdate', Date);
    MainData.qryConvert.SetVariable('load_mode', Ord(FLoadMode));
    MainData.qryConvert.Execute;
    LastDate := 0;
    MainData.pkgCommon.PackageName := 'p_Loader';
    barPos.Properties.Min := 0;
    cntTotal := 0;
    while MainData.qryConvert.ThreadIsRunning do
    begin
      if Now - LastDate > 1 / SecsPerDay then
      begin
        if cntTotal = 0 then
          cntTotal := MainData.pkgCommon.CallIntegerFunction('GetTotal', []);
        cntPos := MainData.pkgCommon.CallIntegerFunction('GetProgress', []);
        lblTotal.Caption := IntToStr(cntTotal);
        lblPostion.Caption := IntToStr(cntPos);
        barPos.Properties.Max := cntTotal;
        barPos.Position := cntPos;
        LastDate := Now;
      end;
      Application.HandleMessage;
    end;
  end;

begin

  if ADisableControls then
    begin
      dxLayoutControl1Group8.Visible := False;
      EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
        MF_DISABLED or MF_GRAYED);
    end;
  try
    sqlStart.Exec;
    cxLabel5.Caption := 'Обработка данных...';
    OnMessage(Format('%s Обработка данных...',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    UpdateWindow(Handle);
    if GridForm = nil then
      DoImportAll
    else
      GridForm.IterateRecords(doImportPO, True, False);

    MainData.Session.Commit;

    //cxLabel5.Caption := 'Генерация отчета...';
    UpdateWindow(Handle);

    if GridForm = nil then
    begin
      Query := MainData.sqlGetErrors.Query;

      try
        while not Query.Eof do
        begin
          OnMessage(Format('Ошибки при загрузке %s', [Query.FieldAsString(0)]));
          OnMessage(Query.FieldAsString(1));
          Query.Next;
        end;
      finally
       null;
      end;
    end;
    MainData.pkgCommon.PackageName := 'p_Loader';
    vCnt    := MainData.pkgCommon.CallIntegerFunction('GetTotal', []);
    vCntErr := MainData.pkgCommon.CallIntegerFunction('GetErrorCount', []);
    OnMessage(Format('Всего записей : %d', [vCnt]));
    OnMessage(Format(' Добавлено : %d', [vCnt - vCntErr]));
    OnMessage(Format(' Ошибок    : %d', [vCntErr]));
    OnMessage(Format('%s Обработка данных завершена',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));

    if ADisableControls then
      begin
        EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
          MF_ENABLED);
        dxLayoutControl1Group8.Visible := True;
      end;

    PageControl.ActivePage := tabResult;
  finally
    if ADisableControls then
      begin
        dxLayoutControl1Group8.Visible := True;
        EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
          MF_ENABLED);
      end;
  end;

end;

procedure TDLLoaderForm.OnFinishLoad(Sender: TObject);
var
  Query : TOracleQuery;
  vCLOB : TLOBLocator;
  vCnt  : Integer;
begin
  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      Application.ShowException(Exception(TThread(Sender).FatalException));
      OnMessage('Фатальная ошибка :');
      OnMessage(Exception(TThread(Sender).FatalException).Message);
    end;
  end;
  FreeAndNil(FLoader);
  dxLayoutControl3Group1.Visible := False;
  try

    try
      Query := sqlStat.Query;

      if Query.FieldAsInteger('error_count') > 0 then
        begin
          OnMessage('Ошибки:');
          vCLOB := TLOBLocator.Create(qryGetErrors.Session, otCLOB);
          Try
            qryGetErrors.SetComplexVariable('result', vCLOB);
            qryGetErrors.Execute;
            if not vCLOB.IsNull then
              OnMessage(vCLOB.AsString);
          finally
            vCLOB.Free;
          end;
          if Query.FieldAsInteger('error_count') > 1000 then
            OnMessage('  Очень много ошибок. В журнал выведены первые 1000!');
        end;
      OnMessage(Format('Всего записей : %s', [Query.FieldAsString('done')]));
      OnMessage(Format(' Добавлено : %s', [Query.FieldAsString('new_count')]));
      OnMessage(Format(' Ошибок    : %s', [Query.FieldAsString('error_count')]));
      OnMessage(Format(' Повтор/старые : %s', [Query.FieldAsString('skip_count')]));
      OnMessage(Format('%s Загрузка завершена', [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    except
      on e:Exception do
        begin
          OnMessage(e.Message);
        end;
    end;
    vCnt := Query.FieldAsInteger('new_count');
    if vCnt > 0 then // если есть загруженные записи, то делаем импорт
      DoImportData(False);

    EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
      MF_ENABLED);
    dxLayoutControl1Group8.Visible := True;
    //Screen.Cursor := crHourGlass;
  
    PageControl.ActivePage := tabResult;
  finally
    dxLayoutControl3Group1.Visible := True;
  end;
end;

procedure TDLLoaderForm.OnMessage(const S: string);
begin
  FMessages.Add(S);
end;

procedure TDLLoaderForm.edtFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if dlgOpenFile.Execute then
     edtFileName.Text := dlgOpenFile.FileName;
end;

procedure TDLLoaderForm.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  inherited;
  if FLoader <> nil then
  begin
    Done := False;
    lblTotal.Caption := IntToStr(FLoader.Total);
    lblPostion.Caption := IntToStr(FLoader.Position);
    barPos.Position := FLoader.Position;
    barPos.Properties.Max := FLoader.Total;
    cxLabel5.Caption := FLoader.Status;
  end;
end;


procedure TDLLoaderForm.btnStopClick(Sender: TObject);
begin
  inherited;
  if FLoader <> nil then
  begin
    FLoader.Terminate;
  end;
end;

procedure TDLLoaderForm.tabResultPrevUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := False;
end;

procedure TDLLoaderForm.FormCreate(Sender: TObject);
begin
  inherited;
  FMessages := TStringList.Create;
end;

procedure TDLLoaderForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FMessages.Free;
end;


procedure TDLLoaderForm.DoImportPO(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  MainData.qryAddLegPay.SetVariable('NNN',
    TcxGridDBBandedTableView(AGridTableView).DataController.DataSet['NNN']);
  MainData.qryAddLegPay.Execute;
  lblTotal.Caption := IntToStr(ACount);
  while MainData.qryAddLegPay.ThreadIsRunning do
  begin
    Application.HandleMessage;
  end;
  barPos.Properties.Min := 0;
  barPos.Properties.Max := ACount;
  barPos.Position := AIndex;
  lblPostion.Caption := IntToStr(AIndex);

  MainData.qryError.SetVariable('NNN',
    TcxGridDBBandedTableView(AGridTableView).DataController.DataSet['NNN']);
  MainData.qryError.Execute;
  while not MainData.qryError.Eof do
  begin
    OnMessage(Format('Ошибки при загрузке %s', [MainData.qryError.FieldAsString(0)]));
    OnMessage(MainData.qryError.FieldAsString(1));
    MainData.qryError.Next;
  end;
  MainData.qryError.Close;
end;

procedure TDLLoaderForm.tabResultShow(Sender: TObject);
begin
  cxMemo1.Lines.Assign( FMessages );
end;

procedure TDLLoaderForm.FormShow(Sender: TObject);
begin
  inherited;
  if Assigned(FGridForm) then
    begin
      PageControl.ActivePage := tabProcess;
      UpdateWindow(Handle);
      DoImportData;
    end;
end;

end.

