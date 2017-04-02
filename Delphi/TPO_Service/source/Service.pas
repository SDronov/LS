unit Service;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, uQueryManager;

type
  TTpoService = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
  private
    FManager: TQueryManager;
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  TpoService: TTpoService;

implementation

uses
  Log4D;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  TpoService.Controller(CtrlCode);
end;

function TTpoService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TTpoService.ServiceExecute(Sender: TService);
begin
  while not Terminated do
  begin
    //Do
    try
      FManager.DoProcess;
    except
     on E:Exception do
     begin
       TLogLogger.GetRootLogger.Error('Ошибка обработки запроса', E);
       LogMessage(E.Message, EVENTLOG_ERROR_TYPE);
     end;
    end;
    ServiceThread.ProcessRequests(False);
    Sleep(500);
  end;    // while
end;

procedure TTpoService.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  TLogLogger.GetRootLogger.Info('Служба запущена');
end;

procedure TTpoService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  TLogLogger.GetRootLogger.Info('Служба остановлена');
end;

procedure TTpoService.ServiceCreate(Sender: TObject);
var
 i: Integer;
 S: string;
begin
  FManager := TQueryManager.Create;
  if FindCmdLineSwitch('depend', ['-','/'], True) then
  begin
    for I := 0 to System.ParamCount - 1 do    // Iterate
    begin
      S := ParamStr(I);
      S := LowerCase(Copy(ParamStr(I), 2, maxInt));
      if (LowerCase(Copy(ParamStr(I), 2, maxInt)) = 'depend') and (System.ParamCount <= I + 1) then
      begin
          TDependency(Self.Dependencies.Add).Name := ParamStr(I + 1);
          Exit;
      end;
    end;    // for
  end;
end;

procedure TTpoService.ServiceDestroy(Sender: TObject);
begin
 FreeAndNil(FManager);
end;

procedure TTpoService.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  TLogLogger.GetRootLogger.Info('Служба приостановлена');
end;

procedure TTpoService.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  TLogLogger.GetRootLogger.Info('Работа службы возобновилась');
end;

end.
