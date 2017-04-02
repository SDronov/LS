unit uOptions;

interface

uses
  Classes,
  Utils,
  Math,
  SysUtils,
  IniFiles;

const
  // --- FileFormat
  ffAuto             = 0;
  ffInt              = 1;
  ffExt              = 2;
  // --- LogCharSet
  csAnsi             = 0;
  csAscii            = 1;
  // --- IniFiles
  cIniFileName       = 'kpstpo.ini';
  cImportMapFileName = 'nsi_import.ini';

type

  TOptions = class
  private
    oldDirList : TStrings;
  public
    // --- DBLogon
    UserName        : string;
    Password        : string;
    DataBase        : string;
    SchemaName      : string;
    // --- Service
    ScanPeriod      : real;
    WaitTpoTInterval : cardinal;
    LogFileName     : string;
    FileFormat      : integer;
    MaxLogSizeMb    : real;
    LogLineCnt      : integer;
    LogCharSet      : integer;
    AccessLogFile   : string;       
    // --- Path\Dir Lists
    PathList        : TStrings;
    DirList         : TStrings;
    // --- calculated
    MaxLogSizeBytes : integer;
    // --- Log Event
    OnMessage       : TMyMessageEvent;
    //---Thread count
    ThreadCount : integer;
    DbfFields  : TStrings;
    Constructor  Create;
    Destructor   Destroy; override;
    procedure    Load;
    procedure    Log(const aText:string);
    function     GetDirListChanged: boolean;
  end;


implementation

