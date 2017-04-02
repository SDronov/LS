unit Unit2;

interface

uses
  SysUtils, Classes, Oracle, QueryList, FDCCustomDataset, fdcQuery, DB,
  OracleData, VKDBFDataSet, uOptions, Forms, Unit3;

const

  cTPOFilePref  = 'F';
  cTRFilePref   = 'R';
  cTPOIndex = 1;
  cTRIndex  = 2;

  dfOtvetSize = 16;

  cTPO          = 'ТПО';
  cTR           = 'ТР';

  cTPODBF       = 'ftpo.dbf';
  cTRDBF        = 'rtpo.dbf';

  vDocs   : array[-1..2] of string = ( cTPO, cTPO, cTPO, cTR );
  vFilesTPODBF : array[-1..2] of string = ( cTPODBF, cTPODBF, cTPODBF, cTRDBF );


    TRFiles : array[0..10] of string = (
    'tpo.dbf'
    ,'tpo_doc.dbf'	//
    ,'tpo_itp.dbf'
    ,'pltperio.dbf'
    ,'tpo_dop.dbf'	//
    ,'goods.dbf'
    ,'tpo_aud.dbf'
    ,'fizlic.dbf'
    ,'okpo.dbf'
    ,'tpo_tdop.dbf'
    ,'tpo_plt.dbf'
  );


    TPOFilesEx : array[0..10] of string = (
     'ftpo.dbf'
    ,'ftpo_doc.dbf'	//
    ,'ftpo_itp.dbf'
    ,'fpltperi.dbf'
    ,'ftpo_dop.dbf'	//
    ,'fgoods.dbf'
    ,'ftpo_aud.dbf'
    ,'ffizlic.dbf'
    ,'fokpo.dbf'
    ,'ftpo_tdo.dbf'
    ,'ftpo_plt.dbf'
  );

    TRFilesEx : array[0..10] of string = (
     'rtpo.dbf'
    ,'rtpo_doc.dbf'	//
    ,'rtpo_itp.dbf'
    ,'rpltperi.dbf'
    ,'rtpo_dop.dbf'	//
    ,'rgoods.dbf'
    ,'rtpo_aud.dbf'
    ,'rfizlic.dbf'
    ,'rokpo.dbf'
    ,'rtpo_tdo.dbf'
    ,'rtpo_plt.dbf'
  );


    TPOFiles : array[0..10] of string = (
    'tpo.dbf'
    ,'tpo_doc.dbf'	//
    ,'tpo_itp.dbf'
    ,'pltperio.dbf'
    ,'tpo_dop.dbf'	//
    ,'goods.dbf'
    ,'tpo_aud.dbf'
    ,'fizlic.dbf'
    ,'okpo.dbf'
    ,'tpo_tdop.dbf'
    ,'tpo_plt.dbf'
  );

    errOk       = 0;
  errNoFiles  = 98;
  errOthers   = 99;

type
  TOtvetERec = record
    Tpo       : string;
    IsLoaded  : integer;
    ErrorCode : integer;
    ErrorText : string;
  end;  

