unit uOptions;

interface
uses
 Windows, SysUtils,
 Registry, IniFiles;


type
 TOptionsState = ( osNotLoaded, osLoading, osLoaded, osSaving, osSaved, osNotSaved );

 TOptions = class
   private
    fIniFileName: TFileName;
    fIniFile: TMemIniFile;
    fRegistry: TRegistry;
    fModified: boolean;
    fLoadedFromINI: boolean;
    fLoadedFromRegistry: boolean;
    fOptionsState: TOptionsState;
    fFileMask: string;
    fApplicationTitle: string;
    fApplicationExeName: string;
   private
    fProgramAutoRun: boolean;
    fLoadFromRegistry: boolean;
    fAutoStart: boolean;
    fIntervalSeconds: integer;

    fNet_Mon: boolean;
    fNetPath: string;

    fFTP_Mon: boolean;

    fFtpHost: string;
    fFtpPort: integer;
    fFtpPassiveMode: boolean;

    fFtpUser:   string;
    fFtpPassword: string;
    fFtpDirectory: string;

    procedure loadingFromINI;
    procedure saveToINI;

    procedure saveProgramAutoRun;
    procedure loadProgramAutoRun;

    procedure loadingFromRegistry;
    procedure saveToRegistry;

    function applicationTitle: string;
    function applicationExeName: string;

   private
    procedure setProgramAutoRun(const value: boolean);
    procedure setAutoStart(const value: boolean);
    procedure setLoadFromRegistry(const Value: boolean);
    procedure setIntervalSeconds(const Value: integer);
    procedure setFtpHost(const Value: string);
    procedure setFtpPort(const Value: integer);
    procedure setFtpPassiveMode(const Value: boolean);
    procedure setFtpUser(const Value: string);
    procedure setFtpPassword(const Value: string);
    procedure setFtpDirectory(const Value: string);

    procedure setNet_Mon(const Value: boolean);
    procedure setFTP_Mon(const Value: boolean);
    procedure setFileMask(const Value: string);

    procedure setDefValues;
    function getNetPath: string;
    procedure setNetPath(const Value: string);

   protected
    procedure loadOptions;
    procedure saveOptions;
   public
    property State: TOptionsState read fOptionsState write fOptionsState;

    property programAutoRun: boolean read fProgramAutoRun write setProgramAutoRun;
    property loadFromRegistry: boolean read fLoadFromRegistry write setLoadFromRegistry;
    property fileMask: string read fFileMask write setFileMask;
    property intervalSeconds: integer  read fIntervalSeconds write setIntervalSeconds;
    property autoStart: boolean read fAutoStart write setAutoStart;

    property Net_Mon: boolean read fNet_Mon write setNet_Mon;
    property NetPath: string read getNetPath write setNetPath;

    property FTP_Mon: boolean read fFTP_Mon write setFTP_Mon;

    property ftpPassiveMode: boolean   read fFtpPassiveMode  write setFtpPassiveMode;
    property ftpHost:        string    read fFtpHost         write setFtpHost;
    property ftpUser:         string   read fFtpUser         write setFtpUser;
    property ftpPassword:     string   read fFtpPassword     write setFtpPassword;
    property ftpPort:         integer read fFtpPort          write setFtpPort;
    property ftpDirectory: string read fFtpDirectory         write setFtpDirectory;

    constructor create(aIniFileName: TFileName = '');

    destructor destroy; override;
 end;

implementation

uses uConsts;

procedure TOptions.loadOptions;
begin
 fOptionsState:= osLoading;
 loadingFromRegistry;
 loadProgramAutoRun;
{ if (not fLoadedFromRegistry)  then
  loadingFromINI; }

 if (fLoadedFromRegistry {or fLoadedFromINI} ) then
   fOptionsState:= osLoaded
 else begin
   fOptionsState:= osNotLoaded;
   setDefValues;
 end;
end;


