unit uLoger;

interface

uses
 Windows, Classes, SysUtils, DateUtils,
 uHelpClasses;

type
 TLogEntry = ( leInfo, leWarn, leDebug, leError, leFatal );

procedure Log( aText: string; aKind: TLogEntry = leInfo );
procedure createNewLog;
procedure Dump;

{$ifdef EXHOSTING}
procedure dbgLog( aText: string; aKind: TLogEntry = leInfo );
{$endif}

var
 maxLogSizeExided: boolean = false;
 currentLogFile: TFileName = '';

type
 TLogStack = class(TNewThreadList)
  public
   procedure add( const aText: string ); overload;
 end;

var LogStack: TLogStack;

implementation
uses
  uCommon, uOptions
  {$IFNDEF SERVICE}
   ,uiFMain
  {$ENDIF}
  ;

const
 cLogEntries: array[TLogEntry] of string = ( 'info', 'warn', 'debug', 'error', 'fatal' );

var
 bStarted: boolean = false;
 lastLE: TLogEntry = leError;
 LF_Path: string = '';
 LF_Name: string = '';
 LF_Ext: string = '';

type
 TLogItem = record
  entryKind: TLogEntry;
  dateTime: TDateTime;
  Text: string;
 end;
 PLogItem = ^TLogItem;

 TLogList = class(TList)
  private
    fMaxCount: integer;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    constructor Create(aMaxCount: integer = 1000); reintroduce;
 end;

{ TLogStack }
procedure  TLogStack.add( const aText: string );
 function newLI(aText: string):pLogItem;
 var i: integer;
 begin
  new(result);
  setLength( result^.Text, length(aText) );
  for i:= 1 to length(result^.Text) do
    result^.Text[i] := aText[i];
 end;
begin
 LockList;
 try
  List.Add( newLI(aText) );
 finally
  UnlockList;
 end;
end;

{ TLogList }
constructor TLogList.Create(aMaxCount: integer = 1000);
begin
 inherited Create;
 fMaxCount:= aMaxCount;
end;

procedure TLogList.Notify(Ptr: Pointer; Action: TListNotification);
begin
 case action of
  lnExtracted: ;

  lnAdded:  while( fMaxCount > 0 )and( count >= fMaxCount ) do
              delete(0);

  lnDeleted: if assigned(ptr) then begin
               PLogItem(ptr).Text:= '';
               dispose(ptr) ;
             end;
 end;
end;
////////

procedure createNewLog;
 function getLogFileName: TFileName;
 begin
  if (not Assigned(Options)) or (Assigned(Options) and (not fileNameValid(Options.LogFile)) ) then
   result:= getReservePath +
    changeFileExt( extractFileName( getFullAppName ), '.log')
  else
   result:= Options.LogFile;
 end;
var
 LF: TFileName;
 dt: string;
begin
 if (currentLogFile = '') then begin
  LF:= getLogFileName;
  LF_Path:= includeTrailingPathDelimiter( extractFilePath(LF) );
  LF_Name:= changeFileExt( extractFileName(LF), '' );
  LF_Ext:= extractFileExt(LF);
  checkDirectory( LF_Path );
 end;
 dt:= stringReplace(  dateTimeToStr(now), '.', '_', [rfReplaceAll, rfIgnoreCase]  );
 dt:= stringReplace(  dt, ':', '_', [rfReplaceAll, rfIgnoreCase]  );
// decodeDateTime(now, Y,M,D,H,Min,Sec, mSec);
// dt:= Format('%d_%d %d:%d',[D, M, H, Min]);
// dt:= '__';
 LF:= LF_Path +  LF_Name  + '_' + dt + LF_Ext;
 if (currentLogFile <> '') then
   Log( 'Создан новый log - файл: ' + LF );
 currentLogFile:= LF;
 bStarted:= false;
 maxLogSizeExided:= false;
 Log( 'Дата и время создания log - файла: ' + dt );
end;

const
 cCRLF = #13#10;
 cBlanc = '   ';
 cModes: array[boolean] of word = (fmCreate, fmOpenWrite);

var bChecked: boolean = false;


function logStr( aText: string; aKind: TLogEntry = leInfo ): string;
begin
 if (lastLE = aKind) then
   result:= StringOfChar( ' ', length(cLogEntries[aKind]) )
 else result:= cLogEntries[aKind];
 result:= result + cBlanc + DateTimeToStr(Now, uCommon.Formats) + cBlanc + aText;
end;

procedure toFileStream(const aText: string);
var
 sz: Int64;
 fs: TFileStream;
 fName: TFileName;
begin
 fName:= currentLogFile;
 if (not bChecked) then
   bChecked:= checkDirectory( fName );
 if (not bChecked) then
   Exit;

 sz:= 0;
 fs:= TFileStream.Create( currentLogFile, cModes[bStarted] or fmShareDenyWrite );
 try
  fs.Position:= fs.Size;
  if( length( aText ) > 0 )then
    fs.Write( aText[1], length( aText ) );
  sz:= fs.size;
 finally
  fs.Free;
 end;
 maxLogSizeExided:= assigned(Options) and ( sz > Options.maxLogSize);
end;

{$ifdef EXHOSTING}
procedure dbgLog( aText: string; aKind: TLogEntry = leInfo );
begin
  if( not assigned(LogStack) )then
    exit;

  LogStack.add( logStr(aText, aKind) + cCRLF );
end;
{$endif}

procedure Log( aText: string; aKind: TLogEntry = leInfo );
{ TODO: Для многопоточной синхронизации необходима доработка до вызова этой процедуры через CriticalSection }
var s: string;
begin
 s:= logStr( aText, aKind );
 lastLE:= aKind;

 {$IFDEF GUI_LOGGER}
 uiFMain.addLogEntry( s );
 {$ENDIF}

 s:= s + cCRLF;
 {$IFDEF EXHOSTING}
 if assigned(LogStack) then
   LogStack.add( s );
 {$ENDIF}
 toFileStream( s );
 bStarted:= True;
end;

procedure Dump;
var
 fs: TFileStream;
 fName: TFileName;
 l: TList;
 i, cnt: integer;
 s: string;

const
 cDMP1 = '--------------------------------' + cCRLF;
 cDMP2 = '------------- ДАМП -------------' + cCRLF;
begin
 fName:= currentLogFile;
 if (not bChecked) then
   bChecked:= checkDirectory( fName );
 if (not bChecked) then
   Exit;

 l:= nil;
 fs:= TFileStream.Create( currentLogFile, cModes[bStarted] or fmShareDenyWrite );
 try
  fs.Position:= fs.Size;

  fs.Write( cDMP1, length(cDMP1) );
  fs.Write( cDMP2, length(cDMP2) );
  fs.Write( cDMP1, length(cDMP1) );

  l:= logStack.LockList;
  cnt:= l.Count - 1;

  for i:= 0 to cnt do
   with pLogItem(l[i])^ do
    if (length(Text) > 0) then
      fs.Write( Text[1], length(Text) );

 finally
  fs.Free;
  if assigned(l) then begin
   l.Clear;
   logStack.unlockList;
  end;
 end;
end;


initialization
 LogStack:= TLogStack.Create( TLogList.Create(1000) );

finalization
 if assigned(LogStack) then
   freeAndNil(LogStack);

end.
