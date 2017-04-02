unit CheckCopySevice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls, AppEvnts, CheckCopyUtils, IniFiles, CheckCThread, DB,
  VKDBFDataSet, IdFTP;

type
  TCheckCopyService = class(TService)
    evtAppMain: TApplicationEvents;
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure evtAppMainException(Sender: TObject; E: Exception);
    procedure OpenLogFile;
    procedure CloseLogFile;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    FsrcFtpDir          : AnsiString;
    FsrcFtpListSDirFile :AnsiString;
    FdstFtpDir          : AnsiString;
    FdstAnsFTPDir       : AnsiString;
    FsrcDir             : AnsiString;
    FdstDir             : AnsiString;
    FLogFileName        : AnsiString;
    // --- options
    FScanPeriod : integer;
    FMaxCountFiles  : integer;
    FUserName : AnsiString;
    FPassword : AnsiString;
    FTnsName : AnsiString;
    FWaitExclusive : Integer;
    FNeedCheckProvision : Boolean;
    FFileMask : AnsiString;
    // --- Log
    FIsLogOpen : boolean;
    FLogFile  : TextFile;
    //--
    fneedstop : boolean;
    fThread : TFCThread;
    //----------------------------------------------------
  public
    // --- Start \ Stop
    //procedure DoStart; override;
    //function  DoStop: Boolean; override;
    // --- Log
    procedure Log(aText: string; isLogDateTime: boolean = True);
    procedure LogError(aErrorCode: integer);
    // --- Options
    procedure LoadOptions;
    // --- Service controller
    function  GetServiceController: TServiceController; override;
  published
    property SourceDir    : string read FsrcDir;
    property DestDir      : string read FdstDir;
    property SourceFtpDir : string read FsrcDir;
    property DestFtpDir   : string read FdstDir;
    property needstop     : boolean read fneedstop;
    //--
  end;

var
  CheckCopyService: TCheckCopyService;

implementation

uses MainDataMUnit;

{$R *.DFM}


// ----------------------------------------------------------------------------
// --- Контролы сервиса

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  CheckCopyService.Controller(CtrlCode);
end;


function TCheckCopyService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;


// ----------------------------------------------------------------------------
// --- Старт\ стоп сервиса
{
procedure TCheckCopyService.DoStart;
begin
  inherited DoStart;
end;


function  TCheckCopyService.DoStop: Boolean;
begin
  Result := inherited DoStop;
end;
}
// ----------------------------------------------------------------------------
// --- Создание и удаление модуля

procedure TCheckCopyService.ServiceCreate(Sender: TObject);
begin
  fneedstop := false;
  fThread := nil;
  FIsLogOpen := False;
  LoadOptions;
end;


procedure TCheckCopyService.ServiceDestroy(Sender: TObject);
begin
  CloseLogFile;
  if Assigned(fThread) then FreeAndNil(fThread);
end;


// ----------------------------------------------------------------------------
// --- Протоколирование исключений

procedure TCheckCopyService.evtAppMainException(Sender: TObject; E: Exception);
begin
  Log(cError + e.Message, False);
end;


// ----------------------------------------------------------------------------
// --- Протокол

procedure TCheckCopyService.Log(aText: string; isLogDateTime: boolean = True);
begin
  if FIsLogOpen then
  begin
    if isLogDateTime then
      aText := DateTimeToStr(Now) + ': ' + aText;
    WriteLn(FLogFile, aText);
  end;
end;


procedure TCheckCopyService.LogError(aErrorCode: integer);
begin
  Log(cError + IntToStr(aErrorCode) + ': ' + SysErrorMessage(aErrorCode), False);
end;


procedure TCheckCopyService.OpenLogFile;
var
  i : integer;
begin
  {$I-}
  AssignFile(FLogFile, FLogFileName);
  Append(FLogFile);
  i := IOResult;
  if (i = FileNotFoundCode) then
  begin
    ReWrite(FLogFile);
    FIsLogOpen := (IOResult = 0);
  end
  else
    FIsLogOpen := (i = 0);
  {$I+}
end;


procedure TCheckCopyService.CloseLogFile;
begin
  if FIsLogOpen then
  begin
    Flush(FLogFile);
    FIsLogOpen := False;
    CloseFile(FLogFile);
  end;
end;


// ----------------------------------------------------------------------------
// --- Загрузка опций

procedure TCheckCopyService.LoadOptions;
  var l_fini: TIniFile;
  //--
  function loc_ReadString(const Section, Ident, Value: string): string;
  begin
    if not(l_fini.ValueExists(Section, Ident)) then
      begin
        l_fini.WriteString(Section, Ident, Value);
      end;
    result := l_fini.ReadString(Section, Ident, Value);
  end;
  function loc_ReadBool(const Section, Ident:String; Value: Boolean): Boolean;
  begin
    if not(l_fini.ValueExists(Section, Ident)) then
      begin
        l_fini.WriteBool(Section, Ident, Value);
      end;
    result := l_fini.ReadBool(Section, Ident, Value);
  end;
  function loc_ReadInteger(const Section, Ident:String; Value: Longint): Longint;
  begin
    if not(l_fini.ValueExists(Section, Ident)) then
      begin
        l_fini.WriteInteger(Section, Ident, Value);
      end;
    result := l_fini.ReadInteger(Section, Ident, Value);
  end;
  //--
