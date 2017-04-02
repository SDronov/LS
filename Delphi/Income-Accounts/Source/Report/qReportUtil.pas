unit qReportUtil;

interface

uses
  DateUtils, Windows, SysUtils,
  Forms, DB, xlReport;

const
  ReportError   = '¬озникла ошибка при формировании отчета: '#13#10;
  SQLIdCount    = 950;
  cDfDateFormat = 'DDMMYYYY';
  cDfTimeFormat = 'HHMMSS';


function  CheckDate(aDate : TDateTime) : boolean ; overload;
function  CheckDate(aDate : TDateField) : boolean ; overload;
function  CmpDate(aStart, aEnd : TDateTime) : boolean; overload;
function  CmpDate(aStart, aEnd : TDateField) : boolean; overload;
function  CmpDateNull(aStart, aEnd : TDateTimeField) : boolean;
procedure ShowReportContextHelp(Idx : integer);
procedure LoadReportQuery(AReport: TxlReport);
procedure LoadReportQueryEx(Form: TForm; aFileName: string);
function  GetMonthStr(aMonth : integer):string;
function  DateAsText(ADate: TDateTime): string; // мес€ц прописью в падеже
function  GetStrTimeStamp(aDateTime: TDateTime): string;
function  GetFormatSettings(aDateFormat:string = cDfDateFormat; aTimeFormat:string = cDfTimeFormat): TFormatSettings;

implementation

uses
  MainFrm, fdcUtils, IniFiles, Classes, FDCQuery, Oracle, OracleData;

const
  minDate    : TDateTime = 367; // 01.01.1901
  ErrorDate  = '«начение даты должно быть больше, чем ';
  ErrorNull  = 'Ќеобходимо выбрать дату';
  ErrorRange = 'ƒата начала должна быть меньше даты окончани€ периода';
  Monthes : array [1..12] of string = (
    '€нварь',
    'февраль',
    'март',
    'апрель',
    'май',
    'июнь',
    'июль',
    'август',
    'сент€брь',
    'окт€брь',
    'но€брь',
    'декабрь'
  );
  CaseMonthes : array [1..12] of string = (
    '€нвар€',
    'феврал€',
    'марта',
    'апрел€',
    'ма€',
    'июн€',
    'июл€',
    'августа',
    'сент€бр€',
    'окт€бр€',
    'но€бр€',
    'декабр€'
  );

function CheckDate(aDate : TDateTime): boolean;
begin
  if (aDate < minDate) then
    raise exception.Create(ErrorDate + DateToStr(minDate));
  Result := True;
end;


function CheckDate(aDate : TDateField): boolean;
begin
  if aDate.IsNull then
    raise exception.Create(ErrorNull);
  if (aDate.Value < minDate) then
    raise exception.Create(ErrorDate + DateToStr(minDate));
  Result := True;
end;


function CmpDate(aStart, aEnd : TDateTime) : boolean;
begin
  if (aStart > aEnd) then
    raise exception.Create(ErrorRange);
  Result := True;
end;


function CmpDate(aStart, aEnd : TDateField) : boolean;
begin
  if (aStart.IsNull or aEnd.IsNull) then
    raise exception.Create(ErrorNull);
  if (aStart.Value < minDate) then
    raise exception.Create(ErrorDate + DateToStr(minDate));
  if (aEnd.Value < minDate) then
    raise exception.Create(ErrorDate + DateToStr(minDate));
  if (aStart.Value > aEnd.Value) then
    raise exception.Create(ErrorRange);
  Result := True;
end;


function CmpDateNull(aStart, aEnd : TDateTimeField) : boolean;
begin
  if (aStart.IsNull or aEnd.IsNull) then
    Result := True
  else if (aStart.Value > aEnd.Value) then
    raise exception.Create(ErrorRange)
  else
    Result := true;
end;


procedure LoadReportQuery(AReport: TxlReport);
var
  IniFile: TMemIniFile;
  Strings: TStrings;
  I: Integer;
  AComp: TComponent;
begin
  Strings := nil;
  IniFile := TMemIniFile.Create(ChangeFileExt(AReport.XLSTemplate, '.sql'));
  try
    Strings := TStringList.Create;
    IniFile.ReadSections(Strings);
    for I := 0 to  AReport.DataSources.Count - 1 do
    begin
      if (AReport.DataSources[I].DataSet is TfdcQuery) and
         (Strings.IndexOf(AReport.DataSources[I].DataSet.Name) > -1) then
          IniFile.ReadSectionValues(AReport.DataSources[I].DataSet.Name,
          TfdcQuery(AReport.DataSources[I].DataSet).SQL);
    end;
  finally
    IniFile.Free;
    Strings.Free;
  end;
end;


procedure LoadReportQueryEx(Form: TForm; aFileName: string);
var
  IniFile: TMemIniFile;
  Strings: TStrings;
  I: Integer;
  AComp: TComponent;
begin
  Strings := nil;
  IniFile := TMemIniFile.Create(ChangeFileExt(aFileName, '.sql'));
  try
    Strings := TStringList.Create;
    IniFile.ReadSections(Strings);
    for I := 0 to Form.ComponentCount-1 do
    begin
      if (Form.Components[i] is TfdcQuery) and
         (Strings.IndexOf(Form.Components[i].name) > -1) then
          IniFile.ReadSectionValues(Form.Components[i].Name,
          TfdcQuery(Form.Components[i]).SQL);
      if (Form.Components[i] is TOracleDataSet) and
         (Strings.IndexOf(Form.Components[i].name) > -1) then
          IniFile.ReadSectionValues(Form.Components[i].Name,
          TOracleDataSet(Form.Components[i]).SQL);
    end;
  finally
    IniFile.Free;
    Strings.Free;
  end;
end;



procedure ShowReportContextHelp(Idx : integer);
begin
  fdcUtils.ShowHelpContent(ExtractFilePath(Application.ExeName) + ExtractFileName(MainForm.HelpFile), Idx);
end;


function GetMonthStr(aMonth : integer):string;
begin
  if (aMonth >= 1) and (aMonth <= 12) then
    Result := Monthes[aMonth]
  else
    raise exception.Create('qReportUtil : Ќеверно указан мес€ц');
end;

function  DateAsText(ADate: TDateTime): string;
begin
  Result := FormatDateTime('dd ' + CaseMonthes[MonthOf(ADate)]
                            +' yyyy г.', ADate);
end;

function GetStrTimeStamp(aDateTime: TDateTime): string;
const
  zero = '0';
var
  y,  mon,  d,  h,  min,  s, ss : word;
  ys, mons, ds, hs, mins  : string;
  procedure LPad(var aStr:string; aChar: char; aLen: integer);
  begin
    while length(aStr) < aLen do aStr := aChar + aStr;
  end;
begin
  DecodeDateTime(aDateTime, y, mon, d, h, min, s, ss);
  ys := IntToStr(y);
  mons := IntToStr(mon);
  ds := IntToStr(d);
  hs := IntToStr(h);
  mins := IntToStr(min);
  LPad(mons, zero, 2);
  LPad(ds, zero, 2);
  LPad(hs, zero, 2);
  LPad(mins, zero, 2);
  Result := ys + mons + ds + '_' + hs + mins;
end;


function  GetFormatSettings(aDateFormat:string = cDfDateFormat; aTimeFormat:string = cDfTimeFormat): TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, Result);
  with Result do
  begin
    ShortDateFormat := aDateFormat;
    LongDateFormat := ShortDateFormat;
    ShortTimeFormat := aTimeFormat;
    LongTimeFormat := ShortTimeFormat;
  end;
end;


End.

