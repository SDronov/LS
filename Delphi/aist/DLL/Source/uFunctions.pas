unit uFunctions;

interface

uses
  SysUtils;

function SetConnection ( IP : PChar; Port : Integer ) : HResult; stdcall;
function ExecQuery( Key : PChar; SizeData : Integer; Data : Pointer; var SizeOtvet : Integer; var Otvet : Pointer{; callBackFnc : Pointer} ) : HResult; stdcall;
function GetLastError( var BufSize : Integer; Msg : Pointer ) : HResult; stdcall;
function Disconnect( Commit : Integer ) : HResult; stdcall;

implementation

uses
  DB
 ,uDM
 ,Classes
 ,uAistConsts
 ,Log4D;

function SetConnection ( IP : PChar; Port : Integer ) : HResult;
begin
  //TLogLogger.GetRootLogger.Options[ 'log4d.appender.file.fileName' ]
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<SetConnection> - start' );

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( Format( 'Подключение к серверу ЛС с параметрами: IP: %s  Порт: %d ...', [ IP, Port ] ) );

  Result := cResOK;
  if Assigned( AistDM ) then
    begin
      Result := cResAlreadyConn;
      Exit;
    end;

  AistDM := TAistDM.Create( nil );
  with AistDM do
    begin
      SocketConnection.Address := IP;
      SocketConnection.Port    := Port;
      try
        SocketConnection.Open;
        with TLogLogger.GetRootLogger do
          if IsInfoEnabled then
            Info( 'Соединение установлено' );
      except
        on E : Exception do
          begin
            TLogLogger.GetRootLogger.Error( 'Открыть соединение не удалось: ', E );
            Free;
            AistDM := nil;
            Result := cResConnError;
            Exit;
          end;
      end;
    end;
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<SetConnection> - exit' );
end;

function Disconnect( Commit : Integer ) : HResult;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Disconnect> - start' );

  Result := cResOK;
  if not Assigned( AistDM ) then
    begin
      Result := cResNoConnection;

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '<Disconnect> - not connected' );

      Exit;
    end;

  if Commit = 1 then
    AistDM.CommitTransaction
  else
    AistDM.RollbackTransaction;

  AistDM.Free;
  AistDM := nil;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( 'Отключён от сервера ЛС' );

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Disconnect> - exit' );
end;

function ExecQuery( Key : PChar; SizeData : Integer; Data : Pointer; var SizeOtvet : Integer; var Otvet : Pointer{; callBackFnc : Pointer} ) : HResult;
  var
    vOtvet : TDataSet;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<ExecQuery> - start' );

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( Format(  'Поступил запрос с кодом [%s]', [Key] ) );

  Result := cResOK;
  if not Assigned( AistDM ) then
    begin
      Result := cResNoConnection;

      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( 'Запрос не выполнен: нет подключения к серверу ЛС' );

      Exit;
    end;

  if     ( Key <> 'R' )
     and ( Key <> 'E' )
     and ( Key <> 'E1' )
     and ( Key <> 'O' )
     and ( Key <> 'V' )
     and ( Key <> 'S' )
     and ( Key <> 'T' ) then
  begin
    Result := cResNoKey;

    TLogLogger.GetRootLogger.Error( Format( 'Неизвестный код запроса [%s]!', [Key] ) );

    Exit;
  end;

  AistDM.InData.WriteBuffer( Data^, SizeData );
  vOtvet := AistDM.ExecQuery( Key );
  if AistDM.ErrCode <> cResOK then
    Result := cResQueryError
  else
    Result := AistDM.ErrCode;
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format( 'Код завершения: %d', [Result] ) );

  SizeOtvet := AistDM.OutData.Size;
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format( 'Размер ответа: %d', [SizeOtvet] ) );

  if SizeOtvet > 0 then
    AistDM.OutData.ReadBuffer( Otvet^, SizeOtvet );
  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( Format( 'Запрос с кодом [%s] выполнен. Код завершения: %d', [Key, Result] ) );

  if Result <> cResOK then
    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( AistDM.ErrMsg );

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<ExecQuery> - exit' );
end;

function GetLastError( var BufSize : Integer; Msg : Pointer ) : HResult;
  var
    i  : Integer;
    pc : ^char;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<GetLastError> - start' );
  Result := 0;

  if BufSize < Length( AistDM.ErrMsg ) + 1 then
    begin
      Result  := -1;
      BufSize := Length( AistDM.ErrMsg ) + 1;
    end
  else
    begin
      BufSize := Length( AistDM.ErrMsg );
      pc := Msg;
      for i := 1 to BufSize do
        begin
          pc^ := AistDM.ErrMsg[i];
          pc  := Pointer( Integer( pc ) + 1 );
        end;
      pc^ := #0;
    end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<GetLastError> - exit' );
end;

end.