type

   TLoadInfo =  record
    Total:  integer;
    Done :  integer;
    ErrorCount: integer;
    NewCount:  integer;
    ModifyCount: integer;
    SkipCount: integer;
  end;

  PLoadInfo = ^TLoadInfo;

  type
   TUniImporter = class(TObject)
  private
    FTotal: integer;
    FSkipped: integer;
    FErrorCount: integer;
    Session: TOracleSession;
  public
    property SetSession: TOracleSession read Session write Session;
    property Total: integer read FTotal write FTotal;
    property Skipped: integer read FSkipped write FSkipped;
    property ErrorCount: integer read FErrorCount write FErrorCount;
    procedure LoadFile(const DefName, FileName: string);
    procedure LoadStream(const DefName: string; Stream: TStream);
  end;

  TDataModule2 = class(TDataModule)
    Session: TOracleSession;
    dsPO: TOracleDataSet;
    dsPOID: TFloatField;
    dsPOREST_SUMMA: TFloatField;
    dsPOLOCKED_SUMMA: TFloatField;
    dsPOSUMMA: TFloatField;
    dsPOCURR_CODE: TStringField;
    dsPOPAYER_INN: TStringField;
    dsPOPAYER_KPP: TStringField;
    dsPODOC_NO: TStringField;
    dsPODOC_DATE: TDateTimeField;
    dsPOSTATE_SYSNAME: TStringField;
    dsPODOC_SUMMA: TFloatField;
    dsPOKBK: TStringField;
    dsPOTYPESYSNAME: TStringField;
    dsPOADVANCE: TStringField;
    dsTPO_PLT: TVKDBFNTX;
    dsTPO_PLTNUM_TPO: TStringField;
    dsTPO_PLTSP: TStringField;
    dsTPO_PLTINN: TStringField;
    dsTPO_PLTKPP: TStringField;
    dsTPO_PLTNUM_DOC: TStringField;
    dsTPO_PLTDATE_DOC: TDateField;
    dsTPO_PLTSUMMA: TFloatField;
    dsTPO_PLTKODVAL: TStringField;
    dsTPO_PLTSUM_TPO: TFloatField;
    dsTPO_PLTVIDNAC: TStringField;
    dsTPO_PLTSCHR: TStringField;
    dsTPO_PLTBIC: TStringField;
    srcTPO_PLT: TDataSource;
    dsNewDecl: TfdcQuery;
    QueryList: TQueryList;
    sqlLoadDecl: TsqlOp;
    sqlBeginLoad: TsqlOp;
    sqlEndLoad: TsqlOp;
    sqlGetErrors: TsqlOp;
    sqlGetDBFErrors: TsqlOp;
    sqlGetDBFErrorCount: TsqlOp;
    sqlSetMethod: TsqlOp;
    sqlGetSubject: TsqlOp;
    sqlAlterSession: TsqlOp;
    QueryListTR: TQueryList;
    sqlLoadDeclTR: TsqlOp;
    QueryListTPO: TQueryList;
    sqlLoadDeclTPO: TsqlOp;
    dsOtvetErrors: TOracleDataSet;
    qryR: TOracleQuery;
    qryLoadFile: TOracleQuery;
    OracleLogon1: TOracleLogon;
    dsOtvet: TVKDBFNTX;
    dsOtvetE: TVKDBFNTX;
    dsOtvetETPO_NUMBER: TStringField;
    dsOtvetEISLOADED: TIntegerField;
    dsOtvetEERRORCODE: TLargeintField;
    dsOtvetEERRORTEXT1: TStringField;
    dsOtvetEERRORTEXT2: TStringField;
    dsOtvetEERRORTEXT3: TStringField;
    dsOtvetEERRORTEXT4: TStringField;
    dsTpo: TVKDBFNTX;
    sqlClearBuffer: TsqlOp;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    UniImporter: TUniImporter;
    procedure HandleR(const DirName: string);
    procedure HandleE(const DirName: string);
    procedure MakeFault(const Cause: string = 'LS');
    function GetDocIndex(const DirName: string): integer;
  public
    Options      : TOptions;
    procedure Handle(const QueueInfo: TQueueInfo);
  end;

var
  DataModule2: TDataModule2;

implementation

 uses  Log4D, Utils, IniFiles;

{$R *.dfm}

function LoadDbfStream(Stream: TStream; const TableName,
  ColMap: string; LoadInfo: PLoadInfo; Session: TOracleSession): integer;
var
  LOB: TLOBLocator;
begin
  LOB := TLOBLocator.CreateTemporary(Session, otBLOB, True);
  try
    LOB.CopyFrom(Stream, Stream.Size - Stream.Position);
    Lob.Trim;
    DataModule2.qryLoadFile.Session := Session;
    DataModule2.qryLoadFile.SetComplexVariable('file', LOB);
    DataModule2.qryLoadFile.SetVariable('TableName', TableName);
    DataModule2.qryLoadFile.SetVariable('ColMap', ColMap);
    DataModule2.qryLoadFile.Execute;
    Result := DataModule2.qryLoadFile.GetVariable('result');
    if (LoadInfo <> nil) then
    begin
      LoadInfo.Total := DataModule2.qryLoadFile.GetVariable('v1');
      LoadInfo.Done := DataModule2.qryLoadFile.GetVariable('v2');
      LoadInfo.ErrorCount := DataModule2.qryLoadFile.GetVariable('v3');
      LoadInfo.NewCount := DataModule2.qryLoadFile.GetVariable('v4');
      LoadInfo.ModifyCount := DataModule2.qryLoadFile.GetVariable('v5');
      LoadInfo.SkipCount := DataModule2.qryLoadFile.GetVariable('v6');
    end;
  finally
    LOB.Free;
  end;
