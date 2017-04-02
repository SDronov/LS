unit uExport;

interface

uses
 Forms, SysUtils, VKDBFDataSet, uCommon;

const maxAnswFieldCnt = 14; // максимальное число полей в dbf

type
 TAnswFields = array [0..maxAnswFieldCnt-1] of TFieldDef;

 TTableDesc_Answ = record
   TableName  : string;     // имя таблицы
   Fields     : TAnswFields; // двумерный массив в котором храняться описания полей
 end;

const
 cTK_ANS: TTableDesc_Answ = (
  TableName  : 'TK.ANS';
  Fields :(
    (name:'NUMDOC';     _type:'C'; size: 12; frac: 0 ),
    (name:'DATEDOC';    _type:'D'; size: 8;  frac: 0 ),
    (name:'DATEBANK';   _type:'D'; size: 8;  frac: 0 ),
    (name:'CURCODE';    _type:'C'; size: 3;  frac: 0 ),
    (name:'SUMMA';      _type:'N'; size: 19; frac: 2 ),
    (name:'ID';         _type:'C'; size: 25; frac: 0 ),
    (name:'CUSTOMCODE'; _type:'C'; size: 8;  frac: 0 ),
    (name:'CARDNUM';    _type:'C'; size: 19; frac: 0 ),
    (name:'NUMPOST';    _type:'C'; size: 12; frac: 0 ),
    (name:'CODEERR';    _type:'N'; size: 5;   frac: 0 ),
    (name:'TEXTERR';    _type:'C'; size: 255; frac: 0 ),
    (name:'DOCDATE';    _type:'D'; size: 8;   frac: 0 ),
    (name:'DOCTIME';    _type:'C'; size: 8;   frac: 0 ),
    (name:'FLAG';       _type:'C'; size: 1;   frac: 0 )  ); );



(* TKxxxxxx : TCetTableDesc = (
  TableName  : 'TK.ANS';
  FieldCount : 14;
  Fields     : (('NUMDOC',     'C', '12',  ''),
                ('DATEDOC',    'D', '',    ''),
                ('DATEBANK',   'D', '',    ''),
                ('CURCODE',    'C', '3',   ''),
                ('SUMMA',      'N', '19',  '2'),

                ('ID',         'C', '25',  ''),
                ('CUSTOMCODE', 'C', '8',   ''),
                ('CARDNUM',    'C', '19',  ''),
                ('NUMPOST',    'C', '12',  ''),
                ('CODEERR',    'N', '5',   ''),

                ('TEXTERR',    'C', '255', ''),
                ('DOCDATE',    'D', '8',   ''),
                ('DOCTIME',    'C', '8',   ''),
                ('FLAG',       'C', '1',   '')   )); *)


var ExportErrorMsg: string;

function getAbsPath(aDirName: string): string;
//function createDBF(aExportDir: string; aTblDesc: TTableDesc_Answ): string;
function getDBFForExport(aFileName: string; aTblDesc: TTableDesc_Answ): TVKDBFNTX;

implementation

function getAppDir : string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function getAbsPath(aDirName : string) : string;
var i: integer;
begin
  Result := aDirName;
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

function getInt(aText : string): integer;
begin
 try
  if (aText = '') then
   Result := 0
  else
   Result := StrToInt(aText);
 except
  on E: exception do begin
   E.Message := 'Ошибка конвертации (модуль Export) : Выражение [' + aText + '] не является числовым выражением';
   raise;
  end;
 end;
end;

function getType(aText : string): char;
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
(*
function createDBF(aExportDir: string; aTblDesc: TTableDesc_Answ): string;
var
 i: integer;
 DBF: TVKDBFNTX;
begin
  try
   // проверки
   if (aTblDesc.TableName = '') then
     raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя таблицы');
   if ( high(aTblDesc.Fields) <= 0 ) then
     raise exception.Create('Ошибка генерации DBF (модуль Export) : Число полей в таблице должно быть больше нуля');
    // создание DBF таблицы
   DBF := TVKDBFNTX.Create(nil);
   try
     DBF.DBFFileName := aExportDir + aTblDesc.TableName;
     // создание полей
     for i := low(aTblDesc.Fields) to high(aTblDesc.Fields) do
       with (dbf.DBFFieldDefs.Add as TVKDBFFieldDef) do
       begin
         if (aTblDesc.Fields[i].name = '') then
           raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя поля')
         else
           Name := aTblDesc.Fields[i].name;
         Field_Type := GetType( aTblDesc.Fields[i]._type );
         Len := aTblDesc.Fields[i].size;
         Dec := aTblDesc.Fields[i].frac;
       end;
       DBF.CreateTable;
       Result := DBF.DBFFileName;
   finally
     FreeAndNil(DBF);
   end;
   except on e : exception do begin
     Result := '';
     ExportErrorMsg := e.Message;
   end; end;
end;   *)

function getDBFForExport(aFileName: string; aTblDesc: TTableDesc_Answ): TVKDBFNTX;
var i: integer;
begin
  if (aFileName = '') then
    raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя таблицы');
  if high(aTblDesc.Fields) <= 0 then
    raise exception.Create('Ошибка генерации DBF (модуль Export) : Число полей в таблице должно быть больше нуля');
  // создание DBF таблицы
  Result := TVKDBFNTX.Create(nil);
  Result.DBFFileName := aFileName;
  // создание полей
  for i := low(aTblDesc.Fields) to high(aTblDesc.Fields) do
    with Result.DBFFieldDefs.Add as TVKDBFFieldDef do
    begin
      if (aTblDesc.Fields[i].name = '') then
        raise exception.Create('Ошибка генерации DBF (модуль Export) : Не указано имя поля')
      else
        Name := aTblDesc.Fields[i].name;
      Field_Type := GetType(aTblDesc.Fields[i]._type);
      Len := aTblDesc.Fields[i].size;
      Dec := aTblDesc.Fields[i].frac;
    end;
  Result.CreateTable;
end;

initialization
  ExportErrorMsg := '';
end.