procedure TOptions.loadingFromRegistry;

 procedure readStringDef( var stringValue: string; const aKey, defValue: string );
 begin
   stringValue:= defValue;
   if fRegistry.ValueExists(aKey) then
     stringValue:= fRegistry.readString(aKey);
 end;

 procedure readIntegerDef( var integerValue: integer; const aKey: string; const defValue: integer);
 begin
   integerValue:= defValue;
   if fRegistry.ValueExists(aKey) then
     integerValue:= fRegistry.readInteger(aKey);
 end;

 procedure readBoolDef( var boolValue: boolean; const aKey: string; const defValue: boolean);
 begin
   boolValue:= defValue;
   if fRegistry.ValueExists(aKey) then
     boolValue:= fRegistry.readBool(aKey);
 end;
var
 b: boolean;
begin
 fLoadedFromRegistry:= false;

 fRegistry:= TRegistry.Create;
 try
 try
   fRegistry.RootKey := cRootKey;
   if not fRegistry.OpenKey(cKeyPath, false) then
     abort;

   fLoadFromRegistry:= true;

   readBoolDef( fAutoStart, cAutoStart, defAutoStart );
   readIntegerDef( fIntervalSeconds, cIntervalSeconds, defIntervalSeconds );

   readStringDef( fFileMask,  cFileMask,  defFileMask );

   readBoolDef( fNet_Mon, cNet_Mon, defNet_Mon );
   readStringDef( fNetPath,  cNetPath,  defNetPath );

   readBoolDef( fFTP_Mon, cFTP_Mon, defFTP_Mon );

   readStringDef( fFtpHost,  cFtpHost,  defFtpHost );
   readIntegerDef( fFtpPort, cFtpPort, defFtpPort );
   readBoolDef( fFtpPassiveMode, cFtpPassiveMode, defFtpPassiveMode );

   readStringDef( fFtpUser, cFtpUser, defFtpUser );
   readStringDef( fFtpPassword, cFtpPassword, defFtpPassword );
   readStringDef( fFtpDirectory, cFtpDirectory, defFtpDirectory );

   fLoadedFromRegistry:= true;
 finally
   if assigned(fRegistry)  then
     freeAndNil(fRegistry);
 end;
 except
 end;
end;



procedure TOptions.loadingFromINI;
begin
 fLoadedFromINI:= false;
 try
 try
   if (fIniFileName = '') then
     fIniFileName:= changeFileExt( paramStr(0), '.ini' );

   if not fileExists( fIniFileName ) then abort;
   fIniFile:= TMemIniFile.Create(fIniFileName);

   with fIniFile do begin
     fLoadFromRegistry:= true;
     //fLoadFromRegistry:= 1 = readInteger( sec_notificator, cLoadFromRegistry, boolAsInt( defLoadFromRegistry) ) ;
     fAutoStart    :=   1 = readInteger( sec_notificator, cAutoStart, boolAsInt( defAutoStart ) );
     fIntervalSeconds:= readInteger( sec_notificator, cIntervalSeconds, defIntervalSeconds );

     fNet_Mon := 1 = readInteger( sec_notificator, cNet_Mon, boolAsInt(defNet_Mon) );
     fNetPath := readString ( sec_notificator, cNetPath, defNetPath);

     fFTP_Mon := 1 = readInteger( sec_notificator, cFTP_Mon, boolAsInt(defFTP_Mon) );

     fFtpHost        := readString ( sec_notificator, cFtpHost, defFtpHost);
     fFtpPort        := readInteger( sec_notificator, cFtpPort, defFtpPort );
     fFtpPassiveMode := 1 = readInteger( sec_notificator, cFtpPassiveMode, boolAsInt(defFtpPassiveMode) );

     fFtpUser        := readString ( sec_notificator, cFtpUser,  defFtpUser);
     fFtpPassword    := readString ( sec_notificator, cFtpPassword, defFtpPassword);
     fFtpDirectory   := readString ( sec_notificator, cFtpDirectory, defFtpDirectory);
   end;

   fLoadedFromINI:= true;
 finally
   if assigned(fIniFile) then
     freeAndNil(fIniFile);
 end;
 except end;
end;

