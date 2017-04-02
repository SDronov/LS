unit uDM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect, armtisvr_TLB,
  VKDBFDataSet, ztvregister, ztvBase, ztvUnZip, ztvZip,ztvConsts;

type
  TfdcSocketConnection = class(TSocketConnection)
  private
    fTransport : TSocketTransport;
  protected
    function CreateTransport: ITransport; override;
  public
    property Transport : TSocketTransport read fTransport;
  end;

  TAistDM = class(TDataModule)
    dsOtvet: TClientDataSet;
    dsData: TClientDataSet;
    UnZip: TUnZip;
    DBF: TVKDBFNTX;
    Zip: TZip;
    dsDK: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SocketConnectionAfterConnect(Sender: TObject);
    procedure SocketConnectionAfterDisconnect(Sender: TObject);
  private
    { Private declarations }
    fSocketConnection: TfdcSocketConnection;

    fInData  : TMemoryStream;
    fOutData : TMemoryStream;
    fAppSrv  : IRemDMDisp;
    fErrCode : HResult;
    fErrMsg  : string;
  public
    { Public declarations }
    function ExecQuery ( AKey : string ) : TDataSet;
    procedure CommitTransaction;
    procedure RollbackTransaction;

    property SocketConnection: TfdcSocketConnection read fSocketConnection;

    property InData  : TMemoryStream read fInData  write fInData;
    property OutData : TMemoryStream read fOutData write fOutData;

    property ErrCode : HResult read fErrCode;
    property ErrMsg  : string read fErrMsg;
  end;

var
  AistDM: TAistDM;

implementation

{$R *.dfm}

uses
  uAistConsts
 ,dxmdaset
 ,Variants
 ,Windows
 ,MidConst
 ,RTLConsts
 ,VKDBFPrx
 ,Log4D;

Const
  cBuild = '00004';

procedure TAistDM.CommitTransaction;
begin
  if not Assigned( fAppSrv ) then
    Exit;

  fAppSrv.QueryCommit;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( 'Транзакция зафиксирована' );
end;

procedure TAistDM.DataModuleCreate(Sender: TObject);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TAistDM.DataModuleCreate> - start' );

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info('СТАРТ - ' + cBuild);

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug('Операция создания soket - соединения');

  fSocketConnection := TfdcSocketConnection.Create( Self );
  with fSocketConnection do
    begin
      ServerGUID := '{85D7F8C0-C05C-4CE1-B898-BB4D390C096D}';
      ServerName := 'armtisvr.RemDM';

      AfterConnect    := SocketConnectionAfterConnect;
      AfterDisconnect := SocketConnectionAfterDisconnect;
    end;
  dsData.RemoteServer  := fSocketConnection;
  dsOtvet.RemoteServer := fSocketConnection;
  dsDK.RemoteServer := fSocketConnection;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug('Операция создания soket - соединения - завершена');

  fInData  := TMemoryStream.Create;
  fErrCode := cResOK;
  fErrMsg  := '';

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TAistDM.DataModuleCreate> - exit' );
end;

