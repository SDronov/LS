unit uOptions;

interface
uses
 Forms, FileCtrl, Classes, SysUtils, Windows, IniFiles, IdFTP;

type
 TSrvOptionsEntry = record
   // Proxy
   Proxy_Type     : TIdFtpProxyType;
   Proxy_Host     : string;
   Proxy_Port     : integer;
   Proxy_UserName : string;
   Proxy_Password : string;
   // FTP
   FTP_Passive    : Boolean;
   FTP_Host       : string;
   FTP_Port       : Integer;
   FTP_TimeOut : Integer;
   FTP_UserName   : string;
   FTP_Password   : string;
   // Каталоги FTP
   FtpDir_Source : string;
   FtpDir_Dest   : string;
   // Каталоги
   Dir_DownLoad : string;
   Dir_DownLoad_Arch : string;
   Dir_Answer   : string;
   Dir_Answer_Arch   : string;
   Dir_Error    : string;

   // файлы
   FileMask        : string;
   AnswerMask      : string;

//   SkipFileName    : string;
   DelFtpFiles     : Boolean;
   MaxTransCount   : Integer;
   OverWriteExists : Boolean;
   DelAfterImport  : Integer;
   DelAfterExport  : Integer;

   // заголовок
   ServiceName: string; // Наименование сервиса
 end;
 PSrvOptionsEntry = ^TSrvOptionsEntry;

TServiceList = TList;
TOptions = class(TIniFile)
 private
   fIniFile: TFileName;
   fTableName: string;
   fColumnMap: string;

   fPeriodSeconds: integer;
   fArchivePeriod: integer;
   fLogDetalization: integer;

   fNsiImportFile: string;
   fDBServer, fDBUser, fDBPassword, fDBSchema: string;
   fDBCrypt: boolean;
   fLogFile: TFileName;
   fWorkDirPath: TFileName;
   fSrvLst: TServiceList;
    fMaxLogSize: integer;

   function getSL: TServiceList;

   function getServCnt: integer;
   procedure setServCnt(const Value: integer);
   function getSrvOptions(aIndex: integer): TSrvOptionsEntry;

   //procedure dbgLoadOptions;

   procedure loadHeader;
   procedure loadServicesInfo;
   function DeCryptPassword(aText: string): string;
   function checkMergePath(aPath: TFileName): TFileName;

 protected
   property ServiceList:TServiceList read getSL;

 public
   procedure beforeDestruction; override;

 public
   constructor create( aIniFile: TFileName = '' ); overload;
   property IniFile: TFileName read fIniFile;
   property TableName: string read fTableName;
   property ColumnMap: string read fColumnMap;

   property NsiImportFile: string read fNsiImportFile;
   property WorkDirPath: TFileName read fWorkDirPath;
   property LogFile: TFileName read fLogFile;  // расположение лог - файла
   property maxLogSize: integer read fMaxLogSize;
   property PeriodSeconds: integer read fPeriodSeconds; // интервал опроса в минутах

   property ArchivePeriod: integer read fArchivePeriod; // Длительность хранения архивных файлов, дней
   property LogDetalization: integer read fLogDetalization; // Детализация лога

   property DB_Server: string read fDBServer;     // наименование сервера БД
   property DB_User: string read fDBUser;         // имя пользователя БД
   property DB_Password: string read fDBPassword; // пароль сервиса
   property DB_Schema: string read fDBSchema;     // схема сервиса
   property DB_Crypt: boolean read fDBCrypt;  // признак шифрования

   property ServiceCount: integer read getServCnt write setServCnt;  // кол - во обслуживаемых сервисов
   property ServiceOptions[idx:integer]: TSrvOptionsEntry read getSrvOptions; // перечень опций для каждого сервиса
end;

var Options: TOptions;

implementation

uses uLoger, uCommon;

