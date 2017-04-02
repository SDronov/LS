program DBFDuple;

uses
  Forms,
  MainFrm in 'source\MainFrm.pas' {MainForm},
  uOptions in 'source\uOptions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Удаление дублей в DBF';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
