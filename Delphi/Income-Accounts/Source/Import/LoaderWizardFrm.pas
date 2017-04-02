unit LoaderWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, cxLookAndFeelPainters, cxMemo, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxImage, ExtCtrls,
  dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  IaccLoader, AppEvnts, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPSTextLnk, dxPScxEditorLnks, QueryList, Oracle;

type
  TMessageEvent = procedure (const S: string) of object;

  TNSILoaderForm = class(TBaseWizardForm)
    tabProcess: TcxTabSheet;
    dxLayoutControl2Item1: TdxLayoutItem;
    edtFileName: TcxButtonEdit;
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
    dlgOpen: TOpenDialog;
    ApplicationEvents1: TApplicationEvents;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    actSave: TAction;
    actPrint: TAction;
    dxLayoutControl4Item3: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl4Item4: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutControl4Group1: TdxLayoutGroup;
    dxComponentPrinter1: TdxComponentPrinter;
    plReportLink: TcxMemoReportLink;
    SaveDialog1: TSaveDialog;
    QueryList1: TQueryList;
    sqlStat: TsqlOp;
    sqlStart: TsqlOp;
    sqlGetErrors: TsqlOp;
    qryGetErrors: TOracleQuery;
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure btnStopClick(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  published
    procedure  tabGeneralNextExecute(Sender: TObject);
    procedure  tabResultPrevExecute(Sender: TObject);
  private
    { Private declarations }
    FLoader: TIaccLegacyLoader;
    FErrorCodes : array of Integer; // список ошибок, для которых была нажата кнопка "Пропускать"

    procedure DoLoad;
    procedure OnFinishImport(Sender: TObject);
    procedure OnMessage(const S: string);
    procedure SetLoaderClass(AClass: TIaccLegacyLoaderClass; const Title: String);
    procedure DoOnError(Query: TOracleQuery; Index,
    ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
  public
    destructor Destroy; override;
    { Public declarations }
  end;

 procedure  ExecuteLoader(AClass: TIaccLegacyLoaderClass; const Title: String);

implementation

uses fdcCustomTabDlgFrm, MainDm, fdcMessages, fdcExceptions, StrUtils;

{$R *.dfm}

procedure  ExecuteLoader(AClass: TIaccLegacyLoaderClass; const Title: String);
var
  F: TNSILoaderForm;
begin
  F := TNSILoaderForm.Create(nil);
  try
    if AClass.TaskName <> '' then
       MainData.CheckTask(AClass.TaskName, True);
    F.SetLoaderClass(AClass, Title);
    F.ShowModal;
  finally
    F.Free;
  end;
end;

type
   TLoaderThread = class(TThread)
   private
     FFileName: string;
     FLoader: TIaccLegacyLoader;
     FQuery: TOracleQuery;
     FIndex: integer;
     FErrorCode: integer;
     FErrorMessage: string;
     FContinue: boolean;
     FErrorHandler: TArrayErrorEvent;
     FOnMessage: TMessageEvent;
     procedure ShowException;
     procedure PassError;
   protected
     procedure Execute; override;
     procedure DoOnError(Sender: TOracleQuery; Index,
      ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
   end;

{ TNSILoaderForm }

destructor TNSILoaderForm.Destroy;
begin
  FLoader.Free;
  inherited;
end;

procedure TNSILoaderForm.tabGeneralNextExecute(Sender: TObject);
 procedure  CheckFileName;
 begin
   if not FileExists(edtFileName.Text) then
      raise Exception.CreateFmt('<<Файл не найден>>.<<Проверьте правильность имени файла>>'#13'Файл не найден: %s', [edtFileName.Text]);
 end;
begin
  CheckFileName;
  DoLoad;
end;

procedure TNSILoaderForm.DoLoad;
var
  Thread: TLoaderThread;
begin
  EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  dxLayoutControl1Group8.Visible := False;
  // Установка разрешения на обновления мат. представления
  MainData.pkgCommon.PackageName := 'p_Params';
  MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['N'] );
  try
    cxMemo1.Lines.Clear;
    lblTotal.Caption := '';
    lblPostion.Caption := '';
    barPos.Position := 0;
    PageControl.ActivePageIndex := 1;
//    FLoader.OnProgress := OnProgress;
//    FLoader.OnFinishImport := OnFinishImport;
    FLoader.OnMessage := OnMessage;
    Thread := TLoaderThread.Create(True);
    Thread.FreeOnTerminate := True;
    Thread.FLoader := FLoader;
    Thread.FErrorHandler := DoOnError;
    Thread.FOnMessage := OnMessage;
    Thread.FFileName := edtFileName.Text;
    Thread.OnTerminate := OnFinishImport;
    sqlStart.Exec;
    OnMessage(Format('%s Начало загрузки', [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    try
      Thread.Resume;
    except
      Application.HandleException(Self);
      OnFinishImport(Self);
    end;
  except
    EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or MF_ENABLED);
    dxLayoutControl1Group8.Visible := True;
    PageControl.ActivePage := tabGeneral;
    raise;
  end;
end;

procedure TNSILoaderForm.tabResultPrevExecute(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

procedure TNSILoaderForm.OnFinishImport(Sender: TObject);
var
  Query : TOracleQuery;
  vCLOB : TLOBLocator;
begin
  EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or MF_ENABLED);
  dxLayoutControl1Group8.Visible := True;

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
  OnMessage(Format(' Изменено  : %s', [Query.FieldAsString('modify_count')]));
  OnMessage(Format(' Ошибок    : %s', [Query.FieldAsString('error_count')]));
  OnMessage(Format(' Повтор/старые : %s', [Query.FieldAsString('skip_count')]));
  OnMessage(Format('%s Загрузка завершена', [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
  // Установка разрешения на обновления мат. представления
  MainData.pkgCommon.PackageName := 'p_Params';
  MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['Y'] );
  except
    on e:Exception do
      begin
        OnMessage(ifthen((pos('ORA-00942',e.Message) > 0),'ПРИВИЛЕГИЙ НЕДОСТАТОЧНО',e.Message));
      end;
  end;
  PageControl.ActivePageIndex := 2;
end;

procedure TNSILoaderForm.OnMessage(const S: string);
begin
  cxMemo1.Lines.Add(S);
end;

procedure TNSILoaderForm.edtFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if dlgOpen.Execute then
     edtFileName.Text := dlgOpen.FileName;
end;

procedure TNSILoaderForm.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  inherited;
  lblTotal.Caption := IntToStr(FLoader.Total);
  lblPostion.Caption := IntToStr(FLoader.Position);
  barPos.Position := FLoader.Position;
  barPos.Properties.Max := FLoader.Total;
end;

procedure TNSILoaderForm.SetLoaderClass(AClass: TIaccLegacyLoaderClass; const Title: String);
begin
  FLoader := AClass.Create;
  dlgOpen.Filter := 'Файлы ' + AClass.FileName + '|' + AClass.FileName;
  Caption := 'Загрузка справочника "' + Title +'"';
end;


procedure TNSILoaderForm.DoOnError(Query: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
var
 UserMessage, UserHint : String;
 E                     : Exception;
 AskResult             : TModalResult;
 i                     : Integer;
 Ignore                : Boolean;
begin
  Ignore := False;
  for i := 0 to High(FErrorCodes) do
    if ErrorCode = FErrorCodes[i] then begin
      Ignore := True;
      Break;
    end;
  E := Exception.Create(ErrorMessage);
  try
    ParseError(E, UserMessage, UserHint);
    OnMessage(UserMessage + ': ' + UserHint);
  finally
    E.Free;
  end;
  if not Ignore then begin
    AskResult := MessageDlg(UserMessage, UserHint + chr(10) + 'Продолжить загрузку?',
                            ErrorMessage, mtConfirmation, [mbYes, mbNo, mbYesToAll], 0);
    if (AskResult = mrNo) then
      Continue := False
    else if AskResult = mrYesToAll then begin
      SetLength(FErrorCodes, Length(FErrorCodes) + 1);
      FErrorCodes[High(FErrorCodes)] := ErrorCode;
    end;
  end;
end;

{ TLoaderThread }

procedure TLoaderThread.ShowException;
begin
  FOnMessage(ifthen((pos('ORA-00942',FErrorMessage) > 0),'ПРИВИЛЕГИЙ НЕДОСТАТОЧНО',FErrorMessage));
end;

procedure TLoaderThread.Execute;
begin
  inherited;
  try
    FLoader.OnError := DoOnError;
    FLoader.Load(FFileName);
  except
    on e:Exception do
      begin
        FErrorMessage := e.Message;
        Self.Synchronize(ShowException);
      end;
  end;
end;

procedure TNSILoaderForm.btnStopClick(Sender: TObject);
begin
  inherited;
  if FLoader <> nil then
  begin
    FLoader.Terminate;
  end;
end;

procedure TNSILoaderForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
      cxMemo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TNSILoaderForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.CurrentLink.Print(True, nil);
end;

procedure TLoaderThread.DoOnError(Sender: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
begin
  FQuery := Sender;
  FIndex := Index;
  FErrorCode := ErrorCode;
  FErrorMessage := ErrorMessage;
  FContinue := Continue;
  Synchronize(PassError);
  Continue := FContinue;
end;

procedure TLoaderThread.PassError;
begin
 if assigned(FErrorHandler) then
 begin
   FErrorHandler(FQuery, FIndex, FErrorCode, FErrorMessage, FContinue);
 end;
end;

end.
