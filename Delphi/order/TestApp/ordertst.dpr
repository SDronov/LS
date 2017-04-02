program ordertst;

uses
  Forms,
  otMain in 'Source\otMain.pas' {MainForm},
  comConsts in '..\Common\comConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
