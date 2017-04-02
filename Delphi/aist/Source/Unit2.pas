unit Unit2;

interface

uses
  SysUtils, Classes, DB, Oracle, QueryList, VKDBFDataSet, IniFiles, Contnrs,Unit3;

type
  TDataModule2 = class(TDataModule)
    OracleSession1: TOracleSession;
    OracleQuery1: TOracleQuery;
    QueryList1: TQueryList;
    sqlInsert: TsqlOp;
    sqlBeginLoad: TsqlOp;
    OracleLogon1: TOracleLogon;
    dsOtvet: TVKDBFNTX;
    qryR: TOracleQuery;
    sqlDelRowCharge: TsqlOp;
    qryV: TOracleQuery;
    qryTest: TOracleQuery;
    qryS: TOracleQuery;
    qryT: TOracleQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure OracleSession1BeforeLogOn(Sender: TOracleSession);
    procedure OracleSession1Change(Sender: TOracleSession);
    procedure dsOtvetAfterClose(DataSet: TDataSet);
    procedure dsOtvetBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FParams: TMemIniFile;
    FLockedFiles: TObjectList;
    procedure LoadAllDBF(const PathName: string);
    procedure LoadDBF(const FileName, TableName: string);
    function  ParseLoad(LoadId: double; Key: string): TOracleQuery;
    procedure HandleP(const DirName: string);
    procedure HandleE1(const DirName: string);
    procedure HandleO(const DirName: string);
    procedure HandleR(const DirName: string);
    procedure HandleT(const DirName: string);
    procedure HandleV(const DirName: string);
    procedure HandleS(const DirName: string);
    procedure GetOutput(Lines: TStrings);
    procedure ForceLockDbf(const FilePath: string; Files: TStrings);
    procedure MakeFault(const Cause: string = 'LS');
  protected
    function HandleCreateException: Boolean; override;

    { Private declarations }
  public
    { Public declarations }
    procedure LoadQuery(Query: TOracleQuery; DataSet: TDataSet);
    procedure Handle(const QueueInfo: TQueueInfo);
  end;

var
  DataModule2: TDataModule2;
  //Key        : String; эта переменная не должна быть глобальной
implementation

uses
  Forms, OracleLogon, Log4D, Math, StrUtils, fdcExceptions;

{$R *.dfm}

function CreateDBFDataSet(const FileName: string; Query: TOracleQuery):
  TVKDBFNTX;
  procedure CreateFields;
  var
    FieldName: string;
    I: Integer;
    procedure CreateField(const FieldName: string; FieldType: char; FieldSize,
      FieldPrec: Integer);
    begin
      with TVKDBFFieldDef(Result.DBFFieldDefs.Add) do
      begin
        Name := FieldName;
        Field_Type := FieldType;
        Len := FieldSize;
        Dec := FieldPrec;
      end;
    end; //
  begin
    for I := 0 to Query.FieldCount - 1 do // Iterate
    begin
      FieldName := Query.FieldName(I);
      case Query.FieldType(I) of //
        otInteger: CreateField(FieldName, 'N', Query.FieldPrecision(I), 0);
        otFloat: CreateField(FieldName, 'N', Query.FieldPrecision(I),
            Query.FieldScale(I));
        otDate: CreateField(FieldName, 'D', 0, 0);
        otString: CreateField(FieldName, 'C', Query.FieldSize(I), 0);
      end; // case
    end; // for
  end;

begin
  Result := TVKDBFNTX.Create(nil);
  try
    Result.DBFFileName := FileName;
    Result.AccessMode.AccessMode := fmOpenReadWrite;
    Result.DbfVersion := xbaseIII;
    Result.TrimCType := True;
    Result.OEM := True;
    CreateFields;
    Result.CreateTable;
    Result.BufferSize := 1024 * 4;
    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

function OpenDBF(const FileName: string): TVKDBFNTX;
begin
  Result := TVKDBFNTX.Create(nil);
  try
    Result.DBFFileName := FileName;
    Result.AccessMode.AccessMode := fmOpenRead + fmShareDenyWrite;
    Result.DbfVersion := xbaseIII;
    Result.TrimCType := True;
    Result.OEM := True;
    Result.BufferSize := 1024 * 10;
    Result.SetDeleted := True;
    Result.Open;
  except
    Result.Free;
    with TLogLogger.GetRootLogger do
      Debug(Format('raise Обработка запроса на платежные поручения', []));
    raise;
  end;
