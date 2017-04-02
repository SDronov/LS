unit CheckCopyUtils;

interface

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  IdFTP;

type
  TLogProcedure  = procedure(aText: string; isLogDateTime: boolean = True) of object;
  TLogErrorProcedure = procedure(aErrorCode: integer) of object;

const
  // --- системные
  FileNotFoundCode = 2;
  crlf             = #13#10;
  MSecPerMin       = 1000 * 60;
  MSecPerSec       = 1000;
  OneSec           = 1/24/60/60;
  OneMin           = 1/24/60;

  // --- приложения
  DirNotFound    = '.';
  Invalid_Handle = -1;
  cAnyFile       = '*.*';
  cSlash         = '\';
  cBackSlash     = '/';


  // --- Опции в файле
  ISDirs                   = 'Directories';
    IVSourceDir            = 'Source_Dir';
      dfSourceDir          = '';
    IVDestinationDir       = 'Destination_Dir';
      dfDestinationDir     = '';
  ISFiles                  = 'Files';
    IVFileMask             = 'FileMask';
      dfFileMask           = '*.req';
  ISOptions                = 'Options';
    IVWaitExclusive        = 'WaitExclusive';		// в секундах
      dfWaitExclusive      = 600;
    IVScanPeriod           = 'ScanPeriod';		   // в секундах
      dfScanPeriod         = 60;
    IVUserName             = 'BDUserName';
      dfUserName           = 'fts';
    IVPassword             = 'BDUserPassword';
      dfPassword           = 'w';
    IVTnsName              = 'BDTnsName';
      dfTnsName            = 'ola_orcl';
    IVMaxCountFiles        = 'MaxCountReadFiles';
      dfMaxCountFiles      = 100;
    IVNeedCheckProvision   = 'NeedCheckProvision';
      dfNeedCheckProvision = True;
  ISFTP                    = 'FTP';
    //--
    IVFtpListSDirFile      = 'ListSDirFile';
      dfFtpListSDirFile    = 'ListSDirFile.txt';
    IVFtpSourceDir         = 'SourceDir';
      dfFtpSourceDir       = '/TK/IN';
    IVFtpTargetDir         = 'TargetDir';
      dfFtpTarget          = '/TK/OUT/C%s/IN';
    IVFtpTargetAnsDir      = 'TargetAnsDir';
      dfFtpTargetAns       = '/TK/OUT/C%s/OUT';
    //--
    IVFtpHost              = 'Host';
      dfFtphost            = 'ftp.fors.ru';
    IVFtpPort              = 'Port';
      dfFtpport            = 21;
    IVFtpPassive           = 'Passive';
      dfFtppassive         = False;
    IVFtpReadTymeoute      = 'ReadTymeoute';
      dfFtpReadTymeoute    = 0;
    IVFtpUser              = 'UserName';
      dfFtpuser            = 'Guest';
    IVFtpUserPassword      = 'UserPassword';
      dfFtpuserpassword    = '*';
    //--
    IVProxyHost            = 'ProxyHost';
      dfProxyHost          = '';
    IVProxyPort            = 'ProxyPort';
      dfProxyport          = 0;
    IVProxyUser            = 'ProxyUser';
      dfProxyUser          = '';
    IVProxyUserPassword    = 'ProxyUserPassword';
      dfProxyUserPassword  = '';
    IVProxyType            = 'ProxyType';
      dfProxyType          = 0;
    //--

  // --- строки в протоколе
  cServiceInstall    = '------- Сервис установлен -------';
  cServiceUnInstall  = '------- Сервис деинсталирован -------';
  cServiceStart      = '------- Сервис стартовал -------';
  cServiceStop       = '------- Останов сервиса -------';
  cDownloadFromFTP   = '------- Загрузка файлов с ФТП -------';
  cBeginWork         = '------- Начало работы -------';
  cEndWork           = '------- Завершение работы -------';
  cRightArrow        = ' -> ';
  cCopy              = 'Копирование ';
  cMove              = 'Перемещение ';
  cCopySD            = '--- Копирование файлов S -> D ---';
  cUnableCreateDir   = 'Не удалось создать каталог ';
  cError             = '  Ошибка ';



// if Founded then Result = SubDir else Result = DirNotFound
function  AddBackSlash(aDir: string): string;
procedure AddBackSlashP(var aDir: string);
function  AddSlash(aDir: string): string;
procedure AddSlashP(var aDir: string);
function  DelSlash(aDir: string): string;
procedure DelSlashP(var aDir: string);
function  DelBackSlash(aDir: string): string;
procedure DelBackSlashP(var aDir: string);

function  WaitExclusive(aFileName: string; var aHandle: integer; aWaitExclusive:integer = dfWaitExclusive): boolean;

function GetIniFileName: string;
function GetProgrammPath: string;
function GetLogFileName: string;

function ConvertAnsiToOem(const S : string) : string;

implementation

function GetIniFileName: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.ini');
end;

function GetLogFileName: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.log');
end;

function GetProgrammPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function AddSlash(aDir: string): string;
  var i : integer;
begin
  Result := aDir;
  i := length(aDir);
  if (i > 0) then
    begin
      if (aDir[i] <> cSlash) then
        begin
          Result := aDir + cSlash;
        end;
    end;
end;


procedure AddSlashP(var aDir: string);
begin
  aDir := AddSlash(aDir);
end;

function AddBackSlash(aDir: string): string;
  var i : integer;
begin
  Result := aDir;
  i := length(aDir);
  if (i > 0) then
    begin
      if (aDir[i] <> cBackSlash) then
        begin
          Result := aDir + cBackSlash;
        end;
    end;
end;

procedure AddBackSlashP(var aDir: string);
begin
  aDir := AddBackSlash(aDir);
end;

function DelSlash(aDir: string): string;
var
  i : integer;
begin
  i := length(aDir);
  while (i > 0) and (aDir[i] = cSlash) do
    dec(i);
  if (i = 0) then
    Result := ''
  else
    Result := Copy(aDir, 1, i);
end;


procedure DelSlashP(var aDir: string);
begin
  aDir := DelSlash(aDir);
end;

function DelBackSlash(aDir: string): string;
var
  i : integer;
begin
  i := length(aDir);
  while (i > 0) and (aDir[i] = cBackSlash) do
    dec(i);
  if (i = 0) then
    Result := ''
  else
    Result := Copy(aDir, 1, i);
end;


procedure DelBackSlashP(var aDir: string);
begin
  aDir := DelBackSlash(aDir);
end;

function WaitExclusive(aFileName: string; var aHandle: integer; aWaitExclusive:integer = dfWaitExclusive): boolean;
var
  TheDate : TDateTime;
begin
  TheDate := Now + aWaitExclusive * OneSec;
  aHandle := Invalid_Handle;
  repeat
    aHandle := FileOpen(aFileName, fmShareExclusive);
  until (aHandle <> Invalid_Handle) or (Now > TheDate);
  Result := (aHandle <> Invalid_Handle);
end;

function ConvertAnsiToOem(const S : string) : string;
{ ConvertAnsiToOem translates a string into the OEM-defined character set }
{$IFNDEF WIN32}
var
  Source, Dest : array[0..255] of Char;
{$ENDIF}
begin
{$IFDEF WIN32}
  SetLength(Result, Length(S));
  if Length(Result) > 0 then
    AnsiToOem(PChar(S), PChar(Result));
{$ELSE}
  if Length(Result) > 0 then
  begin
    AnsiToOem(StrPCopy(Source, S), Dest);
    Result := StrPas(Dest);
  end;
{$ENDIF}
end;

end.