const

  // -- Настройки INI-файла
  // ======= Common
  // =========================
  SEC_COMMON           = 'Common';
  v_CommonServiceCount = 'ServiceCount';
  v_Seconds            = 'PeriodSeconds';
    dfSeconds          = 60;

  v_LogFile            = 'LogFileName';
  v_MaxLogSize         = 'MaxLogSize';
  dfMaxLogSize         = 150;

  v_WorkDirPath        = 'WorkDirPath';
  v_NsiImportFile      = 'NsiImportFile';

  SEC_SERVICE          = 'Service';

  v_ArchivePeriod      = 'ArchivePeriod';
  dfArchivePeriod      = 0;

  v_LogDetalization    = 'LogDetalization';
  dfLogDetalization    = 0;

  // ======= FTP
  // =========================
  SEC_FTP              = 'FTP';
  v_FTPHost            = 'Host';
  v_FTPPort            = 'Port';
      dfFtpPort        = 21;
  v_FTPUserName        = 'UserName';
  v_FTPPassword        = 'FTPPassword';
  v_FTPCrypt           = 'FTPCrpypt';
  v_FTPPassive         = 'Passive';
      dfFtpPassive     = False;
  v_FtpTimeOut         = 'FtpTimeOut';
      dfFtpTimeOut     = 30;
  // ======= Proxy
  // =========================
  SEC_PROXY            = 'PROXY';
  v_ProxyType          = 'ProxyType';
      dfProxyType      = 0;
  v_ProxyHost          = 'ProxyHost';
  v_ProxyPort          = 'ProxyPort';
      dfProxyPort      = 0;
  v_ProxyUserName      = 'ProxyUserName';
  v_ProxyPassword      = 'ProxyPassword';
  v_ProxyCrypt         = 'ProxyCrypt';
  // ======= DB
  // =========================
  SEC_DB               = 'DataBase';
  v_DbHost             = 'DBName';
  v_DBUserName         = 'DBUserName';
  v_DBPassword         = 'DBPassword';
  v_DBSchema           = 'DBSchema';
  v_DBCrypt            = 'DBCrypt';

  v_TableName          = 'tablename';
    oraTableName       = 'DBF_CUSTOM_PAYS';
  v_ColumnMap          = 'fields';
  // ======= Dirs
  // =========================
  SEC_DIRS             = 'DIRS';
  // -- FTP каталоги
  v_SourceDir          = 'SourceDir';
      dfSourceDir      = 'in';
  v_DestDir            = 'DestDir';
      dfDestDir        = 'out';
  // -- локальные каталоги
  v_DownLoadDir        = 'DownLoadDir';
      dfDownLoadDir    = 'Downloads';
  v_ErrorFileDir       = 'ErrorFileDir';
      dfErrorDir       = 'Errors';
  v_AnsDir             = 'AnswerDir';
      dfAnsDir         = 'Answers';

  v_DownLoad_ArchDir = 'ArchDownDir';
    dfDownLoad_ArchDir = 'ArchDown';

  v_Answ_ArchDir = 'ArchAnswDir';
    dfAnsw_ArchDir = 'ArchAnsw';

  // -- файлы
  v_ServiceName        = 'ServiceName'; // Наименование сервиса

  // -- опции
  v_FileMask           = 'FileMask';
      dfFileMask       = '*.*';//'*.REQ';

  v_AnswerMask         = 'AnswerMask';
      dfAnswMask       = 'TK*.ANS';

  v_MaxLogSizeMb       = 'MaxLogSizeMb';
      dfMaxLogSizeMb   = 1;
  v_MaxTransCount      = 'MaxTransactionCount';
    dfMaxTransCount    = 100;
      MaxTransCountMax = 500;
  // -- ключи
  v_OverWriteExists    = 'OverWriteExists';
    dfOverWriteExists  = True;
  v_DelAfterImport     = 'DeleteFilesAfterImport';
      dfDelAfterImport = 0;

  v_DelAfterExport  = 'DeleteFilesAfterExport';
  dfDelAfterExport  = 0;


  v_DeleteFtpFiles     = 'DeleteFtpFiles';
      dfDeleteFtpFiles = False;

      
{ TOptions }
procedure TOptions.loadHeader;
 function NSIImportLoad(aNSI_FILE: TFileName): boolean;
 const
  cSection = 'tran.dbf';
  cTableName = 'tablename';
  cOraTableName = 'DBF_CUSTOM_PAYS';
  cColumnMap          = 'fields';
 var
  ini: TIniFile;
 begin
  ini:= nil;
  Result := False;
  if FileExists(aNSI_FILE) then
  try
   ini := TIniFile.Create(aNSI_FILE);
   fTableName := ini.ReadString( cSection, cTableName, cOraTableName );
   fColumnMap := ini.ReadString( cSection, cColumnMap, '');
   Result := True;
  finally
   if Assigned(ini) then
     FreeAndNil(ini);
  end;
 end;{function NSIImportLoad..}

