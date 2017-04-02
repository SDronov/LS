program AistTstApp;

uses
  FastMM4,
  Forms,
  uMain in 'Source\uMain.pas' {MainForm},
  uAistConsts in '..\Common\uAistConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ИРС "Доход" - Тест АИСТ-М <=> ЛС-Т';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
