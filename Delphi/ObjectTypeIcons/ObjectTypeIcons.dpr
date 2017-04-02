program ObjectTypeIcons;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Пиктограммы типов объектов';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
