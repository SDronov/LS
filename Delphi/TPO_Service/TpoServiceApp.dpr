program TpoServiceApp;

uses
  Forms,
  SvcMgr,
  SysUtils,
  uOptions in 'source\uOptions.pas',
  Utils in 'source\Utils.pas',
  fdcUtils in '..\FDC Library\FDC Common\Source\fdcUtils.pas',
  uQueryManager in 'source\uQueryManager.pas',
  Log4D in 'source\Log4D.pas',
  Unit1 in 'source\Unit1.pas' {Form1},
  Service in 'source\Service.pas' {TpoService: TService},
  Unit2 in 'source\Unit2.pas' {DataModule2: TDataModule},
  Unit3 in 'source\Unit3.pas',
  TRollingFileAppenderUnit in 'source\TRollingFileAppenderUnit.pas';

{$R *.res}

begin
  TLogPropertyConfigurator.Configure(ChangeFileExt(ParamStr(0), '.log4d'));
  TLogLogger.GetRootLogger.Info('Старт');
  TLogLogger.GetRootLogger.Debug('Версия приложения:' + fdcUtils.GetAppVersion);
  if FindCmdLineSwitch('gui', ['-','/'], True) then
  begin
    begin
     Forms.Application.Initialize;
     Forms.Application.Title := 'Сервис TpoService';
     Forms.Application.CreateForm(TDataModule2, DataModule2);
  if not Forms.Application.Terminated then
       begin
          Forms.Application.CreateForm(TForm1, Form1);
          Forms.Application.Run;
       end;
    end
  end
  else
  begin
    SvcMgr.Application.Initialize;
    SvcMgr.Application.CreateForm(TDataModule2, DataModule2);
    SvcMgr.Application.CreateForm(TTPOService, TPOService);
    SvcMgr.Application.Run;
    TLogLogger.GetRootLogger.Info('Стоп');
  end;
end.
