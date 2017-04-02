unit Unit4;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, armtisvr_TLB, StdVcl, Provider, Oracle, DB, OracleData,
  dxmdaset, QueryList, IniFiles, Forms, DateUtils;

type
  TRemDM = class(TRemoteDataModule, IRemDM)
    DataSetProvider: TDataSetProvider;
    OraDataSet: TOracleDataSet;
    mdOtvet: TdxMemData;
    mdOtvetG_NDOK: TStringField;
    mdOtvetKEY: TStringField;
    mdOtvetKODVAL: TStringField;
    mdOtvetP_NDOK: TStringField;
    mdOtvetN_NDOK: TStringField;
    mdOtvetN_DDOK: TDateTimeField;
    mdOtvetSUMMA: TFloatField;
    mdOtvetSUMMA1: TFloatField;
    mdOtvetID_NDOK: TStringField;
    mdOtvetKEY_OWNER: TStringField;
    mdOtvetN_POST: TStringField;
    mdOtvetKINDVP: TStringField;
    mdOtvetKEY_EX: TStringField;
    OracleSession: TOracleSession;
    OracleQuery1: TOracleQuery;
    QueryList1: TQueryList;
    sqlInsert: TsqlOp;
    sqlBeginLoad: TsqlOp;
    sqlDelRowCharge: TsqlOp;
    qryR: TOracleQuery;
    qryV: TOracleQuery;
    mdOtvetKBK: TStringField;
    mdOtvetADVANCE: TStringField;
    qryS: TOracleQuery;
    mdOtvetNTR: TStringField;
    qryT: TOracleQuery;
    mdOtvetSTATUS: TStringField;
    mdOtvetPROCESS_ID: TStringField;
    mdOtvetV_REASON: TStringField;
    mdOtvetV_DOC_NUM: TStringField;
    mdOtvetV_DOC_DATE: TDateTimeField;
    mdDK_PP: TdxMemData;
    mdDK_PPG071: TStringField;
    mdDK_PPG072: TDateTimeField;
    mdDK_PPG073: TStringField;
    mdDK_PPOKPO: TStringField;
    mdDK_PPINN: TStringField;
    mdDK_PPKPP: TStringField;
    mdDK_PPK92: TStringField;
    mdDK_PPK93: TDateTimeField;
    mdDK_PPK94: TFloatField;
    mdDK_PPK95: TFloatField;
    mdDK_PPK96: TDateField;
    mdDK_PPK_VAL: TStringField;
    mdDK_PPPRIZ: TStringField;
    mdDK_PPWHO: TStringField;
    mdDK_PPSP: TStringField;
    mdDK_PPCRYPT: TStringField;
    mdDK_PPCODE: TStringField;
    mdDK_PPBANK_ID: TStringField;
    mdDK_PPVP: TStringField;
    mdDK_PPIRET: TIntegerField;
    mdDK_PPNBLKTC1: TStringField;
    mdDK_PPTSP: TStringField;
    mdDK_PPDSP: TDateTimeField;
    mdDK_PPN_SV: TStringField;
    mdDK_PPD_SV: TDateTimeField;
    mdDK_PPN_CNTR: TStringField;
    mdDK_PPD_CNTR: TDateTimeField;
    DataSetProviderDK: TDataSetProvider;
    qryDK: TOracleQuery;
    sqlNeedDK: TsqlOp;
    mdDK_PPNTR: TStringField;
    mdDK_PPPROCESS_ID: TStringField;
    mdDK_PPLNPINSP: TStringField;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    gv_G_NDOC       : String;
    FParams         : TMemIniFile;
    ELSInnList      : TStringList;
    TypeQuery       : String[2];
    LoadId          : Real;
    fConnectionName : string;
    fHSem           : THandle;
    fActive         : Boolean;
    fErrCode        : Integer;
    fErrMsg         : string;
    fIsResulst      : boolean;  
    DateFormat      : TFormatSettings;
    procedure GetOutput(Lines: String);
    procedure DoLogInfoR(Str : String);
    procedure DoLogInfoT(Str : String);
    procedure InsertToOracle;
    procedure SetActive(const Value: Boolean);
    function checkELS(inn: String; date: TDateTime) :boolean;
    function Insert(DsName :String;TableName :String) :Integer;
    function GetKey: string;
    function GenInsertForDataSet(DataSet: TDataSet; const TableName, ColMap: string):string;
    procedure Enqueue;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Query_T; safecall;
    procedure Query_E; safecall;
    procedure Query_E1; safecall;
    procedure Query_O; safecall;
    procedure Query_R; safecall;
    procedure Query_V; safecall;
    procedure Query_S; safecall;
    procedure QueryCommit; safecall;
    procedure QueryRollback; safecall;
    procedure ReadDataSet(const NameDataSet: WideString); safecall;
    procedure SendFields(const NameDataSet: WideString; Size: Integer;
      Data: OleVariant); safecall;
    procedure CreateOtvet(pKey :String;pKeyEx:String;pMessage :String);
    procedure SetInfo(const Host, IP: WideString; Port: Integer); safecall;
    procedure GetLastError(var ErrCode: OleVariant); safecall;
    procedure GetLastErrorMsg(var Size, ErrMsg: OleVariant); safecall;
    procedure CreateDKList;
  public
    { Public declarations }
    procedure ExecuteQuery;

    //property HSem           : THandle read fHSem;
    property Active         : Boolean read fActive write SetActive;
    property ConnectionName : string read fConnectionName;
    property Key            : string read GetKey;
  end;

