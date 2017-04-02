unit uCommon;

interface

uses
  Windows, Classes, Contnrs, SysUtils, ShlObj, Controls, Messages, ShellAPI;

const
  msg_ExchComplete = 1 + wm_user;
  MSG_Downloaded = 1 + msg_ExchComplete;
  MSG_Uploaded   = 1 + MSG_Downloaded;
  MSG_NoNew_Queries      = 1 + MSG_Uploaded;
  MSG_Watch_Dog          = 1 + MSG_NoNew_Queries;
  MSG_After_Startup      = 1 + MSG_Watch_Dog;

const
  // --- !! Do not localize !! --- //
  cTKInvalid  = 99;
  cTKDup      = 100;
  cNotDBF     = 'is not DBF file';
  cORA20001   = 'ORA-20001';
  cORA20306   = 'ORA-20306';
  cUnqTK      = 'UNQ_TK_ID';
  cDbfBuffer  = 512;
  cTimeFormat = 'HH:MM:SS';

const
 cService_Name = 'service_name';
 cDisplay_Name = 'display_name';
 cDescription  = 'description';
 cINI_Path     = 'ini_path';

type

 TFileInfoEntry = record
  serviceIndex: integer;
  FileName: TFileName;
  FileDate: TDateTime;
 end;
 PFileInfoEntry = ^TFileInfoEntry;

 TFileList = class(TList)
  private
   function getFileName(idx:integer): string;
   function getFileNameDate(idx: integer): string;
  protected
   {$WARN UNSAFE_TYPE OFF}
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
   {$WARN UNSAFE_TYPE ON}
  public
   procedure AddToList(const aRec: TSearchRec);
   property FileName[idx:integer]: string read getFileName;
   property FileNameDate[idx: integer]: string read getFileNameDate;
 end;

type
  TFieldDef = record
    name: string;  //название поля
    _type: char;   //тип поля (D,N,C)
    size: word;    //размер поля (для Numeric и Char)   (для Date игнорируется)
    frac: word;    //размер дробной части для (Numeric) (для Date игнорируется)
  end;


type
 TMoney = double;
 TAnswerRec= record
   CUSTOMCODE: string; //Код таможенного органа
   INN_D: string;      //ИНН плательщика
   KPP_D: string;      //КПП плательщика
   BEGIN_DATE: TDate;  //Дата начала периода, за который запрашивается информация о движении денежных средств
   END_DATE: TDate;    //Дата конца периода, за который запрашивается информация о движении денежных средств
   TYPEDOC: string;    //Тип получаемой информации
   REPEAT_: string;
   FLAG: string;
   NUMPOST: string;      //Наименование загружаемой транзакции
   CODEERR: string;      //Код ошибки
   TEXTERR: string;      //Описание ошибки

   //REPORT_DAT: TDate;   //Дата подтверждения уплаты таможенных пошлин, налогов
   //NUMDOC: string;      //Номер платежного документа
   //SUMMA: TMoney;        //Сумма платежа
   //KBK: string;         //Код бюджетной классификации
   //PAYMENTNUM: string;  //Номер документа основания для расходования денежных средств
   //PAYMENTDAT: TDate;    //Дата платежного документа
   //NAME_AGENT: string;   //Наименование таможенного представителя
 end;

procedure clearAnswerRec(var rec: TAnswerRec);

var
 Formats: TFormatSettings;

