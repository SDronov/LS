program GTDViewer;

uses
  Forms,
  TestMainForm in 'TestMainForm.pas' {TestMainForm1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTestMainForm1, TestMainForm1);
  Application.Run;
end.