begin
  l_fini := TIniFile.Create(GetIniFileName);
  with l_fini do
  try
    FsrcFtpDir := AddBackSlash(loc_ReadString(ISFTP, IVFtpSourceDir, dfFtpSourceDir));
    FsrcFtpListSDirFile := AddBackSlash(loc_ReadString(ISFTP, IVFtpListSDirFile, dfFtpListSDirFile));
    FdstFTPDir := AddBackSlash(loc_ReadString(ISFTP, IVFtpTargetDir, dfFtpTarget));
    FdstansFTPDir := AddBackSlash(loc_ReadString(ISFTP, IVFtpTargetAnsDir, dfFtpTargetAns));
    FsrcDir := AddSlash(loc_ReadString(ISDirs, IVSourceDir, dfSourceDir));
    FdstDir := AddSlash(loc_ReadString(ISDirs, IVDestinationDir, dfDestinationDir));
    FLogFileName := GetLogFileName;
    FWaitExclusive := MSecPerSec * loc_ReadInteger(ISOptions, IVWaitExclusive, dfWaitExclusive);
    FScanPeriod := MSecPerSec * loc_ReadInteger(ISOptions, IVScanPeriod, dfScanPeriod);
    if (FWaitExclusive < 0) then
      FWaitExclusive := MSecPerSec * dfWaitExclusive;
    if (FScanPeriod < 0) then
      FScanPeriod := MSecPerSec * dfScanPeriod;
    FMaxCountFiles := loc_ReadInteger(ISOptions, IVMaxCountFiles, dfMaxCountFiles);
    //--
    FFileMask := loc_ReadString(ISFiles, IVFileMask, dfFileMask);
    //-- База данных
    FUserName := loc_ReadString(ISOptions, IVUserName, dfUserName);
    FPassword := loc_ReadString(ISOptions, IVPassword, dfPassword);
    FTnsName := loc_ReadString(ISOptions, IVTnsName, dfTnsName);
    //--
    FNeedCheckProvision := loc_ReadBool(ISOptions, IVNeedCheckProvision, dfNeedCheckProvision);
    //-- FTP
    MainDataM.MainIdFTP.Host := loc_ReadString(ISFTP, IVFtpHost, dfFtphost);
    MainDataM.MainIdFTP.Port := loc_ReadInteger(ISFTP, IVFtpPort, dfFtpport);
    MainDataM.MainIdFTP.Passive := loc_ReadBool(ISFTP, IVFtpPassive, dfFtppassive);
    MainDataM.MainIdFTP.ReadTimeout := loc_ReadInteger(ISFTP, IVFtpReadTymeoute, dfFtpReadTymeoute);
    MainDataM.MainIdFTP.Username := loc_ReadString(ISFTP, IVFtpUser, dfFtpuser);
    MainDataM.MainIdFTP.Password := loc_ReadString(ISFTP, IVFtpUserPassword, dfFtpuserpassword);
    MainDataM.MainIdFTP.ProxySettings.Host := loc_ReadString(ISFTP, IVProxyHost, dfProxyHost);
    MainDataM.MainIdFTP.ProxySettings.Port := loc_ReadInteger(ISFTP, IVProxyPort, dfProxyport);
    MainDataM.MainIdFTP.ProxySettings.UserName := loc_ReadString(ISFTP, IVProxyUser, dfProxyUser);
    MainDataM.MainIdFTP.ProxySettings.Password := loc_ReadString(ISFTP, IVProxyUserPassword, dfProxyUserPassword);
    case loc_ReadInteger(ISFTP, IVProxyType, dfProxyType) of
     1: MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmUserSite;  //Send command USER user@hostname
     2: MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmSite;  //Send command SITE (with logon)
     3: MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmOpen;  //Send command OPEN
     4: MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmUserPass; //USER user@firewalluser@hostname / PASS pass@firewallpass
     5: MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmTransparent;  //First use the USER and PASS command with the firewall username and password, and then with the target host username and password.
     6: MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmHttpProxyWithFtp; //HTTP Proxy with FTP support. Will be supported in Indy 10
     else MainDataM.MainIdFTP.ProxySettings.ProxyType := fpcmNone; //Sends the FTP client Username and optional Password
    end;
    //--
  finally
    FreeAndNil(l_fini);
  end;
end;


procedure TCheckCopyService.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  fneedstop := false;
  //-- загрузка настроек
  LoadOptions;
  //--
  MainDataM.ConnectToBD(FUserName, FPassword, FTnsName);
  MainDataM.sqlCheckLevel.Exec;
  if not(MainDataM.connectftp) then
    begin
      raise Exception.Create('Не удалось подключиться к FTP!');
    end;
  //-- запуск процесса
  if not(Assigned(fThread)) then
    begin
      fThread := TFCThread.Create(FsrcFtpDir, FdstFtpDir, FsrcFtpListSDirFile, FdstAnsFTPDir, FFileMask, FsrcDir, FdstDir, FScanPeriod, FMaxCountFiles, FWaitExclusive, FNeedCheckProvision);
      fThread.OnLog := Log;
      fThread.OnLogError := LogError;
    end;
  OpenLogFile;
  fThread.Resume;
  Log(cServiceStart);
end;

procedure TCheckCopyService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  fneedstop := true;
  MainDataM.disconnectftp;
  MainDataM.DisConnectToBD;
  Log(cServiceStop);
  CloseLogFile;
end;

end.

