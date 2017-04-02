unit uMPKService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls, Registry,
  uCommon;

type
  TMPK_Service = class(TService)
    Timer: TTimer;
    safetyTimer: TTimer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceShutdown(Sender: TService);
    procedure TimerTimer(Sender: TObject);
    procedure ServiceBeforeInstall(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure safetyTimerTimer(Sender: TObject);
  private
    fWinHandle: THandle;
    fDescription, fService_Name, fDisplay_Name: string;

    procedure toRegistry();
    procedure Wnd_Proc(var msg: TMessage);
    procedure chargeSafetyTimer;
    procedure BusinessRestart;

  protected
    procedure runTimer;
    procedure afterStartUp(var Message: TMessage); message MSG_After_Startup;
    procedure whenQueriesDownloaded(var Message: TMessage); message MSG_Downloaded;
    procedure whenAnswersUploaded(var Message: TMessage); message MSG_Uploaded;
    procedure whenWatchDog(var Message: TMessage); message MSG_Watch_Dog;
  public
    function GetServiceController: TServiceController; override;
    property Description: string read fDescription;
  end;

var MPK_Service: TMPK_Service;

implementation

uses uBusiness, uOptions, uLoger, uConsts, uDMFTP, uQueue;

{$R *.DFM}

procedure TMPK_Service.ServiceCreate(Sender: TObject);
var sService_Name: string;
begin
 sService_Name:= getParamValue(cService_Name);
 if ('' <> sService_Name)and(Name <> sService_Name) then
   Name := sService_Name;
 inherited;
end;

procedure TMPK_Service.ServiceBeforeInstall(Sender: TService);
var sService_Name, sDisplay_Name, sDescription: string;
begin
 inherited;
 sService_Name:= getParamValue(cService_Name);
 sDisplay_Name:= getParamValue(cDisplay_Name);
 sDescription:= getParamValue(cDescription);

 if (sService_Name <> '') then
   Name := sService_Name;

 if (sDisplay_Name <> '') then
   DisplayName := sDisplay_Name;

 fDescription := sDescription;
 fService_Name:= sService_Name;
end;

procedure TMPK_Service.ServiceAfterInstall(Sender: TService);
begin
 inherited;
 toRegistry();
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  MPK_Service.Controller(CtrlCode);
end;

function TMPK_Service.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TMPK_Service.ServiceStart(Sender: TService; var Started: Boolean);
begin
 inherited;
 fWinHandle := AllocateHWND( Wnd_Proc );
 Timer.Enabled:= false;

 uCommon.StartUp(fWinHandle);
end;

procedure TMPK_Service.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
 inherited;
 uCommon.StopNow:= True;
 uLoger.Log( '' );
 uLoger.Log( 'Служба остановлена' );
end;

procedure TMPK_Service.ServiceShutdown(Sender: TService);
begin
 inherited;
 uCommon.StopNow:= True;
 uLoger.Log( '' );
 uLoger.Log( 'Служба остановлена' ); 
end;

procedure TMPK_Service.toRegistry( );
const
  cRoot = HKEY_LOCAL_MACHINE;
  cKeyPath   = '\SYSTEM\CurrentControlSet\Services\';
  cImagePath = 'ImagePath';
  cDescription  = 'Description';
var
 r: TRegistry;
 cmdStr:string;
begin
 r:= TRegistry.Create;
 try
   r.RootKey := cRoot;
   if r.OpenKey(cKeyPath + Name, false) then begin

     if fService_Name <> '' then begin
       cmdStr:= r.readString( cImagePath ) + ' /' + cService_Name +'=' + fService_Name ;
       r.WriteString( cImagePath,  cmdStr );
     end;

     r.WriteString( cDescription,  Description );

     r.CloseKey;
   end;
 finally
   freeAndNil(r);
 end;
end;

procedure TMPK_Service.Wnd_Proc(var msg: TMessage);
begin
          {$ifdef EXHOSTING}
           dbgLog('MPK_Service.Wnd_Proc');
          {$endif}
  case msg.Msg of
   MSG_After_Startup: begin
          {$ifdef EXHOSTING}
           dbgLog('MPK_Service.Wnd_Proc.MSG_After_Startup');
          {$endif}
     afterStartUp(msg);
   end;
   MSG_Downloaded: begin
          {$ifdef EXHOSTING}
           dbgLog('MPK_Service.Wnd_Proc.whenQueriesDownloaded');
          {$endif}
     whenQueriesDownloaded(msg);
   end;
   MSG_Uploaded: begin
          {$ifdef EXHOSTING}
           dbgLog('MPK_Service.Wnd_Proc.whenAnswersUploaded');
          {$endif}
     whenAnswersUploaded(msg);
   end;
   MSG_Watch_Dog: begin
          {$ifdef EXHOSTING}
           dbgLog('MPK_Service.Wnd_Proc.whenWatchDog');
          {$endif}
     whenWatchDog(msg);
   end;
  else
    // for all other messages call the default window procedure
    msg.Result := DefWindowProc(fWinHandle, msg.Msg, msg.wParam, msg.lParam);
  end;
          {$ifdef EXHOSTING}
          dbgLog('MPK_Service.Wnd_Proc. Завершено');
          {$endif}
end;



procedure TMPK_Service.runTimer;
begin
 if Timer.Enabled then
   Exit;
 Timer.Interval := 1000 * Options.PeriodSeconds;
             {$ifdef EXHOSTING}
             dbgLog( format('MPK_Service.runTimer Interval= %d',[Timer.Interval] ) );
             {$endif}
 Timer.Enabled:= True;
              {$ifdef EXHOSTING}
               if Timer.Enabled then
                 dbgLog('MPK_Service.runTimer Главный таймер запущен')
               else
                 dbgLog('MPK_Service.runTimer НЕ запущен Главный таймер');
              {$endif}
end;

procedure TMPK_Service.TimerTimer(Sender: TObject);
begin
          {$ifdef EXHOSTING}
          dbgLog( 'Главный таймер сработал' );
          {$endif}
 if Business.Stopped then
   Exit;

 Timer.Enabled:= false;
          {$ifdef EXHOSTING}
           dbgLog( 'Главный таймер остановлен' );
          {$endif}

 Business.Main;

          {$ifdef EXHOSTING}
           dbgLog( 'MPK_Service.TimerTimer. Завершено' );
          {$endif}
end;

procedure TMPK_Service.chargeSafetyTimer;
begin
 safetyTimer.Enabled:= false;
 safetyTimer.Interval:= trunc( 5 * ( Options.PeriodSeconds * 1000 ) );
 safetyTimer.Enabled:= true;
end;

procedure TMPK_Service.afterStartUp(var Message: TMessage);
begin
 if Timer.Enabled then
   Exit;

 Timer.Interval := 1000;
 Timer.Enabled:= True;

 chargeSafetyTimer;
end;

procedure TMPK_Service.whenQueriesDownloaded(var Message: TMessage);
begin
// 2 - create answers
 SafetyTimer.Enabled:= false;
 if( not downQsAreEmpty )then begin
   Business.queriesExecuted;
 end;
 chargeSafetyTimer;
 ///Log( 'whenQueriesDownloaded - chargeSafetyTimer' );

 if upQsAreEmpty then
   runTimer
 else
   DMFTP.startUpload; // 3 - send answers
end;

procedure  ClearFTPDirs;
const
  cP1 = 'Z:\MPS\OUT';
  cP2 = 'Z:\TK\OUT';
{const
  cP1 = 'C:\FTP\Services\MPS\OUT\';
  cP2 = 'C:\FTP\Services\TK\OUT'; }
{const
  cP1 = '\\192.168.48.30\Download\_Oviont\exchange\EXCH\MPS\OUT';
  cP2 = '\\192.168.48.30\Download\_Oviont\exchange\EXCH\TK\OUT'; }
begin
 exit;
 sleep(3000);
 DelFilesFromDir(cP1, '*.*');
 DelFilesFromDir(cP2, '*.*');
end;

procedure TMPK_Service.whenAnswersUploaded(var Message: TMessage);
begin
 runTimer;
 ClearFTPDirs;
end;

procedure TMPK_Service.BusinessRestart;
begin
 Timer.Enabled:= false;
 safetyTimer.Enabled:= false;

 Business.restart;

 chargeSafetyTimer;
 runTimer;
end;

procedure TMPK_Service.whenWatchDog(var Message: TMessage);
begin
 Log( '!! WatchDog !!', leError );
 if assigned(LogStack) then
   dump;
 BusinessRestart;
end;


procedure TMPK_Service.safetyTimerTimer(Sender: TObject);
begin
 Log( ' Safety_Timer сработал ', leError );

 if assigned(LogStack) then
   dump;
 createNewLog;

 BusinessRestart;
end;

end.
