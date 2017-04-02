unit FCThread;

interface

uses
  FileCopyUtils,
  SysUtils,
  Windows,
  Forms,
  Classes;

type

  TFCThread = class(TThread)
  private
    procedure   Log(aText: string; isLogDateTime: boolean = True);
    procedure   LogError(aErrorCode: integer);
    procedure   MoveFiles(aList: TStrings; aSrc, aDst: string);
    procedure   CopyFiles(aList: TStrings; aSrc, aDst: string);
  private
    // --- Log procedures
    FOnLog         : TLogProcedure;
    FOnLogError    : TLogErrorProcedure;
    // --- Files
    FReqFileName    : string;
    FAnsFileName    : string;
    // --- FAnsFiles
    FAnsFiles : TStrings;
    // --- Folders
    FsrcDir         : string;
    FdstDir         : string;
    FresDir         : string;
    FsubDir         : string;
    // --- File Handles
    freq, fans     : integer;
    // --- wait period
    FWaitExclusive : integer;
  protected
    procedure   Execute; override;
  public
    Constructor Create(aAnsFiles : TStrings;
                       aReqFileName : string;
                       aAnsFileName : string;
                       aSrcDir : string;
                       aDstDir : string;
                       aResDir : string;
                       aSubDir : string;
                       aReqFile : integer;
                       aWaitExclusive : integer);
    Destructor  Destroy; override;
  published
    property    OnLog : TLogProcedure read FOnLog write FOnLog;
    property    OnLogError : TLogErrorProcedure read FOnLogError write FOnLogError;
  end;

implementation


procedure TFCThread.Execute;
var
  List : TStringList;
  srcF,
  dstF,
  resF : string;
  function CheckDir(aDir: string): boolean;
  begin
    try
      ForceDirectories(aDir);
      Result := True;
    except on e: exception do begin
      Log(cUnableCreateDir + aDir + crlf + e.Message);
      Result := False;
    end; end;
  end;
begin
  // --- Get Folders
  srcF := FsrcDir + FSubDir;
  dstF := FdstDir + FSubDir;
  resF := FresDir + FSubDir;
  if not (CheckDir(dstF) and CheckDir(resF)) then
    exit;
  // --- Get list of file for copy
  List := GetFileList(srcF);
  // --- copying S-D
  Log(cCopySD);
  CopyFiles(List, srcF, dstF);
  // --- moving S-R
  Log(cCopySR);
  CopyFiles(List, srcF, resF);
  // --- wait eoj.txt
  if WaitExclusive(dstF + FAnsFileName, fans, FWaitExclusive) then
  begin
    // --- moving ansver files
    Log(cMoveAnsver);
    MoveFiles(FAnsFiles, dstF, srcF);
    // ---
    List.Clear;
    List.Append(FAnsFileName);
    FileClose(fans);
    MoveFiles(List, dstF, srcF);
    // .7
    FileClose(freq);
    DeleteFile(PChar(srcF + FReqFileName));
  end
  else
    FileClose(freq);
  // --- work done
  List.Free;
  Log(cEndWork);
end;

// ----------------------------------------------------------------------------
// --- Протокол


procedure TFCThread.Log(aText: string; isLogDateTime: boolean = True);
begin
  if Assigned(FOnLog) then
    FOnLog('(' + IntToStr(freq) + ') ' + aText);
end;


procedure TFCThread.LogError(aErrorCode: integer);
begin
  if Assigned(FOnLogError) then
    FOnLogError(aErrorCode);
end;


Constructor TFCThread.Create(
  aAnsFiles : TStrings;
  aReqFileName : string;
  aAnsFileName : string;
  aSrcDir : string;
  aDstDir : string;
  aResDir : string;
  aSubDir : string;
  aReqFile : integer;
  aWaitExclusive: integer);
begin
  inherited Create(True);
  FAnsFiles := TStringList.Create;
  FAnsFiles.Assign(aAnsFiles);
  FReqFileName := aReqFileName;
  FAnsFileName := aAnsFileName;
  FsrcDir := aSrcDir;
  FdstDir := aDstDir;
  FresDir := aResDir;
  FsubDir := aSubDir;
  freq := aReqFile;
  fans := 0;
  FWaitExclusive := aWaitExclusive;
end;



Destructor  TFCThread.Destroy;
begin
  FAnsFiles.Free;
  inherited;
end;


// ----------------------------------------------------------------------------
// --- Копирование файлов с протоколированием

procedure TFCThread.MoveFiles(aList: TStrings; aSrc, aDst: string);
var
  i: integer;
  sf, df: string;
begin
  if (aList <> nil) then
    for i := 0 to aList.Count-1 do
      if AnsiUpperCase(aList.Strings[i]) <> AnsiUpperCase(FReqFileName) then
      begin
        sf := aSrc + aList.Strings[i];
        df := aDst + aList.Strings[i];
        // --- если целевой файл существует то заменяем
        if FileExists(df) then
          DeleteFile(PChar(df));
        Log(cMove + sf + cRightArrow + df);
        if not RenameFile(sf, df) then
          LogError(GetLastError);
      end;
end;


procedure TFCThread.CopyFiles(aList: TStrings; aSrc, aDst: string);
var
  i : integer;
  sf,df : string;
begin
  if (aList <> nil) then
    for i := 0 to aList.Count-1 do
      if AnsiUpperCase(aList.Strings[i]) <> AnsiUpperCase(FReqFileName) then
      begin
        sf := aSrc + aList.Strings[i];
        df := aDst + aList.Strings[i];
        Log(cCopy + sf + cRightArrow + df);
        if not CopyFile(PChar(sf), PChar(df), False) then
          LogError(GetLastError);
      end;
end;


end.

