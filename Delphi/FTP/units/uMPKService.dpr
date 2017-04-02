unit uMPKService;
//unit IAccFTP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs;

type
  TMPK_Service = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
  public
    function GetServiceController: TServiceController; override;

  end;

var
  MPK_Service: TMPK_Service;

implementation

{$R *.DFM}

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
{}
end;

procedure TMPK_Service.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
{}
end;

end.