function TAistDM.ExecQuery(AKey: string) : TDataSet;

  procedure CopyDBFFieldDefs( ADBF : TVKDBFNTX; AFieldDefs : TFieldDefs );
    var
      i : Integer;
  begin
    if ADBF.Active then
      ADBF.Close;
    ADBF.FieldDefs.Clear;
    ADBF.DBFFieldDefs.Clear;
    ADBF.DBFIndexDefs.Clear;

    for i := 0 to AFieldDefs.Count - 1 do
      if AFieldDefs[i].Name <> 'RecId' then
        with ADBF.DBFFieldDefs.Add as TVKDBFFieldDef do
          begin
            Name       := AFieldDefs[i].Name;
            case AFieldDefs[i].DataType of
              ftString : begin
                           field_type := 'C';
                           len        := AFieldDefs[i].Size;
                           dec        := 0;
                         end;
              ftInteger
             ,ftFloat   : begin
                            field_type := 'N';
                            // !!Achtung Частный случай!!
                            if Name = 'IRET' then
                            begin
                              len        := 2;//AFieldDefs[i].Size;
                              dec        := 0;//AFieldDefs[i].Precision;
                            end
                            else
                              begin
                                len        := 17;//AFieldDefs[i].Size;
                                dec        := 2;//AFieldDefs[i].Precision;
                              end;
                          end;
              ftDate
             ,ftDateTime: begin
                            field_type := 'D';
                            len        := 8;
                            dec        := 0;
                          end;
              ftBoolean : begin
                            field_type := 'L';
                            len        := 1;
                            dec        := 0;
                          end;
            end;
          end;
  end;

  procedure SendData( ATableName : string );
    var
      msd : TDecompMemoryStream;
      ms  : TMemoryStream;
      dsf : TdxMemData;
      p   : Pointer;
      pb  : ^Byte;
      b   : OleVariant;
      i   : Integer;
      f   : TField;
      ff  : TFloatField;
  begin
    try
      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( Format( 'Передача данных на сервер. Набор данных: %s', [ATableName] ) );

      if DBF.Active then
        DBF.Close;

      msd := TDecompMemoryStream.Create;
      UnZip.FileSpec.Clear;
      UnZip.FileSpec.Add( ATableName + '.dbf' );
      UnZip.ExtractToMemoryStream( msd );

      if msd.Size = 0 then
       begin
        TLogLogger.GetRootLogger.Info('В сообщении не найдена таблица ' + ATableName);
        raise Exception.Create( 'В сообщении не найдена таблица ' + ATableName );
       end;

      DBF.FieldDefs.Clear;
      DBF.DBFFieldDefs.Clear;
      DBF.DBFIndexDefs.Clear;
      DBF.OuterStream := msd;
      DBF.Open;

      if dsData.Active then
        dsData.Close;

      dsData.FieldDefs.Clear;


      dsf := TdxMemData.Create( Self );
      ms := TMemoryStream.Create;
      try
        // Передать информацию о полях
        dsf.CreateFieldsFromDataSet( DBF );
        dsf.LoadFromDataSet( DBF );
        dsf.Close;
        for i := 0 to dsf.FieldCount - 1 do
          if dsf.Fields[i] is TLargeintField then
            begin
              f := dsf.Fields[i];
              dsf.Fields.Remove(f);
              ff := TFloatField.Create( Self );
              ff.FieldName := f.FieldName;
              ff.Size      := f.Size;
              ff.DataSet   := dsf;
              f.Free;
            end;
        dsf.Open;
        dsf.Append;
        for i := 0 to DBF.FieldCount - 1 do
          if DBF.Fields[i] is TLargeintField then
            TFloatField( dsf.FieldByName( DBF.Fields[i].FieldName ) ).AsFloat := TLargeintField( DBF.Fields[i] ).Value
          else
            dsf.FieldByName( DBF.Fields[i].FieldName ).Value := DBF.Fields[i].Value;
        dsf.Post;
        {while dsf.RecordCount > 1 do
          dsf.Delete;}


        dsf.SaveToStream( ms );
        ms.Seek(0, soFromBeginning);
        GetMem( p, ms.Size );

        try
          ms.ReadBuffer( p^, ms.Size );
          pb := p;
          b := VarArrayCreate( [0, ms.Size], varByte );
          for i := 0 to ms.Size - 1 do
            begin
              b[i] := pb^;
              pb := Pointer( Integer( pb ) + 1 );
            end;

          fAppSrv.SendFields( ATableName, ms.Size, b );
        finally
          FreeMem( p, ms.Size );
        end;

      finally
        ms.Free;
        dsf.Free;
      end;

      fAppSrv.ReadDataSet( ATableName );
      dsData.Open;

      DBF.First;
      while not DBF.Eof do
        begin
          dsData.Append;
          for i := 0 to DBF.FieldCount - 1 do
            if DBF.Fields[i] is TLargeintField then
              TFloatField( dsData.FieldByName( DBF.Fields[i].FieldName ) ).AsFloat := TLargeintField( DBF.Fields[i] ).Value
            else
              dsData.FieldByName( DBF.Fields[i].FieldName ).Value := DBF.Fields[i].Value;
          dsData.Post;

          DBF.Next;
        end;
      dsData.ApplyUpdates( 0 );
      dsData.Close;
      dsData.FieldDefs.Clear;

      DBF.Close;
      DBF.OuterStream := nil;
      DBF.FieldDefs.Clear;
      DBF.DBFFieldDefs.Clear;
      msd.Destroy;

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( Format( 'Передача данных на сервер. Набор данных: %s - завершено', [ATableName] ) );
    except
      on E : Exception do
        begin
          TLogLogger.GetRootLogger.Fatal( Format( 'Ошибка при передаче данных [%s] ', [ATableName] ), E );
          raise;
        end;
    end;
  end;

  var
    tmpDir      : PChar;
    tmpFileName : PChar;
    i           : Integer;
    TempFile    : TFileStream;

    iMsgSize    : OleVariant;
    vMsg        : OleVariant;
    vErrCode    : OleVariant;
    pc          : ^char;
    DoCreateDK  : Boolean;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TAistDM.ExecQuery> - start' );

  GetMem( tmpDir, MAX_PATH );
  GetMem( tmpFileName, MAX_PATH );
  try
    // Сохранить поток во временный файл
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( 'Сохраняем поток во временный файл' );

    i := GetTempPath( MAX_PATH, tmpDir );
    pc  := Pointer(Integer(tmpDir) + i);
    pc^ := #0;
    GetTempFileName( tmpDir, 'lsz'#0, 0, tmpFileName );
    pc  := Pointer(Integer(tmpFileName) + length(tmpFileName));
    pc^ := #0;

    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        begin
          Debug( Format(  'Имя директории [%s]>', [tmpDir]));
          Debug( Format(  'Имя файла [%s]>', [tmpFileName]));
        end;
    try
      TempFile := TFileStream.Create( tmpFileName, fmCreate );
      fInData.Position := 0;
      TempFile.CopyFrom( fInData, fInData.Size );
      TempFile.Free;
      UnZip.ArchiveFile := tmpFileName;
    except
        on E : Exception do
        begin
          TLogLogger.GetRootLogger.Fatal( 'Ошибка при сохранении временного файла', E );
          raise;
        end;
     end;
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( 'Сохранение потока во временный файл завершено' );

    // Передать данные на сервер
    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( 'Передача данных на сервер ЛС' );
    if (AKey = 'R') or (AKey = 'T') then
      SendData( 'DK_PP' )
    else
      if AKey = 'O' then
        for i := 0 to sTableNamesO.Count - 1 do
          SendData( sTableNamesO[i] )
      else
        for i := 0 to sTableNames.Count - 1 do
          SendData( sTableNames[i] );

    // Выполнить запрос
    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( Format( 'Выполнение запроса [%s] на сервере ЛС', [AKey] ) );

    if AKey = 'R' then
      fAppSrv.Query_R
    else if AKey = 'E1' then
      fAppSrv.Query_E1
    else if AKey = 'E' then
      fAppSrv.Query_E
    else if AKey = 'O' then
      fAppSrv.Query_O
    else if AKey = 'V' then
      fAppSrv.Query_V
    else if AKey = 'S' then
      fAppSrv.Query_S
    else if AKey = 'T' then
      fAppSrv.Query_T;
    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( Format(  'Запрос [%s] выполнен на сервере ЛС', [AKey] ) );

    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( 'Формирование файла - otvet.dbf' );
    dsOtvet.Open;
    fOutData := TMemoryStream.Create;
    DBF.Close;
    DBF.FieldDefs.Clear;
    DBF.StorageType := pstFile;
    CopyDBFFieldDefs( DBF, dsOtvet.FieldDefs );
    DBF.DBFFileName := tmpDir + 'otvet.dbf';
    DBF.AccessMode.AccessMode := 66;
    DBF.CreateNow := True;
    DBF.Open;
    dsOtvet.First;

    DoCreateDK := False;
    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( Format( 'Файл ответа содержит %d строк', [dsOtvet.RecordCount] ) );
    while not dsOtvet.Eof do
    begin
      DBF.Append;
      for i := 0 to dsOtvet.FieldCount - 1 do
      begin
        if ( dsOtvet.Fields[i].FieldName = 'KEY' )
          and ( ( dsOtvet.Fields[i].Value = 'A' ) or ( dsOtvet.Fields[i].Value = 'X' ) ) then
          DoCreateDK := True;
        if dsOtvet.Fields[i].FieldName <> 'RecId' then  // Стандартное поле в dxMemData
          DBF.FieldByName( dsOtvet.Fields[i].FieldName ).Value := dsOtvet.Fields[i].Value;
      end;
      DBF.Post;

      dsOtvet.Next;
    end;
    DBF.Close;

    if DoCreateDK and ( (AKey = 'E') or (AKey = 'E1') ) then
    begin

      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( 'Формирование файла - dk_pp.dbf' );
      dsDK.Open;
      DBF.Close;
      DBF.FieldDefs.Clear;
      DBF.StorageType := pstFile;
      CopyDBFFieldDefs( DBF, dsDK.FieldDefs );
      DBF.DBFFileName := tmpDir + 'dk_pp.dbf';
      DBF.AccessMode.AccessMode := 66;
      DBF.CreateNow := True;
      DBF.Open;
      dsDK.First;

      with TLogLogger.GetRootLogger do
        if IsInfoEnabled then
          Info( Format( 'Файл dk_pp содержит %d строк', [dsDK.RecordCount] ) );
      while not dsDK.Eof do
      begin
        DBF.Append;
        for i := 0 to dsDK.FieldCount - 1 do
          if dsDK.Fields[i].FieldName <> 'RecId' then  // Стандартное поле в dxMemData
            DBF.FieldByName( dsDK.Fields[i].FieldName ).Value := dsDK.Fields[i].Value;
        DBF.Post;

        dsDK.Next;
      end;
      DBF.Close;

    end;

    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( 'Получение кода ошибки' );

    fAppSrv.GetLastError( vErrCode );
    fErrCode := vErrCode;
    fAppSrv.GetLastErrorMsg( iMsgSize, vMsg );
    fErrMsg := VarToStr( vMsg );

    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( 'Получение кода ошибки - завершено' );

    if FileExists(tmpFileName) then
      DeleteFile( tmpFileName );
      //EraseFile(tmpFileName, doAllowUndo);
    DeleteFile( PChar( tmpDir + 'otvet.zip' ) );

    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( 'Упаковка ответа' );

    Zip.ArchiveFile := tmpDir + 'otvet.zip';
    Zip.ExcludeSpec.Clear;
    Zip.FileSpec.Clear;
    Zip.FileSpec.Add( tmpDir + 'otvet.dbf' );

    if DoCreateDK and ( (AKey = 'E') or (AKey = 'E1') ) then
      Zip.FileSpec.Add( tmpDir + 'dk_pp.dbf' );

    if Zip.Compress <> 0 then
    begin
      TempFile := TFileStream.Create( Zip.ArchiveFile, fmOpenRead );
      fOutData.CopyFrom( TempFile, TempFile.Size );
      fOutData.Position := 0;
      TempFile.Free;

      DeleteFile( PChar( tmpDir + 'otvet.zip' ) );

      Result := dsOtvet;

      with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
          Debug( 'Упаковка ответа - завершено' );
    end
    else
      begin
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
            Debug( 'Ошибка при упаковке ответа!' );
        Result := nil;
      end;

    with TLogLogger.GetRootLogger do
      if IsInfoEnabled then
        Info( 'Формирование файла - otvet.zip - завершено' ) ;
  except
    on E : Exception do
      begin
        TLogLogger.GetRootLogger.Fatal( 'Ошибка при выполнении запроса', E );
        fAppSrv.QueryRollback;
        Result := nil;
        DeleteFile( tmpFileName );
        FreeMem( tmpDir, MAX_PATH );
        FreeMem( tmpFileName, MAX_PATH );
        if fErrCode = cResOK then
          fErrCode := cResQueryError;
      end;
  end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TAistDM.ExecQuery> - exit' );
end;

procedure TAistDM.DataModuleDestroy(Sender: TObject);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TAistDM.DataModuleDestroy> - start' );

  fInData.Free;
  if Assigned( fOutData ) then
    fOutData.Destroy;

  if fSocketConnection.Connected then
    fSocketConnection.Close;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info('СТОП');

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<TAistDM.DataModuleDestroy> - exit' );
end;

procedure TAistDM.SocketConnectionAfterConnect(Sender: TObject);
begin
  fAppSrv := IRemDMDisp(IDispatch(fSocketConnection.AppServer));
  with fSocketConnection.Transport.Socket do
    fAppSrv.SetInfo( LocalHost, LocalAddress, LocalPort );
end;

procedure TAistDM.RollbackTransaction;
begin
  if not Assigned( fAppSrv ) then
    Exit;

  fAppSrv.QueryRollback;

  with TLogLogger.GetRootLogger do
    if IsInfoEnabled then
      Info( 'Транзакция отменена' );
end;

procedure TAistDM.SocketConnectionAfterDisconnect(Sender: TObject);
begin
  fAppSrv := nil;
end;

{ TfdcSocketConnection }

function TfdcSocketConnection.CreateTransport: ITransport;
begin
  if SupportCallbacks then
    if not LoadWinSock2 then raise Exception.CreateRes(@SNoWinSock2);
  if (Address = '') and (Host = '') then
    raise ESocketConnectionError.CreateRes(@SNoAddress);
  fTransport := TSocketTransport.Create;
  fTransport.Host    := Host;
  fTransport.Address := Address;
  fTransport.Port    := Port;
  fTransport.InterceptGUID := InterceptGUID;
  Result := fTransport as ITransport;
end;

end.