{
FileFormat 0 - авто (1 затем 2)
           1 - внут
           2 - внеш
{}           

uses
  OracleLogon;

const
  cNoStrValue         = '---';
  cBytesPerMb         = 1024 * 1024;

  // --- section values
  cSecCommon = 'common';
  cSecLogon           = 'Logon';
    cUserName         = 'UserName';
      dfUserName      = 'DOXOD_LS_5';
    cPassword         = 'Password';
    cDataBase         = 'DataBase';
    cSchemaName       = 'SchemaName';
    cIsCrypt          = 'CryptPassword';
  cSecPathList        = 'Path_List';
    cItem             = 'Item';
  cSecService         = 'Service';
    cFileFormat       = 'FileFormat';
      dfFileFormat    = 0;
  cScanPeriod       = 'ScanPeriod';
      dfScanPeriod    = 1;
  cWaitTpoTInterval  = 'WaitTpoTInterval';
      dfWaitTpoTInterval = 10;


    cLogFileName      = 'LogFileName';
      dfLogFileName   = 'KpsTpo.Log';
    cMaxLogSizeMB     = 'MaxLogSizeMB';
      dfMaxLogSizeMB  = 2;
    cLogLineCnt       = 'LogLineCount';
      dfLogLineCnt    = 30;
    cLogCharSet       = 'LogCharSet';
      dfLogCharSet    = csAnsi;
    cAccessLogFile    = 'AccessLog_FileName';
      dfAccessLogFile = 'AccessLog.txt';
      cThreadCount =    'Countreadthread';

/// --- !! DO NOT LOCALIZE !! --- ///      
Procedure ScanDir(DirName: string; var Dir: TStrings);
var
  SearchRec: TSearchRec;
begin
  // --- если параметр передан со звездочкой на конце, то убираем ее
  while (Copy(DirName, length(DirName) - cStarLen + 1, cStarLen) = cStar) do
    DirName := Copy(DirName, 1, Length(DirName) - cStarLen);
  // --- получаем полное название каталога
  DirName := GetFullDir(DirName);
  // --- поиск подкаталогов первого уровня в заданом каталоге
  if (FindFirst(DirName + '*.*', faDirectory, SearchRec) = 0) then
  repeat
    if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
      Continue;
    if (SearchRec.Attr and faDirectory <> 0) then
      Dir.Append(GetFullDir(DirName + SearchRec.Name));
  until (FindNext(SearchRec) <> 0);
  FindClose(SearchRec);
end;


procedure TOptions.Load;
var
  Ini : TIniFile;
  IniMem: TMemIniFile;
  i   : integer;
  oldDecSep : char;
begin
  oldDecSep := DecimalSeparator;
  DecimalSeparator := '.';
  Ini := TIniFile.Create(GetAppDir + cIniFileName);
  // --- Logon
  UserName := Ini.ReadString(cSecLogon, cUserName, dfUserName);
  DataBase := Ini.ReadString(cSecLogon, cDataBase, NoParam);
  Password := IfElse(Ini.ReadBool(cSecLogon, cIsCrypt, False)
                     ,LogonDeCrypt(Ini.ReadString(cSecLogon, cPassword, NoParam))
                     ,Ini.ReadString(cSecLogon, cPassword, NoParam));
  SchemaName := Ini.ReadString( cSecLogon, cSchemaName, '' );

  ThreadCount:= Ini.ReadInteger( cSecCommon, cThreadCount, 1 );

  // --- Service
  FileFormat := Ini.ReadInteger(cSecService, cFileFormat, dfFileFormat);
  ScanPeriod := Ini.ReadFloat(cSecService, cScanPeriod, dfScanPeriod);
  WaitTpoTInterval :=  Ini.ReadInteger(cWaitTpoTInterval, cWaitTpoTInterval, dfWaitTpoTInterval);
  LogFileName := GetFullFileName(Ini.ReadString(cSecService, cLogFileName, dfLogFileName));
  LogLineCnt := Ini.ReadInteger(cSecService, cLogLineCnt, dfLogLineCnt);
  MaxLogSizeMb := Ini.ReadFloat(cSecService, cMaxLogSizeMB, dfMaxLogSizeMB);
  LogCharSet := Ini.ReadInteger(cSecService, cLogCharSet, dfLogCharSet);
  AccessLogFile := GetFullFileName(Ini.ReadString(cSecService, cAccessLogFile, dfAccessLogFile));

  IniMem:= TMemIniFile.Create(GetAppDir + cIniFileName);
  IniMem.ReadSectionValues('otvet.dbf', DbfFields);


  // --- Items
  PathList.Clear;
  DirList.Clear;
  i := 0;
  repeat
    PathList.Append(Ini.ReadString(cSecPathList, cItem+IntToStr(i), cNoStrValue));
    i := i + 1;
  until (PathList.Strings[PathList.Count-1] = cNoStrValue);
  PathList.Delete(PathList.Count-1);

  // --- parse items
  for i := 0 to PathList.Count-1 do
    if (Copy(PathList[i], length(PathList[i]) - cStarLen + 1, cStarLen) = cStar) then
      ScanDir(PathList.Strings[i], DirList)
    else
      DirList.Append(GetFullDir(PathList.Strings[i]));

  // --- checks
  if not (FileFormat in [0..2]) then
    FileFormat := dfFileFormat;
  if (ScanPeriod <= 0) then
    ScanPeriod := dfScanPeriod;
  if (MaxLogSizeMB <= 0) then
    MaxLogSizeMB := dfMaxLogSizeMB;
  if (LogLineCnt <= 0) then
    LogLineCnt := dfLogLineCnt;
  if not (LogCharSet in [csAnsi, csAscii]) then
    LogCharSet := dfLogCharSet;

  // --- calculates
  MaxLogSizeBytes := Trunc(MaxLogSizeMB * cBytesPerMb);

  DecimalSeparator := oldDecSep;


  Ini.Free;
  IniMem.Free;
end;


procedure TOptions.Log(const aText:string);
begin
  if Assigned(OnMessage) then
    OnMessage(aText);
end;


Constructor TOptions.Create;
begin
  inherited;
  PathList := TStringList.Create;
  DirList := TStringList.Create;
  oldDirList := TStringList.Create;
  DbfFields := TStringList.Create;
  OnMessage := nil;
end;


Destructor TOptions.Destroy;
begin
  PathList.Free;
  DirList.Free;
  oldDirList.Free;
  DbfFields.Free;
  inherited;
end;


function  TOptions.GetDirListChanged: boolean;
var
  i : integer;
begin
  Result := False;
  // --- check append
  for i := 0 to DirList.Count-1 do
    if (oldDirList.IndexOf(DirList[i]) = -1) then
      Result := True;
  // --- check delete
  for i := 0 to oldDirList.Count-1 do
    if (DirList.IndexOf(oldDirList[i]) = -1) then
      Result := True;
  // --- clear
  oldDirList.Clear;
  // --- renew
  for i := 0 to DirList.Count-1 do
    oldDirList.Append(DirList[i]);
end;


end.




