program notificator;

uses
  Forms,
  uiMain in 'Units\uiMain.pas' {Main},
  uOptions in 'Units\uOptions.pas',
  uConsts in 'Units\uConsts.pas',
  uFTP in 'Units\uFTP.pas',
  uiMessageForm in 'Units\uiMessageForm.pas' {MsgForm};
 // uTrayIcon in 'Units\uTrayIcon.pas'


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
//Application.ShowMainForm:= false;
  Application.Run;
end.
