program DBFDuple;

uses
  Forms,
  MainFrm in 'source\MainFrm.pas' {MainForm},
  uOptions in 'source\uOptions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�������� ������ � DBF';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
