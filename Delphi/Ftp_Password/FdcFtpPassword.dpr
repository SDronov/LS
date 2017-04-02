program FdcFtpPassword;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  FdcFtpPasswordUtils in 'FdcFtpPasswordUtils.pas',
  FtpUtils in '..\FTP\FtpUtils.pas';

const
  KeyFtpPassword = 'FtpPass';
  KeyProxyPassword = 'ProxyPass';
  KeyDBPassword  = 'DBPass';  
  
var
  i : integer;
  KeySwitch : string;
  aFileName : string;

begin
  if (ParamCount < 0) or (not Odd(ParamCount)) then
    TypeHelp
  else
  begin
    aFileName := ExtractFilePath(ParamStr(0)) +  ParamStr(1);
    i := 2;
    while (i < ParamCount) do
    begin
      KeySwitch := GetSwitch(i);
      Inc(i);
      if (AnsiCompareText(KeySwitch, KeyFtpPassword) = 0) then
        WriteIni(aFileName, SEC_FTP, v_FTPPassword, LogonEncrypt(ParamStr(i)))
      else if (AnsiCompareText(KeySwitch, KeyProxyPassword) = 0) then
        WriteIni(aFileName, SEC_PROXY, v_ProxyPassword, LogonEncrypt(ParamStr(i)))
      else if (AnsiCompareText(KeySwitch, KeyDBPassword) = 0) then
        WriteIni(aFileName, SEC_DB, v_DBPassword, LogonEncrypt(ParamStr(i)));
      Inc(i);
    end;
  end;
End.

