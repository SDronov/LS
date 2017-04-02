unit uFTPComm;

interface

uses
  Classes, windows,
  uCommon;

type
  TFTPComm = class(TThread)
  private
    fMethod: TThreadMethod;
    fHandle: THandle;
    fWatchTime: integer;
  protected
    procedure Execute; override;
  public
    constructor Create( aHandle: THandle; aMethod: TThreadMethod; aWatchTime: integer );
    destructor destroy; override;
  end;

implementation
uses uWatchDog;
{ FTPComm }

constructor TFTPComm.Create( aHandle: THandle; aMethod: TThreadMethod; aWatchTime: integer );
begin
 inherited Create(false);
 freeOnTerminate:= true;
 fHandle:= aHandle;
 fWatchTime:= aWatchTime;   
 fMethod:= aMethod;
end;

destructor TFTPComm.destroy;
begin
 if assigned(fMethod) then
   fMethod:= nil;
 inherited;
end;

procedure TFTPComm.Execute;
var fWatchDog: TWatchDog;
begin
 fWatchDog:= TWatchDog.create( fHandle, self, fWatchTime ); 

 if assigned( fMethod ) then
   synchronize( fMethod );

 fWatchDog.WatchThread:= nil;
end;

end.