begin
// Процедура загрузки заголовка ini - файла
// Общие настройки -- [Common]
 ServiceCount:= readInteger( SEC_COMMON, v_CommonServiceCount, 0 );
 fPeriodSeconds:= readInteger( SEC_COMMON, v_Seconds, dfSeconds );

 fWorkDirPath:= readString(SEC_COMMON, v_WorkDirPath, '' );
 if ( fWorkDirPath <> '' ) then
   fWorkDirPath:= includeTrailingPathDelimiter(fWorkDirPath)
 else
   fWorkDirPath:= getReservePath;

 checkDirectory( fWorkDirPath );

 fNsiImportFile:= readString(SEC_COMMON, v_NsiImportFile, '' );
 if (fNsiImportFile = '')or(not fileExists(fNsiImportFile) ) then
   fNsiImportFile := IncludeTrailingPathDelimiter(extractFileDir(Application.ExeName)) + 'nsi_import.ini';

{ TODO : make LOG path hire!!! }
 fLogFile:= readString(SEC_COMMON, v_LogFile, '' ) ;
 if (fLogFile = '') then
   fLogFile:= changeFileExt(getShortAppName,'.log');
 fLogFile:= checkMergePath( fLogFile );
 fMaxLogSize:= 1000*readInteger( SEC_COMMON, v_MaxLogSize, dfMaxLogSize );

// База данных -- [DataBase]
 fDBServer     := ReadString( SEC_DB, v_DbHost, '' );
 fDBUser := ReadString( SEC_DB, v_DBUserName, '' );
 fDBSchema := ReadString( SEC_DB, v_DBSchema, '' );

 if ReadBool( SEC_DB, v_DBCrypt, False ) then
   fDBPassword := DeCryptPassword( ReadString( SEC_DB, v_DBPassword, '' ) )
 else
   fDBPassword := ReadString( SEC_DB, v_DBPassword, '' );

 if not NSIImportLoad( NsiImportFile ) then
 begin
   fTableName := ReadString( SEC_DB, v_TableName, oraTableName );
   fColumnMap := ReadString( SEC_DB, v_ColumnMap, '' );
 end;

 fArchivePeriod:= readInteger( SEC_COMMON, v_ArchivePeriod, dfArchivePeriod );

 fLogDetalization:= readInteger( SEC_COMMON, v_LogDetalization, dfLogDetalization );
// Заголовок загружен. Дальше только сервисы
end;

procedure TOptions.loadServicesInfo;
var
 i: integer;
 sSection: string;
 pe: PSrvOptionsEntry;
