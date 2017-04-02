unit uExpAOANS;

interface

uses
  Forms,  SysUtils,  DB, VKDBFDataSet, uCommon, uExpPUANS;

const
 LSxxxxxxANS_AO : TAnswTableDesc = (
   TableName  : 'LS.ANS';
   Fields     : ((name:'CUSTOMCODE'; _type:'C';   size:8;  frac:0 ),
                 (name:'INN_D';      _type:'C';   size:12; frac:0 ),
                 (name:'KPP_D';      _type:'C';   size:9;  frac:0 ),
                 (name:'BEGIN_DATE'; _type:'D';   size:8;  frac:0 ),
                 (name:'END_DATE';   _type:'D';   size:8;  frac:0 ),
                 (name:'TYPEDOC';    _type:'C';   size:3;  frac:0 ),
                 (name:'REPORT_DAT'; _type:'D';   size:8;  frac:0 ),
                 (name:'NUMDOC';     _type:'C';   size:12; frac:0 ),
                 (name:'DATE_DOC';   _type:'D';   size:8;  frac:0 ),
                 (name:'SUMMA_AR';   _type:'N';   size:19; frac:2 ),
                 (name:'SUMMA_RE';   _type:'N';   size:19; frac:2 ),
                 (name:'PAYMENTNUM'; _type:'C';   size:30;  frac:0 ),
                 (name:'PAYMENTID';  _type:'C';   size:4;  frac:0 ),
                 (name:'PAYMENTSUM'; _type:'N';   size:19; frac:2 ),
                 (name:'NUMPOST';    _type:'C';   size:19; frac:0 ),
                 (name:'CODEERR';    _type:'N';   size:5;  frac:0 ),
                 (name:'TEXTERR';    _type:'C';   size:255; frac:0 ) ));

(*  LSxxxxxxaoANS : TCetTableDescAOANS = (
    TableName  : 'LS.ANS';
    FieldCount : 16;  //17
    Fields     : (('CUSTOMCODE', 'C',   '8',   ''),
                  ('INN_D',      'C',   '12',  ''),
                  ('KPP_D',      'C',   '9',   ''),
                  ('BEGIN_DATE', 'D',   '8',   ''),
                  ('END_DATE',   'D',   '8',   ''),
                  ('TYPEDOC',    'C',   '3',   ''),
                  ('REPORT_DAT', 'D',   '8',   ''),
                  ('NUMDOC',     'C',   '12',  ''),
                  ('DATE_DOC',   'D',   '8',   ''),
                  ('SUMMA_AR',   'N',   '19',  '2'),
                  ('SUMMA_RE',   'N',   '19',  '2'),
                  ('PAYMENTNUM', 'C',   '7',   ''),
                  ('PAYMENTID',  'C',   '4',   ''),
                  //('PAYMENTSUM', 'Num', '19',  '2'),
                  ('NUMPOST',    'C',   '19',  ''),
                  ('CODEERR',    'N',   '5',   '0'),
                  ('TEXTERR',    'C',   '255', '')
                 )); *)

                 
function GetInt(aText : string): integer;  //проверка на пустое значение массива
function GetType(aText : string): char;    //проверка типов в массиве
procedure createAnswDBF_AO(const aDBF_Name:TFileName; const aDS: TDataSet; var aRec:TAnswerRec); //Создание и заполнение dbf файла ответа

var
  ExportErrorMsg : string;

implementation

function GetInt(aText : string): integer;
begin
  try
    if (aText = '') then
      Result := 0
    else
      Result := StrToInt(aText);
  except on E: exception do begin
    E.Message := 'Ошибка конвертации (модуль Export) : Выражение [' + aText + '] не является числовым выражением';
    raise;
  end; end;
end;

function GetType(aText : string): char;
var
  SwapChar : char;
begin
  SwapChar := upperCase(aText)[1];
  if (SwapChar <> 'D') and (SwapChar <> 'C') and (SwapChar <> 'N') then
    raise exception.Create('Ошибка конвертации (модуль Export) : Выражение [' + aText + '] не является константой для типа поля dBaseIII')
  else
    Result := SwapChar;
end;

// процедура генерации DBF файла LS*.ANS
function Create_DBF_AOANS(ExportDir : string; tblDesc: TAnswTableDesc) : string;
var
  i : integer;
  DBF : TVKDBFNTX;
