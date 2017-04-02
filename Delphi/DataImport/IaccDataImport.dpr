{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 254 $
  $Author: alexglad $
  $Date: 2005-10-03 16:51:05 +0400 (РџРЅ, 03 РѕРєС‚ 2005) $
}

program IaccDataImport;

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
  fdcCustomMainDm in '..\Common\fdcCustomMainDm.pas' {fdcCustomMainData: TDataModule},
  ImportDm in '..\Income-Accounts\Source\Import\ImportDm.pas' {ImportData: TDataModule},
  IaccLoader in '..\Income-Accounts\Source\Import\IaccLoader.pas',
  fdcDBUtils in '..\Income-Accounts\Source\fdcDBUtils.pas',
  CheckUtils in '..\Income-Accounts\Source\CheckUtils.pas',  
  IaccUtils in '..\Income-Accounts\Source\IaccUtils.pas';  

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Импорт в АПС "Лицевые счета"';
  Application.CreateForm(TMainData, MainData);
  Application.CreateForm(TImportData, ImportData);  
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