end;

procedure TDataModule2.LoadQuery(Query: TOracleQuery; DataSet: TDataSet);
var
  Field: TField;
  I: Integer;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug('Начало формирование файла otvet.dbf');
  while not Query.Eof do
  begin
    DataSet.Append;
    for I := 0 to Query.FieldCount - 1 do // Iterate
    begin
      Field := DataSet.FindField(Query.FieldName(I));
      if Field <> nil then
        Field.Value := Query.Field(I);
    end; // for
    DataSet.Post;
    Query.Next;
  end; // while
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Формирование файла otvet.dbf закончено, файл содержит %d записей', [DataSet.RecordCount]));
end;

function GenInsertForDataSet(DataSet: TDataSet; const TableName, ColMap: string):
  string;
var
  I: Integer;
  ClmList, VarList, dbf_field: string;
  ColList : TStrings;
begin
  if ColMap <> '' then
    begin
      ColList := TStringList.Create;
      try
        ColList.Delimiter := ';';
        ColList.DelimitedText := ColMap;
        for i := 0 to ColList.Count - 1 do
          begin
            if ColList.Names[i] <> '' then
              dbf_field := ColList.Names[i]
            else
              dbf_field := ColList.ValueFromIndex[i];

            ClmList := ClmList + ',' + ColList.ValueFromIndex[i];
            VarList := VarList + ',:' + dbf_field;
          end;
      finally
        FreeAndNil(ColList);
      end;
    end
  else
    for I := 0 to DataSet.FieldCount - 1 do
      with DataSet.Fields[I] do
        if fieldKind = fkData then
        begin
          ClmList := ClmList + ',' + FieldName;
          VarList := VarList + ',:' + FieldName;
        end;
  Delete(ClmList, 1, 1);
  Delete(VarList, 1, 1);
  Result := Format('insert into %s(%s) values(%s)', [TableName, ClmList,
    VarList]);
end;

{ TDataModule2 }

procedure TDataModule2.LoadDBF(const FileName: string; const TableName: string);
var
  DataSet: TDataSet;
  ColList: String;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Загрузка файла %s в таблицу %s', [FileName, TableName]));

  if not FileExists(FileName) then
  begin
    TLogLogger.GetRootLogger.Warn(Format('Файл  "%s" не найден', [FileName]));
    Exit;
  end;

  DataSet := OpenDBF(FileName);
  try
    ColList := FParams.ReadString(ExtractFileName(FileName), 'fields', '');
    sqlInsert.SQL.Text := GenInsertForDataSet(DataSet, TableName, ColList);
    sqlInsert.DataSet := DataSet;
    while not DataSet.Eof do
    begin
      try
        sqlInsert.Exec;
      except
        on e: EOracleError do
        begin
          if (e.ErrorCode = 942) then
            GlobalExceptionHandler(E, 'Ошибка загрузки файла',
              Format('Файл %s не загружен. Таблицы %s не существует', [FileName, TableName]),
              'Unit2','TDataModule2','LoadDBF')
          else
            if not ((e.ErrorCode = 1) or (e.ErrorCode = 2291)) then
              raise;
        end;
      end; // try/except
      DataSet.Next;
    end; // while
  finally // wrap up
    DataSet.Free;
  end; // try/finally
end;

function TDataModule2.ParseLoad(LoadId: double; Key: string): TOracleQuery;
begin
  Result := TOracleQuery.Create(nil);
  try
    Result.Session := OracleSession1;
    OracleQuery1.SetVariable('PLOADID', LoadId);
    OracleQuery1.SetVariable('PKEY', Key);
    OracleQuery1.SetComplexVariable('podata', Result);
    OracleQuery1.Execute;
    Result.Execute;
  except
    Result.Free;
    raise
  end; // try/finally
end;

