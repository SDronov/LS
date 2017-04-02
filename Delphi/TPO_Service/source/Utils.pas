unit Utils;

interface

uses
  DB,
  Windows,
  Classes,
  Forms,
  SysUtils,
  Variants;

const
  // --- Системные константы
  NoParam         = '';
  cStar           = '*';
  Invalid_Handle  = -1;
  cOneSecInterval = 1000;
  cSecPerMin      = 60;
  cSpace          = ' ';
  cBackSlash      = '\';

  // --- Время
  cOneHour        = 1 / 24;
  cOneMinute      = cOneHour / 60;
  cOneSecond      = cOneMinute / 60;

  // --- Вычисляемые константы
  cStarLen        = length(cStar);

type
  TMyMessageEvent = procedure (S: string) of object;

function  GetDefFS: TFormatSettings;  
function  GetAppDir: string;
function  GetFullDir(aDir: string): string;
function  GetFullFileName(aFileName: string): string;
function  OpenExclusive(const aFileName: string; var aHandle: integer): boolean;
procedure CloseExclusive(const aHandle: integer);
function  LTrim(const aText: string): string;
function  RTrim(const aText: string): string;
function  LRTrim(const aText: string): string;
function  NVLStr(a, b: Variant): string;
function  IfElse(aValue: boolean; valTrue, valFalse: Variant): Variant;
function  CheckFiles(const DirName: string; const FileNames: array of string): string;
function  AnsiToAscii(const aText: string): string;
function  AnsiToAsciiEx(const aText: string): string;
function  AsciiToAnsiEx(const aText: string): string;
procedure DsAnsiToAsciiEx(ds: TDataSet);
procedure DeepCopyArray(var ArrDest: array of string; const ArrSource: array of string);
function  GetFileDateTime(aFileName: string; aHandle : integer = -1): string;

implementation

const
  cDateFormat    = 'DD.MM.YYYY';
  cTimeFormat    = 'HH:MM:SS';


function GetDefFS: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, Result);
  with Result do
  begin
    ShortDateFormat := cDateFormat;
    ShortTimeFormat := cTimeFormat;
    LongDateFormat  := ShortDateFormat;
    LongTimeFormat  := ShortTimeFormat;
  end;
end;



function GetAppDir: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;


function GetFullDir(aDir: string): string;
begin
  if (Copy(aDir, 2, 1) = ':') then
    Result := aDir
  else if (Copy(aDir, 1, 2) = '.\') then
    Result := ExtractFilePath(Application.exeName) + Copy(aDir, 3, MaxInt)
  else if (Copy(aDir, 1, 2) = '\\') then
    Result := aDir
  else if (Copy(aDir, 1, 1) = '\') then
    Result := ExtractFilePath(Application.exeName) + Copy(aDir, 2, MaxInt)
  else
    Result := ExtractFilePath(Application.exeName) + aDir;
  if (length(Result) <> 0) and (Result[length(Result)] <> '\') then
    Result := Result + '\';
end;


function GetFullFileName(aFileName: string): string;
begin
  Result := GetFullDir(ExtractFilePath(aFileName)) + ExtractFileName(aFileName);
end;


function OpenExclusive(const aFileName: string; var aHandle: integer): boolean;
begin
  aHandle := FileOpen(aFileName, fmShareExclusive);
  Result := (aHandle <> Invalid_Handle);
end;

procedure CloseExclusive(const aHandle: integer);
begin
  FileClose(aHandle);
end;

function LTrim(const aText: string): string;
begin
  Result := aText;
  while (length(Result) > 0) and (Result[1] = cSpace) do
    Result := Copy(Result, 2, MaxInt);
end;


function RTrim(const aText: string): string;
begin
  Result := aText;
  while (length(Result) > 0) and (Result[length(Result)] = cSpace) do
    Result := Copy(Result, 1, length(Result)-1);
end;


function LRTrim(const aText: string): string;
begin
  Result := LTrim(RTrim(aText));
end;


function NVLStr(a, b: Variant): string;
begin
  try
    if (a <> NULL) then
      Result := a
    else
      Result := b;
  except
    Result := '';
  end;
end;


function IfElse(aValue: boolean; valTrue, valFalse: Variant): Variant;
begin
  if aValue then
    Result := valTrue
  else
    Result := valFalse;
end;


function CheckFiles(const DirName: string; const FileNames: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(FileNames) to High(FileNames) do
  begin
    if not FileExists(DirName + '\' + FileNames[I]) then
      Result := Result + ',' + FileNames[I];
  end;
  Result := Copy(Result, 2, MaxInt);
end;



function AnsiToAscii(const aText: string): string;
var
  i : Integer;
  b : byte;
begin
  Result := aText;
  for i := 1 to length(Result) do
  begin
    b := Ord(Result[i]);
    case b of
      $C0..$EF : Result[i] := Chr(b - $40);	// А-п
      $F0..$FF : Result[i] := Chr(b - $10);	// р-я
    end;
  end;
end;


function AnsiToAsciiEx(const aText: string): string;
var
  i : Integer;
  b : byte;
begin
  Result := aText;
  for i := 1 to length(aText) do
  begin
    b := Ord(Result[i]);
    case b of
      $C0..$EF : Result[i] := Chr(b - $40);	// А-п
      $F0..$FF : Result[i] := Chr(b - $10);	// р-я
      $A8      : Result[i] := Chr($F0);		// Ё
      $B8      : Result[i] := Chr($F1);		// ё
    end;
  end;
end;


procedure DsAnsiToAsciiEx(ds: TDataSet);
var
  i : integer;
begin
  if ds.Active then
    for i := 0 to ds.FieldCount-1 do
      ds.Fields[i].Text := AnsiToAsciiEx(Ds.Fields[i].Text);
end;


function AsciiToAnsiEx(const aText: string): string;
var
  i : integer;
  b : byte;
begin
  Result := aText;
  for i := 1 to length(aText) do
  begin
    b := Ord(Result[i]);
    case b of
      $80..$AF : Result[i] := Chr(b + $40);
      $E0..$EF : Result[i] := Chr(b + $10);
      $F0      : Result[i] := Chr($A8);
      $F1      : Result[i] := Chr($B8);
    end;
  end;
end;

procedure DeepCopyArray(var ArrDest: array of string; const ArrSource: array of string);
var
  i,j : integer;
begin
  j:= Low(ArrDest) - Low(ArrSource);
  if j+High(ArrDest) > High(ArrSource) then
    for i := Low(ArrSource) to High(ArrSource) do
      ArrDest[j+i]:= ArrSource[i]
  else
    for i := Low(ArrSource) to High(ArrDest)-j do
      ArrDest[j+i]:= ArrSource[i];
end;


function  GetFileDateTime(aFileName: string; aHandle : integer = -1): string;
var
  f : integer;
  d : integer;
begin
  if aHandle = -1 then
  begin
    f := FileOpen(aFileName, fmOpenRead);
    d := FileGetDate(f);
    if d = -1 then
      Result := 'xx.xx.xxxx xx:xx:xx'
    else
      Result := DateTimeToStr(FileDateToDateTime(d), GetDefFS);
    FileClose(f);
  end
  else
    Result := DateTimeToStr(FileDateToDateTime(FileGetDate(aHandle)), GetDefFS);
end;

end.

