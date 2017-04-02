program StdOraClientApp;

uses
  Forms,
  fdcCustomFrm in '..\Common\fdcCustomFrm.pas' {fdcCustomForm},
  fdcCustomDlgFrm in '..\Common\fdcCustomDlgFrm.pas' {fdcCustomDlgForm},
  fdcCustomSimpleDlgFrm in '..\Common\fdcCustomSimpleDlgFrm.pas' {fdcCustomSimpleDlgForm},
  fdcCustomTabDlgFrm in '..\Common\fdcCustomTabDlgFrm.pas' {fdcCustomTabDlgForm},
  fdcCustomWizardFrm in '..\Common\fdcCustomWizardFrm.pas' {fdcCustomWizardForm},
  fdcCustomLogOnFrm in '..\Common\fdcCustomLogOnFrm.pas' {fdcCustomLogOnForm},
  fdcOraLogOnFrm in '..\Common\fdcOraLogOnFrm.pas' {fdcOraLogOnForm},
  fdcSplashFrm in '..\Common\fdcSplashFrm.pas' {fdcSplashForm},
  fdcModulesInfoFrm in '..\Common\fdcModulesInfoFrm.pas' {fdcModulesInfoForm},
  fdcCustomWindowFrm in '..\Common\fdcCustomWindowFrm.pas' {fdcCustomWindowForm},
  fdcCustomMainFrm in '..\Common\fdcCustomMainFrm.pas' {fdcCustomMainForm},
  fdcCustomOraMainFrm in '..\Common\fdcCustomOraMainFrm.pas' {fdcCustomOraMainForm},
  fdcCustomDataFrm in '..\Common\fdcCustomDataFrm.pas' {fdcCustomDataForm},
  fdcCustomDBDataFrm in '..\Common\fdcCustomDBDataFrm.pas' {fdcCustomDBDataForm},
  fdcCustomCardFrm in '..\Common\fdcCustomCardFrm.pas' {fdcCustomCardForm},
  fdcCustomGridFrm in '..\Common\fdcCustomGridFrm.pas' {fdcCustomGridForm},
  MainDm in 'Source\MainDm.pas' {MainData: TDataModule},
  MainFrm in 'Source\MainFrm.pas' {MainForm},
  fdcCustomMainDm in '..\Common\fdcCustomMainDm.pas' {fdcCustomMainData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '<InternalName>';
  Application.CreateForm(TMainData, MainData);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