end;

function LoadDbf(const FileName, TableName, ColMap: string; LoadInfo: PLoadInfo; Session: TOracleSession): integer;
var
  F: TFileStream;
begin
  F := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    Result := LoadDbfStream(F, TableName, ColMap, LoadInfo, Session);
  finally
    F.Free;
  end;
end;


procedure TUniImporter.LoadStream(const DefName: string; Stream: TStream);
var
  IniFile: TIniFile;
  TableName: String;
  ColMap: String;
  LoadInfo: TLoadInfo;
begin
  IniFile := TIniFile.Create(GetAppDir + cImportMapFileName);
  try
    TableName := IniFile.ReadString(DefName, 'tablename', '');
    Assert(TableName <> '', Format('Не задано имя целевой таблицы для %s', [DefName]));
    ColMap := IniFile.ReadString(DefName, 'fields', '');
    LoadDbfStream(Stream, TableName, ColMap, @LoadInfo, Session);
    FTotal := LoadInfo.Done;
    FSkipped := LoadInfo.SkipCount;
    FErrorCount := LoadInfo.ErrorCount;
  finally
    IniFile.Free;
  end;
end;

procedure TUniImporter.LoadFile(const DefName, FileName: string);
var
  IniFile: TIniFile;
  TableName: String;
  ColMap: String;
  LoadInfo: TLoadInfo;
begin
  IniFile := TIniFile.Create(GetAppDir + cImportMapFileName);
  try
    TableName := IniFile.ReadString(DefName, 'tablename', '');
    Assert(TableName <> '', Format('Не задано имя целевой таблицы для %s', [DefName]));
    ColMap := IniFile.ReadString(DefName, 'fields', '');
    LoadDbf(FileName, TableName, ColMap, @LoadInfo, Session);
    FTotal := LoadInfo.Done;
    FSkipped := LoadInfo.SkipCount;
    FErrorCount := LoadInfo.ErrorCount;
  finally
    IniFile.Free;
  end;
end;