procedure TDataModule2.MakeFault(const Cause: string = 'LS');
begin
  dsOtvet.Truncate;
  dsOtvet.AppendRecord(['', 'F', '', '', Cause]);
end; //

procedure TDataModule2.Handle(const QueueInfo: TQueueInfo);
begin
  try
    //TLogLogger.GetRootLogger.Info('TDataModule2.Handle');

    dsOtvet.DBFFileName := QueueInfo.Path + '\otvet.dbf';
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug(Format('Создание файла: %s', [dsOtvet.DBFFileName]));
    dsOtvet.CreateTable;
    dsOtvet.Open;

    if QueueInfo.Queue  = btSpisQueueE1 then
      HandleE1(QueueInfo.Path)
    else if QueueInfo.Queue  = btSpisQueueE then
      HandleP(QueueInfo.Path)
    else if QueueInfo.Queue  =  btReadQueueR then
      HandleR(QueueInfo.Path)
    else if QueueInfo.Queue  = btSpisQueueV then
      HandleV(QueueInfo.Path)
    else if QueueInfo.Queue  = btOtzivQueueS then
      HandleS(QueueInfo.Path)
    else if QueueInfo.Queue  =  btSpisQueueO then
      HandleO(QueueInfo.Path)
    else if QueueInfo.Queue  =  btReadQueueT then
      HandleT(QueueInfo.Path)
    else
      MakeFault;
  except
    MakeFault;
    raise;
  end;
end;

procedure TDataModule2.GetOutput(Lines: TStrings);
var
  S: string;
  Status: Integer;
begin
  repeat
    OracleSession1.DBMS_Output.Get_Line(S, Status);
    if Status <> glSuccess then
      Break;
    Lines.Add(S);
  until False;
end;

procedure TDataModule2.HandleP(const DirName: string);
var
  Query: TOracleQuery;
  LoadId: double;
  ALog: TStrings;
  Key: String;
begin
  Key := 'E';
  ALog := TStringList.Create;
  try
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug(Format('Обработка запроса на списание по ДТ', []));

    OracleSession1.DBMS_Output.Enable();

    LoadId := sqlBeginLoad.Exec;
    try
      LoadAllDBF(DirName);
      Query := ParseLoad(LoadId, Key);
      try
        GetOutput(ALog);
        with TLogLogger.GetRootLogger do
          if IsInfoEnabled then
            Info(ALog.Text);
        //     DataSet := CreateDBFDataSet(DirName + '\otvet.dbf', Query);
        try
          LoadQuery(Query, dsOtvet);
        finally
          dsOtvet.Close;
          { set variable reference to nil if scope is not local or this variable is referenced later in this method. }
        end; // try/finally
      finally
        Query.Free;
      end;
      OracleSession1.Commit;
    except
      on E: Exception do
      begin
        ALog.Add(E.Message);
        OracleSession1.Rollback;
        raise;
      end;
    end; // try/except
  finally
    try
      ALog.SaveToFile(DirName + '\job.log');
    except
      on E: Exception do
        TLogLogger.GetRootLogger.Error('Ошибка формирования файла job.txt', E);
    end;
    ALog.Free;
  end;
end;

procedure TDataModule2.HandleE1(const DirName: string);
var
  Query: TOracleQuery;
  LoadId: double;
  ALog: TStrings;
  Key: String;
begin
  Key  := 'E1';
  ALog := TStringList.Create;
  try
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug(Format('Обработка запроса на списание сборов по ДТ', []));

    OracleSession1.DBMS_Output.Enable();

    LoadId := sqlBeginLoad.Exec;
    try
      LoadAllDBF(DirName);
      Query := ParseLoad(LoadId, Key);
      try
        GetOutput(ALog);
        with TLogLogger.GetRootLogger do
          if IsInfoEnabled then
            Info(ALog.Text);
        //     DataSet := CreateDBFDataSet(DirName + '\otvet.dbf', Query);
        try
          LoadQuery(Query, dsOtvet);
        finally
          dsOtvet.Close;
          { set variable reference to nil if scope is not local or this variable is referenced later in this method. }
        end; // try/finally
      finally
        Query.Free;
      end;
      OracleSession1.Commit;
    except
      on E: Exception do
      begin
        ALog.Add(E.Message);
        OracleSession1.Rollback;
        raise;
      end;
    end; // try/except
  finally
    try
      ALog.SaveToFile(DirName + '\job.log');
    except
      on E: Exception do
        TLogLogger.GetRootLogger.Error('Ошибка формирования файла job.txt', E);
    end;
    ALog.Free;
  end;
