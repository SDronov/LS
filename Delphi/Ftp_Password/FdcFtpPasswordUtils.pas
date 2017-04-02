unit FdcFtpPasswordUtils;

interface

uses
  SysUtils;

const

  cHelpTextLines = 1;
  cHelpText : array [0..cHelpTextLines-1] of string = (
    'Здесь будет хелп'
  );


function LogonEncrypt(const S: string): string;
function AnToAs(s: String) : String;
function GetSwitch(Idx : integer): string;
procedure TypeHelp;
procedure WriteIni(aIniFileName, aSection, aIdent, aValue : string);

implementation

uses
  IniFiles;

function AnToAs(s: String) : String;
Var
  i, kod : Integer;
begin
  Result := s;
  for i := 1 to length(s) do
  begin
    kod := Ord(s[i]);
    if (kod >= 192 ) and (kod <= 239) then
      Result[i] := Chr(kod-64);
    if (kod >= 240) and (kod <= 255) then
      Result[i] := Chr(kod-16);
    if (kod = 168) then
      Result[i] := Chr(240);
    if (kod = 184) then
      Result[i] := Chr(241);
  end;
end;



function LogonEncrypt(const S: string): string;
var i, v, x: Integer;
begin
  Randomize;
  x := Random(1000) + 2000;
  Result := '';
  for i := 1 to Length(S) do
  begin
    v := Ord(S[i]) * 16;
    Result := Result + IntToStr(1000 + (v xor (x + i * 10)));
  end;
  Result := IntToStr(x) + Result;
end;


procedure TypeHelp;
var
  i : integer;
begin
  for i := 0 to cHelpTextLines - 1 do
    WriteLn(AnToAs(cHelpText[i]));
end;


function GetSwitch(Idx : integer): string;
begin
  if (Idx > 0) and (Idx < ParamCount) then
    Result := AnsiUpperCase(Copy(ParamStr(Idx), 1, length(ParamStr(Idx))))
  else
    Result := '';
end;


procedure WriteIni(aIniFileName, aSection, aIdent, aValue : string);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(aIniFileName);
  try
    Ini.WriteString(aSection, aIdent, aValue);
  finally
    Ini.Free;
  end;
end;


end.