implementation

uses
  uAistConsts
 ,Log4D
 ,fdcExceptions
 ,Service
 ,Math
 ,StrUtils;
{$R *.DFM}
class procedure TRemDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRemDM.CreateOtvet(pKey :String;pKeyEx:String;pMessage :String);
begin
  if not mdOtvet.IsEmpty then exit;

  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Ошибка : - %s>' ,[pMessage]) );

  mdOtvet.Open;
  mdOtvet.Insert;
  mdOtvet.Edit;
  mdOtvet.FieldByName('G_NDOK').AsString := gv_G_NDOC;
  mdOtvet.FieldByName('KEY').AsString    := pKey;
  mdOtvet.FieldByName('KEY_EX').AsString := pKeyEx;
  mdOtvet.Post;

  DataSetProvider.DataSet := mdOtvet;
  mdOtvet.Open;

  // возвращаем dk_pp в случае локальной ошибки.
  if ( pKey = 'A' ) or ( pKey = 'X' ) then CreateDKList;

end;

procedure TRemDM.CreateDKList;
var
  dsOraDK : TOracleQuery;
  i : Integer;
begin
  if not mdDK_PP.IsEmpty then exit;

  dsOraDK := TOracleQuery.Create(self);
  dsOraDK.Session := OracleSession;

  qryDK.SetVariable('pGtdName', gv_G_NDOC);
  qryDK.SetComplexVariable('podata', dsOraDK);
  qryDK.Execute;

  mdDK_PP.Open;

  dsOraDK.Execute;
  while not dsOraDK.Eof do
  begin
    mdDK_PP.Insert;
    mdDK_PP.Edit;
    for i := 1 to mdDK_PP.Fields.Count - 1 do // Iterate
      mdDK_PP.FieldByName(mdDK_PP.Fields[i].FieldName).AsVariant := dsOraDK.Field(mdDK_PP.Fields[i].FieldName);
{    mdDK_PP.FieldByName('G071').AsVariant := dsOraDK.Field('G071');
    mdDK_PP.FieldByName('G072').AsVariant := dsOraDK.Field('G072');
    mdDK_PP.FieldByName('G073').AsVariant := dsOraDK.Field('G073');
    mdDK_PP.FieldByName('OKPO').AsVariant := dsOraDK.Field('OKPO');
    mdDK_PP.FieldByName('INN').AsVariant := dsOraDK.Field('INN');
    mdDK_PP.FieldByName('KPP').AsVariant := dsOraDK.Field('KPP');
    mdDK_PP.FieldByName('K92').AsVariant := dsOraDK.Field('K92');
    mdDK_PP.FieldByName('K93').AsVariant := dsOraDK.Field('K93');
    mdDK_PP.FieldByName('K94').AsVariant := dsOraDK.Field('K94');
    mdDK_PP.FieldByName('K95').AsVariant := dsOraDK.Field('K95');
    mdDK_PP.FieldByName('K_VAL').AsVariant := dsOraDK.Field('K_VAL');
    mdDK_PP.FieldByName('VP').AsVariant := dsOraDK.Field('VP');
    mdDK_PP.FieldByName('IRET').AsVariant := dsOraDK.Field('IRET');}
    mdDK_PP.Post;
    dsOraDK.Next;
  end;

