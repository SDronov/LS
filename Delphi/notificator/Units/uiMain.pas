unit uiMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ActnList, ShellAPI,
  uOptions, StdCtrls, Registry,
  uConsts, uiMessageForm, Menus, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Buttons;

type
  TMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ActionList1: TActionList;
    acQuit: TAction;
    acOptions: TAction;
    acShow: TAction;
    acHide: TAction;
    Timer: TTimer;
    PM: TPopupMenu;
    pmHideShow: TMenuItem;
    N21: TMenuItem;
    pmStartStop: TMenuItem;
    acStartScan: TAction;
    acStopScan: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    acMinimize: TAction;
    PC: TPageControl;
    tsState: TTabSheet;
    tsOptions: TTabSheet;
    Label1: TLabel;
    lbStarted: TLabel;
    lbQweryStatus: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    lbLastQwery: TLabel;
    lbLastNotify: TLabel;
    Label3: TLabel;
    cbAutoRun: TCheckBox;
    cbAutoStart: TComboBox;
    Label10: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label8: TLabel;
    edServer: TEdit;
    edPort: TcxSpinEdit;
    Label9: TLabel;
    Label11: TLabel;
    cbPassive: TComboBox;
    edUser: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edPassword: TEdit;
    edDirectory: TEdit;
    Label14: TLabel;
    btStart: TButton;
    edInterval: TcxSpinEdit;
    mntrNetwork: TRadioButton;
    mntrFTP: TRadioButton;
    edPath: TEdit;
    sbPath: TSpeedButton;
    edFileMask: TEdit;
    Label6: TLabel;
    procedure acQuitExecute(Sender: TObject);
    procedure acOptionsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure acStartScanExecute(Sender: TObject);
    procedure acStopScanExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure acHideExecute(Sender: TObject);
    procedure acMinimizeExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tsOptionsShow(Sender: TObject);
    procedure cbAutoStartChange(Sender: TObject);
    procedure edIntervalPropertiesChange(Sender: TObject);
    procedure edServerChange(Sender: TObject);
    procedure edPortPropertiesChange(Sender: TObject);
    procedure cbPassiveChange(Sender: TObject);
    procedure edUserChange(Sender: TObject);
    procedure edPasswordChange(Sender: TObject);
    procedure edDirectoryChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure mntrNetworkClick(Sender: TObject);
    procedure mntrFTPClick(Sender: TObject);
    procedure sbPathClick(Sender: TObject);
    procedure edPathChange(Sender: TObject);
    procedure edFileMaskChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAutoRunClick(Sender: TObject);
  private
    fLastStatus: string;
    fFtpAvailible: boolean;
    fStartTime, fLastQwery, fLastNotify: TDateTime;
    fFormatSettings: TFormatSettings;

    fIconData:TNotifyIconData;

    fOptions: TOptions;

    procedure showOptions;

    function FTP_checkFiles: TStrings;
    function NET_checkFiles: TStrings;

    procedure whenFilesExists(const aFiles: TStrings);
    procedure notificationConfirmed(var Message: TMessage);  message confirm_notification;

    procedure startScan;
    procedure stopScan;

    procedure saveOptions;
    procedure setEditors;
    procedure disableOnChange;
    procedure enableOnChange;

    procedure visibleInversion;
    procedure showMain;
    procedure hideMain;

    procedure checkFiles;
    function isStartScanEnabled: boolean;

  protected
    procedure ControlWindow(var Msg: TMessage); message WM_SYSCOMMAND;
    procedure WndProc(var Msg: TMessage); override;

    procedure updateStatus;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var  Main: TMain;

implementation

uses uFTP;

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin
 inherited;
 fStartTime:=  now;
 fLastQwery:=  0;
 fLastNotify:= 0;
 fLastStatus := '';

 PC.ActivePageIndex:= 0;

 fOptions:= TOptions.Create;
// fOptions.loadFromRegistry:= true;

 GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fFormatSettings );

 acStopScanExecute(nil);
 if( fOptions.State  <> osLoaded )then begin
   showOptions;
 end
 else begin
   if fOptions.autoStart then begin
     hideMain;
     if isStartScanEnabled then
       acStartScanExecute(nil);
   end
   else begin
     showMain;
   end;
 end;
