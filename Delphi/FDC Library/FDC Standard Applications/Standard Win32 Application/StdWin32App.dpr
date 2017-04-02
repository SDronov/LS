program StdWin32App;

uses
  Forms,
  fdcCustomFrm in '..\Common\fdcCustomFrm.pas' {fdcCustomForm},
  fdcCustomDlgFrm in '..\Common\fdcCustomDlgFrm.pas' {fdcCustomDlgForm},
  fdcCustomSimpleDlgFrm in '..\Common\fdcCustomSimpleDlgFrm.pas' {fdcCustomSimpleDlgForm},
  fdcCustomTabDlgFrm in '..\Common\fdcCustomTabDlgFrm.pas' {fdcCustomTabDlgForm},
  fdcCustomWizardFrm in '..\Common\fdcCustomWizardFrm.pas' {fdcCustomWizardForm},
  fdcSplashFrm in '..\Common\fdcSplashFrm.pas' {fdcSplashForm},
  fdcModulesInfoFrm in '..\Common\fdcModulesInfoFrm.pas' {fdcModulesInfoForm},
  fdcCustomWindowFrm in '..\Common\fdcCustomWindowFrm.pas' {fdcCustomWindowForm},
  fdcCustomMainFrm in '..\Common\fdcCustomMainFrm.pas' {fdcCustomMainForm},
  fdcCustomDataFrm in '..\Common\fdcCustomDataFrm.pas' {fdcCustomDataForm},
  MainFrm in 'Source\MainFrm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '<InternalName>';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