end;

procedure SetFieldDefs(Ds: TdxMemData; const FieldDefs: string);
var
  Mem    : TMemoryStream;
  Src    : TStringStream;
  Reader : TReader;
begin
  Src :=
    TStringStream.Create(Format('inherited object %s: TdxMemData object mdOtvet: TdxMemData %s end',
    [Ds.Name, FieldDefs]));
  try
    Mem := TMemoryStream.Create;
    try
      ObjectTextToBinary(Src, Mem);
      Mem.Position := 0;
      Ds.FieldDefs.Clear;
      Reader := TReader.Create(Mem, 4096);
      try
        Reader.ReadSignature;
        Reader.BeginReferences;
        Reader.ReadComponent(Ds);
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

function TRemDM.checkELS(inn: String; date: TDateTime) :boolean;
var
    i       : Integer;
    curInn  : String;
    curDate : TDateTime;
    delimPos: Integer;
begin
  Result := false;
  for I := 0 to ELSInnList.Count - 1 do
  begin
    delimPos := Pos('|',ELSInnList.ValueFromIndex[i]);
    if delimPos = 0 then begin
      curInn  := ELSInnList.ValueFromIndex[i];
      curDate := StrToDateTime('2000-01-01',DateFormat);
    end else begin
      curInn  := Copy(ELSInnList.ValueFromIndex[i],1,delimPos-1);
      curDate := StrToDateTime(Copy(ELSInnList.ValueFromIndex[i],delimPos+1,10),DateFormat);
    end;

    if inn='' then begin
      TLogLogger.GetRootLogger.debug( Format( 'ИНН "%s" в списке ЕЛС с "%s".', [curInn,DateTimeToStr(curDate)]));
    end else begin                                                                                               
      TLogLogger.GetRootLogger.debug( Format( 'Сравниваем инн "%s" с "%s" и дату "%s" с "%s".',
        [inn, curInn, DateTimeToStr(date), DateTimeToStr(curDate)]));
      if (inn = curInn) then begin
        if (CompareDate(date, curDate)>=0) then begin
          // ИНН нашли, дата подходит
          Result := true;
          break;
        end else begin
          // ИНН нашли. дата не подходит - выходим
          break;
        end;
      end;
    end;
  end;
end;

procedure TRemDM.RemoteDataModuleCreate(Sender: TObject);
var
    Fields    : TStrings;
//    dsData    :TdxMemData;
    i         :Integer;
begin
  fIsResulst      := False;
  fActive         := False;
  fConnectionName := '<Не определено>';
  fErrCode        := 0;
  fErrMsg         := '';

  DateFormat.ShortDateFormat := 'yyyy-mm-dd';
  DateFormat.DateSeparator   :='-';

  for i:=0 to sTableNames.Count - 1 do
    with TdxMemData.Create(Self) do
      Name := sTableNames[i];

  FParams := TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  fHSem := CreateSemaphore( nil, 0, 1, nil );
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( Format('<[%s] Создан семафор для запрос: %d>', [fConnectionName, fHSem] ) );

   Fields := TStringList.Create;
   try
     FParams.ReadSectionValues('otvet', Fields);
     //mdOtvet.FieldDefs.Clear;
     //SetFieldDefs(mdOtvet, Fields.Text);
   finally
     Fields.Free;
   end;


  // Определяем список ИНН, относящихся к ЕЛС
  ELSInnList := TStringList.Create;
  FParams.ReadSectionValues('ELSInnList', ELSInnList);
  checkELS('',Now);

end;

function TRemDM.GenInsertForDataSet(DataSet: TDataSet; const TableName, ColMap: string):
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