end;

function TMain.FTP_checkFiles: TStrings;
var ftp: TFTP;
begin
 result:= nil;

 if( not assigned(fOptions) )then
   Exit;

 fLastStatus := 'Ошибка FTP-соединения';
 ftp:= TFTP.create(fOptions);
 try
   fFtpAvailible:= ftp.ftpAvailible;
   if fFtpAvailible then begin
     result := ftp.existingFiles;
     fLastStatus := '';
   end;
 finally
   freeAndNil(ftp);
 end;
end; { procedure TMain.FTP_checkFiles }


function TMain.NET_checkFiles: TStrings;
var
 sr: TSearchRec;
 m : string;
begin
 result:= nil;
 if( not DirectoryExists(fOptions.NetPath) )then begin
   fLastStatus:= 'Нет доступа к: ' + fOptions.NetPath;
   exit;
 end;

 m:= fOptions.NetPath + fOptions.fileMask;
 if 0 = findFirst( m, faAnyFile, sr ) then
   repeat
     if not assigned(result) then
       result:= TStringList.Create;
     result.add(sr.Name);
   until ( findNext(sr) <> 0 );
 findClose(sr);

end;

procedure TMain.TimerTimer(Sender: TObject);
begin
 timer.Enabled:= false;
 timer.Interval := 1000 * fOptions.intervalSeconds;

 checkFiles;

 fLastQwery:= now;
 timer.Enabled:= true;
 updateStatus;
end;

procedure TMain.checkFiles;
var files: TStrings;
begin
 files:= nil;
 if fOptions.Net_Mon then
    files:= NET_checkFiles
 else
  if fOptions.FTP_Mon then
     files:= FTP_checkFiles;

 if (not assigned( files )) or (files.Count = 0)  then begin
   if fLastStatus = '' then
     fLastStatus:= 'Файлов нет';
 end
 else begin
   fLastStatus:= 'Поступило файлов: ' + intToStr( files.Count ) ;
   whenFilesExists(files);
 end;

 if assigned(files) then
   freeAndNil(files);

end;

procedure TMain.notificationConfirmed;
begin

end;

constructor TMain.Create(AOwner: TComponent);
begin
  // Создаем главную форму и блокируем ее показ
  inherited Create(AOwner);

  Visible:= false;
  Application.ShowMainForm:=False;

  // Подготавливаем иконку для System Tray
  with FIconData do begin
    cbSize:=SizeOf(FIconData);
    Wnd:=Handle;
    uID:=100;
    uFlags:=NIF_MESSAGE+NIF_ICON+NIF_TIP;
    uCallbackMessage:=msg_callback;
    hIcon:=Application.Icon.Handle;
    szTip:='Уведомление';
  end;
  // Все готово - помещаем иконку в System Tray
  Shell_NotifyIcon(NIM_ADD, @FIconData);
end;

destructor TMain.Destroy;
begin
 // Перед уничтожение формы удаляем иконку из SysTray
 Shell_NotifyIcon(NIM_DELETE, @FIconData);
 inherited Destroy;
end;

procedure TMain.WndProc(var Msg: TMessage);
var
  P: TPoint;
begin
  if Msg.Msg = msg_callback then begin
    case Msg.LParam of
      WM_LBUTTONDBLCLK:
       begin
        visibleInversion;
       end;
      WM_LBUTTONDOWN:
        begin

        end;
      WM_RBUTTONDOWN:  // Нажата правая кнопка мыши - показываем pop-up меню
        begin
          SetForegroundWindow(Handle);      // Восстанавливаем программу в качестве переднего окна
          GetCursorPos(P);                  // Запоминаем координаты курсора мыши
          PM.Popup(P.X,P.Y);        // Показываем pop-up меню
          PostMessage(Handle,WM_NULL,0,0)   // Обнуляем сообщение
        end;
    end;
  end;
  inherited;
end;

procedure TMain.ControlWindow(var Msg: TMessage);
begin
  if (Msg.WParam = SC_MINIMIZE) or (Msg.WParam = SC_CLOSE) then
    visibleInversion
  else
    inherited;
