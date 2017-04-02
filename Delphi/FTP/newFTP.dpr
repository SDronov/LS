program newFTP;

uses
  Forms,
  uiFMain in 'units\uiFMain.pas' {FMain},
  uOptions in 'units\uOptions.pas',
  uBusiness in 'units\uBusiness.pas',
  dmData in 'units\dmData.pas' {DM: TDataModule},
  uLoger in 'units\uLoger.pas',
  uExport in 'units\uExport.pas',
  uCommon in 'units\uCommon.pas',
  uFTP in 'units\uFTP.pas',
  uQueue in 'units\uQueue.pas',
  uExpPUANS in 'units\uExpPUANS.pas',
  uExpAOANS in 'units\uExpAOANS.pas',
  uZip in 'units\uZip.pas' {dmZIP: TDataModule},
  uWatchDog in 'units\uWatchDog.pas',
  uFTPComm in 'units\uFTPComm.pas',
  uDMFTP in 'units\uDMFTP.pas' {DMFTP: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmZIP, dmZIP);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