procedure TOptions.saveToINI;
begin
 fOptionsState:= osSaving;
 try
  fIniFile:=nil;
  try
    if not fileExists( fIniFileName ) then abort;
    fIniFile:= TMemIniFile.Create(fIniFileName);

    with fIniFile do begin
      //writeInteger( sec_notificator, cLoadFromRegistry, boolAsInt( LoadFromRegistry) );

      writeInteger( sec_notificator, cAutoStart, boolAsInt( AutoStart ) );
      writeInteger( sec_notificator, cIntervalSeconds, IntervalSeconds );

      writeInteger( sec_notificator, cNet_Mon, boolAsInt( Net_Mon ) );
      writeString( sec_notificator,  cNetPath,       NetPath);
      writeInteger( sec_notificator, cFTP_Mon, boolAsInt( FTP_Mon ) );

      writeString( sec_notificator,  cFtpHost,       FtpHost);
      writeInteger( sec_notificator, cFtpPort,       FtpPort );
      writeInteger( sec_notificator, cFtpPassiveMode, boolAsInt( FtpPassiveMode ) );

      writeString( sec_notificator,  cFtpUser,       FtpUser);
      writeString( sec_notificator,  cFtpPassword,   FtpPassword);
      writeString( sec_notificator,  cFtpDirectory,  FtpDirectory);
    end;

    fOptionsState:= osSaved;
  except
    fOptionsState:= osNotSaved;
  end;
 finally
   if assigned(fIniFile) then
     freeAndNil(fIniFile);
 end;

end;

procedure TOptions.saveToRegistry;
begin
 fOptionsState:= osSaving;
 fRegistry:= TRegistry.Create;
 try
  try
    fRegistry.RootKey := cRootKey;
    if not fRegistry.OpenKey( cKeyPath, true ) then
      abort;

    with fRegistry do begin
      //writeBool   ( cLoadFromRegistry, LoadFromRegistry);
      writeBool   ( cAutoStart, AutoStart );
      writeInteger( cIntervalSeconds,  IntervalSeconds );

      writeBool( cNet_Mon,  Net_Mon );
      writeString(  cNetPath,  NetPath );
      writeBool( cFTP_Mon,  FTP_Mon );

      writeString ( cFtpHost,        FtpHost );
      writeInteger( cFtpPort,        FtpPort );
      writeBool   ( cFtpPassiveMode, FtpPassiveMode );

      writeString ( cFtpUser,       FtpUser );
      writeString ( cFtpPassword,   FtpPassword );
      writeString ( cFtpDirectory,  FtpDirectory );
      writeString  ( cFileMask, FileMask );
    end;

    fOptionsState:= osSaved;
  except
    fOptionsState:= osNotSaved;
  end;
 finally
  if assigned(fRegistry)  then
    freeAndNil(fRegistry);
 end;
end;

function TOptions.applicationTitle: string;
begin
 if( fApplicationTitle = '' )then
   fApplicationTitle:= ChangeFileExt( ExtractFileName(applicationExeName), '' );
 result:= fApplicationTitle;
end;

function TOptions.applicationExeName: string;
begin
 if( fApplicationExeName = '' )then
   fApplicationExeName:= ParamStr(0); ;
 result:= fApplicationExeName;
end;

procedure TOptions.saveProgramAutoRun;
var r: TRegistry;
begin
 r := TRegistry.Create;
 try
   r.RootKey := HKEY_CURRENT_USER;
   if r.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True) then begin
     if fProgramAutoRun then
       r.writeString( applicationTitle  ,'"' + applicationExeName + '"')
     else
       r.DeleteValue(applicationTitle);

     r.CloseKey;
   end;
 finally
   r.free;
 end;
end;

procedure TOptions.loadProgramAutoRun;
var
 r: TRegistry;
 s: string;
begin
 r := TRegistry.Create;
 try
  r.RootKey := HKEY_CURRENT_USER;
  if r.OpenKey( '\Software\Microsoft\Windows\CurrentVersion\Run', false ) then begin
    s:= r.ReadString( applicationTitle );
    fProgramAutoRun:= ( s = '"' + applicationExeName + '"')
  end;
 finally
  r.Free;
 end;
end;


procedure TOptions.saveOptions;
begin
 saveProgramAutoRun;
 saveToRegistry;

 exit;
 if LoadFromRegistry then begin
   saveProgramAutoRun;
   saveToRegistry;
 end
 else
