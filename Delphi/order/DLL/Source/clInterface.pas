unit clInterface;

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
 ,clData
 ,Classes
 ,comConsts
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
  if Assigned( LocalDM ) then
    begin
      Result := cResAlreadyConn;
      Exit;
    end;

  LocalDM := TLocalDM.Create( nil );
  with LocalDM do
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
            LocalDM := nil;
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
  if not Assigned( LocalDM ) then
    begin
      Result := cResNoConnection;

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( '<Disconnect> - not connected' );

      Exit;
    end;

  if Commit = 1 then
    LocalDM.CommitTransaction
  else
    LocalDM.RollbackTransaction;

  LocalDM.Free;
  LocalDM := nil;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( 'Отключён от сервера ЛС' );

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Disconnect> - exit' );
end;

function ExecQuery( Key : PChar; SizeData : Integer; Data : Pointer; var SizeOtvet : Integer; var Otvet : Pointer{; callBackFnc : Pointer} ) : HResult;
  var
    Res: String;
    ResSize: Integer;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<ExecQuery> - start' );

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( Format(  'Поступил запрос с кодом [%s]', [Key] ) );

  Result := cResOK;

  if not Assigned( LocalDM ) then
    begin
      Result := cResNoConnection;

      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( 'Запрос не выполнен: нет подключения к серверу ЛС' );

      Exit;
    end;

  if     ( Key <> 'R' )
     and ( Key <> 'T' )
     and ( Key <> 'E' )
     and ( Key <> 'D' )
     and ( Key <> 'X' ) then
  begin
    Result := cResNoKey;
    TLogLogger.GetRootLogger.Error( Format( 'Неизвестный код запроса [%s]!', [Key] ) );
    Exit;
  end;

  LocalDM.InData.WriteBuffer( Data^, SizeData );

  with TLogLogger.GetRootLogger do
     if IsDebugEnabled then
     begin
       SetString( Res, PChar( LocalDM.InData.Memory ), SizeData );
       Debug( Res );
     end;

  if Key = 'X' then
    LocalDM.ExecQuery( 'R' )
  else
    LocalDM.ExecQuery( Key );

  if LocalDM.ErrCode <> cResOK then
    Result := cResQueryError
  else
    Result := LocalDM.ErrCode;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format( 'Код завершения: %d', [Result] ) );

  ResSize := LocalDM.OutData.Size;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format( 'Размер ответа: %d', [ResSize] ) );

  if ResSize > 0 then
  begin
    if Key <> 'X' then
    begin

      try
        GetMem( Otvet, ResSize );
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
            Debug( Format( 'Распределено %d байт', [ResSize] ) );

        LocalDM.OutData.ReadBuffer( Otvet^, ResSize );
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
            Debug( Format( 'Записано в буфер %d байт', [ResSize] ) );

        SizeOtvet := ResSize;

        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
          begin
            SetString( Res, PChar( LocalDM.OutData.Memory ), ResSize );
            Debug( Res );
          end;

      except
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
            Debug( 'Ошибка записи ответа в буфер' );

        FreeMem( Otvet );
        SizeOtvet := 0;
      end;

    end
    else
      begin
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
          begin
            SetString( Res, PChar( LocalDM.OutData.Memory ), ResSize );
            Debug( Res );
          end;
      end;
  end
  else
    SizeOtvet := 0;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( Format( 'Запрос с кодом [%s] выполнен. Код завершения: %d', [Key, Result] ) );

  if Result <> cResOK then
    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( LocalDM.ErrMsg );

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

  if BufSize < Length( LocalDM.ErrMsg ) + 1 then
    begin
      Result  := -1;
      BufSize := Length( LocalDM.ErrMsg ) + 1;
    end
  else
    begin
      BufSize := Length( LocalDM.ErrMsg );
      GetMem( Msg, BufSize );
      pc := Msg;
      for i := 1 to BufSize do
        begin
          pc^ := LocalDM.ErrMsg[i];
          pc  := Pointer( Integer( pc ) + 1 );
        end;
      pc^ := #0;
    end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<GetLastError> - exit' );
end;

end.
