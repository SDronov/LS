program iesvc;

uses
  SvcMgr,
  SysUtils,
  uService in 'Source\uService.pas' {IncomeExchangeService: TService},
  TRollingFileAppenderUnit in 'Source\TRollingFileAppenderUnit.pas',
  Log4D in 'Source\Log4D.pas',
  uOptions in 'Source\uOptions.pas',
  uDBService in 'Source\uDBService.pas' {dmDBService: TDataModule},
  uFileService in 'Source\uFileService.pas' {dmFileService: TDataModule},
  uInterfaces in 'Source\uInterfaces.pas';



{$IFDEF UTD}
{$R iesvc_utd.res}
{$ELSE}
{$R *.res}
{$ENDIF}

begin
  TLogPropertyConfigurator.Configure(ChangeFileExt(ParamStr(0), '.log4d'));
  Application.Initialize;
{$IFDEF UTD}
  Application.Title := 'АС УТД - КПС "Обмен-данными"';
{$ELSE}
  Application.Title := 'АПС "Лицевые счета" - КПС "Обмен-данными"';
{$ENDIF}
  Application.CreateForm(TIncomeExchangeService, IncomeExchangeService);
  Application.Run;
end.