end;

procedure TDataModule2.HandleO(const DirName: string);
var
  Query: TOracleQuery;
  LoadId: double;
  ALog: TStrings;
  Key: String;
begin
  Key  := 'O';
  ALog := TStringList.Create;
  try
    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug(Format('Обработка запроса на начисление до оплаты по ДТ', []));

    OracleSession1.DBMS_Output.Enable();

    LoadId := sqlBeginLoad.Exec;
    try
      LoadAllDBF(DirName);
      Query := ParseLoad(LoadId, Key);
      try
        GetOutput(ALog);
        with TLogLogger.GetRootLogger do
          if IsInfoEnabled then
            Info(ALog.Text);
        //     DataSet := CreateDBFDataSet(DirName + '\otvet.dbf', Query);
        try
          LoadQuery(Query, dsOtvet);
        finally
          dsOtvet.Close;
          { set variable reference to nil if scope is not local or this variable is referenced later in this method. }
        end; // try/finally
      finally
        Query.Free;
      end;
      OracleSession1.Commit;
    except
      on E: Exception do
      begin
        ALog.Add(E.Message);
        OracleSession1.Rollback;
        raise;
      end;
    end; // try/except
  finally
    try
      ALog.SaveToFile(DirName + '\job.log');
    except
      on E: Exception do
        TLogLogger.GetRootLogger.Error('Ошибка формирования файла job.txt', E);
    end;
    ALog.Free;
  end;
end;


procedure TDataModule2.LoadAllDBF(const PathName: string);
var
  I: Integer;
  DbfList: TStringList;
  DirName: string;
begin
  DirName := IncludeTrailingPathDelimiter(PathName);
  DbfList := TStringList.Create;
  try
   if FParams.ReadBool('common', 'ForceLock', False) then
   begin
     FParams.ReadSectionValues('dcl', DbfList);
     ForceLockDbf(DirName, DbfList);
     FParams.ReadSectionValues('dk', DbfList);
     ForceLockDbf(DirName, DbfList);
   end;
   try
     FParams.ReadSectionValues('dcl', DbfList);
     for I := 0 to DbfList.Count - 1 do    // Iterate
     begin
       LoadDBF(DirName + DbfList.Names[I], DbfList.ValueFromIndex[I]);
     end;    // for
   except
     MakeFault('DCL');
     raise;
   end;
   try
     FParams.ReadSectionValues('dk', DbfList);
     for I := 0 to DbfList.Count - 1 do    // Iterate
     begin
       LoadDBF(DirName + DbfList.Names[I], DbfList.ValueFromIndex[I]);
     end;    // for
   except
     MakeFault('DK');
     raise;
   end;
  finally
    DbfList.Free;
  end;
end;

procedure SetDBFFieldDefs(Dbf: TVKDBFNTX; const DBFFieldDefs: string);
var
  Mem: TMemoryStream;
  Src: TStringStream;
  Reader: TReader;
begin
  Src :=
    TStringStream.Create(Format('inherited %s: TVKDBFNTX DBFFieldDefs = <%s>end',
    [Dbf.Name, DBFFieldDefs]));
  try
    Mem := TMemoryStream.Create;
    try
      ObjectTextToBinary(Src, Mem);
      Mem.Position := 0;
      Dbf.DBFFieldDefs.Clear;
      Reader := TReader.Create(Mem, 4096);
      try
        Reader.ReadSignature;
        Reader.BeginReferences;
        Reader.ReadComponent(Dbf);
        Reader.FixupReferences;
      finally
        Reader.Free;
      end;
    finally
      Mem.Free;
    end;
  finally
    Src.Free;
  end;
end;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
  DbfFields: TStrings;