end;

procedure TMain.acQuitExecute(Sender: TObject);
begin
 stopScan;
 close;
end;

procedure TMain.acOptionsExecute(Sender: TObject);
begin
 showOptions;
end;

procedure TMain.showOptions;
begin
 showMain;
 PC.ActivePageIndex:= 1;
end;

procedure TMain.whenFilesExists(const aFiles: TStrings);
var fMsgForm: TMsgForm;
begin
 fLastNotify := now;

 fMsgForm:= TMsgForm.Create(self, aFiles);
 fMsgForm.showModal;
 if fMsgForm.NotifyIn5Minutes then
   Timer.Interval := 5 * (60 * 1000);
 freeAndNil(fMsgForm);
end;

procedure TMain.startScan;
begin
 TimerTimer(nil);
end;

procedure TMain.stopScan;
begin
 Timer.Enabled:= false;
 updateStatus;
end;

procedure TMain.acStartScanExecute(Sender: TObject);
begin
 startScan;
 pmStartStop.Action:= acStopScan;
 btStart.Action:= pmStartStop.Action;
end;

procedure TMain.acStopScanExecute(Sender: TObject);
begin
 stopScan;
 pmStartStop.Action:= acStartScan;
 btStart.Action:= pmStartStop.Action;
end;

procedure TMain.acShowExecute(Sender: TObject);
begin
 visibleInversion;
end;

procedure TMain.acHideExecute(Sender: TObject);
begin
 visibleInversion;
end;

procedure TMain.visibleInversion;
begin

 if visible then begin
   visible:= false;
   pmHideShow.Action:= acShow;
 end else begin
   visible:= true;
   pmHideShow.Action:= acHide;
 end;
 Application.ShowMainForm := visible;

end;

procedure TMain.acMinimizeExecute(Sender: TObject);
begin
 SendMessage( Handle, SC_MINIMIZE, 0, 0 );
end;

procedure TMain.updateStatus;
begin
 if (fStartTime = 0) then
   lbStarted.Caption   := ''
 else
   lbStarted.Caption   :=  dateTimeToStr( fStartTime,  fFormatSettings );

 if (fLastQwery = 0) then
   lbLastQwery.Caption := ''
 else
   lbLastQwery.Caption :=  dateTimeToStr( fLastQwery,  fFormatSettings );

 if Timer.Enabled then
   lbQweryStatus.Caption:= 'Запущен'
 else
   lbQweryStatus.Caption:= 'Остановлен';

 lbLastNotify.Caption:= fLastStatus;
 fLastStatus := '';
(* if (fLastNotify=0) then
   lbLastNotify.Caption:= ''
 else
   lbLastNotify.Caption:=  dateTimeToStr( fLastNotify, fFormatSettings );

 if (fLastNotify<>0)and (not fFtpAvailible) then
  lbLastNotify.Caption:= 'Ошибка доступа к FTP - серверу'; *)

end;

procedure TMain.Button1Click(Sender: TObject);
var
 ftp: TFTP;
 good: boolean;
begin
 saveOptions;
 ftp:= TFTP.create(fOptions, true);
 try
   good:= ftp.ftpAvailible;
 finally
   freeAndNil(ftp);
 end;
 if good then
   showMessage(' Успешная установка соединения! ')
 else
   showMessage(' Ошибка при установке соединения! ');
end;

procedure TMain.tsOptionsShow(Sender: TObject);
begin
  setEditors;
end;

procedure TMain.saveOptions;
begin
 if( not assigned(fOptions) )then
   exit;
// fOptions.loadFromRegistry:= intAsBool( cbIniRegistry.ItemIndex );
 fOptions.autoStart:= intAsBool(cbAutoStart.ItemIndex);
 fOptions.intervalSeconds:= edInterval.Value;

 fOptions.Net_Mon := mntrNetwork.Checked;
 fOptions.NetPath := edPath.Text;

 fOptions.FTP_Mon := mntrFTP.Checked;
 fOptions.FtpHost   := edServer.Text;
 fOptions.ftpPort     := edPort.Value;
 fOptions.ftpPassiveMode:= intAsBool(cbPassive.ItemIndex);

 fOptions.ftpUser     := edUser.Text;
 fOptions.ftpPassword := edPassword.Text;
 fOptions.ftpDirectory:= edDirectory.Text;
