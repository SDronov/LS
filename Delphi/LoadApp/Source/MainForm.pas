unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, AppEvnts, Oracle, cxLookAndFeelPainters,
  dxLayoutLookAndFeels, ImgList, ActnList, dxLayoutControl, cxButtons,
  cxControls, ExtCtrls, Menus, dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxDockControl, fdcCustomGridFrm, dxBar, cxClasses, cxSplitter,
  cxGraphics, cxContainer, cxEdit, cxLabel, dxStatusBar, fdcOracleSession;

type
  TAppParams = class
  private
    FAppPath: String;
  public
    property AppPath: String read FAppPath write FAppPath;
  end;


  TMainMDIForm = class(TForm)
    XPManifest1: TXPManifest;
    ApplicationEvents1: TApplicationEvents;
    ActionList1: TActionList;
    ActionsImages: TImageList;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutOfficeLookAndFeel1: TdxLayoutOfficeLookAndFeel;
    LeftDockSite: TdxDockSite;
    barNavigator: TdxNavBar;
    bngPO: TdxNavBarGroup;
    bniDocPackpays: TdxNavBarItem;
    dxBarManager1: TdxBarManager;
    btnClear: TdxBarButton;
    btnExit: TdxBarButton;
    btnCancel: TdxBarButton;
    actChangeImportDate: TAction;
    bniShowRestUFK: TdxNavBarItem;
    bniShowRestCustoms: TdxNavBarItem;
    actClear: TAction;
    actCancel: TAction;
    actExit: TAction;
    actExport: TAction;
    actImport: TAction;
    btnExport: TdxBarButton;
    btnImport: TdxBarButton;
    actShowErrors: TAction;
    bniShowErrors: TdxNavBarItem;
    cxSplitter1: TcxSplitter;
    bngErrors: TdxNavBarGroup;
    StatusBar: TdxStatusBar;
    StatusBarContainer0: TdxStatusBarContainerControl;
    lblHint: TcxLabel;
    StatusBarContainer3: TdxStatusBarContainerControl;
    imgUser: TImage;
    dxBarButton1: TdxBarButton;
    actMerge: TAction;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bniDocPackpaysClick(Sender: TObject);
    procedure actChangeImportDateExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bniShowRestUFKClick(Sender: TObject);
    procedure bniShowRestCustomsClick(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure actShowErrorsExecute(Sender: TObject);
    procedure actMergeExecute(Sender: TObject);
//    procedure cxButton6Click(Sender: TObject);
  private
    { Private declarations }

//    procedure ProgressFormClosed(var Msg: TMessage); message CM_Progress_Windows_Closed;
    function IsImportMode: Boolean;
    procedure NavigateForm(var NewForm; AClass: TCustomFormClass);
    procedure ShowConnectionInfo;
    function GetSession: TfdcOracleSession;
  protected
    { Вывести стандартное окно авторизации пользователя }
    function ShowLogon: boolean; virtual;
    { загрузить/сохранить настройки соединения }
    procedure LoadLogon; virtual;
    procedure SaveLogon; virtual;
    procedure CheckMoveAbility;
    procedure SetVisibleAction;
  public
    { Public declarations }
    AppParams: TAppParams;
    property Session: TfdcOracleSession read GetSession;
  end;

var
  MainMDIForm: TMainMDIForm;

implementation

uses
  Registry, fdcUtils, ChangeImportDateFrm, fdcMessages, fdcExceptions,
  fdcSplashFrm, AppInf, fdcCustomLogOnFrm, fdcOraLogOnFrm, DLWizardFrm, DataDM,
  BadPaymentFrm, UFKPaymentsGridFrm, PaysUpGridFrm, ExportWizardFrm,
  ImportWizardFrm, ImportErrorsFrm, MergeFrm;

{$R *.dfm}

const
  SShowLogon = 'SHOWLOGON';
  SShowSplash = 'SHOWSPLASH';
  SUser = 'USER';
  SPassword = 'PASSWORD';
  SSchema = 'SCHEMA';
  SServer = 'SERVER';



procedure TMainMDIForm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  ErrorDlg(E);
end;

procedure TMainMDIForm.FormCreate(Sender: TObject);
begin
  { продолжить обработку в случае успешной авторизации }
  LoadLogon;
  if ShowLogon then
  begin
    SaveLogon;
    inherited;
    if IsImportMode then MainData.RegisterEvent('OBS','00001');
  end
  { либо выйти из приложения }
  else
  begin
    Application.ShowMainForm := False;
    PostQuitMessage(0);
    Exit;
  end;
  AppParams := TAppParams.Create;
  AppParams.FAppPath := ExtractFilePath(Application.ExeName);
end;

procedure TMainMDIForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(AppParams);
end;

procedure TMainMDIForm.FormShow(Sender: TObject);
begin
  HideSplashScreen;

  if IsImportMode then
    CheckMoveAbility;

  SetVisibleAction;
  ShowConnectionInfo;
end;

procedure TMainMDIForm.LoadLogon;
var
  Reg: TRegistry;
  KeyOpened: boolean;
  Session: TfdcOracleSession;
begin
  Session := GetAppSession;
  Reg := TRegistry.Create;
  try
    { set root key }
    Reg.RootKey := HKEY_CURRENT_USER;

    { open params key }
    KeyOpened := Reg.OpenKey(GetAppRegistryKey, False);

    Session.LogonUsername := '';
    if KeyOpened and Reg.ValueExists(SUser) then
      Session.LogonUsername := Trim(Reg.ReadString(SUser));

    Session.LogonPassword := '';
    if KeyOpened and Reg.ValueExists(SPassword) then
      Session.LogonPassword := Trim(Reg.ReadString(SPassword));

    Session.DefSchemeName := Session.LogonUsername;
    if KeyOpened and Reg.ValueExists(SSchema) then
      Session.DefSchemeName := Trim(Reg.ReadString(SSchema));

    Session.LogonDatabase := '';  
    if KeyOpened and Reg.ValueExists(SServer) then
      Session.LogonDatabase := Trim(Reg.ReadString(SServer));
  finally
    Reg.Free;
  end;
end;

procedure TMainMDIForm.SaveLogon;
var
  Reg: TRegistry;
  Session: TfdcOracleSession;
begin
  Session := GetAppSession;
  Reg := TRegistry.Create;
  try
    { set root key }
    Reg.RootKey := HKEY_CURRENT_USER;
    { open params key }
    if Reg.OpenKey(GetAppRegistryKey, True) then
    begin
      { write param values }
      Reg.WriteString(SUser, Trim(Session.LogonUsername));
      Reg.WriteString(SSchema, Trim(Session.DefSchemeName));
      Reg.WriteString(SServer, Trim(Session.LogonDatabase));
    end;
  finally
    Reg.Free;
  end;
end;

function TMainMDIForm.ShowLogon: boolean;
begin
  { вывести стандартное окно авторизации }
  Result := (GetAppSession <> nil) and Logon(GetAppSession);
end;

procedure TMainMDIForm.NavigateForm(var NewForm; AClass: TCustomFormClass);
begin
  if TfdcCustomGridForm(NewForm) = nil then
  begin
     Application.CreateForm(AClass, NewForm);
//     TfdcCustomGridForm(NewForm).ManualDock(Panel2, nil, alClient);
//     TfdcCustomGridForm(NewForm).Align := alClient;
     TfdcCustomGridForm(NewForm).FormStyle := fsMDIChild;
  end;
  TfdcCustomGridForm(NewForm).Show;
  TfdcCustomGridForm(NewForm).BringToFront;
//  TfdcCustomGridForm(NewForm).RefreshData;
//  StaticText1.Caption := TfdcCustomGridForm(NewForm).Caption;
end;

procedure TMainMDIForm.bniDocPackpaysClick(Sender: TObject);
begin
  NavigateForm(BadPaymentForm, TBadPaymentForm);
end;

procedure TMainMDIForm.CheckMoveAbility;
var
  vMoveDate : TDateTime;
begin
  vMoveDate := MainData.GetSystemValue('MOVING_DATE', rvDateTime, 0);
  if (vMoveDate <> 0) and (vMoveDate < MainData.GetServerDate) then
    begin
      InfoDlg(FormatDateTime('Функция переноса остатков запрещена, так как перенос был уже осуществлен dd.mm.yy !', vMoveDate));
      actImport.Enabled := False;
    end;
end;

procedure TMainMDIForm.actChangeImportDateExecute(Sender: TObject);
begin
  ChangeImportDateFrm.ChangeDate(MainData.Session);
end;

procedure TMainMDIForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if IsImportMode then
    MainData.RegisterEvent('OBS','00002');
end;

procedure TMainMDIForm.bniShowRestUFKClick(Sender: TObject);
begin
  NavigateForm(UFKPaymentsGridForm, TUFKPaymentsGridForm);
end;

procedure TMainMDIForm.bniShowRestCustomsClick(Sender: TObject);
begin
  NavigateForm(PaysUpGridForm, TPaysUpGridForm);
end;

function TMainMDIForm.IsImportMode: Boolean;
begin
  Result := MainData.IsImportMode;
end;

procedure TMainMDIForm.SetVisibleAction;
  var
    i : Integer;
begin
  if (ParamCount > 0) and (ParamStr(1) = '/ADM_MODE') then
  begin
    actClear.Visible  := IsImportMode;
    actCancel.Visible := IsImportMode;
  end;
  actExport.Visible := not IsImportMode;
  actImport.Visible := IsImportMode;
  for i := 0 to barNavigator.Items.Count - 1 do
    if barNavigator.Items[i].Visible then
      barNavigator.Items[i].Enabled := IsImportMode;
end;

procedure TMainMDIForm.actClearExecute(Sender: TObject);
begin
  if ConfirmDlg('Подтвердите удаление данных из буферной области',
   'ВНИМАНИЕ: Все перенесенные данные (ГТД и платежные документы) будут также удалены') = mrNo then
   begin
      Exit;
   end;
   FreeAndNil(BadPaymentForm);
//   StaticText1.Caption := '';

   MainData.sqlClear.Exec;
   MainData.Session.Commit;
end;

procedure TMainMDIForm.actCancelExecute(Sender: TObject);
begin
  if ConfirmDlg('Подтвердите удаление всех перенесеных данных',
   'ВНИМАНИЕ: Все перенесенные данные (ГТД и платежные документы) будут удалены, данные из буферной'
   +' удаляться не будут') = mrNo then
   begin
      Exit;
   end;
   FreeAndNil(BadPaymentForm);
   MainData.sqlRollback.Exec;
   MainData.Session.Commit;
end;

procedure TMainMDIForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainMDIForm.actExportExecute(Sender: TObject);
begin
  with TExportWizardForm.Create(Application) do
  try
    ShowModal;
  finally
     Free;
  end;
end;

procedure TMainMDIForm.actImportExecute(Sender: TObject);
begin
   with TImportWizardForm.Create(Application) do
  try
    ShowModal;
  finally
     Free;
  end;
end;

procedure TMainMDIForm.actShowErrorsExecute(Sender: TObject);
begin
  NavigateForm(ImportErrorsForm, TImportErrorsForm);
end;

procedure TMainMDIForm.ShowConnectionInfo;
begin
  { отобразить информацию о соединении в строке состояния }
  imgUser.Visible := Assigned(Session) and Session.Connected;
  if imgUser.Visible then
    begin
     imgUser.Hint := 'Пользователь: ' + Session.LogonUsername + '@' + Session.LogonDatabase;
     Self.Caption := 'Перенос начальных остатков. '+ imgUser.Hint;
   end;
end;

function TMainMDIForm.GetSession: TfdcOracleSession;
begin
  Result := MainData.Session;
end;

procedure TMainMDIForm.actMergeExecute(Sender: TObject);
var
  Frm : TForm;
begin
  Frm:=TMergeForm.Create(nil);
  try
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

end.
