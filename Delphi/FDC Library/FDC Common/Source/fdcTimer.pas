{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcTimer.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit fdcTimer;

interface

uses Windows, SysUtils, Messages, Classes, Controls, SyncObjs;

type

  { TTimerThreadClass }
  TTimerThreadClass = class(TThread)
  private
    FEvent: TSimpleEvent;
    FTimerEvent: TThreadMethod;
    FInterval: Integer;
    procedure SetInterval(Value: Integer);
  protected
    FCounter: Int64;
    procedure Execute; override;
  public
    constructor Create(aPriority: TThreadPriority; aSuspended: Boolean;
      aTimerEvent: TThreadMethod; aInterval: Integer);
    destructor Destroy; override;
    property Interval: Integer read FInterval write SetInterval;
  end;

  {
    TfdcTimer
    
    Потоково-безопасный таймер. Работает в отдельном потоке и,
    в отличие от стандартного таймера, не зависит от главного
    VCL потока приложения.
  }
  TfdcTimer = class(TComponent)
  private
    FThread: TTimerThreadClass;
    FEnabled: Boolean;
    FInterval: Integer;
    FPriority: TThreadPriority;
    FSuspended: Boolean;
    FOnTimer: TThreadMethod;

    procedure ReCreateThread;
    function GetCounter: Int64;
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: Integer);
    procedure SetPriority(Value: TThreadPriority);
    procedure SetSuspended(Value: Boolean);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Suspended: Boolean read FSuspended write SetSuspended default False;
    property Priority: TThreadPriority read FPriority write SetPriority default tpNormal;
    property Counter: Int64 read GetCounter;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Interval: Integer read FInterval write SetInterval default 1000;

    property OnTimer: TThreadMethod read FOnTimer write FOnTimer;
  end;

implementation

{ TTimerThreadClass }

constructor TTimerThreadClass.Create(aPriority: TThreadPriority; aSuspended:
  Boolean;
  aTimerEvent: TThreadMethod; aInterval: Integer);
begin
  inherited Create(aSuspended);
  Priority := aPriority;
  FEvent := TSimpleEvent.Create;
  FTimerEvent := aTimerEvent;
  FInterval := aInterval;
  FreeOnTerminate := True;
end;

destructor TTimerThreadClass.Destroy;
begin
  FEvent.Free;
  inherited Destroy;
end;

procedure TTimerThreadClass.SetInterval(Value: Integer);
begin
  if Value <> FInterval then begin
    Suspend;
    FInterval := Value;
    FCounter := 0;
    Resume;
  end;
end;

procedure TTimerThreadClass.Execute;
begin
  try
    try
      while True do begin
        FEvent.WaitFor(FInterval);
        if Assigned(FTimerEvent) then begin
          Synchronize(FTimerEvent);
          Inc(FCounter);
        end;
        if Terminated then
          Exit;
      end;
    except
      FTimerEvent := nil;
    end;
  finally
    FCounter := 0;
  end;
end;

{ TfdcTimer }

constructor TfdcTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := False;
  FInterval := 200;
  FPriority := tpNormal;
  FSuspended := False;
end;

destructor TfdcTimer.Destroy;
begin
  FEnabled := False;
  ReCreateThread;
  inherited Destroy;
end;

procedure TfdcTimer.Loaded;
begin
  inherited Loaded;
  if not (csDesigning in ComponentState) then
    ReCreateThread;
end;

procedure TfdcTimer.ReCreateThread;
begin
  if FThread <> nil then begin
    FThread.Terminate;
    FThread := nil;
  end;
  if FEnabled then
    FThread := TTimerThreadClass.Create(FPriority, FSuspended, FOnTimer,
      FInterval);
end;

function TfdcTimer.GetCounter: Int64;
begin
  if FThread <> nil then
    Result := FThread.FCounter
  else
    Result := 0;
end;

procedure TfdcTimer.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then begin
    FEnabled := Value;
    if not ((csDesigning in ComponentState) or (csLoading in ComponentState))
      then
      ReCreateThread;
  end;
end;

procedure TfdcTimer.SetInterval(Value: Integer);
begin
  if Value <> FInterval then begin
    FInterval := Value;
    if FThread <> nil then
      FThread.Interval := FInterval;
  end;
end;

procedure TfdcTimer.SetPriority(Value: TThreadPriority);
begin
  if Value <> FPriority then begin
    FPriority := Value;
    if FThread <> nil then
      FThread.Priority := FPriority;
  end;
end;

procedure TfdcTimer.SetSuspended(Value: Boolean);
begin
  if Value <> FSuspended then begin
    FSuspended := Value;
    if FThread <> nil then
      FThread.Suspended := FSuspended;
  end;
end;

end.

