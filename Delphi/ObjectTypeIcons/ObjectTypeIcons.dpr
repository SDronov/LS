program ObjectTypeIcons;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '����������� ����� ��������';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
