unit ExportModule;

interface

uses
  Forms,
  SysUtils,
  VKDBFDataSet;

const
  maxFieldCount = 35;             // максимальное число полей в dbf

Type

{
  TCetFields[i,j] - массив описания полей
  i   - порядковый номер поля
  j=0 - название поля
  j=1 - тип поля (D,N,C)
  j=2 - размер поля (для Numeric и Char)   (для Date игнорируется)
  j=3 - размер дробной части для (Numeric) (для Date игнорируется)
  TCetTableDesc - запись описывающая структуру таблицы
{}

  TCetFields = array [0..maxFieldCount-1, 0..3] of string;

  TCetTableDesc = record
    TableName  : string;                  // имя таблицы
    FieldCount : integer;                 // количество полей
    Fields     : TCetFields;              // двумерный массив в котором храняться описания полей
  end;

var
  ExportErrorMsg : string;


function GetAbsPath(DirName : string) : string;
function CreateDBF(ExportDir : string; tblDesc : TCetTableDesc) : string;
function GetDBFForExport(aFileName : string; tblDesc : TCetTableDesc) : TVKDBFNTX;


implementation


function GetAppDir : string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;


function GetAbsPath(DirName : string) : string;
var
  i : integer;
begin
  Result := DirName;
  if (Result = '') then
    Result := GetAppDir
  else if (length(Result) > 1) and (Result[2] <> ':') or (length(Result) = 1) then
  begin
    // otnositelno
    while (Result[1] = '\') do Result := Copy(Result, 2, length(Result)-1);
    Result := GetAppDir + Result;
  end;
  Result := Result + '\';
  i := 1;
  while (i < length(Result)-1) do
    if (Result[i] = '\') and (Result[i+1] = '\') then
      Delete(Result, i, 1)
    else
      Inc(i);
  try
    ForceDirectories(Result);
  except
    Result := '';
  end;
end;


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


// процедура генерации DBF файла
function CreateDBF(ExportDir : string; tblDesc : TCetTableDesc) : string;
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
      DBF.DBFFileName := ExportDir + tblDesc.TableName;
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
      DBF.Free;
    end;
  except on e : exception do begin
    Result := '';
    ExportErrorMsg := e.Message;
  end; end;
end;


function GetDBFForExport(aFileName : string; tblDesc : TCetTableDesc) : TVKDBFNTX;
var
  i : integer;
begin
  if (aFileName = '') then
    raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя таблицы');
  if (tblDesc.FieldCount <= 0) then
    raise exception.Create('Ошибка генерации DBF (модуль Export) : Число полей в таблице должно быть больше нуля');
  // создание DBF таблицы
  Result := TVKDBFNTX.Create(nil);
  Result.DBFFileName := aFileName;
  // создание полей
  for i := 0 to tblDesc.FieldCount-1 do
    with Result.DBFFieldDefs.Add as TVKDBFFieldDef do
    begin
      if (tblDesc.Fields[i,0] = '') then
        raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя поля')
      else
        Name := tblDesc.Fields[i, 0];
      Field_Type := GetType(tblDesc.Fields[i,1]);
      Len := GetInt(tblDesc.Fields[i, 2]);
      Dec := GetInt(tblDesc.Fields[i, 3]);
    end;
  Result.CreateTable;
end;


Initialization
  ExportErrorMsg := '';
  

End.