//  if fLoadedFromINI then
   saveToINI;

end;

constructor TOptions.create(aIniFileName: TFileName = '');
begin
  inherited create;
  fIniFileName := aIniFileName;
  fLoadedFromINI:= false;
  fLoadedFromRegistry:= false;
//  fLoadedFromINI:= (fIniFileName <> '');
//  fLoadedFromRegistry:= not fLoadedFromINI;
  fOptionsState:= osNotLoaded;
  fModified:= false;
  loadOptions;
end;

destructor TOptions.destroy;
begin
 if fModified then
   saveOptions;
 inherited;
end;

procedure TOptions.setLoadFromRegistry(const Value: boolean);
begin
 if ( Value = fLoadFromRegistry ) then exit;
 fLoadFromRegistry:= Value;
 fModified:= true;
end;

procedure TOptions.setIntervalSeconds(const Value: integer);
begin
 if ( Value = fIntervalSeconds ) then exit;
 fIntervalSeconds:= Value;
 fModified:= true;
end;

procedure TOptions.setFtpHost(const Value: string);
begin
 if ( Value = fFtpHost ) then exit;
 fFtpHost:= Value;
 fModified:= true;
end;

procedure TOptions.setFtpUser(const Value: string);
begin
 if ( Value = fFtpUser ) then exit;
 fFtpUser:= Value;
 fModified:= true;
end;

procedure TOptions.setFtpPassword(const Value: string);
begin
 if ( Value = fFtpPassword ) then exit;
 fFtpPassword:= Value;
 fModified:= true;
end;

procedure TOptions.setFtpPort(const Value: integer);
begin
 if ( Value = fFtpPort ) then exit;
 fFtpPort:= Value;
 fModified:= true;
end;

procedure TOptions.setFtpDirectory(const Value: string);
begin
 if ( Value = fFtpDirectory ) then exit;
 fFtpDirectory:= Value;
 fModified:= true;
end;

procedure TOptions.setAutoStart(const value: boolean);
begin
 if ( Value = fAutoStart ) then exit;
 fAutoStart:= Value;
 fModified:= true;
end;

procedure TOptions.setProgramAutoRun(const value: boolean);
begin
 if ( Value = fProgramAutoRun ) then exit;
 fProgramAutoRun:= Value;
 fModified:= true;
end;


procedure TOptions.setFtpPassiveMode(const Value: boolean);
begin
 if ( Value = fFtpPassiveMode ) then exit;
 fFtpPassiveMode := Value;
 fModified:= true;
end;

procedure TOptions.setNet_Mon(const Value: boolean);
begin
 if ( Value = Net_Mon ) then exit;
 fNet_Mon:= Value;
 fModified:= true;
end;

procedure TOptions.setNetPath(const Value: string);
begin
 if ( Value = NetPath ) then
   exit;
 fNetPath:= Value;
 fModified:= true;
end;

function TOptions.getNetPath: string;
begin
 result:= fNetPath;
 if result <> '' then
   result:= IncludeTrailingPathDelimiter( fNetPath );
end;


procedure TOptions.setFTP_Mon(const Value: boolean);
begin
 if ( Value =  FTP_Mon) then exit;
 fFTP_Mon := Value;
 fModified:= true;
end;

procedure TOptions.setFileMask(const Value: string);
begin
 if FileMask = Value then exit;
 fFileMask := Value;
 fModified:= true;
end;


procedure TOptions.setDefValues;
begin
 fProgramAutoRun:= false;
 fLoadFromRegistry:= true;
 fAutoStart:=       defAutoStart;
 fIntervalSeconds:= defIntervalSeconds;

 fNet_Mon:= defNet_Mon;
 fNetPath:= defNetPath;
 fFTP_Mon := defFTP_Mon;

 fFtpHost:= defFtpHost;
 fFtpPort:= defFtpPort;
 fFtpPassiveMode:= defFtpPassiveMode;

 fFtpUser     := defFtpUser;
 fFtpPassword := defFtpPassword;
 fFtpDirectory:= defFtpDirectory;
 fFileMask:= defFileMask;
end;


end.
