unit FileCopySevice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls, AppEvnts, FileCopyUtils, IniFiles, FCThread;

type
  TFileCopyService = class(TService)
    tmrMain: TTimer;
    evtAppMain: TApplicationEvents;
    procedure tmrMainTimer(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure evtAppMainException(Sender: TObject; E: Exception);
    procedure OpenLogFile;
    procedure CloseLogFile;
    procedure Scan(aDir: string; aFileName: string; aSubDir: string = '');
  private
    FsrcDir       : string;
    FdstDir       : string;
    FresDir       : string;
    FLogFileName  : string;
    FReqFileName  : string;
    FAnsFileName  : string;
    // --- import files
    FAnsFiles     : TStrings;
    // --- options
    FWaitExclusive : integer;
    FScanPeriod : integer;
    // --- Log
    FIsLogOpen : boolean;
    FLogFile  : TextFile;
    // ----------------------------------------------------
  public
    // --- Start \ Stop
    procedure DoStart; override;
    function  DoStop: Boolean; override;
    // --- Log
    procedure Log(aText: string; isLogDateTime: boolean = True);
    procedure LogError(aErrorCode: integer);
    // --- Options
    procedure LoadOptions;
    // --- Service controller
    function  GetServiceController: TServiceController; override;
  published
    property SourceDir  : string read FsrcDir;
    property DestDir    : string read FdstDir;
    property ReserveDir : string read FresDir;
  end;

var
  FileCopyService: TFileCopyService;

implementation

{$R *.DFM}


// ----------------------------------------------------------------------------
// --- Контролы сервиса

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  FileCopyService.Controller(CtrlCode);
end;


function TFileCopyService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;


// ----------------------------------------------------------------------------
// --- Старт\ стоп сервиса
 
procedure TFileCopyService.DoStart;
begin
  LoadOptions;
  OpenLogFile;
  Log(cServiceStart);
  tmrMain.Interval := FScanPeriod;
  tmrMain.Enabled := True;
  inherited DoStart;
end;


function  TFileCopyService.DoStop: Boolean;
begin
  tmrMain.Enabled := False;
  Log(cServiceStop);
  CloseLogFile; 
  Result := inherited DoStop;
end;


// ----------------------------------------------------------------------------
// --- Функционирование сервиса

procedure TFileCopyService.tmrMainTimer(Sender: TObject);
begin
  LoadOptions;
  Scan(FsrcDir, FReqFileName);
end;


procedure TFileCopyService.Scan(aDir: string; aFileName: string; aSubDir: string = '');
var
  SearchRec : TSearchRec;
  fct : TFCThread;
  h : integer;
begin
  if DirectoryExists(aDir) then
  begin
    AddSlashP(aDir);
    AddSlashP(aSubDir);
    // --- поиск файлов
    if (FindFirst(aDir + cAnyFile, faAnyFile, SearchRec) = 0) then
    repeat
      // --- если нашли текущий каталог или родительский то опускаем
      if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
        Continue;
      // --- если нашли файл то
      if (SearchRec.Attr and faDirectory = 0) and (SearchRec.Name = aFileName) then
      begin
        if WaitExclusive(aDir + aFileName, h) then
        begin
          fct := TFCThread.Create(
            FAnsFiles,
            FReqFileName,
            FAnsFileName,
            FSrcDir,
            FDstDir,
            FResDir,
            aSubDir,
            h,
            FWaitExclusive);
          fct.OnLog := Log;
          fct.OnLogError := LogError;
          fct.Resume;
        end;
      end // --- если нашли каталог то продолжаем поиски в нем
      else if (SearchRec.Attr and faDirectory <> 0) then
        Scan(aDir + SearchRec.Name, aFileName, aSubDir + SearchRec.Name);
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
end;



// ----------------------------------------------------------------------------
// --- Создание и удаление модуля

procedure TFileCopyService.ServiceCreate(Sender: TObject);
begin
  FIsLogOpen := False;
  FAnsFiles := TStringList.Create;
  LoadOptions;
end;


procedure TFileCopyService.ServiceDestroy(Sender: TObject);
begin
  FAnsFiles.Free;
  CloseLogFile;
end;


// ----------------------------------------------------------------------------
// --- Протоколирование исключений

procedure TFileCopyService.evtAppMainException(Sender: TObject; E: Exception);
begin
  Log(cError + e.Message, False);
end;


// ----------------------------------------------------------------------------
// --- Протокол

procedure TFileCopyService.Log(aText: string; isLogDateTime: boolean = True);
begin
  if FIsLogOpen then
  begin
    if isLogDateTime then
      aText := DateTimeToStr(Now) + ': ' + aText;
    WriteLn(FLogFile, aText);
  end;
end;


procedure TFileCopyService.LogError(aErrorCode: integer);
begin
  Log(cError + IntToStr(aErrorCode) + ': ' + SysErrorMessage(aErrorCode), False);
end;


procedure TFileCopyService.OpenLogFile;
var
  i : integer;
begin
  {$I-}
  AssignFile(FLogFile, FLogFileName);
  Append(FLogFile);
  i := IOResult;
  if (i = FileNotFoundCode) then
  begin
    ReWrite(FLogFile);
    FIsLogOpen := (IOResult = 0);
  end
  else
    FIsLogOpen := (i = 0);
  {$I+}
end;


procedure TFileCopyService.CloseLogFile;
begin
  if FIsLogOpen then
  begin
    Flush(FLogFile);
    FIsLogOpen := False;
    CloseFile(FLogFile);
  end;
end;


// ----------------------------------------------------------------------------
// --- Загрузка опций

procedure TFileCopyService.LoadOptions;
var
  i : integer;
  aFileName : string;
begin
  with TIniFile.Create(GetIniFileName) do
  try
    FsrcDir := AddSlash(ReadString(ISDirs, IVSourceDir, dfSourceDir));
    FdstDir := AddSlash(ReadString(ISDirs, IVDestinationDir, dfDestinationDir));
    FresDir := AddSlash(ReadString(ISDirs, IVReservedDir, dfReservedDir));
    FLogFileName := ReadString(ISFiles, IVLogFileName, dfLogFileName);
    FReqFileName := ReadString(ISFiles, IVReqFileName, dfReqFileName);
    FAnsFileName := ReadString(ISFiles, IVAnsFileName, dfAnsFileName);
    FWaitExclusive := MSecPerSec * ReadInteger(ISOptions, IVWaitExclusive, dfWaitExclusive);
    FScanPeriod := MSecPerSec * ReadInteger(ISOptions, IVScanPeriod, dfScanPeriod);
    if (FWaitExclusive < 0) then
      FWaitExclusive := MSecPerSec * dfWaitExclusive;
    if (FScanPeriod < 0) then
      FScanPeriod := MSecPerSec * dfScanPeriod;
    i := 0;
    FAnsFiles.Clear;
    repeat
      aFileName := ReadString(ISAnsFiles, IVFile + IntToStr(i), dfFile);
      if (aFileName <> '') then
        FAnsFiles.Append(aFileName);
      Inc(i);
    until (aFileName = '');
  finally
    Free;
  end;
end;


end.