function TRemDM.Insert(DsName :String;TableName :String) :Integer;
var
  Ds           : TDataSet;
  ColList      : String;
  CountNotLoad : Integer;
  DefDateFormat: string;
begin
    CountNotLoad := 0;
    Ds := TDataSet(FindComponent(DsName));

    if UpperCase(DsName) = 'DCLHEAD'  then
       begin
         DefDateFormat   := ShortDateFormat;
         ShortDateFormat := 'ddmmyy';
         gv_G_NDOC := Ds.FieldByName('G071').AsString+'/'+Ds.FieldByName('G072').AsString+'/'+Ds.FieldByName('G073').AsString;
         ShortDateFormat := DefDateFormat;
       end;
    begin
      ColList := FParams.ReadString(ExtractFileName(TableName), 'fields', '');
      sqlInsert.SQL.Text := GenInsertForDataSet(Ds, TableName, ColList);
      sqlInsert.DataSet := Ds;
      while not Ds.Eof do
      begin
          try
            sqlInsert.Exec;
          except
            on e: EOracleError do
            begin
              if (e.ErrorCode = 1) then
                  CountNotLoad := CountNotLoad + 1
              else
                  raise;
            end;
          end;
          Ds.Next;
      end;
    end;
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Загрузка в БД набора данных [ %s ] загружено - %s записей, пропущено - %s>',[DsName,IntToStr(Ds.RecordCount-CountNotLoad),IntToStr(CountNotLoad)]) );
  Result := Ds.RecordCount-CountNotLoad;
end;

procedure TRemDM.InsertToOracle;
var
  I           : Integer;
  DbfList     : TStringList;
  DataSetName : String;
  CountLoad   :Integer;
begin
  CountLoad := 0;

  DbfList := TStringList.Create;
  try
    try
      TLogLogger.GetRootLogger.Info( fConnectionName + '<Начало загрузка в базу данных>' );
     FParams.ReadSectionValues('dcl', DbfList);
     for I := 0 to DbfList.Count - 1 do
     begin
       DataSetName := copy(DbfList.Names[I],1,length(DbfList.Names[I])-4);
       if not TDataSet(findcomponent(DataSetName)).IsEmpty  then
          CountLoad := CountLoad + Insert(DataSetName,DbfList.ValueFromIndex[I]);
     end;
     FParams.ReadSectionValues('dk', DbfList);
     for I := 0 to DbfList.Count - 1 do
     begin
       DataSetName := copy(DbfList.Names[I],1,length(DbfList.Names[I])-4);
       if not TDataSet(findcomponent(DataSetName)).IsEmpty  then
          CountLoad := CountLoad + Insert(DataSetName,DbfList.ValueFromIndex[I]);
     end;

     TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Завершение загрузки в базу данных " %s ">', [TypeQuery]));

     if CountLoad = 0 then  raise Exception.Create('ДТ уже обработана');
  except
      on E: Exception do
      begin
        fErrMsg := 'Ошибка : - <' + E.Message+'>';
        if CountLoad = 0 then
          if TypeQuery = 'E1' then
            CreateOtvet('X','ДТ уже обработана',E.Message)
          else
            CreateOtvet('A','ДТ уже обработана',E.Message)
        else
            CreateOtvet('F','Ошибка маппировки',E.Message);
        raise;
      end;
  end;
 finally
   DbfList.Free;
 end;
end;

procedure TRemDM.GetOutput(Lines: String);
var
  S: string;
  Status: Integer;
begin
  repeat
    OracleSession.DBMS_Output.Get_Line(S, Status);
    if Status <> glSuccess then
      Break;
    Lines := Lines + S + ' ';
  until False;
end;

procedure TRemDM.DoLogInfoR(Str : String);
  function GetFormatDate( ADate : TDateTime ) : string;
    var
      vYear  : Word;
      vMonth : Word;
      vDay   : Word;
  begin
    DecodeDate( ADate, vYear, vMonth, vDay );

    Result := IntToStr( vYear ) + '.' + StringOfChar( '0', IfThen( vMonth < 10, 1, 0 ) ) + IntToStr( vMonth ) + '.' + StringOfChar( '0', IfThen( vDay < 10, 1, 0 ) ) + IntToStr( vDay );
  end;
