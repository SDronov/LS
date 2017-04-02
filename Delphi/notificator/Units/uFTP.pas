unit uFTP;
interface
uses
  Windows, Classes, SysUtils, Masks,
  IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdGlobal,
  uOptions;

type
 TFTP = class(TIdFTP)
  private
   fAutoDisconnect: boolean;
   fOptions: TOptions;
   function optionsAssigned: boolean;
   function getFtpAvailible: boolean;
  protected

  public
   property ftpAvailible: boolean read getFtpAvailible;

   constructor create( aOptions: TOptions; aAutoDisconnect:boolean =false ); reintroduce;
   function existingFiles: TStrings;
   destructor destroy; override;
 end;

implementation

uses uConsts;

destructor TFTP.destroy;
begin
 if connected then
   disconnect;
 inherited;
end;


constructor TFTP.create( aOptions: TOptions; aAutoDisconnect:boolean =false ); 
begin
 inherited create(nil);
 fOptions:= aOptions;
 fAutoDisconnect:= aAutoDisconnect;
// fFilesExists:= false;
end;

function TFTP.optionsAssigned: boolean;
begin
 result:= false;
 if not assigned( fOptions ) then
   exit;
 Passive:= fOptions.ftpPassiveMode;
 Host   := fOptions.ftpHost;
 Username:= fOptions.ftpUser;
 Password:= fOptions.ftpPassword;
 Port:= fOptions.ftpPort;

 result:= true;
end;

function TFTP.getFtpAvailible: boolean;
var sCurDir: string;
begin
 result:= false;
 if (not optionsAssigned) then
   exit;
 try
  connect( true, 5000 );

  if (fOptions.ftpDirectory <> '') then begin
    sCurDir:= RetrieveCurrentDir;
    if (fOptions.ftpDirectory <> sCurDir) then
      changeDir(fOptions.ftpDirectory);
    while (sCurDir <> RetrieveCurrentDir) do
      changeDirUp;
  end { if (fOptions.ftpDirectory <> '') ..};

  result:= connected;
  if result and fAutoDisconnect then
    disconnect;
 except
  result:= false;
 end;
end;


function TFTP.existingFiles: TStrings;
begin
 result:= nil;
 if (not optionsAssigned) then
   exit;

 try
  if (not connected) then
    connect( true, 5000 );

  if (not connected) then begin
    abort;
  end;

  if (fOptions.ftpDirectory <> '') then
    changeDir(fOptions.ftpDirectory);

  result:= TStringList.Create;
  list( result, fOptions.fileMask, false );

 finally
  if connected then
    disconnect;
  if( result.Count = 0 )then
    freeAndNil(result);
 end;

end;


(*function TFTP.listEquivalence(const aList1, aList2: TStringList):boolean;
var
 i1, i2: integer;
begin
 result:= false;
 if (aList1.Count = aList2.Count) then begin
  result := (aList1.Count = 0);
  if result then
    exit;

  for i1:= 0 to aList1.Count-1 do begin
    for i2:= 0 to aList2.Count-1 do begin
      result:= (aList1[i1] = aList2[i2]);
      if result then
        break;
    end;
    if (not result) then
      break;
  end;
 end; { if (aList1.Count = aList2.Count).. }
end;*)

end.
