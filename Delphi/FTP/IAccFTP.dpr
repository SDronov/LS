program IAccFTP;

uses
  SvcMgr,
  uMPKService in 'units\uMPKService.pas' {MPK_Service: TService},
  uZip in 'units\uZip.pas' {dmZIP: TDataModule},
  dmData in 'units\dmData.pas' {DM: TDataModule},
  uBusiness in 'units\uBusiness.pas',
  uCommon in 'units\uCommon.pas',
  uConsts in 'units\uConsts.pas',
  uExpAOANS in 'units\uExpAOANS.pas',
  uExpPUANS in 'units\uExpPUANS.pas',
  uExport in 'units\uExport.pas',
  uFTP in 'units\uFTP.pas',
  uLoger in 'units\uLoger.pas',
  uOptions in 'units\uOptions.pas',
  uQueue in 'units\uQueue.pas',
  uWatchDog in 'units\uWatchDog.pas',
  uFTPComm in 'units\uFTPComm.pas',
  uDMFTP in 'units\uDMFTP.pas' {DMFTP: TDataModule},
  uHelpClasses in 'units\uHelpClasses.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMPK_Service, MPK_Service);
  Application.CreateForm(TdmZIP, dmZIP);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