begin
  FParams := TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));

   if (DataModule2 <> nil) and (DataModule2 <> self) then
   begin
     OracleSession1.LogonUsername := DataModule2.OracleSession1.LogonUsername;
     OracleSession1.LogonPassword := DataModule2.OracleSession1.LogonPassword;
     OracleSession1.LogonDatabase := DataModule2.OracleSession1.LogonDatabase;

     OracleSession1.Connected := True;
   end
   else
   begin
     OracleSession1.LogonUsername := FParams.ReadString('logon', 'username', '');
     OracleSession1.LogonPassword := FParams.ReadString('logon', 'password', '');
     OracleSession1.LogonDatabase := FParams.ReadString('logon', 'database', '');
     if FParams.ReadBool('logon', 'crypt', False) then
       OracleSession1.LogonPassword :=
         LogonDecrypt(OracleSession1.LogonPassword);

     if AnsiStartsText('crypt:', OracleSession1.LogonPassword) then
       OracleSession1.LogonPassword :=
         LogonDecrypt(Copy(OracleSession1.LogonPassword, Length('crypt:') + 1,
         MaxInt));

     if FindCmdLineSwitch('gui', ['-', '/'], True) then
     begin
       OracleLogon1.Execute;
       if not OracleSession1.Connected then
         Application.Terminate
       else
       begin
         OracleSession1.LogOff;
         FParams.WriteString('logon', 'username', OracleSession1.LogonUsername);
         FParams.WriteString('logon', 'database', OracleSession1.LogonDatabase);
         FParams.UpdateFile;
       end;
     end;
   end;
   DbfFields := TStringList.Create;
   try
     FParams.ReadSectionValues('otvet.dbf', DbfFields);
     SetDBFFieldDefs(dsOtvet, DBFFields.Text);
   finally
     DbfFields.Free;
   end; 
end;

procedure TDataModule2.HandleR(const DirName: string);
var
  DataSet : TDataSet;
  Query   : TOracleQuery;

  LoadId: double;
  DbfList: TStringList;

  Key : String;

  INN    : string;   // ИНН плательщика
  KPP    : string;   // КПП плательщика
  N_SV   : string;  // Номер свидетельства о включении в реестр таможенных представителей (только для представителей (брокеров))
  D_SV   : string;  // Дата свидетельства о включении в реестр таможенных представителей (только для представителей (брокеров))
  N_CNTR : string;  // Номер договора между представителем и декларантом (только для представителей (брокеров))
  D_CNTR : string;  // Дата договора между представителем и декларантом (только для представителей (брокеров))

  S   : string;

  function CallDB(const ALoadID: double): TOracleQuery;
  begin
    Result := TOracleQuery.Create(nil);
    try
      Result.Session := OracleSession1;
      qryR.SetVariable('pLoadID', ALoadID);
      qryR.SetComplexVariable('podata', Result);
      qryR.Execute;
      Result.Execute;
    except
      Result.Free;
      raise
    end; // try/finally
  end;

  function GetFormatDate( ADate : TDateTime ) : string;
    var
      vYear  : Word;
      vMonth : Word;
      vDay   : Word;
  begin
    DecodeDate( ADate, vYear, vMonth, vDay );

    Result := IntToStr( vYear ) + '.' + StringOfChar( '0', IfThen( vMonth < 10, 1, 0 ) ) + IntToStr( vMonth ) + '.' + StringOfChar( '0', IfThen( vDay < 10, 1, 0 ) ) + IntToStr( vDay );
  end;