var
  DataSet    : TDataSet;
  INN        : string;   // ИНН плательщика
  KPP        : string;   // КПП плательщика
  N_SV       : string;   // Номер свидетельства о включении в реестр таможенных представителей (только для представителей (брокеров))
  D_SV       : string;   // Дата свидетельства о включении в реестр таможенных представителей (только для представителей (брокеров))
  N_CNTR     : string;   // Номер договора между представителем и декларантом (только для представителей (брокеров))
  D_CNTR     : string;   // Дата договора между представителем и декларантом (только для представителей (брокеров))
  S          : string;
begin
  DataSet := TDataSet(FindComponent('DK_PP'));
  DataSet.First;
  while not DataSet.Eof do
    begin
      INN := DataSet.FieldByName('INN').AsString;
      KPP := DataSet.FieldByName('KPP').AsString;
      // только для представителя (брокера)
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
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Запрос ( R ) - " %s " %s >', [S,Str]));
end;

procedure TRemDM.DoLogInfoT(Str : String);
var
  DataSet    : TDataSet;
  NTR        : string;   // Полный номер ТР
  S          : string;
begin
  DataSet := TDataSet(FindComponent('DK_PP'));
  DataSet.First;
  while not DataSet.Eof do
    begin
      NTR := DataSet.FieldByName('NTR').AsString;

      if S = '' then S := S + ';';
      S := S + NTR;
      DataSet.Next;
  end;
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Запрос ( T ) - " %s " %s >', [S,Str]));
end;

procedure TRemDM.ExecuteQuery;
var dsOra   : TOracleQuery;
    Ds      : TDataSet;
    S       : String;
    NameGtd : String;
//    i       : Integer;
//    Field   : TField;
    HasError: Integer;
    found_ident_tab: boolean;   
    DataSetName : String;       
    DbfList     : TStringList;
    I           : Integer;
    INN         : String;
    date        : TDateTime;
    date_dbf: TField;
