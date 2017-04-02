program ConsoleApp;
{$APPTYPE CONSOLE}
uses
  Windows, Classes, SysUtils, SyncObjs,
  fdcLogComponents;

type
  TTestThread = class(TThread)
  private
    FLog: TfdcCustomLog;
    FEventSource: TfdcEventSource;
    FName: String;
    FCounter: Integer;
  public
    constructor Create(const AName: String; const ALog: TfdcCustomLog);
    procedure Execute; override;
  end;

{ TTestThread }

constructor TTestThread.Create(const AName: String; const ALog: TfdcCustomLog);
begin
  inherited Create(False);
  FName := AName;
  FLog := ALog;
  FEventSource := TfdcEventSource.Create(nil);
  FLog.RegisterEventSource(FEventSource);
  FCounter := 0;
end;

var
  StartEvent: TEvent;

procedure TTestThread.Execute;
var
  i, j: Integer;
begin
  i := 500;

  try
    FEventSource.GenerateEvent(Format('%s Start', [FName]));
    StartEvent.WaitFor(INFINITE);
    for j := 1 to i do
    begin
      //Sleep(Random(5));
      // Sleep(1);
      //if FLog is TfdcFileLog then
      //  (FLog as TfdcFileLog).FileName := 'Log\' + FormatDateTime('HH-MM-SS', Now) + '.Log';
      Inc(FCounter);
      FEventSource.GenerateEvent(Format('%s - %d', [FName, FCounter]));
    end;    // for
    FEventSource.GenerateEvent(Format('%s ------------------ DONE ------------------------', [FName]));
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end;

var
  Log: TfdcCustomLog;

begin
  StartEvent := TEvent.Create(nil, True, False, '');
  Log := TfdcFileLog.Create(nil);
  (Log as TfdcFileLog).FileName := 'log\test.log';


  try
    with TTestThread.Create('TH1', Log) do
    begin
      with TTestThread.Create('TH2', Log) do
      begin
        ResetTickCount;
        StartEvent.SetEvent;
        WaitFor;
      end;
      WaitFor;
    end;
  finally
    Log.Free;
  end;
end.
