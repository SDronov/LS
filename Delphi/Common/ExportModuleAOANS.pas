unit ExportModuleAOANS;

interface

uses
  Forms,
  SysUtils,
  VKDBFDataSet;

//{$I SearchProcedureConsts.inc}  

const
  maxFieldCountAOANS = 17;             // максимальное число полей в dbf из LS*.ANS

type

{
  TCetFields[i,j] - массив описания полей
  i   - порядковый номер поля
  j=0 - название поля
  j=1 - тип поля (D,N,C)
  j=2 - размер поля (для Numeric и Char)   (для Date игнорируется)
  j=3 - размер дробной части для (Numeric) (для Date игнорируется)
  TCetTableDesc - запись описывающая структуру таблицы
{}

  TCetFieldsAOANS = array [0..maxFieldCountAOANS-1, 0..3] of string;

  TCetTableDescAOANS = record
    TableName  : string;                  // имя таблицы
    FieldCount : integer;                 // количество полей
    Fields     : TCetFieldsAOANS;         // двумерный массив в котором храняться описания полей
  end;

function GetInt(aText : string): integer;  //проверка на пустое значение массива
function GetType(aText : string): char;    //проверка типов в массиве
function Create_DBF_AOANS(ExportDir : string; tblDesc : TCetTableDescAOANS) : string;   //Создание dbf файла
procedure Filling_DBF_AOANS(val: string; parray: array of string);  //заполнение dbf файла

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
function Create_DBF_AOANS(ExportDir : string; tblDesc: TCetTableDescAOANS) : string;
var
  i : integer;
  DBF : TVKDBFNTX;
begin
  try
    // проверки
    if (tblDesc.TableName = '') then
      raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя таблицы');
    if (tblDesc.FieldCount <= 0) then
      raise exception.Create('Ошибка генерации DBF (модуль Export) : Число полей в таблице должно быть больше нуля');
    // создание DBF таблицы
    DBF := TVKDBFNTX.Create(nil);
    try
      DBF.DBFFileName := ExportDir + tblDesc.TableName;// tblDesc.TableName;
      // создание полей
      for i := 0 to tblDesc.FieldCount-1 do
        with dbf.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          if (tblDesc.Fields[i,0] = '') then
            raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя поля')
          else
            Name := tblDesc.Fields[i, 0];
          Field_Type := GetType(tblDesc.Fields[i,1]);
          Len := GetInt(tblDesc.Fields[i, 2]);
          Dec := GetInt(tblDesc.Fields[i, 3]);
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

procedure Filling_DBF_AOANS(val: string; parray: array of string);
var
  dbf: TVKDBFNTX;
begin
  dbf := TVKDBFNTX.Create(nil);
  dbf.OEM := True;
  dbf.AccessMode.OpenReadWrite := True;
  dbf.DBFFileName := ExtractFilePath(val) + ExtractFileName(val);

  dbf.Open;
  dbf.Append;

  dbf.FieldByName('CUSTOMCODE'  ).AsString   := parray[0];                //Код таможенного органа
  dbf.FieldByName('INN_D'       ).AsString   := parray[1];                //ИНН плательщика
  dbf.FieldByName('KPP_D'       ).AsString   := parray[2];                //КПП плательщика
  if parray[3] <> '' then
    dbf.FieldByName('BEGIN_DATE').AsDateTime := StrToDate(parray[3]);     //Дата начала периода, за который запрашивается информация о движении денежных средств
  if parray[4] <> '' then
    dbf.FieldByName('END_DATE'  ).AsDateTime := StrToDate(parray[4]);     //Дата конца периода, за который запрашивается информация о движении денежных средств
  dbf.FieldByName('TYPEDOC'     ).AsString   := parray[5];                //Тип получаемой информации
  if parray[6] <> '' then
    dbf.FieldByName('REPORT_DAT').AsDateTime := StrToDate(parray[6]);     //Дата отчета о расходовании денежных средств
  dbf.FieldByName('NUMDOC'      ).AsString   := parray[7];                //Номер платежного документа
  if parray[8] <> '' then
    dbf.FieldByName('DATE_DOC'  ).AsDateTime := StrToDate(parray[8]);     //Дата платежного документа
  if parray[9] <> '' then
    dbf.FieldByName('SUMMA_AR'  ).AsFloat    := StrToFloat(parray[9]);    //Сумма, поступившая за указанный период
  if parray[10] <> '' then
    dbf.FieldByName('SUMMA_RE'  ).AsFloat    := StrToFloat(parray[10]);    //Сумма, зачтенная за указанный период
  dbf.FieldByName('PAYMENTNUM'  ).AsString   := parray[11];                //Номер документа основания для расходования денежных средств
  dbf.FieldByName('PAYMENTID'   ).AsString   := parray[12];                //Вид платежа по документу основанию
  if parray[13] <> '' then
  dbf.FieldByName('PAYMENTSUM'  ).AsFloat    := StrToFloat(parray[13]);    //Сумма платежа по документу основанию
  dbf.FieldByName('NUMPOST'     ).AsString   := parray[14];                //Наименование загружаемой транзакции
  dbf.FieldByName('CODEERR'     ).AsString   := parray[15];                //Код ошибки
  dbf.FieldByName('TEXTERR'     ).AsString   := parray[16];                //Описание ошибки

  dbf.Post;
  dbf.Close;
  dbf.Free;

  //RenameFile(ExtractFilePath(ExtractFilePath(val)) + ExtractFileName(ChangeFileExt(ExtractFileName(val), '.dbf')), ExtractFilePath(val) + ExtractFileName(ChangeFileExt(ExtractFileName(val), '.ans')));
  //DeleteFile(ExtractFilePath(ExtractFilePath(val)) + ExtractFileName(ChangeFileExt(ExtractFileName(val), '.req')));

end;

Initialization
  ExportErrorMsg := '';


End.


