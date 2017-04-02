program armtisvr;

uses
  Forms,
  SvcMgr,
  SysUtils,
  Unit1 in 'Source\Unit1.pas' {Form1},
  Unit2 in 'Source\Unit2.pas' {DataModule2: TDataModule},
  Unit3 in 'Source\Unit3.pas',
  QueryManager in 'Source\QueryManager.pas',
  Service in 'Source\Service.pas' {ARMTIService: TService},
  Log4D in 'Source\Log4D.pas',
  fdcUtils,
  Windows,
  TRollingFileAppenderUnit in 'Source\TRollingFileAppenderUnit.pas',
  armtisvr_TLB in 'armtisvr_TLB.pas',
  Unit4 in 'Source\Unit4.pas' {RemDM: TRemoteDataModule} {RemDM: CoClass},
  uAistConsts in 'Common\uAistConsts.pas',
  uScktSrv in 'Source\uScktSrv.pas';

{$R *.TLB}

{$IFDEF UTD}
{$R armtisvr_utd.res}
{$ELSE}
{$R *.res}
{$ENDIF}

//var
  //Mutex : THandle;

begin
  TLogPropertyConfigurator.Configure(ChangeFileExt(ParamStr(0), '.log4d'));
  TLogLogger.GetRootLogger.Info('Старт');
  TLogLogger.GetRootLogger.Info('Версия приложения:' + fdcUtils.GetAppVersion);
  if FindCmdLineSwitch('gui', ['-','/'], True) then
  begin

//    Mutex := CreateMutex(nil, True,
//      PChar(StringReplace(lowercase(ParamStr(0)), '\', '/', [rfReplaceAll])));
//    if (Mutex <> 0) and (GetLastError = 0) then
    begin
     Forms.Application.Initialize;
     Forms.Application.Title := 'Интерфейс с КПС "Инспектор ОТО"';
     Forms.Application.CreateForm(TDataModule2, DataModule2);
  if not Forms.Application.Terminated then
       begin
          Forms.Application.CreateForm(TForm1, Form1);
          Forms.Application.Run;
       end;
     //CloseHandle(Mutex);
    end
//    else
//      Forms.Application.MessageBox('Сервис уже запущен', 'Интерфейс с КПС "Инспектор ОТО"');
  end
  else
    begin
      SvcMgr.Application.Initialize;
      //SvcMgr.Application.CreateForm(TDataModule2, DataModule2);
      SvcMgr.Application.CreateForm(TARMTIService, ARMTIService);
      SvcMgr.Application.Run;
    end;
  TLogLogger.GetRootLogger.Info('Стоп');
end.
