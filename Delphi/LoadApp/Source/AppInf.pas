unit AppInf;

interface

uses  fdcOracleSession;

  function GetAppSession: TfdcOracleSession;
  function GetAppRegistryKey: String;

  procedure SetAppSession(ASession: TfdcOracleSession);

implementation

uses  fdcUtils;

var
  FSession: TfdcOracleSession;

function GetAppSession: TfdcOracleSession;
begin
  Result := FSession;
end;

function GetAppRegistryKey: String;
begin
  Result := fdcUtils.GetAppRegistryKey;
end;

procedure SetAppSession(ASession: TfdcOracleSession);
begin
  FSession := ASession;
end;

end.