begin
  Key  := 'R';
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Обработка запроса на платежные поручения', []));

  DataSet := OpenDBF(DirName + '\dk_pp.dbf');
  try
    while not DataSet.Eof do
    begin
      INN := DataSet.FieldByName('INN').AsString;
      KPP := DataSet.FieldByName('KPP').AsString;
      // только для представителя (брокера)
        // 17.03.2011
        // проверка наличия столбцов в таблице необходима только до внедрения АИСТ-М
        // т.к. ЛС будут внедряться раньше АИСТ-М, то необходимо уметь работать и со старым форматом
        // АИСТ-М рассылается 28.03.2011
      if     ( DataSet.FindField( 'N_SV' ) <> nil )
         and not DataSet.FieldByName('N_SV').IsNull then
        N_SV := DataSet.FieldByName('N_SV').AsString
      else
        N_SV := '-';
      if     ( DataSet.FindField( 'D_SV' ) <> nil )
         and not DataSet.FieldByName('D_SV').IsNull then
        D_SV := GetFormatDate( DataSet.FieldByName('D_SV').AsDateTime )
      else
        D_SV := '-';
      if     ( DataSet.FindField( 'N_CNTR' ) <> nil )
         and not DataSet.FieldByName('N_CNTR').IsNull then
        N_CNTR := DataSet.FieldByName('N_CNTR').AsString
      else
        N_CNTR := '-';
      if     ( DataSet.FindField( 'D_CNTR' ) <> nil )
         and not DataSet.FieldByName('D_CNTR').IsNull then
        D_CNTR := GetFormatDate( DataSet.FieldByName('D_CNTR').AsDateTime )
      else
        D_CNTR := '-';

      S := S + ';' + INN + '/' + KPP + '/' + N_SV + '/' + D_SV + '/' + N_CNTR + '/' + D_CNTR;
      DataSet.Next;
    end;
  finally
    DataSet.Free;
  end;


  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Запрос на платежные поручения для %s', [Copy(S, 2,
          MaxInt)]));

  DbfList := TStringList.Create;
  try
    // Загрузка DK_PP.DBF
    LoadId := sqlBeginLoad.Exec;

    FParams.ReadSectionValues('dk', DbfList);
    LoadDBF( DirName + '\dk_pp.dbf', DbfList.Values['Dk_pp.Dbf'] );

    // Обработка DK_PP
    Query := CallDB( LoadId );
    try
      // Выгрузка результата
      LoadQuery(Query, dsOtvet);
    finally
      Query.Free;
    end;
  finally
    OracleSession1.Rollback;
    DbfList.Free;
  end;
end;

procedure TDataModule2.HandleT(const DirName: string);
var
  DataSet : TDataSet;
  Query   : TOracleQuery;

  LoadId: double;
  DbfList: TStringList;

  Key : String;

  NTR    : string;  // Полный номер ТР

  S   : string;

  function CallDB(const ALoadID: double): TOracleQuery;
  begin
    Result := TOracleQuery.Create(nil);
    try
      Result.Session := OracleSession1;
      qryT.SetVariable('pLoadID', ALoadID);
      qryT.SetComplexVariable('podata', Result);
      qryT.Execute;
      Result.Execute;
    except
      Result.Free;
      raise
    end; // try/finally
  end;

begin
  Key  := 'T';
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Обработка запроса по ТР', []));

  DataSet := OpenDBF(DirName + '\dk_pp.dbf');
  try
    while not DataSet.Eof do
    begin
      NTR := DataSet.FieldByName('NTR').AsString;

      if S = '' then S := S + ';';
      S := S + NTR;
      DataSet.Next;
    end;
  finally
    DataSet.Free;
  end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Запрос по ТР для %s', [Copy(S, 2,
          MaxInt)]));

  DbfList := TStringList.Create;
  try
    // Загрузка DK_PP.DBF
    LoadId := sqlBeginLoad.Exec;

    FParams.ReadSectionValues('dk', DbfList);
    LoadDBF( DirName + '\dk_pp.dbf', DbfList.Values['Dk_pp.Dbf'] );

    // Обработка DK_PP
    Query := CallDB( LoadId );
    try
      // Выгрузка результата
      LoadQuery(Query, dsOtvet);
    finally
      Query.Free;
    end;
  finally
    OracleSession1.Rollback;
    DbfList.Free;
  end;
end;

procedure TDataModule2.HandleV(const DirName: string);
var
  DataSet: TDataSet;
  Query: TOracleQuery;
  S: string;
  NameGTD: string;
  Key: string;

  function CallDB(const GtdList: string): TOracleQuery;
  begin
    Result := TOracleQuery.Create(nil);
    try
      Result.Session := OracleSession1;
      qryV.SetVariable('PGTDLIST', GtdList);
      qryV.SetComplexVariable('podata', Result);
      qryV.Execute;
      Result.Execute;
    except
      Result.Free;
      raise
    end; // try/finally
  end;
