unit uService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  uOptions, uDBService, uFileService, uInterfaces;

type
  TIncomeExchangeService = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceDestroy(Sender: TObject);
  private
    { Private declarations }
    fOptions     : TieOptions;
    fDBService   : TdmDBService;
    fFileService : TdmFileService;

    function GetOptionsString : string;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  IncomeExchangeService: TIncomeExchangeService;

implementation

{$R *.DFM}

uses
  Forms, Log4D, fdcUtils;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  IncomeExchangeService.Controller(CtrlCode);
end;

function TIncomeExchangeService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TIncomeExchangeService.ServiceCreate(Sender: TObject);
begin
  fOptions     := nil;
  fDBService   := nil;
  fFileService := nil;
end;

procedure TIncomeExchangeService.ServiceStart(Sender: TService;
  var Started: Boolean);
  var
    li_FileSvc : IFileService;
    li_DBSvc   : IDBService;
begin
  fOptions := TieOptions.Create;
  fOptions.ReadStart;

  if not Assigned( fDBService ) then
    fDBService := TdmDBService.Create( Self );
  fDBService.Options := fOptions;

  if not Assigned( fFileService ) then
    fFileService := TdmFileService.Create( Self );
  fFileService.Options := fOptions;

  if Supports( fFileService, IFileService, li_FileSvc ) then
    fDBService.FileService := li_FileSvc;

  if Supports( fDBService, IDBService, li_DBSvc ) then
    fFileService.DBService := li_DBSvc;


  Self.WaitHint := fOptions.Interval * 2000;

  LogMessage(
      'КПС "Обмен-Доход/ЕАИС" запущен с параметрами:'#$D#$A +
      GetOptionsString
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      'КПС "Обмен-Доход/ЕАИС" запущен с параметрами:'#$D#$A +
      GetOptionsString
    );
  if fOptions.Debug then
    TLogLogger.GetRootLogger.Debug(
        'Версия приложения:' + fdcUtils.GetAppVersion
      );

  Started := True;
end;

procedure TIncomeExchangeService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  FreeAndNil( fOptions );

  LogMessage(
      'КПС "Обмен-Доход/ЕАИС" остановлен'
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      'КПС "Обмен-Доход/ЕАИС" остановлен'
    );

  Stopped := True;
end;

procedure TIncomeExchangeService.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  fOptions.Read;

  LogMessage(
      'КПС "Обмен-Доход/ЕАИС" возобновлён с параметрами:'#$D#$A +
      GetOptionsString
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      'КПС "Обмен-Доход/ЕАИС" возобновлён с параметрами:'#$D#$A +
      GetOptionsString
    );
end;

procedure TIncomeExchangeService.ServiceExecute(Sender: TService);
  var
    i : Integer;
begin
  while not Terminated do
    begin
      ServiceThread.ProcessRequests( False );
      if not Terminated then
        begin
          try
            fDBService.ExecRequests;
          except
            on E : Exception do
              TLogLogger.GetRootLogger.Error( 'Ошибка при попытке обработки очереди сообщений из ЛС:', E );
          end;
          try
            fFileService.ExecRequests;
          except
            on E : Exception do
              TLogLogger.GetRootLogger.Error( 'Ошибка при попытке обработки очереди сообщений для ЛС:', E );
          end;

          i := 1;
          while not Terminated
            and (i <= fOptions.Interval * 10) do
            begin
              ReportStatus;
              Sleep( 100 );
              ServiceThread.ProcessRequests( False );
              inc( i );
            end;
        end
      else
        ReportStatus;
    end;
end;

function TIncomeExchangeService.GetOptionsString: string;

  function BoolToStr( ABoolVal : Boolean): string;
  begin
    if ABoolVal then
      Result := 'Да'
    else
      Result := 'Нет';
  end;

begin
  Result := '  Интервал        : ' + IntToStr( fOptions.Interval ) + #$D#$A +
            '  Сервис БД       : ' + fOptions.DataBase + #$D#$A +
            '  Пользователь БД : ' + fOptions.UserName + #$D#$A +
            '  Схема БД ЛС     : ' + fOptions.SchemeName + #$D#$A +
            '  Взаимодействие с КПС "Применение льгот" : ' + #$D#$A +
            '    Включено  : ' + BoolToStr( fOptions.PrivilegesEnebled ) + #$D#$A +
            '    Входящие  : ' + fOptions.PrivilegesDirIn + #$D#$A +
            '    Исходящие : ' + fOptions.PrivilegesDirOut + #$D#$A +
            '    Упаковка  : ' + BoolToStr( fOptions.PrivilegesPackedOut ) + #$D#$A +
            '  Взаимодействие с АПС "Задолженность" : ' + #$D#$A +
            '    Включено  : ' + BoolToStr( fOptions.DebtEnebled ) + #$D#$A +
            '    Входящие  : ' + fOptions.DebtDirIn + #$D#$A +
            '    Исходящие : ' + fOptions.DebtDirOut + #$D#$A +
            '    Упаковка  : ' + BoolToStr( fOptions.DebtPackedOut ) + #$D#$A +
            '  Взаимодействие с АПС "Штрафы" : ' + #$D#$A +
            '    Включено  : ' + BoolToStr( fOptions.FinesEnebled ) + #$D#$A +
            '    Входящие  : ' + fOptions.FinesDirIn + #$D#$A +
            '    Исходящие : ' + fOptions.FinesDirOut + #$D#$A +
            '    Упаковка  : ' + BoolToStr( fOptions.FinesPackedOut ) + #$D#$A +
            '  Взаимодействие с КПС "Стоимость-1" : ' + #$D#$A +
            '    Включено  : ' + BoolToStr( fOptions.CostEnebled ) + #$D#$A +
            '    Входящие  : ' + fOptions.CostDirIn + #$D#$A +
            '    Исходящие : ' + fOptions.CostDirOut + #$D#$A +
            '    Упаковка  : ' + BoolToStr( fOptions.CostPackedOut );
end;

procedure TIncomeExchangeService.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  LogMessage(
      'КПС "Обмен-Доход/ЕАИС" приостановлен'
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      'КПС "Обмен-Доход/ЕАИС" приостановлен'
    );

  Paused := True;
end;

procedure TIncomeExchangeService.ServiceDestroy(Sender: TObject);
begin
  if Assigned(fOptions) then
    FreeAndNil( fOptions );
  if Assigned(fDBService) then
    begin
      if Assigned(fFileService) then
        fFileService.DBService := nil;

      fDBService.FileService := nil;
       FreeAndNil( fDBService );
    end;
  if Assigned(fFileService) then
    FreeAndNil( fFileService );
end;

end.