begin
  try
    // проверки
    if (tblDesc.TableName = '') then
      raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя таблицы');
    if (length(tblDesc.Fields) <= 0) then
      raise exception.Create('Ошибка генерации DBF (модуль Export) : Число полей в таблице должно быть больше нуля');
    // создание DBF таблицы
    DBF := TVKDBFNTX.Create(nil);
    try
      DBF.DBFFileName := includeTrailingPathDelimiter(ExportDir) + tblDesc.TableName;// tblDesc.TableName;
      // создание полей
      for i := low(tblDesc.Fields) to high(tblDesc.Fields) do
        with dbf.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          if (tblDesc.Fields[i].name = '') then
            raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя поля')
          else
            Name := tblDesc.Fields[i].name;
          Field_Type := GetType(tblDesc.Fields[i]._type);
          Len := tblDesc.Fields[i].size;
          Dec := tblDesc.Fields[i].frac;
        end;
      DBF.CreateTable;
      Result := DBF.DBFFileName;
    finally
      FreeAndNil(DBF);
    end;
  except on e : exception do
    begin
      Result := '';
      ExportErrorMsg := e.Message;
    end;
  end;
end;

procedure createAnswDBF_AO(const aDBF_Name:TFileName; const aDS: TDataSet; var aRec:TAnswerRec);
//procedure Fill_DBF_AOANS(const aDBF_Name:string; const aDS: TDataSet; var aRec:TAnswerRec);
var
 dbf: TVKDBFNTX;
 ans_AO: TAnswTableDesc;
 _dbf: TFileName; 
begin
 ans_AO := LSxxxxxxANS_AO;
 ans_AO.TableName  := extractFileName( aDBF_Name );

 _dbf := Create_DBF_AOANS( extractFileDir(aDBF_Name), ans_AO );

 dbf := TVKDBFNTX.Create(nil);
 dbf.DBFFileName := _dbf;
 dbf.OEM := True;
 dbf.AccessMode.OpenReadWrite := True;

  dbf.Open;
  repeat
    dbf.Append;

    dbf.FieldByName('CUSTOMCODE'  ).AsString   := aRec.CUSTOMCODE;    //Код таможенного органа
    dbf.FieldByName('INN_D'       ).AsString   := aRec.INN_D;         //ИНН плательщика
    dbf.FieldByName('KPP_D'       ).AsString   := aRec.KPP_D;         //КПП плательщика

    dbf.FieldByName('BEGIN_DATE').AsDateTime := aRec.BEGIN_DATE;      //Дата начала периода, за который запрашивается информация о движении денежных средств
    if (aRec.BEGIN_DATE = 0) then
      dbf.FieldByName('BEGIN_DATE').Clear;

    dbf.FieldByName('END_DATE'  ).AsDateTime := aRec.END_DATE;      //Дата конца периода, за который запрашивается информация о движении денежных средств
    if (aRec.END_DATE = 0) then
      dbf.FieldByName('END_DATE').Clear;

    dbf.FieldByName('TYPEDOC'     ).AsString  := aRec.TYPEDOC;       //Тип получаемой информации
    dbf.FieldByName('NUMPOST').AsString   := aRec.NUMPOST;            //Наименование загружаемой транзакции
    dbf.FieldByName('CODEERR').AsString   := aRec.CODEERR;            //Код ошибки
    dbf.FieldByName('TEXTERR').AsString   := aRec.TEXTERR;            //Описание ошибки
    dbf.FieldByName('REPORT_DAT').AsDateTime := Now;                  //Дата отчета о расходовании денежных средств

    if assigned(aDS) then begin
      dbf.FieldByName('NUMDOC').asString      := aDS.FieldByName('NUMDOC').AsString;      //Номер платежного документа

      dbf.FieldByName('DATE_DOC').asDateTime := aDS.FieldByName('DATE_DOC').AsDateTime;  //Дата платежного документа
      if (aDS.FieldByName('DATE_DOC').IsNull) then  dbf.FieldByName('DATE_DOC').Clear;

      dbf.FieldByName('SUMMA_AR').asFloat     := aDS.FieldByName('SUMMA_AR').asFloat;     //Сумма, поступившая за указанный период
      dbf.FieldByName('SUMMA_RE'  ).AsFloat   := aDS.FieldByName('SUMMA_RE').asFloat;     //Сумма, зачтенная за указанный период
      dbf.FieldByName('PAYMENTNUM').AsString  := aDS.FieldByName('PAYMENTNUM').AsString;  //Номер документа основания для расходования денежных средств
      dbf.FieldByName('PAYMENTID').AsString   := aDS.FieldByName('PAYMENTID').AsString;   //Вид платежа по документу основанию
      dbf.FieldByName('PAYMENTSUM'  ).AsFloat := aDS.FieldByName('PAYMENTSUM').asFloat;
      aDS.Next;
    end;
    dbf.Post;
  until (not assigned(aDS)) or aDS.Eof;
  if assigned(aDS) then aDS.Close;
  dbf.Close;
  dbf.Free;
end;

initialization
  ExportErrorMsg := '';
end.