begin
  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Обработка запроса " %s ">', [TypeQuery]));

  HasError := 0;

  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Начало выполнения запроса " %s " в Oracle >', [TypeQuery]));

  try
    // Определяем ЕЛС или Т
    begin
      found_ident_tab := false;
      // Проверим по DCLHEAD
      Ds := TDataSet(FindComponent('DCLHEAD'));
      if not Ds.IsEmpty then begin
        TLogLogger.GetRootLogger.Info('Нашли индетифицирующую таблицу "DCLHEAD".');
        while not Ds.Eof do
        begin
          INN := Ds.FieldByName('G141').AsString;
          date := Ds.FieldByName('G072').asDateTime;
          TLogLogger.GetRootLogger.Info( Format( 'Сведения о декларанте/представителе - ИНН "%s", дата документа "%s".', [INN,DateTimeToStr(date)]));
          //Ds.Next;
          found_ident_tab := true;
          break;
        end;
      end;
      if not found_ident_tab then begin
        // Проверим по DK_PP
        Ds := TDataSet(FindComponent('DK_PP'));
        if not Ds.IsEmpty then begin
          TLogLogger.GetRootLogger.Info('Нашли индетифицирующую таблицу "DK_PP".');
          while not Ds.Eof do
          begin
            INN := Ds.FieldByName('INN').AsString;    
            date_dbf := Ds.FieldByName('G072');
            if date_dbf.IsNull then begin
              date := Now;
            end else begin
              date := date_dbf.asDateTime;
            end;
            TLogLogger.GetRootLogger.Info( Format( 'ИНН плательщика "%s", дата документа "%s".', [INN,DateTimeToStr(date)]));
            //Ds.Next;
            found_ident_tab := true;
            break;
          end;
        end;
      end;

      if not found_ident_tab then begin
        TLogLogger.GetRootLogger.warn( 'Не найдена идентифицирующая таблица!');
      end;
    end;
    

    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
        Debug( fConnectionName + ' <Подключение к БД>' );
    if checkELS(INN,date) then begin
      TLogLogger.GetRootLogger.Info('Запрос в ЕЛС');
      OracleSession.LogonUsername := ARMTIService.DBUserNameFTS;
      OracleSession.LogonDatabase := ARMTIService.DBServerFTS;
      OracleSession.LogonPassword := ARMTIService.DBPasswordFTS;

    end else begin
      TLogLogger.GetRootLogger.Info('Запрос в ЛС-Т');
      OracleSession.LogonUsername := ARMTIService.DBUserName;
      OracleSession.LogonDatabase := ARMTIService.DBServer;
      OracleSession.LogonPassword := ARMTIService.DBPassword;

    end;
    try
      OracleSession.Connected := True;
    except
      on E : Exception do
        begin
          TLogLogger.GetRootLogger.Fatal( '<Ошибка при подключении к БД ЛС>', E );
          raise;
        end;
    end;

             
    if  not OracleSession.Connected then
    begin
      CreateOtvet('F','Нет доступа к БД ЛС','Нет доступа к БД Лицевых счетов');
      Exit;
    end;
    OracleSession.DBMS_Output.Enable();

    LoadId := sqlBeginLoad.Exec;

    if (TypeQuery <> 'V') and (TypeQuery <> 'S') then InsertToOracle;
    if TypeQuery = 'R' then DoLogInfoR('');
    if TypeQuery = 'T' then DoLogInfoT('');
    if (TypeQuery <> 'R') and (TypeQuery <> 'T') then
       TLogLogger.GetRootLogger.Info( Format( fConnectionName + '< ДТ " %s "  >', [gv_G_NDOC]));

    dsOra := TOracleQuery.Create(self);
    dsOra.Session := OracleSession;

    if TypeQuery = 'R' then
         begin
          qryR.SetVariable('pLoadID', LoadID);
          qryR.SetComplexVariable('podata', dsOra);
          qryR.Execute;
         end
    else if TypeQuery = 'T' then
         begin
          qryT.SetVariable('pLoadID', LoadID);
          qryT.SetComplexVariable('podata', dsOra);
          qryT.Execute;
         end
    else if TypeQuery = 'E1' then
         begin
          OracleQuery1.SetVariable('pLoadID', LoadID);
          OracleQuery1.SetVariable('pKey', TypeQuery);
          OracleQuery1.SetComplexVariable('podata', dsOra);
          OracleQuery1.Execute;
          HasError := OracleQuery1.GetVariable('pHasError');
         end
    else if TypeQuery = 'O' then
         begin
          OracleQuery1.SetVariable('pLoadID', LoadID);
          OracleQuery1.SetVariable('pKey', TypeQuery);
          OracleQuery1.SetComplexVariable('podata', dsOra);
          OracleQuery1.Execute;
          HasError := OracleQuery1.GetVariable('pHasError');
         end
    else if TypeQuery = 'E' then
         begin
          OracleQuery1.SetVariable('pLoadID', LoadID);
          OracleQuery1.SetVariable('pKey', TypeQuery);
          OracleQuery1.SetComplexVariable('podata', dsOra);
          OracleQuery1.Execute;
          HasError := OracleQuery1.GetVariable('pHasError');
         end
     else if TypeQuery = 'V' then
         begin
          S := '';
          Ds := TDataSet(FindComponent('DCLHEAD'));
          try
            while not Ds.Eof do
            begin
              NameGtd := Ds.FieldByName('G071').AsString+'/'+
                         FormatDateTime('dd.mm.yyyy',Ds.FieldByName('G072').AsDateTime)+'/'+
                         Ds.FieldByName('G073').AsString+'\'+
                         FormatDateTime('dd.mm.yyyy',Ds.FieldByName('GD1').AsDateTime);
              if S = '' then S := NameGtd
               else S := S + ';' + NameGtd;
              Ds.Next;
            end;
          finally
              Ds.Free;
          end;

          qryV.SetVariable('pGtdList', S);
          qryV.SetComplexVariable('podata', dsOra);
          qryV.Execute;
         end
     else if TypeQuery = 'S' then
         begin
          S := '';
          Ds := TDataSet(FindComponent('DCLHEAD'));
          try
            while not Ds.Eof do
            begin
              NameGtd := Ds.FieldByName('G071').AsString+'/'+
                         Ds.FieldByName('G072').AsString+'/'+
                         Ds.FieldByName('G073').AsString+'\'+
                         Ds.FieldByName('GD0').AsString;
              if S = '' then S := NameGtd
               else S := S + ';' + NameGtd;
              Ds.Next;
            end;
          finally
              Ds.Free;
          end;

          qryS.SetVariable('pGtdList', S);
          qryS.SetComplexVariable('podata', dsOra);
          qryS.Execute;
         end;
   except
      on E: Exception do
      begin
        fErrCode := 1;
        if fErrMsg = '' then fErrMsg := 'Ошибка заполнения ДТ - <' + E.Message+'>';
        CreateOtvet('F','Ошибка заполнения ДТ',E.Message);
        OracleSession.Rollback;
        Exit;
      end;
  end;

  GetOutput(fErrMsg);

  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Завершение выполнения запроса  " %s " в Oracle>', [TypeQuery]));

  TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Начало передачи результата запроса " %s ">', [TypeQuery]));
  // Заполнить OTVET
  OraDataSet.ExternalCursor := dsOra;

  DataSetProvider.DataSet := OraDataSet;
  OraDataSet.Open;

  // Заполнить DK_PP
  if ( TypeQuery = 'E1' ) or ( TypeQuery = 'E' ) and ( sqlBeginLoad.Exec <> 0 ) then
    CreateDKList;

  if (TypeQuery <> 'R') and (TypeQuery <> 'T') then
    TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Завершение передачи результата запроса  " %s " по ДТ (%s) выгружено - %s записей >', [TypeQuery,gv_G_NDOC,IntToStr(OraDataSet.RecordCount)]))
  else
    begin
      if TypeQuery = 'R' then DoLogInfoR(' - окончание')
      else
        if TypeQuery = 'T' then DoLogInfoT(' - окончание');
      TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Завершение передачи результата запроса " %s " выгружено - %s записей >', [TypeQuery,IntToStr(OraDataSet.RecordCount)]));
    end;
  if HasError = 1 then
    OracleSession.Rollback;