function TDataModule2.GetDocIndex(const DirName: string): integer;
begin
  if FileExists(DirName + '\'+ cTPOFilePref + '*.dbf') then
    Result := cTPOIndex
  else
    if FileExists(DirName + '\'+cTRFilePref + '*.dbf') then
      Result := cTRIndex
    else
      if FileExists(DirName + '*.dbf') then
        Result := 0
      else
        Result := -1;
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
begin
    Options := TOptions.Create;
    Options.Load;
    
    if (DataModule2 <> nil) and (DataModule2 <> self) then
   begin
     Session.LogonUsername := DataModule2.Session.LogonUsername;
     Session.LogonPassword := DataModule2.Session.LogonPassword;
     Session.LogonDatabase := DataModule2.Session.LogonDatabase;

     Session.Connected := True;
   end
   else
   begin
     Session.LogonUsername := Options.UserName;
     Session.LogonPassword := Options.Password;
     Session.LogonDatabase := Options.DataBase;

     if FindCmdLineSwitch('gui', ['-', '/'], True) then
     begin
       OracleLogon1.Execute;
       if not Session.Connected then
         Application.Terminate
       else
       begin
         Session.LogOff;
       end;
     end;
   end;

  if    Session.Connected
    and (Options.SchemaName <> '') then
    sqlAlterSession.Exec( 'schema_name', [Options.SchemaName] );

  SetDBFFieldDefs(dsOtvet, Options.DBFFields.Text);

  UniImporter := TUniImporter.Create;
  UniImporter.Session:= self.Session;
end;

procedure TDataModule2.DataModuleDestroy(Sender: TObject);
begin
  freeandnil(Options);
  freeandnil(UniImporter);
end;


procedure TDataModule2.Handle(const QueueInfo: TQueueInfo);
begin
  dsOtvet.DBFFileName := QueueInfo.Path + '\otvet.dbf';


     //with TLogLogger.GetRootLogger do
      //if IsDebugEnabled then
    //TLogLogger.GetRootLogger.Info(Format('!!!!!Найден файл dsOtvet!!!!!: %s', [dsOtvet.DBFFileName]));

    //with TLogLogger.GetRootLogger do
      //if IsDebugEnabled then
  if  not FileExists(QueueInfo.Path + '\otvet.dbf') then
  begin

    TLogLogger.GetRootLogger.Info(Format('Попытка создания файла: %s', [dsOtvet.DBFFileName]));

    dsOtvet.CreateTable;

    //    with TLogLogger.GetRootLogger do
    //  if IsDebugEnabled then
    TLogLogger.GetRootLogger.Info(Format('Создан файл: %s', [dsOtvet.DBFFileName]));

    dsOtvet.Open;
  end;


  try
    try
      if QueueInfo.Queue  = btSpisQueueE then
        HandleE(QueueInfo.Path)
      else if QueueInfo.Queue  =  btReadQueueR then
        HandleR(QueueInfo.Path)
      else
        MakeFault;
    except
        MakeFault;
    raise;
    end;
  finally
      dsOtvet.Close;
  end;
end;

procedure TDataModule2.MakeFault(const Cause: string = 'LS');
begin
  dsOtvet.Truncate;
  dsOtvet.AppendRecord(['', 'F', '', '', Cause]);
end;

procedure LoadQuery(Query: TOracleQuery; DataSet: TDataSet);
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
    end;
    DataSet.Post;
    Query.Next;
  end; 
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Формирование файла otvet.dbf закончено, файл содержит %d записей', [DataSet.RecordCount]));
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


procedure TDataModule2.HandleR(const DirName: string);
var
  DataSet: TDataSet;
  Query: TOracleQuery;
  S: string;
  INN: string;
  KPP: string;
  NUM: string;
  function CallDB(const SubjList: string): TOracleQuery;
  begin
    Result := TOracleQuery.Create(nil);
    try
      Result.Session := Session;
      qryR.SetVariable('PSUBJLIST', SubjList);
      qryR.SetComplexVariable('podata', Result);
      qryR.Execute;
      Result.Execute;
    except
      Result.Free;
      raise
    end;
  end;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Обработка запроса на платежные поручения', []));

  DataSet := OpenDBF(DirName + '\tpo_plt.dbf');
  try
    while not DataSet.Eof do
    begin
      if  DataSet.FieldByName('NUM_TPO').AsString <> '' THEN
        begin
          NUM :=  DataSet.FieldByName('NUM_TPO').AsString;
          S := S + ';' + NUM;
        end
      else
        begin
          INN := DataSet.FieldByName('INN').AsString;
          KPP := DataSet.FieldByName('KPP').AsString;
          S := S + ';' + INN + '/' + KPP;
        end;
      DataSet.Next;
    end;
  finally
    DataSet.Free;
  end;


  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug(Format('Запрос на платежные поручения для %s', [Copy(S, 2,
          MaxInt)]));

  Query := CallDB(S);
  try
    try
      LoadQuery(Query, dsOtvet);
    finally
      Query.Free;
    end;
    Session.Commit;
  except
    Session.Rollback;
    raise;
  end; 
end;

procedure DeepCopyArray(var ArrDest: array of string; const ArrSource: array of string);
var
  i,j : integer;
begin
  j:= Low(ArrDest) - Low(ArrSource);
  if j+High(ArrDest) > High(ArrSource) then
    for i := Low(ArrSource) to High(ArrSource) do
      ArrDest[j+i]:= ArrSource[i]
  else
    for i := Low(ArrSource) to High(ArrDest)-j do
      ArrDest[j+i]:= ArrSource[i];
end;

function CheckFiles(const DirName: string; const FileNames: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(FileNames) to High(FileNames) do
  begin
    if not FileExists(DirName + '\' + FileNames[I]) then
      Result := Result + ',' + FileNames[I];
  end;
  Result := Copy(Result, 2, MaxInt);
end;


procedure TDataModule2.HandleE(const DirName: string);
var
  DocIndex:integer;
  Files   : array[0..10] of string;
  FilesEx : array[0..10] of string;
  MissingFiles  : String;
  WorkIntFF     : boolean;  // TRUE - Internal FileFormat; FALSE - external FileFormat
  OtvetSize     : integer;
  OtvetCnt      : integer;
  OtvetRecs     : array of TOtvetERec;
  vDoc    : string;
  TotalDecl     : integer;
  LoadSessionId : double;
  i, j: integer;
  HasDuple      : boolean;
  ErrorCount    : Integer;
  vFileTPODBF  : string;
  FSkipTpo      : boolean;
  IsLoaded      : integer;
  Query         : TOracleQuery;
  ALog: TStrings;
  NumTpo: String;

  procedure LoadDBF(const DBFName: String; const DirName: string);
  begin
    UniImporter.LoadFile(DBFName, Format('%s\%s', [DirName, DBFName]))
  end;

  procedure AddOtvet(aTpo: string; aErrorCode: integer; aErrorText: string; aIsLoaded: integer);
  begin
    if not (aIsLoaded in [0,1]) then
      raise exception.Create('IsLoaded must be 0 or 1');
    if (OtvetSize = OtvetCnt) then
    begin
      OtvetSize := OtvetSize + dfOtvetSize;
      SetLength(OtvetRecs, OtvetSize);
    end;
    OtvetRecs[OtvetCnt].Tpo := aTpo;
    OtvetRecs[OtvetCnt].ErrorCode := aErrorCode;
    OtvetRecs[OtvetCnt].ErrorText := aErrorText;
    OtvetRecs[OtvetCnt].IsLoaded := aIsLoaded;
    Inc(OtvetCnt);
  end;

  procedure FlushOtvet(const DirName: string);
  var
    i    : integer;
    Text : string;
  begin
    if (OtvetCnt = 0) then
      AddOtvet('', errOthers, '', 0);


    dsOtvetE.DBFFileName := DirName + '\otvetE.dbf';

    //if FileExists(DirName + '\otvetE.dbf') then
      //TLogLogger.GetRootLogger.Info(Format('!!!!!Найден файл otvetE.dbf!!!!!: %s', [dsOtvetE.DBFFileName]));

    TLogLogger.GetRootLogger.Info(Format('Попытка создания файла: %s', [dsOtvetE.DBFFileName]));

    dsOtvetE.CreateTable;

    TLogLogger.GetRootLogger.Info(Format('Создан файл: %s', [dsOtvetE.DBFFileName]));

    dsOtvetE.Open;
    for i := 0 to OtvetCnt-1 do
    begin
      dsOtvetE.Append;
      //dsOtvetETpo_Number.Value := AnsiToAsciiEx(OtvetRecs[i].Tpo);
      dsOtvetETpo_Number.Value:=OtvetRecs[i].Tpo;
      dsOtvetEErrorCode.Value := OtvetRecs[i].ErrorCode;
      dsOtvetEIsLoaded.Value := OtvetRecs[i].IsLoaded;
      //Text := AnsiToAsciiEx(Otvetrecs[i].ErrorText);
      Text := Otvetrecs[i].ErrorText;
      dsOtvetEErrorText1.Value := Copy(Text, 001, 250);
      dsOtvetEErrorText2.Value := Copy(Text, 251, 250);
      dsOtvetEErrorText3.Value := Copy(Text, 501, 250);
      dsOtvetEErrorText4.Value := Copy(Text, 751, 250);
      dsOtvetE.Post;
    end;
    dsOtvetE.Close;
    OtvetCnt := 0;
  end;

begin

  NumTpo:='';

  DocIndex := GetDocIndex(DirName);
  vDoc := vDocs[DocIndex];

    // --- выбор ТПО или ТР файлов
  if DocIndex = 2 then begin
    DeepCopyArray(Files, TrFiles);
    DeepCopyArray(FilesEx, TrFilesEx);
  end else begin
    DeepCopyArray(Files, TpoFiles);
    DeepCopyArray(FilesEx, TpoFilesEx);
  end;

    // --- выбор формата файла
  Case Options.FileFormat of
    ffAuto :
     begin
        MissingFiles :=  CheckFiles(DirName, Files);
        WorkIntFF := True;
        vFileTPODBF:= Files[0];
        if (MissingFiles <> '') then
        begin
          MissingFiles := CheckFiles(DirName, FilesEx);
          WorkIntFF := False;
          vFileTPODBF:= FilesEx[0];
        end;
      end;
    ffInt :
      begin
        WorkIntFF := True;
        MissingFiles := CheckFiles(DirName, Files);
        vFileTPODBF:= Files[0];
      end;
    ffExt :
      begin
        WorkIntFF := False;
        MissingFiles := CheckFiles(DirName, FilesEx);
        vFileTPODBF:= FilesEx[0];
      end;
  else
    WorkIntFF := True;
    MissingFiles := CheckFiles(DirName, Files);
    vFileTPODBF:= Files[0];
  end;

  if (MissingFiles <> '') then
  begin
    TLogLogger.GetRootLogger.Error(Format('Пропущены файлы %s '#13#10' В каталоге %s нет файлов %s', [vDoc, DirName, MissingFiles]));
    AddOtvet('', errNoFiles, MissingFiles, 0);
    FlushOtvet(DirName);
    raise exception.Create(MissingFiles);
  end;

  if DocIndex = 2 then
    sqlLoadDecl.SQL.Text:= sqlLoadDeclTR.SQL.Text
  else
    sqlLoadDecl.SQL.Text:= sqlLoadDeclTPO.SQL.Text;

  if WorkIntFF then
    TLogLogger.GetRootLogger.Info(Format('Внутренний формат файлов %s', [vDoc]))
  else
    TLogLogger.GetRootLogger.Info(Format('Внешний формат файлов %s', [vDoc]));

  ALog := TStringList.Create;  

   try
    TotalDecl := 0;
    LoadSessionId := sqlBeginLoad.Exec;
    TLogLogger.GetRootLogger.Info(Format('Загрузка БД %s', [vDoc]));

    for I := Low(Files) to High(Files) do
    begin

      try

      if WorkIntFF then
        LoadDBF(Files[I], DirName)
      else
        LoadDBF(FilesEx[I], DirName);

      except
        on e: exception do
          begin

            try
              dsTpo.DBFFileName := DirName +'\' + vFileTPODBF;
              dsTpo.Open;
              NumTpo := dsTpo.FieldByName('Tpo_Number').AsString;
            finally
              dsTpo.Close;
            end;

            if NumTpo <> '' then
               sqlClearBuffer.Exec('tpo_number', NumTpo);

            AddOtvet(NumTpo, errOthers, e.Message, 0);
            raise;
          end;
      end;

      if I = 0 then
      begin
        TotalDecl := UniImporter.Total - UniImporter.Skipped;
        HasDuple := (UniImporter.FSkipped > 0);
      end;

      TLogLogger.GetRootLogger.Info(Format('  Файл %s: всего строк %d, дубли %d, с ошибками %d', [IfElse(WorkIntFF, Files[i], FilesEx[i]),UniImporter.Total, UniImporter.Skipped, UniImporter.ErrorCount] ));
      ErrorCount := sqlGetDBFErrorCount.Exec;

      for j := 1 to ErrorCount do
        TLogLogger.GetRootLogger.Error('    ' + sqlGetDBFErrors.Exec('nError', j));
    end;

    TLogLogger.GetRootLogger.Info(Format('Обработка загруженных %s', [vDoc]));

    sqlSetMethod.Exec;

    dsNewDecl.ParamByName('LOAD_ID').Value := LoadSessionId;
    dsNewDecl.Open;

    try
      try
        if dsNewDecl.Eof and HasDuple then
        begin
          dsTpo.DBFFileName := DirName +'\' + vFileTPODBF;
          dsTpo.Open;
          while not dsTpo.Eof do
          begin
            FSkipTpo := False;
            for i := 0 to OtvetCnt -1 do
              if OtvetRecs[i].Tpo = dsTpo.FieldByName('Tpo_Number').AsString then
                FSkipTpo := True;
                if not FSkipTpo then
                begin
                  AddOtvet(dsTpo.FieldByName('Tpo_Number').AsString, 95, Format('%s уже загружена',[vDoc]), 0);
                  TLogLogger.GetRootLogger.Info(Format('%s %s уже загружена', [vDoc, AsciiToAnsiEx(dsTpo.FieldByName('Tpo_Number').AsString)]));
                  ALog.Add(Format('%s %s уже загружена', [vDoc, AsciiToAnsiEx(dsTpo.FieldByName('Tpo_Number').AsString)]));
                end;
                dsTpo.Next;
               end;
               dsTpo.Close;
            end;

           while not dsNewDecl.eof do
           begin
             TLogLogger.GetRootLogger.Info(Format('%s %s, (%d из %d):', [vDoc, dsNewDecl.FieldValues['tpo_name'], dsNewDecl.RecNo, TotalDecl]));
             sqlLoadDecl.Exec;
             if (sqlLoadDecl['ErrText'] <> '') then
               Dec(TotalDecl);
             try
               dsOtvetErrors.Open;
               try
                 dsOtvetErrors.First;
                 while not dsOtvetErrors.Eof do
                 begin
                   AddOtvet(dsOtvetErrors.FieldByName('Tpo_Number').AsString
                           ,dsOtvetErrors.FieldByName('ErrorCode').AsInteger
                           ,dsOtvetErrors.FieldByName('ErrorText').AsString
                           ,dsOtvetErrors.FieldByName('IsLoaded').AsInteger);
                   ALog.Add(dsOtvetErrors.FieldByName('ErrorText').AsString);
                   dsOtvetErrors.Next;
                 end;
               finally
                 dsOtvetErrors.Close;
               end;
             except on e: exception do begin
               dsOtvetErrors.Close;
               if (sqlLoadDecl['ErrText'] = '') then
                 IsLoaded := 1
               else
                 IsLoaded := 0;
               AddOtvet(dsNewDecl.FieldValues['tpo_name'], 96, Format('Не удалось получить результат загрузки %s: %s', [vDoc,e.message]), IsLoaded);
             end;
           end;

           if (sqlLoadDecl['ErrText'] <> '') then
           begin
             TLogLogger.GetRootLogger.Error(Format(' Ошибка загрузки %s %s: %s', [vDoc, dsNewDecl.FieldValues['tpo_name'], sqlLoadDecl['ErrText']]));
             ALog.Add(Format(' Ошибка загрузки %s %s: %s', [vDoc, dsNewDecl.FieldValues['tpo_name'], sqlLoadDecl['ErrText']]));
           end
           else
           begin
             Query := sqlGetErrors.Query('ID', sqlLoadDecl['result']);
             if not Query.Eof then
             begin
               TLogLogger.GetRootLogger.Info('Ошибки:');
               while not Query.Eof do begin
                 TLogLogger.GetRootLogger.Info('  ' + Query.FieldAsString('name'));
                 Query.Next;
               end;
             end;
           end;
             dsNewDecl.Next;
           end;
           TLogLogger.GetRootLogger.Info(Format('Импортировано: %d', [TotalDecl]));
           ALog.Add(Format('Импортировано: %d', [TotalDecl]));
      finally
        dsNewDecl.Close;
      end;

      sqlEndLoad.Exec('ploadlog', LoadSessionId);

      QueryList.Session.Commit;

    except on e: exception do begin
      QueryList.Session.Rollback;
      TLogLogger.GetRootLogger.Error(Format('Ошибка загрузки %s файлов: %s', [vDoc,e.Message]));
      ALog.Add(Format('Ошибка загрузки %s файлов: %s', [vDoc,e.Message]));
      AddOtvet('', errOthers, e.Message, 0);
    end; end;

  finally
    FlushOtvet(DirName);
    try
      ALog.SaveToFile(DirName + '\job.log');
    except
      on E: Exception do
        TLogLogger.GetRootLogger.Error('Ошибка формирования файла' +DirName+ '\job.log', E);
    end;
    ALog.Free;
  end;
end;

end.