end;

procedure TMain.setEditors;
begin
 if ( not assigned(fOptions) ) then
   exit;

 disableOnChange;

 cbAutoRun.Checked:= fOptions.programAutoRun;
 edServer.Text:=  fOptions.FtpHost;
 edUser.Text   :=  fOptions.ftpUser;
 edPassword.Text:= fOptions.ftpPassword;
 edPort.Value:= fOptions.ftpPort;
 edInterval.Value:= fOptions.intervalSeconds;
 edDirectory.Text:= fOptions.ftpDirectory;

 edPath.Text:= fOptions.NetPath;
 mntrNetwork.Checked := fOptions.Net_Mon;
 mntrFTP.Checked := fOptions.FTP_Mon;

 cbPassive.ItemIndex:= boolAsInt(fOptions.FtpPassiveMode);
 cbAutoStart.ItemIndex:= boolAsInt(fOptions.autoStart);
 edFileMask.Text := fOptions.fileMask;

// edPath.Enabled := mntrNetwork.Checked;
 sbPath.Enabled := mntrNetwork.Checked;
 GroupBox1.Enabled := mntrFTP.Checked;

 enableOnChange;
end;

procedure TMain.cbAutoStartChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.autoStart:= intAsBool(cbAutoStart.ItemIndex);
end;

procedure TMain.edIntervalPropertiesChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.intervalSeconds:= edInterval.Value;
end;

procedure TMain.edServerChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.FtpHost   := edServer.Text;
end;

procedure TMain.edPortPropertiesChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.ftpPort:= edPort.Value;
end;

procedure TMain.cbPassiveChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.ftpPassiveMode:= intAsBool( cbPassive.ItemIndex );
end;

procedure TMain.edUserChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.ftpUser:= edUser.Text;
end;

procedure TMain.edPasswordChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.ftpPassword := edPassword.Text;
end;

procedure TMain.edDirectoryChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.ftpDirectory:= edDirectory.Text;
end;

procedure TMain.mntrFTPClick(Sender: TObject);
begin
 acStopScanExecute(nil);
 mntrNetworkClick(nil);
end;

procedure TMain.edPathChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.NetPath := edPath.Text;
 isStartScanEnabled;
end;

procedure TMain.edFileMaskChange(Sender: TObject);
begin
 acStopScanExecute(nil);
 fOptions.fileMask:= edFileMask.Text;
 isStartScanEnabled;
end;

function TMain.isStartScanEnabled: boolean;
begin
 result:= (fOptions.NetPath <> '') and (fOptions.fileMask <> '');
 acStartScan.Enabled:= result;
end;

procedure TMain.disableOnChange;
begin
  cbAutoRun.OnClick:= nil;
  cbAutoStart.onChange := nil;
  cbPassive.onClick := nil;
  edInterval.Properties.OnChange := nil;
  edServer.onChange := nil;
  edPort.Properties.onChange := nil;
  edUser.onChange := nil;
  edPassword.onChange := nil;
  edDirectory.onChange := nil;

  mntrNetwork.onClick := nil;
  edPath.onChange := nil;
  mntrFTP.onClick := nil;
  edFileMask.OnChange := nil;
end;

procedure TMain.enableOnChange;
begin
  cbAutoRun.OnClick:= cbAutoRunClick;
  cbAutoStart.onChange := cbAutoStartChange;
  cbPassive.onClick := cbPassiveChange;
  edInterval.Properties.OnChange := edIntervalPropertiesChange;
  edServer.onChange := edServerChange;
  edPort.Properties.onChange := edPortPropertiesChange;
  edUser.onChange := edUserChange;
  edPassword.onChange := edPasswordChange;
  edDirectory.onChange := edDirectoryChange;

  mntrNetwork.onClick := mntrNetworkClick;
  edPath.onChange := edPathChange;
  mntrFTP.onClick := mntrFTPClick;
  edFileMask.OnChange := edFileMaskChange;
end;

