program LoadApp;

{%ToDo 'LoadApp.todo'}

uses
  Forms,
  MainDm in 'Source\MainDm.pas' {MainDm},
  MainForm in 'Source\MainForm.pas' {MainMDIForm},
  fdcCustomFrm in '..\Common\fdcCustomFrm.pas' {fdcCustomForm},
  fdcCustomDlgFrm in '..\Common\fdcCustomDlgFrm.pas' {fdcCustomDlgForm},
  fdcCustomTabDlgFrm in '..\Common\fdcCustomTabDlgFrm.pas' {fdcCustomTabDlgForm},
  fdcCustomWizardFrm in '..\Common\fdcCustomWizardFrm.pas' {fdcCustomWizardForm},
  DataDM in 'Source\DataDM.pas' {MainData: TDataModule},
  fdcSplashFrm in '..\Common\fdcSplashFrm.pas' {fdcSplashForm},
  fdcCustomLogOnFrm in '..\Common\fdcCustomLogOnFrm.pas' {fdcCustomLogOnForm},
  fdcCustomSimpleDlgFrm in '..\Common\fdcCustomSimpleDlgFrm.pas' {fdcCustomSimpleDlgForm},
  fdcModulesInfoFrm in '..\Common\fdcModulesInfoFrm.pas' {fdcModulesInfoForm},
  AppInf in 'Source\AppInf.pas',
  BaseWizardFrm in 'Source\BaseWizardFrm.pas' {BaseWizardForm},
  DLWizardFrm in 'Source\DLWizardFrm.pas' {DLLoaderForm},
  fdcCustomGridFrm in '..\Common\fdcCustomGridFrm.pas' {fdcCustomGridForm},
  fdcCustomDBDataFrm in '..\Common\fdcCustomDBDataFrm.pas' {fdcCustomDBDataForm},
  fdcCustomDataFrm in '..\Common\fdcCustomDataFrm.pas' {fdcCustomDataForm},
  BadPaymentFrm in 'Source\BadPaymentFrm.pas' {BadPaymentForm},
  fdcCustomCardFrm in '..\Common\fdcCustomCardFrm.pas' {fdcCustomCardForm},
  PaymentFrm in 'Source\PaymentFrm.pas' {PaymentForm},
  InLoader in 'Source\InLoader.pas',
  SubejctGridFrm in 'Source\SubejctGridFrm.pas' {SubjectGridForm},
  fdcOraLogOnFrm in '..\Common\fdcOraLogOnFrm.pas' {fdcOraLogOnForm},
  DateForm in 'Source\DateForm.pas' {fdcCustomDlgForm1},
  FormMngr in '..\Common\FormMngr.pas',
  dxPsStrs_RUS in '..\dx-rus\dxPsStrs_RUS.pas',
  cxGridStrs_RUS in '..\dx-rus\cxGridStrs_RUS.pas',
  dxBarStrs_RUS in '..\dx-rus\dxBarStrs_RUS.pas',
  Log4D in '..\Income-Accounts\Source\utils\Log4D.pas',
  ArchUtils in 'Source\ArchUtils.pas',
  qdbfload in '..\Income-Accounts\Source\Import\qdbfload.pas',
  fdcExceptions in '..\FDC Library\FDC Common\Source\fdcExceptions.pas',
  IaccLoader in 'Source\IaccLoader.pas',
  IaccUtils in '..\Income-Accounts\Source\IaccUtils.pas',
  fdcCustomObjectFrm in '..\Common\fdcCustomObjectFrm.pas' {fdcCustomObjectForm},
  fdcCustomObjectGridFrm in '..\Common\fdcCustomObjectGridFrm.pas' {fdcCustomObjectGridForm},
  ObjectFrm in 'Source\ObjectFrm.pas' {ObjectForm},
  FormUtils in 'Source\FormUtils.pas',
  ObjServices in '..\Income-Accounts\Source\core\ObjServices.pas',
  ChangeImportDateFrm in 'Source\ChangeImportDateFrm.pas' {ChangeImportDateForm},
  DBFLoader in 'Source\DBFLoader.pas',
  UFKPaymentsGridFrm in 'Source\UFKPaymentsGridFrm.pas' {UFKPaymentsGridForm},
  TransferDm in 'Source\TransferDm.pas' {dmTransfer: TDataModule},
  PaysUpGridFrm in 'Source\PaysUpGridFrm.pas' {PaysUpGridForm},
  UFKPaySplitFrm in 'Source\UFKPaySplitFrm.pas' {UFKPaySplitForm},
  ExportWizardFrm in 'Source\ExportWizardFrm.pas' {ExportWizardForm},
  ImportWizardFrm in 'Source\ImportWizardFrm.pas' {ImportWizardForm},
  ImportErrorsFrm in 'Source\ImportErrorsFrm.pas' {ImportErrorsForm},
  MergeFrm in 'Source\MergeFrm.pas' {MergeForm};

{$R *.res}

begin
  ShowSplashScreen;
  Application.Initialize;
  Application.Title := 'АПС "Лицевые счета" - Перенос остатков';
  Application.CreateForm(TMainData, MainData);
  Application.CreateForm(TMainMDIForm, MainMDIForm);
  Application.Run;
end.