begin
  Key  := 'V';
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Обработка запроса для ДТ', []));

  DataSet := OpenDBF(DirName + '\dclhead.dbf');
  try
    while not DataSet.Eof do
    begin
      NameGtd := DataSet.FieldByName('G071').AsString+'/'+
                 DataSet.FieldByName('G072').AsString+'/'+
                 DataSet.FieldByName('G073').AsString+'\'+
                 DataSet.FieldByName('GD1').AsString;
      S := S + ';' + NameGtd;
      DataSet.Next;
    end; // while
  finally
    DataSet.Free;
  end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Запрос на проставление даты выпуска для %s', [Copy(S, 2,
          MaxInt)]));

  Query := CallDB(S);
  try
    try
      LoadQuery(Query, dsOtvet);
    finally
      Query.Free;
    end;
    OracleSession1.Commit;
  except
    OracleSession1.Rollback;
    raise;
  end; // try/except
end;

procedure TDataModule2.HandleS(const DirName: string);
var
  DataSet: TDataSet;
  Query: TOracleQuery;
  S: string;
  NameGTD: string;
  Key: string;

  function CallDB(const GtdList: string): TOracleQuery;
  begin
    Result := TOracleQuery.Create(nil);
    try
      Result.Session := OracleSession1;
      qryS.SetVariable('PGTDLIST', GtdList);
      qryS.SetComplexVariable('podata', Result);
      qryS.Execute;
      Result.Execute;
    except
      Result.Free;
      raise
    end; // try/finally
  end;
begin
  Key  := 'S';
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Обработка запроса для ДТ', []));

  DataSet := OpenDBF(DirName + '\dclhead.dbf');
  try
    while not DataSet.Eof do
    begin
      NameGtd := DataSet.FieldByName('G071').AsString+'/'+
                 DataSet.FieldByName('G072').AsString+'/'+
                 DataSet.FieldByName('G073').AsString+'\'+
                 DataSet.FieldByName('GD0').AsString;
      S := S + ';' + NameGtd;
      DataSet.Next;
    end; // while
  finally
    DataSet.Free;
  end;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Запрос на проставление даты выпуска для %s', [Copy(S, 2,
          MaxInt)]));

  Query := CallDB(S);
  try
    try
      LoadQuery(Query, dsOtvet);
    finally
      Query.Free;
    end;
    OracleSession1.Commit;
  except
    OracleSession1.Rollback;
    raise;
  end; // try/except
end;

procedure TDataModule2.OracleSession1BeforeLogOn(Sender: TOracleSession);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Попытка подключения к БД: %s@%s', [Sender.LogonUsername,
        Sender.LogonDatabase]));
end;

procedure TDataModule2.OracleSession1Change(Sender: TOracleSession);
begin
  if Sender.Connected then
    TLogLogger.GetRootLogger.Debug('Подключение к БД выполнилось успешно')
  else
    TLogLogger.GetRootLogger.Debug('Отключение от БД');
end;

function TDataModule2.HandleCreateException: Boolean;
begin
  Result := False;
end;

procedure TDataModule2.dsOtvetAfterClose(DataSet: TDataSet);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Закрытие файла: %s', [dsOtvet.DBFFileName]));
end;

procedure TDataModule2.dsOtvetBeforeOpen(DataSet: TDataSet);
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Открытие файла: %s', [dsOtvet.DBFFileName]));
end;

procedure TDataModule2.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil(FParams);
   FreeAndNil(FLockedFiles);
end;

procedure TDataModule2.ForceLockDbf(const FilePath: string; Files: TStrings);
var
  I: integer;
begin
  if FLockedFiles = nil then
    FLockedFiles := TObjectList.Create(True);

  for I := 0 to Files.Count - 1 do
  begin
    with TLogLogger.GetRootLogger do
        if IsDebugEnabled then
            Debug(Format('Блокировка файла: %s', [FilePath + Files.Names[I]]));
       FLockedFiles.Add(TFileStream.Create(FilePath + Files.Names[I], fmOpenRead + fmShareDenyWrite));
  end;
end;

end.

