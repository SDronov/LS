unit uWatchDog;

interface
uses
  Windows, Classes, SysUtils;

type
  TWatchDog = class(TThread)
  private
    fWatchThread: TThread;
    fWatchTime: integer;
    fHandle: THandle; 
  protected
    procedure Execute; override;
  public
    property WatchThread: TThread read fWatchThread write fWatchThread;
    property WatchTime: integer read fWatchTime;

    constructor create( aHandle: THandle; aWatchThread: TThread; aWatchTime: integer );
    destructor destroy; override;
  end;

implementation

uses uCommon;

{ TWatchDog }

constructor TWatchDog.create( aHandle: THandle; aWatchThread: TThread; aWatchTime: integer );
begin
 inherited create(false);
 fHandle:= aHandle;
 fWatchThread:= aWatchThread;
 fWatchTime:= aWatchTime;
 FreeOnTerminate:= true;
end;

destructor TWatchDog.destroy;
begin
  if assigned(fWatchThread) then
    FreeAndNil(fWatchThread);
  inherited;
end;

procedure TWatchDog.Execute;
var res: DWORD;
begin
 {Place thread code here}
 res:= 666;
 sleep( fWatchTime );
 if assigned( fWatchThread ) then begin
   Windows.TerminateThread( fWatchThread.Handle, 0 );
   GetExitCodeThread( fWatchThread.Handle, res );

   if(res <> 0) and ( fHandle <> 0 )then
     postMessage( fHandle, MSG_Watch_Dog, 0, 0 );
 end;

end;

end.

