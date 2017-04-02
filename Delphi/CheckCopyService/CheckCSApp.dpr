program CheckCSApp;

uses
  SvcMgr,
  CheckCopySevice in 'CheckCopySevice.pas' {CheckCopyService: TService},
  CheckCopyUtils in 'CheckCopyUtils.pas',
  CheckCThread in 'CheckCThread.pas',
  MainDataMUnit in 'MainDataMUnit.pas' {MainDataM: TDataModule},
  ExportFTPAns in 'ExportFTPAns.pas',
  ExportModule in 'ExportModule.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Сервис взаимодействия с ТК';
  Application.CreateForm(TCheckCopyService, CheckCopyService);
  Application.CreateForm(TMainDataM, MainDataM);
  Application.Run;
end.