procedure TMain.Button3Click(Sender: TObject);
begin
  visibleInversion;
end;

procedure TMain.showMain;
begin
 if (not visible) then begin
   visible:= true;
   pmHideShow.Action:= acHide;
   Application.ShowMainForm := visible;
 end;
end;

procedure TMain.hideMain;
begin
 if visible then begin
   visible:= false;
   pmHideShow.Action:= acShow;
   Application.ShowMainForm := visible;
 end
end;

procedure TMain.mntrNetworkClick(Sender: TObject);
begin
 //edPath.Enabled := mntrNetwork.Checked;
 sbPath.Enabled := mntrNetwork.Checked;

 GroupBox1.Enabled := mntrFTP.Checked;

{ edServer.Enabled := mntrFTP.Checked;
 edPort.Enabled := mntrFTP.Checked;
 cbPassive.Enabled := mntrFTP.Checked;
 edUser.Enabled := mntrFTP.Checked;
 edPassword.Enabled := mntrFTP.Checked;
 edDirectory.Enabled := mntrFTP.Checked;
 Button1.Enabled := mntrFTP.Checked; }

 fOptions.Net_Mon := mntrNetwork.Checked;
 fOptions.FTP_Mon := mntrFTP.Checked;
end;

type
 TOpenDir = class(TObject)
 private
   fDialog: TOpenDialog;
   procedure HideControls(Sender: TObject);
 public
   destructor Destroy; override;
   constructor create( aInitialDir: string );
   function getDirectory: string;

 end;

 destructor TOpenDir.Destroy;
 begin
  freeAndNil( fDialog );
  inherited destroy;
 end;

 constructor TOpenDir.create( aInitialDir: string);
 begin
  inherited create;

  fDialog:= TOpenDialog.Create(nil);
  fDialog.InitialDir := aInitialDir;

  fDialog.OnShow := HideControls;

  fDialog.FileName:= '*.';
  fDialog.Filter:=   '*.';
  fDialog.Title:=    'Chose a folder';
 //No need to check file existis!
  fDialog.Options:= fDialog.Options + [ofNoValidate];

 end;

 //This procedure hides de combo box of file types...
 procedure TOpenDir.HideControls(Sender: TObject);
 const
  CDM_HIDECONTROL =    WM_USER + 100 + 5;
  CDM_SETCONTROLTEXT = WM_USER + 100 + 4;
  cmb1: integer  = $470; //Combo box with list of file type filters
  stc2: integer  = $441; //Label of the file type
  cmb13: integer = $47c; //Combo box with name of the current file
  edt1: integer  = $480; //Edit with the name of the current file
  stc3: integer  = $442; //Label of the file name combo
 var H: THandle;
 begin
  H:= GetParent(fDialog.Handle);
  SendMessage(H, CDM_HIDECONTROL, cmb1,  0);
  SendMessage(H, CDM_HIDECONTROL, stc2,  0);
  //Hide file name label, edit and combo...
  SendMessage(H, CDM_HIDECONTROL, cmb13, 0);
  SendMessage(H, CDM_HIDECONTROL, edt1,  0);
  SendMessage(H, CDM_HIDECONTROL, stc3,  0);
 //NOTE: How to change label text (the lentgh is not auto):
 //SendMessage(H, CDM_SETCONTROLTEXT, stc3, DWORD(pChar('Hello!')));
 end;

 function TOpenDir.getDirectory: string;
 begin
  result:= '';
  if fDialog.Execute then
   result:= extractFilePath(fDialog.FileName);
 end;


procedure TMain.sbPathClick(Sender: TObject);
const cCapt = 'Выберете директорию';
var
  OpenDir: TOpenDir;
  _Path: TFileName;
begin
 OpenDir:= TOpenDir.create( fOptions.NetPath );
 try
  _Path:= OpenDir.getDirectory;
  if (_Path <> '') then
    edPath.Text:= _Path;
 finally
  freeAndNil(OpenDir);
 end;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
 if assigned(fOptions) then
   freeAndNil( fOptions );
 inherited;
end;

procedure TMain.cbAutoRunClick(Sender: TObject);
begin
 fOptions.programAutoRun:= cbAutoRun.Checked;
end;

end.
