program crypt;

{$APPTYPE CONSOLE}

uses
  SysUtils;

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

begin
  { TODO -oUser -cConsole Main : Insert code here }
  if ParamCount > 0 then
    Writeln(LogonEncrypt(ParamStr(1)));
end.
 