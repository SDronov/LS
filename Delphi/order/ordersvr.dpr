program ordersvr;

uses
  SvcMgr,
  SysUtils,
  fdcUtils,
  osService in 'Source\osService.pas' {ORDERService: TService},
  ordersvr_TLB in 'ordersvr_TLB.pas',
  osRemoteData in 'Source\osRemoteData.pas' {RemoteDM: TRemoteDataModule} {RemoteDM: CoClass},
  Log4D in 'Common\Log4D.pas',
  TRollingFileAppenderUnit in 'Common\TRollingFileAppenderUnit.pas',
  osScktSrv in 'Source\osScktSrv.pas',
  comConsts in 'Common\comConsts.pas';

{$R *.TLB}

{$IFDEF UTD}
{$R ordersvr_utd.res}
{$ELSE}
{$R *.res}
{$ENDIF}

begin
  TLogPropertyConfigurator.Configure(ChangeFileExt(ParamStr(0), '.log4d'));
  TLogLogger.GetRootLogger.Info('Старт');
  TLogLogger.GetRootLogger.Info('Версия приложения:' + fdcUtils.GetAppVersion);
  SvcMgr.Application.Initialize;
  SvcMgr.Application.CreateForm(TORDERService, ORDERService);
  SvcMgr.Application.Run;
  TLogLogger.GetRootLogger.Info('Стоп');
end.