end;

procedure  TRemDM.Enqueue;
  var
    WaitTime : DWORD;
begin
  //Поставить в очередь
  ARMTIService.AddToQueue( Self );

  // Ожидание исполнения
  if ARMTIService.QueueTimeOut = 0 then
    WaitTime := INFINITE
  else
    WaitTime := ARMTIService.QueueTimeOut * 60000;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( '<Ожидание очереди...>' );
  case WaitForSingleObject( fHSem, WaitTime ) of
    WAIT_OBJECT_0 : begin
                      with TLogLogger.GetRootLogger do
                        if IsDebugEnabled then
                          Debug( '<Подошла очередь исполнения запроса>' );
                      ExecuteQuery;
                    end;

    WAIT_TIMEOUT : begin
                     TLogLogger.GetRootLogger.Info( 'Отмена выполнения запроса по таймауту' );
                   end;
  end;
end;

procedure TRemDM.Query_E;
begin
  TypeQuery := 'E';

  //Поставить в очередь
  Enqueue;
end;

procedure TRemDM.Query_E1;
begin
  TypeQuery := 'E1';
  //Поставить в очередь
  Enqueue;
end;

procedure TRemDM.Query_O;
begin
  TypeQuery := 'O';
  //Поставить в очередь
  Enqueue;
end;

procedure TRemDM.Query_R;
begin
  TypeQuery := 'R';
  try
    ExecuteQuery;
  finally
    OracleSession.Rollback;
  end;
end;

procedure TRemDM.Query_T;
begin
  TypeQuery := 'T';
  try
    ExecuteQuery;
  finally
    OracleSession.Rollback;
  end;
end;

procedure TRemDM.Query_V;
begin
  TypeQuery := 'V';
  //Поставить в очередь
  Enqueue;
end;

procedure TRemDM.Query_S;
begin
  TypeQuery := 'S';
  //Поставить в очередь
  Enqueue;
end;

procedure TRemDM.QueryCommit;
begin
  if OracleSession.Connected then
    begin
     OracleSession.Commit;
     fIsResulst := True;
     if (TypeQuery <> 'R') and (TypeQuery <> 'T') then
       ARMTIService.RemoveFromQueue( Self );
     TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Фиксирование результата запрос " %s ">', [TypeQuery]));
    end;