begin
// Процедура загрузки информации о сервисах
 for i:= 0 to ServiceCount-1 do begin
  sSection := SEC_SERVICE + '.' + IntToStr( i );
  new(pe);

  pe^.ServiceName := ReadString ( sSection, v_ServiceName, sSection );
 // Dirs
  pe^.FtpDir_Source := ReadString( sSection, v_SourceDir, dfSourceDir );
  pe^.FtpDir_Dest   := ReadString( sSection, v_DestDir,   dfDestDir   );

  pe^.Dir_Download :=  includeTrailingPathDelimiter(checkMergePath( ReadString( sSection, v_DownLoadDir,  dfDownloadDir ) ) );
  pe^.Dir_Error    :=  includeTrailingPathDelimiter(checkMergePath( ReadString( sSection, v_ErrorFileDir, dfErrorDir    ) ) );
  pe^.Dir_Answer   :=  includeTrailingPathDelimiter(checkMergePath( ReadString( sSection, v_AnsDir,       dfAnsDir      ) ) );

  pe^.Dir_DownLoad_Arch := includeTrailingPathDelimiter(checkMergePath( ReadString( sSection, v_DownLoad_ArchDir, dfDownLoad_ArchDir ) ) );
  pe^.Dir_Answer_Arch   := includeTrailingPathDelimiter(checkMergePath( ReadString( sSection, v_Answ_ArchDir, dfAnsw_ArchDir  ) ) );

    checkDirectory(pe^.Dir_Download);
    checkDirectory(pe^.Dir_Error);
    checkDirectory(pe^.Dir_Answer);
    checkDirectory(pe^.Dir_DownLoad_Arch );
    checkDirectory(pe^.Dir_Answer_Arch);

  pe^.FileMask   := ReadString ( sSection, v_FileMask,   dfFileMask );
  pe^.AnswerMask := ReadString ( sSection, v_AnswerMask, dfAnswMask );

  pe^.DelAfterImport  := ReadInteger( sSection, v_DelAfterImport,  dfDelAfterImport  );
  pe^.DelAfterExport  := ReadInteger( sSection, v_DelAfterExport,  dfDelAfterExport  );

  pe^.OverWriteExists := ReadBool   ( sSection, v_OverWriteExists, dfOverWriteExists );
  pe^.DelFtpFiles     := ReadBool   ( sSection, v_DeleteFtpFiles,  dfDeleteFtpFiles  );

  pe^.MaxTransCount   := ReadInteger( sSection, v_MaxTransCount,  dfMaxTransCount );

// FTP
   pe^.Ftp_Passive    := ReadBool   ( sSection + '.' + SEC_FTP, v_FTPPassive,    dfFtpPassive    );
   pe^.Ftp_Host       := ReadString ( sSection + '.' + SEC_FTP, v_FTPHost,       ''              );
   pe^.Ftp_Port       := ReadInteger( sSection + '.' + SEC_FTP, v_FTPPort,       dfFtpPort       );
   pe^.Ftp_Username   := ReadString ( sSection + '.' + SEC_FTP, v_FTPUserName,   ''              );
   pe^.Ftp_TimeOut    := ReadInteger( sSection + '.' + SEC_FTP, v_FtpTimeOut, dfFtpTimeOut );
   if ReadBool( sSection + '.' + SEC_FTP, v_FTPCrypt, False ) then
     pe^.Ftp_Password := DeCryptPassword( ReadString( sSection + '.' + SEC_FTP, v_FTPPassword, '' ) )
   else
     pe^.Ftp_Password := ReadString( sSection + '.' + SEC_FTP, v_FTPPassword, '' );

// Proxy
   pe^.Proxy_Type     := TIdFtpProxyType( ReadInteger( sSection + '.' + SEC_PROXY, v_ProxyType, dfProxyType ) );
   pe^.Proxy_Host     := ReadString ( sSection + '.' + SEC_PROXY, v_ProxyHOST,     ''          );
   pe^.Proxy_Port     := ReadInteger( sSection + '.' + SEC_PROXY, v_ProxyPort,     dfProxyPort );
   pe^.Proxy_UserName := ReadString ( sSection + '.' + SEC_PROXY, v_ProxyUserName, ''          );
   if ReadBool( sSection + '.' + SEC_PROXY, v_ProxyCrypt, False ) then
     pe^.Proxy_Password := DeCryptPassword( ReadString( sSection + '.' + SEC_PROXY, v_ProxyPassword, '' ) )
   else
     pe^.Proxy_Password := ReadString( sSection + '.' + SEC_PROXY, v_ProxyPassword, '' );

 // проверки
  if not (pe^.DelAfterImport in [0,1,2]) then
    pe^.DelAfterImport := dfDelAfterImport;

  if pe^.Ftp_TimeOut <= 0 then
    pe^.Ftp_TimeOut := dfFtpTimeOut;

 { if (pe^.MaxTransCount <= 0) or (pe^.MaxTransCount > MaxTransCountMax) then
    pe^.MaxTransCount := dfMaxTransCount; }

  fSrvLst.items[i]:= pe;

 end;{ for i:= 0 to ServiceCount-1.. }
end;

