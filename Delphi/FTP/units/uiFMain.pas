unit uiFMain;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls,
  Forms, ExtCtrls, Dialogs, StdCtrls,
  uBusiness, uCommon;

type
  TFMain = class(TForm)
    M: TMemo;
    Timer: TTimer;
    Panel1: TPanel;
    btStop: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btStopClick(Sender: TObject);
  private

  protected
    procedure runTimer;
    procedure afterStartUp(var Message: TMessage); message MSG_After_Startup;
    procedure whenQueriesDownloaded(var Message: TMessage); message MSG_Downloaded;
    procedure whenAnswersUploaded(var Message: TMessage); message MSG_Uploaded;
    procedure whenWatchDog(var Message: TMessage); message MSG_Watch_Dog;
  protected
    procedure OnEntry();
  public
  end;

var
  FMain: TFMain;

procedure addLogEntry(aLogTxt: string);

implementation

uses uOptions, uQueue, uDMFTP, ShellAPI;
{$R *.dfm}

procedure addLogEntry(aLogTxt: string);
begin
 if( not Assigned(fMain) )then
   exit;
 fMain.M.Lines.Insert(0, aLogTxt);
 fMain.M.Refresh;
end;

procedure TFMain.runTimer;
begin
 if Timer.Enabled then
   Exit;
 Timer.Interval := 1000 * Options.PeriodSeconds;
 Timer.Enabled:= True;
end;


procedure TFMain.OnEntry();
begin
(* *)
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
 Timer.Enabled:= false;
 uCommon.StartUp( self.Handle );
end;

procedure TFMain.afterStartUp(var Message: TMessage);
begin
 if Timer.Enabled then
   Exit;
 Timer.Interval := 1000;
 Timer.Enabled:= True;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
//  uLoger.Log(' Сервис завершён ');
end;

procedure TFMain.btStopClick(Sender: TObject);
begin
 if (not Business.Stopped) then begin
   btStop.Caption:= 'Пуск';
   Business.Stop
 end
 else begin
   btStop.Caption:= 'Стоп';
   Business.run;
 end;

end;

procedure TFMain.TimerTimer(Sender: TObject);
begin
 if Business.Stopped then
   Exit;
 Timer.Enabled:= false;
 Business.Main; // 1 - download qweries
end;

procedure TFMain.whenQueriesDownloaded(var Message: TMessage);
begin
// 2 - create answers
 if Business.queriesExecuted then
  DMFTP.startUpload // 3 - send answers
 else
  runTimer;
end;


procedure  ClearFTPDirs;
{const
  cP1 = 'Z:\EXCH\MPS\OUT';
  cP2 = 'Z:\EXCH\TK\OUT'; }
const
  cP1 = 'C:\FTP\Services\MPS\OUT';
  cP2 = 'C:\FTP\Services\TK\OUT';
{const
  cP1 = '\\192.168.48.30\Download\_Oviont\exchange\EXCH\MPS\OUT\';
  cP2 = '\\192.168.48.30\Download\_Oviont\exchange\EXCH\TK\OUT\';}
begin
 sleep(2000);
 DelFilesFromDir(cP1, '*.*', FALSE);
 DelFilesFromDir(cP2, '*.*', FALSE);
end;

procedure TFMain.whenWatchDog(var Message: TMessage);
begin
 Timer.Enabled:= false;
 Business.restart;
 ClearFTPDirs;
end;

procedure TFMain.whenAnswersUploaded(var Message: TMessage);
begin
 runTimer;
 ClearFTPDirs;
end;



end.