end;

procedure TRemDM.QueryRollback;
begin
  if OracleSession.Connected then
    begin
     OracleSession.Rollback;
     if (TypeQuery <> 'R') and (TypeQuery <> 'T') and not fIsResulst  then
       ARMTIService.RemoveFromQueue( Self );
     fIsResulst := True;
     TLogLogger.GetRootLogger.Info( Format( fConnectionName + '<Отмена результата запроса " %s ">', [TypeQuery]));
    end;
end;

procedure TRemDM.ReadDataSet(const NameDataSet: WideString);
var Ds : TDataSet;
begin
  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
       Debug( Format( fConnectionName + '<Запрос начала передачи набора данных [ %s ]>', [NameDataSet]));

  Ds := TDataSet(FindComponent(NameDataSet));
  DataSetProvider.DataSet := Ds;
  Ds.Open;

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
       Debug( Format( fConnectionName + '<Запрос начала передачи набора данных [ %s ] завершен>', [NameDataSet]));
end;

procedure TRemDM.SendFields(const NameDataSet: WideString; Size: Integer;
  Data: OleVariant);
var
    ms : TMemoryStream;
    p  : Pointer;
    pb : ^Byte;
    i  : Integer;
    Ds : TdxMemData;
begin
  with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
         Debug( Format( fConnectionName + '<Передача описания полей набора данных [ %s ]>', [NameDataSet]));

  Ds := TdxMemData(findcomponent(NameDataSet));
  ms := TMemoryStream.Create;
  GetMem( p, Size );
  try
    pb := p;
    for i := 0 to Size - 1 do
      begin
        pb^ := Data[i];
        pb := Pointer( Integer( pb ) + 1 );
      end;
    ms.WriteBuffer( p^, Size );
    ms.Seek( 0, soFromBeginning );
    Ds.CreateFieldsFromStream( ms );
  finally
    FreeMem( p, Size );
    ms.Free;
  end;

    with TLogLogger.GetRootLogger do
      if IsDebugEnabled then
         Debug( Format( fConnectionName + '<Передача описания полей набора данных [ %s ] завершено>', [NameDataSet]));
end;

procedure TRemDM.RemoteDataModuleDestroy(Sender: TObject);
begin
  CloseHandle( fHSem );

  if (TypeQuery <> 'R') and (TypeQuery <> 'T') and not fIsResulst then
     ARMTIService.RemoveFromQueue( Self );

  if  FParams <> nil then FreeAndNil(FParams);

  with TLogLogger.GetRootLogger do
    if IsDebugEnabled then
      Debug( fConnectionName + ' <Отключение от БД>' );

  if OracleSession.Connected then
  begin
    OracleSession.Rollback;
    OracleSession.Connected := False;
  end;
end;

procedure TRemDM.SetInfo(const Host, IP: WideString; Port: Integer);
begin
  fConnectionName := '[' + Host + '_' + IP + '_' + IntToStr(Port) + ']';
  TLogLogger.GetRootLogger.Info( Format( '<Клиент идентифицировался как: %s>', [fConnectionName] ) );
end;

procedure TRemDM.SetActive(const Value: Boolean);
begin
  fActive := Value;

  if fActive then
    if not ReleaseSemaphore( fHSem, 1, nil ) then
      begin
        with TLogLogger.GetRootLogger do
          if IsDebugEnabled then
            Debug( Format( 'Ошибка при переводе семафора запроса в сигнальное состояние: %d', [ Windows.GetLastError ] ) );
        fActive := False;
      end;
end;

function TRemDM.GetKey: string;
begin
  Result := TypeQuery;
end;

procedure TRemDM.GetLastError(var ErrCode: OleVariant);
begin
  ErrCode := fErrCode;
end;

procedure TRemDM.GetLastErrorMsg(var Size, ErrMsg: OleVariant);
begin
  Size := Length( fErrMsg );
  ErrMsg := fErrMsg;
end;

initialization
  TComponentFactory.Create(ComServer, TRemDM,
    Class_RemDM, ciMultiInstance, tmApartment);
end.