function TOptions.checkMergePath( aPath: TFileName ): TFileName;
const
 cDRV = ':\';
 cREL= '.\';
begin
 if ( 2 = pos(cDRV, aPath)) then begin // полагаем, что это абсолютный путь
  result:= aPath;
  exit;
 end;
 // значит, это относительный путь
 result:= fWorkDirPath + copy(aPath, 1+pos(cREL, aPath)*length(cREL), length(aPath) );
end;

function TOptions.DeCryptPassword(aText : string) : string;
begin
 if (aText = '') then
   Result := ''
 else
   Result := aText; // LogonDeCrypt(aText); { TODO : Найти функцию LogonDeCrypt(aText) и сделать правильно }
end;

constructor TOptions.create( aIniFile: TFileName );
begin
 fIniFile:= aIniFile;
 inherited create(fIniFile);
 loadHeader;
 loadServicesInfo;
end;

procedure TOptions.beforeDestruction;
var i: integer;
begin
 if Assigned(fSrvLst) then begin
   for i:= 0 to ServiceList.Count-1 do
     dispose(ServiceList[i]);
   freeAndNil(fSrvLst);
 end;
 inherited;
end;

function TOptions.getSL: TServiceList;
begin
 if not Assigned(fSrvLst) then
   fSrvLst:= TServiceList.Create;
 result:= fSrvLst;
end;

function TOptions.getServCnt: integer;
begin
 result:= ServiceList.Count;
end;

procedure TOptions.setServCnt(const Value: integer);
begin
 if (ServiceList.Count <> value) then
  ServiceList.Count:= Value;
end;

function TOptions.getSrvOptions(aIndex: integer): TSrvOptionsEntry;
begin
 result:= TSrvOptionsEntry(ServiceList[aIndex]^);
end;

(*
procedure TOptions.dbgLoadOptions;
var entry: PSrvOptionsEntry;
begin
 Exit;

 fDBServer:= '';
 fDBUser:= '';
 fDBPassword:= '';

// fSecondsCnt:= 60;

// первый
 new(entry); // **************
  // Каталоги FTP
 entry^.FtpDir_Source := '';
 entry^.FtpDir_Dest   := '';
 // Каталоги
 entry^.Dir_Error    := '';
 entry^.Dir_Answer   := '';
 entry^.Dir_DownLoad_Arch := '';
 entry^.Dir_Answer_Arch   := '';
 // файлы
 // entry^.SkipFileName    := '';
 entry^.DelFtpFiles     := true;
 entry^.OverWriteExists := false;
// entry^.DelAfterImport  : Integer;
// entry^.MaxTransCount   : Integer;
 entry^.FileMask        := '*.exe';
 ServiceList.Add(entry);

// второй
 new(entry); //*****************************************
  // Каталоги FTP
 entry^.FtpDir_Source := '';
 entry^.FtpDir_Dest   := '';
 // Каталоги
 entry^.Dir_Error    := '';
 entry^.Dir_Answer   := '';
 entry^.Dir_DownLoad_Arch := '';
 entry^.Dir_Answer_Arch := '';
 // файлы
 // entry^.SkipFileName    := '';
 entry^.DelFtpFiles     := true;
 entry^.OverWriteExists := false;
// entry^.DelAfterImport  : Integer;
// entry^.MaxTransCount   : Integer;
 entry^.FileMask        := '*.ini';
 ServiceList.Add(entry);

//третий
 new(entry); //*****************************************
  // Каталоги FTP
 entry^.FtpDir_Source := '';
 entry^.FtpDir_Dest   := '';
 // Каталоги
 entry^.Dir_Error    := '';
 entry^.Dir_Answer   := '';
 entry^.Dir_DownLoad_Arch := '';
 entry^.Dir_Answer_Arch   := '';
 // файлы
 // entry^.SkipFileName    := '';
 entry^.DelFtpFiles     := true;
 entry^.OverWriteExists := false;
// entry^.DelAfterImport  : Integer;
// entry^.MaxTransCount   : Integer;
 entry^.FileMask        := '*.dll';
 ServiceList.Add(entry);
end; *)


initialization

finalization

end.
