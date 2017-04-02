unit uTest;

interface
uses
  Windows, Classes, Contnrs, SysUtils, ShlObj, Controls, Messages, ShellAPI;

procedure Test;

implementation
uses uLoger;


procedure Z1;
var
 sl: TStringList;
 i: integer;
begin
 sl:= nil;
 createNewLog;
 try
  sl:= TStringList.Create;
  sl.LoadFromFile('iaccftp.ini');
  for i:= 0 to sl.Count - 1 do
    LogStack.add( sl[i] + #13#10 );

  Dump;
 finally
  if assigned(sl) then
    sl.free;
 end;

end;

procedure Test;
begin
 z1;
end;

end.
