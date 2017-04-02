unit uDebug;

interface

var
  gv_DebugFileName   : string;

procedure WriteDebug ( const ALogStr : string );

implementation

uses
  SysUtils
 ,Forms;

var
  gv_DebugFileHandle : THandle;
  s                  : PChar;

procedure WriteDebug ( const ALogStr : string );
begin
  gv_DebugFileHandle := FileOpen( gv_DebugFileName, fmOpenReadWrite );
  FileSeek( gv_DebugFileHandle, 0, 2 );
  s := PChar( DateTimeToStr( Now ) + ' ' + ALogStr + #$D#$A );
  FileWrite( gv_DebugFileHandle, s^, Length(s) );
  FileClose( gv_DebugFileHandle );
end;

initialization

  gv_DebugFileName   := ChangeFileExt( Application.ExeName, '.debug.log' );
  gv_DebugFileHandle := FileCreate( gv_DebugFileName );
  s := PChar( DateTimeToStr( Now ) + ' Запуск приложения.' + #$D#$A );
  FileWrite( gv_DebugFileHandle, s^, Length(s) );
  FileClose( gv_DebugFileHandle );

finalization

  WriteDebug( 'Приложение закрыто.' );

end.
