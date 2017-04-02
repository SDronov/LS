unit uConsts;

interface
uses
 Windows, Messages;

const // messages
 confirm_notification = wm_user + 1;
 msg_callback         = wm_user + 2;



const
 cRootKey = HKEY_CURRENT_USER;
 cKeyPath = '\SOFTWARE\OVIONT-Inform\NOTIFICATOR';  // Имя раздела

 sec_notificator = 'NOTIFICATOR';

 cAutoStart = 'AutoStart';
 cIntervalSeconds = 'IntervalSeconds';

 cNet_Mon = 'Net_Mon';
 cNetPath = 'NetPath';
 cFTP_Mon = 'FTP_Mon';

 cFtpHost   = 'FtpHost';
 cFtpPort     = 'FtpPort';
 cFtpPassiveMode = 'FtpPassiveMode';

 cFtpUser  = 'FtpUser';
 cFtpPassword = 'FtpPassword';
 cFtpDirectory = 'FtpDirectory';

 cFileMask = 'FileMask';

 defAutoStart = false;
 defIntervalSeconds = 60;

 defNet_Mon = true;
 defNetPath = '';
 defFTP_Mon = false;

 defFtpHost   = '127.0.0.1';
 defFtpPassiveMode = true;
 defFtpPort     = 21;

 defFtpUser  = '';
 defFtpPassword = '';
 defFtpDirectory = '';

 defFileMask = '*.lzh';


function boolAsInt(aValue: boolean): integer;
function intAsBool(aValue: integer): boolean;

implementation

function boolAsInt(aValue: boolean): integer;
begin
 if aValue then
  result:= 1
 else result:= 0;
end;

function intAsBool(aValue: integer): boolean;
begin
 if (aValue <> 0) then
   result:= true
 else result:= false;
end;

end.
