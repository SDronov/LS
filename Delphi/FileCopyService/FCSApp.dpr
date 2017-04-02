program FCSApp;

uses
  SvcMgr,
  FileCopySevice in 'FileCopySevice.pas' {FileCopyService: TService},
  FileCopyUtils in 'FileCopyUtils.pas',
  FCThread in 'FCThread.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFileCopyService, FileCopyService);
  Application.Run;
end.
