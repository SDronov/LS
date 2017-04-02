unit FileCopyUtils;

interface

uses
  Windows,
  Forms,
  SysUtils,
  Classes;

type
  TLogProcedure  = procedure(aText: string; isLogDateTime: boolean = True) of object;
  TLogErrorProcedure = procedure(aErrorCode: integer) of object;

const
  // --- ���������
  FileNotFoundCode = 2;
  crlf             = #13#10;
  MSecPerMin       = 1000 * 60;
  MSecPerSec       = 1000;
  OneSec           = 1/24/60/60;
  OneMin           = 1/24/60;

  // --- ����������
  DirNotFound    = '.';
  Invalid_Handle = -1;
  cAnyFile       = '*.*';
  cSlash         = '\';


  // --- ����� � �����
  ISDirs               = 'Dirs';
    IVSourceDir        = 'Source_Dir';
      dfSourceDir      = '';
    IVDestinationDir   = 'Destination_Dir';
      dfDestinationDir = '';
    IVReservedDir      = 'Reserved_Dir';
      dfReservedDir    = '';
  ISFiles              = 'Files';
    IVReqFileName      = 'Request_FileName';
      dfReqFileName    = 'job.txt';
    IVAnsFileName      = 'Ansver_FileName';
      dfAnsFileName    = 'eoj.txt';
    IVLogFileName      = 'Log_FileName';
      dfLogFileName    = 'FileCopyService.log';
  ISAnsFiles           = 'Ansver_Files';
    IVFile             = 'File';
      dfFile           = '';
  ISOptions            = 'Options';
    IVWaitExclusive    = 'WaitExclusive';		// � ��������
      dfWaitExclusive  = 600;
    IVScanPeriod       = 'ScanPeriod';
      dfScanPeriod     = 30;

  // --- ������ � ���������
  cServiceInstall    = '------- ������ ���������� -------';
  cServiceUnInstall  = '------- ������ �������������� -------';
  cServiceStart      = '------- ������ ��������� -------';
  cServiceStop       = '------- ������� ������� -------';
  cBeginWork         = '------- ������ ������ -------';
  cEndWork           = '------- ���������� ������ -------';
  cRightArrow        = ' -> ';
  cCopy              = '����������� ';
  cMove              = '����������� ';
  cCopySD            = '--- ����������� ������ S -> D ---';
  cCopySR            = '--- ����������� ������ S -> R ---';
  cMoveSR            = '--- ����������� ������ S -> R ---';
  cMoveAnsver        = '--- ����������� ������ ������ ---';
  cUnableCreateDir   = '�� ������� ������� ������� ';
  cError             = '  ������ ';



// if Founded then Result = SubDir else Result = DirNotFound
function  AddSlash(aDir: string): string;
procedure AddSlashP(var aDir: string);
function  DelSlash(aDir: string): string;
procedure DelSlashP(var aDir: string);
function  FindFileSubDir(aDir: string; aFileName: string; aSubDir: string = ''): string;
function  GetFileList(aDir: String): TStringList;

function  GetIniFileName : string;
function  GetLogFileName: string;

function  WaitExclusive(aFileName: string; var aHandle: integer; aWaitExclusive:integer = dfWaitExclusive): boolean;


implementation

function AddSlash(aDir: string): string;
begin
  if (length(aDir) > 0) and (aDir[length(aDir)] <> cSlash) then
    Result := aDir + cSlash
  else
    Result := aDir;
end;


procedure AddSlashP(var aDir: string);
begin
  aDir := AddSlash(aDir);
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


function FindFileSubDir(aDir: string; aFileName: string; aSubDir: string = ''): string;
var
  SearchRec : TSearchRec;
begin
  Result := DirNotFound;
  if DirectoryExists(aDir) then
  begin
    AddSlashP(aDir);
    AddSlashP(aSubDir);
    // --- ����� ������
    if (FindFirst(aDir + '*.*', faAnyFile, SearchRec) = 0) then
    repeat
      // --- ���� ����� ������� ������� ��� ������������ �� ��������
      if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
        Continue;
      // --- ���� ����� ���� �� ���������� ����; ���� ������� �� ������ � ���
      if (SearchRec.Attr and faDirectory = 0) and (SearchRec.Name = aFileName) then
      begin
        Result := aSubDir;
        break;
      end
      else if (SearchRec.Attr and faDirectory <> 0) then
      begin
        Result := FindFileSubDir(aDir + SearchRec.Name, aFileName, aSubDir + SearchRec.Name);

        if (Result <> DirNotFound) then
          break;
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
end;


function GetFileList(aDir: string): TStringList;
var
  SearchRec : TSearchRec;
begin
  if DirectoryExists(aDir) then
  begin
    Result := TStringList.Create;
    Result.Clear;
    AddSlashP(aDir);
    // --- ����� ������
    if (FindFirst(aDir + '*.*', faAnyFile, SearchRec) = 0) then
    repeat
      // --- ���� ����� ������� ������� ��� ������������ �� ��������
      if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
        Continue;
      // --- ���� ����� ���� �� ��������� ��� � ������
      if (SearchRec.Attr and faDirectory = 0) then
        Result.Append(SearchRec.Name);
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end
  else
    Result := nil;
end;



function  GetIniFileName: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.ini');
end;


function  GetLogFileName: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.log');
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

end.

