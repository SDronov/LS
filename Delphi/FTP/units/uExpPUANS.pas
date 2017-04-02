unit uExpPUANS;
interface

uses Forms, SysUtils, DB, VKDBFDataSet, uCommon;



const
  maxFieldCnt = 17;             // максимальное число полей в dbf из LS*.ANS

type
  TAnswTableFields = array[0..maxFieldCnt-1] of TFieldDef;

  TAnswTableDesc = record
    TableName  : string;                  // имя таблицы
//    FieldCount : integer;                 // количество полей
    Fields     : TAnswTableFields;         // двумерный массив в котором храняться описания полей
  end;

const
  LSxxxxxxANS_PU : TAnswTableDesc = (
    TableName  : 'LS.ANS';
//    FieldCount : 17;  // (name:''; _type:''; size:0; frac:''),
    Fields  :( (name:'CUSTOMCODE'; _type:'C'; size:8;   frac:0),
               (name:'INN_D';      _type:'C'; size:12;  frac:0),
               (name:'KPP_D';      _type:'C'; size:9;   frac:0),
               (name:'BEGIN_DATE'; _type:'D'; size:8;   frac:0),
               (name:'END_DATE';   _type:'D'; size:8;   frac:0),
               (name:'TYPEDOC';    _type:'C'; size:3;   frac:0),
               (name:'REPORT_DAT'; _type:'D'; size:8;   frac:0),
               (name:'NUMDOC';     _type:'C'; size:12;  frac:0),
               (name:'DATE_DOC';   _type:'D'; size:8;   frac:0),
               (name:'SUMMA';      _type:'N'; size:19;  frac:2),
               (name:'KBK';        _type:'C'; size:20;  frac:0),
               (name:'PAYMENTNUM'; _type:'C'; size:30;   frac:0),
               (name:'PAYMENTDAT'; _type:'C'; size:10;  frac:0),
               (name:'NAME_AGENT'; _type:'C'; size:70;  frac:0),
               (name:'NUMPOST';    _type:'C'; size:19;  frac:0),
               (name:'CODEERR';    _type:'N'; size:5;   frac:0),
               (name:'TEXTERR';    _type:'C'; size:255; frac:0) ) );

function GetInt(aText : string): integer;  //проверка на пустое значение массива
function GetType(aText : string): char;    //проверка типов в массиве
procedure createAnswDBF_PU(const aDBF_Name:TFileName; const aDS: TDataSet; var aRec:TAnswerRec); //Создание и заполнение dbf файла ответа

implementation

var ExportErrorMsg : string = '';

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
function Create_DBF_PUANS( ExportDir : string; tblDesc: TAnswTableDesc ) : string;
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
      DBF.DBFFileName := includeTrailingPathDelimiter(ExportDir) + tblDesc.TableName;
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

procedure createAnswDBF_PU(const aDBF_Name:TFileName; const aDS: TDataSet; var aRec:TAnswerRec);
var
 dbf: TVKDBFNTX;
// PU: TAnswTableDesc;
 ans_PU: TAnswTableDesc;
 _dbf: TFileName;
begin
 //Заполнение записи для структуры DBF
 ans_PU := LSxxxxxxANS_PU;
// PU.FieldCount := 16;
 ans_PU.TableName := extractFileName( aDBF_Name );
 _dbf := create_DBF_PUANS( extractFileDir(aDBF_Name) , ans_PU );

 dbf := TVKDBFNTX.Create(nil);
 dbf.DBFFileName := _dbf;
 dbf.OEM := True;
 dbf.AccessMode.OpenReadWrite := True;

  dbf.Open;
  repeat;
    dbf.Append;

    dbf.FieldByName('CUSTOMCODE').AsString:= aRec.CUSTOMCODE;          //Код таможенного органа
    dbf.FieldByName('INN_D').AsString     := aRec.INN_D;               //ИНН плательщика
    dbf.FieldByName('KPP_D').AsString     := aRec.KPP_D;               //КПП плательщика

    dbf.FieldByName('BEGIN_DATE').AsDateTime := aRec.BEGIN_DATE;     //Дата начала периода, за который запрашивается информация о движении денежных средств
    if (aRec.BEGIN_DATE = 0) then
      dbf.FieldByName('BEGIN_DATE').Clear;

    dbf.FieldByName('END_DATE').AsDateTime := aRec.END_DATE;         //Дата конца периода, за который запрашивается информация о движении денежных средств
    if (aRec.END_DATE = 0) then
      dbf.FieldByName('END_DATE').Clear;

    dbf.FieldByName('TYPEDOC').AsString      := aRec.TYPEDOC;          //Тип получаемой информации
    dbf.FieldByName('REPORT_DAT').AsDateTime := now;

    dbf.FieldByName('NUMPOST'     ).AsString   := aRec.NUMPOST;        //Наименование загружаемой транзакции
    dbf.FieldByName('CODEERR'     ).AsString   := aRec.CODEERR;        //Код ошибки
    dbf.FieldByName('TEXTERR'     ).AsString   := aRec.TEXTERR;        //Описание ошибки
    if assigned(aDS) then begin
      dbf.FieldByName('NUMDOC').AsString:= aDS.FieldByName('NUMDOC').AsString;

      dbf.FieldByName('DATE_DOC').AsDateTime := aDS.FieldByName('DATE_DOC').AsDateTime;
      if aDS.FieldByName('DATE_DOC').IsNull then
        dbf.FieldByName('DATE_DOC').Clear;

      dbf.FieldByName('SUMMA').AsFloat:=  aDS.FieldByName('SUMMA').AsFloat;
      dbf.FieldByName('KBK').AsString:= aDS.FieldByName('KBK').AsString;
      dbf.FieldByName('PAYMENTNUM').AsString:= aDS.FieldByName('PAYMENTNUM').AsString;
      dbf.FieldByName('PAYMENTDAT').AsDateTime:= aDS.FieldByName('PAYMENTDAT').AsDateTime;
      dbf.FieldByName('NAME_AGENT').AsString:= aDS.FieldByName('NAME_AGENT').AsString;
      aDS.Next;
    end;{}
    dbf.Post;
  until ( not assigned(aDS) ) or aDS.Eof ; {while not aDS.Eof..}
  if assigned(aDS) then aDS.Close;  
  dbf.Close;
  dbf.Free;
end;

initialization

end.