{$WARN UNSAFE_TYPE OFF}
function PackData(ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer; stdcall; external 'Packer.dll';
{$WARN UNSAFE_TYPE ON}

{$ifdef LOGGER }
procedure toLog(aEntry: string);
{$endif}


procedure StartUp(const aHandle: THandle);
procedure ShutDown;

function checkDirectory( const aName:TFileName ): boolean;
function getFullAppName: string;
function getShortAppName: string;

function getReservePath: TFileName;
function fileNameValid(aFileName: TFileName): boolean;

function moveFile( const aSrcFullName, aDestDir: TFileName; const aDestFileName: TFileName = '' ): TFileName;
function copyFile( const aSrcFullName, aDestDir: TFileName; const aDestFileName: TFileName = '' ): TFileName;

function fileAlredyLoaded(const aFileName: TFileName; const aSrvIDX: integer ): boolean;

function getParamValue(const aParamName: string): string;

procedure DelFilesFromDir(Directory, FileMask: string; DelSubDirs: Boolean = false);


var StopNow: boolean = false;

implementation
uses uOptions, uLoger, uQueue, uFTP, uBusiness;


function getParamValue(const aParamName: string): string;
var i: integer;
begin
  result:= '';
  for i:= 1 to system.paramCount do begin
    if ( pos( ansiUpperCase(aParamName), ansiUpperCase(system.paramStr(i)) ) > 0 ) then begin
      result:= trim( copy( system.paramStr(i), 1 + length('/'+aParamName+'='), length(system.paramStr(i)) ) );
      break;
    end;
  end;
end;

function filesCount(const aDirectory, aFileName: TFileName): integer;
var
 base: string;
 ext: string;
begin
 result:= 0;
 if (not fileExists(aDirectory + aFileName) ) then
  exit;

 result := 1;
 ext:= extractFileExt(aFileName);
 base:= changeFileExt(aFileName, '' );

 while fileExists( aDirectory + base + '_' + intToStr( result ) + ext ) do
  inc(result);
end;

function newFileName( const aDirectory, aFileName: TFileName ):TFileName;
var
 i: integer;
 nme, ext: string;
begin
 result:= aFileName;
 i:= filesCount( aDirectory, aFileName );
 if (i > 0) then begin
   ext:= extractFileExt( aFileName );
   nme:= copy( aFileName, 1, length(aFileName)-length(ext) );
   result:= nme + '_' + intToStr( i ) + ext;
 end; { if (i > 0) then.. }
 result:= aDirectory + result;
end;


function copyFile( const aSrcFullName, aDestDir: TFileName; const aDestFileName: TFileName = '' ): TFileName;
var f: TFileName;
begin
 result:= '';
 if (aDestFileName <> '') then
  f:= aDestFileName
 else f:= extractFileName(aSrcFullName);
 if (f = '') then
  exit;

 result:= newFileName(aDestDir, f);
 try
  checkDirectory(aDestDir);
   {$WARN UNSAFE_TYPE OFF}
  windows.CopyFile( PChar(aSrcFullName), PChar(result), false );
   {$WARN UNSAFE_TYPE ON}
 except
  result:= '';
 end;
end;

function fileAlredyLoaded(const aFileName: TFileName; const aSrvIDX: integer ): boolean;
var
 answExt, answFileName, rqFileName: string;
begin
 result := false;
 rqFileName:= extractFileName(aFileName);
 with Options.ServiceOptions[aSrvIDX] do
   answExt:= copy( answerMask, 1, pos('.', answerMask ) );
 answFileName:=  copy( rqFileName, 1, pos('.', rqFileName) ) + answExt;

 if    fileExists( options.ServiceOptions[aSrvIDX].Dir_DownLoad + rqFileName )
    or fileExists( options.ServiceOptions[aSrvIDX].Dir_DownLoad_Arch + rqFileName )
    or fileExists( options.ServiceOptions[aSrvIDX].Dir_Error + rqFileName )
//    or fileExists( options.ServiceOptions[aSrvIDX].Dir_Answer + answFileName )
//    or fileExists( options.ServiceOptions[aSrvIDX].Dir_Answer_Arch + answFileName )
 then
   result := true; // это не индийский код
end;


function moveFile( const aSrcFullName, aDestDir: TFileName; const aDestFileName: TFileName = '' ): TFileName;
var f: TFileName;
begin
 result:= '';
 if (aDestFileName <> '') then
  f:= aDestFileName
 else f:= extractFileName(aSrcFullName);
 if (f = '') then
  exit;

 result:= newFileName(aDestDir, f);
 try
  checkDirectory(aDestDir);
  renameFile(aSrcFullName, result );
 except
  result:= '';
 end;
end;


function checkDirectory( const aName:TFileName ): boolean;
var s: string;
begin
 try
  s:= extractFileDir(aName);
  if (not directoryExists(s)) then
    forceDirectories(s);
  result:= true;
 except
  result:= false;
 end;
end;


function getFullAppName: string;
begin
 result:= paramStr(0) ;
end;

function getShortAppName: string;
begin
 result:= extractFileName( getFullAppName );
end;

function getReservePath: TFileName;
const CSIDL_COMMON_APPDATA = $0023;
var
 appName: string;
 dirName: string;
// pth: array[0..Max_Path] of char;
begin
 result:= '';
 appName:= getFullAppName;
 dirName:= AnsiUpperCase(changeFileExt( extractFileName( appName ), ''));
 {if SHGetSpecialFolderPath(0, pth, CSIDL_COMMON_APPDATA, False) then
   result:= pth;}
 if ( result = '' ) then
   result:= extractFilePath(appName);

 result:= includeTrailingPathDelimiter( includeTrailingPathDelimiter(result) + dirName );
end;

function fileNameValid(aFileName: TFileName): boolean;
begin
 { TODO : Реализовать валидацию файла }
// fileNameValidation:
// http://stackoverflow.com/questions/3783202/is-there-any-way-to-validate-a-filename
// checking directory-is-writeable:
//http://stackoverflow.com/questions/3599256/how-can-i-use-delphi-to-test-if-a-directory-is-writeable
 result:= true;
end;

{TFileList}
{$WARN UNSAFE_TYPE OFF}
procedure TFileList.Notify(Ptr: Pointer; Action: TListNotification);
begin
 if (Action = lnDeleted) and Assigned(ptr) then
   dispose(ptr);
end;   {$WARN UNSAFE_TYPE ON}

function TFileList.getFileName(idx:integer): string;
begin
 result:= PFileInfoEntry(items[idx])^.FileName;
end;

function TFileList.getFileNameDate(idx: integer): string;
begin
 result:= FileName[idx] + '   ' + DateTimeToStr( PFileInfoEntry(items[idx])^.FileDate );
end;

procedure TFileList.AddToList(const aRec: TSearchRec);
var itm: PFileInfoEntry;
begin
 new(itm);
 itm.FileName := aRec.Name;
 itm.FileDate:= fileDateToDateTime(aRec.Time);
 Add(itm);
end;


procedure initFormatSettings(var aSettings:TFormatSettings);
const
 cLongDateFormat = 'DD:MM:YYYY';
 cLongTimeFormat = 'HH:MM:SS';
 cDateTimeSeparator = ' ';
begin
 GetLocaleFormatSettings( windows.GetUserDefaultLCID, aSettings);

 //aSettings.CurrencyFormat:= Byte;
 //aSettings.NegCurrFormat:= Byte;
 aSettings.ThousandSeparator:= ' ';
 aSettings.DecimalSeparator:= '.';
 //aSettings.CurrencyDecimals: Byte; // 2
 aSettings.DateSeparator:= '.';
 aSettings.TimeSeparator:= ':';
 //aSettings.ListSeparator:= Char;
 //aSettings.CurrencyString:= 'руб';
 //aSettings.ShortDateFormat: string;
 aSettings.LongDateFormat:= cLongDateFormat;
 //aSettings.TimeAMString:= string;
 //aSettings.TimePMString:= string;
 //aSettings.ShortTimeFormat: string;
 aSettings.LongTimeFormat:= cLongTimeFormat;
 //aSettings.ShortMonthNames: array[1..12] of string;
 //aSettings.LongMonthNames: array[1..12] of string;
 //aSettings.ShortDayNames: array[1..7] of string;
 //aSettings.LongDayNames: array[1..7] of string;
 //aSettings.TwoDigitYearCenturyWindow: Word;
end;


function findIniFile(var aIniFile: TFileName): boolean;
var
 sServ_Name: string;
begin
(*************
{  фрагмент для отладки }
 aIniFile:= 'C:\!Projects\Working\Delphi\new_FTP\new_iaccftp.ini';
 result:= true;
 exit;
*************)

 aIniFile:= getParamValue(cINI_Path);
 if ( aIniFile = '' ) then begin
   sServ_Name:= ansiLowerCase(getParamValue(cService_Name));
   if (sServ_Name <> '') then
      aIniFile:= IncludeTrailingPathDelimiter( extractFilePath( getFullAppName ) ) + changeFileExt( sServ_Name, '.ini')
 end;

 if ( aIniFile = '' ) then
   aIniFile:= changeFileExt(getFullAppName, '.ini');

 result:= fileExists( aIniFile );
end;

procedure StartUp(const aHandle: THandle);
var
 myIniFile: TFileName;
 b: boolean;

begin
// Порядок запуска
// 1 -- Options, Loger

 b:= findIniFile(myIniFile);
 if (not b) then begin
  createNewLog;
  uLoger.Log( Format('Не найден файл параметров ининциализации "%s" ', [myIniFile]), leFatal );
  uLoger.Log( 'Запуск приложения не возможен.', leFatal );
  Halt(666);
 end;

 try
  Options:= TOptions.Create(myIniFile);
  createNewLog;
  uLoger.log( Format('Файл параметров инициализации "%s" успешно загружен', [myIniFile]) );

 except
   on ex: exception do begin
     uLoger.Log( Format('Ошибка загрузки файла параметров ининциализации "%s" ', [myIniFile]), leFatal );
     uLoger.Log( 'Запуск приложения не возможен.', leFatal );
     Halt(666);
   end;
 end;

 uLoger.log( ' Начало процедуры запуска сервиса... ' );

 Business:= TBusiness.Create( aHandle );
 Business.restart;

 uLoger.log( ' Процедура запуска сервиса произведена успешно ' ); 

end;

procedure ShutDown;
begin
// Порядок остановки
// 1 -- FTP_Download

// 2 -- FQ_Download

// 3 -- DB_Loader

// 4 -- FTP_Upload

// 5 -- FQ_Upload

// 6 -- Loger, Options
end;

procedure clearAnswerRec(var rec: TAnswerRec);
begin
 with rec do begin
  CUSTOMCODE:= '';
  INN_D:= '';
  KPP_D:= '';
  BEGIN_DATE:= 0;
  END_DATE  := 0;
  REPEAT_:= '';
  FLAG:= '';
  TYPEDOC:= '';

  NUMPOST:= '';
  CODEERR:= '';
  TEXTERR:= '';
 end;
end;

{$ifdef LOGGER }
procedure toLog(aEntry: string);
const cName = 'log.txt';
function getMode: word;
begin
 result:= fmCreate;
 if fileExists(cName) then
   result:= fmOpenWrite;
end;
var
 s: string;
 fs: TFileStream;
begin
 fs:= TFileStream.Create( cName, getMode );
 try
   s:= aEntry +  #13#10;
   fs.Position := fs.Size;
   fs.Write( s[1], length(s) );
 finally
   freeAndNil(fs);
 end;
end; {$endif}


procedure DelFilesFromDir(Directory, FileMask: string; DelSubDirs: Boolean = false );
var
  SourceLst: string;
  FOS: TSHFileOpStruct;
begin
  FillChar(FOS, SizeOf(FOS), 0);
  //FOS.Wnd := Application.MainForm.Handle;
  FOS.wFunc := FO_DELETE;

  SourceLst := IncludeTrailingPathDelimiter(Directory) + FileMask; // + #0;
  FOS.pFrom := PChar(SourceLst);
  if not DelSubDirs then
    FOS.fFlags := FOS.fFlags OR FOF_FILESONLY;
  // Remove the next line if you want a confirmation dialog box
  FOS.fFlags := FOS.fFlags OR FOF_NOCONFIRMATION;
  // Add the next line for a "silent operation" (no progress box)
  //FOS.fFlags := FOS.fFlags OR FOF_SILENT;
  SHFileOperation(FOS);
end;


initialization
 initFormatSettings(Formats);

finalization

end.
