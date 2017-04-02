unit TransportAcrh;

interface

uses
  Classes, ztvConsts, ztvBase;

type
  TTransportArchive = class
  private
    FFiles: TStrings;
    FArchiveExt: string;
    FDescription: string;
    FPerformer: string;
    FToName: string;
    FInfoType: string;
    FFromName: string;
    FArchiveName: string;
    FMoveMode: Boolean;
  protected
    procedure MakeArchiveName(const Prefix: string; ControlChar: Char);
    procedure MakeArchive(Compressor: TCompBase);
    procedure MakeCover(const FileName: String);
  public
    constructor  Create(const Prefix: string; ControlChar: Char = #0);
    destructor   Destroy; override;
    class function GetDefControlChar: Char;
    class procedure SetDefControlChar(ControlChar: Char);
    procedure AddFile(const FileName: string; const BaseFolder: string = '');
    procedure AddFiles(const FileMask: string; const BaseFolder: string = '');
    procedure SaveTo(const DirName: string);
    property  FromName: string read FFromName write FFromName;
    property  ToName: string read FToName write FToName;
    property  Performer: string read FPerformer write FPerformer;
    property  InfoType: string read FInfoType write FInfoType;
    property  Description: string read FDescription write FDescription;
    property  ArchiveExt: string read FArchiveExt write FArchiveExt;
    property  ArchiveName: string read FArchiveName;
    property  MoveMode: Boolean read FMoveMode write FMoveMode;
  end;

implementation

uses SysUtils, CoverLetterUnit, DateUtils, Windows;

const

  {
    Строка символов для построения таблиц в Dos. Последовательность
    символов соответствует порядку появления новых символов псевдографики
    по мере продвиженияпо таблице по строкам слева направо сверху вниз
   ..можно свериться по таблице символов..
  }
  //                  г   =   T   ¬   ||  |  ||-  +  -|| ||-  -   +  -||  L  _|_ _||
  cDelimiterCodes = #201#205#209#187#186#179#204#216#185#199#196#197#182#200#207#188;

  { размеры таблицы сопроводительного письма }
  cNoWidth   = 6;
  cNameWidth = 14;
  cSizeWidth = 14;
  cTypeWidth = 41;
  cCoverWidth = cNoWidth + cNameWidth + cSizeWidth + cTypeWidth + 5;

  { расширения файлов транспортного архива }
  SCoverFileExt   = '.(s)';

var
  FDefControlChar: char = 'y';

{ TTransportArchive }

procedure TTransportArchive.AddFile(const FileName, BaseFolder: string);
begin
  if FileExists(FileName) then
//    FFiles.Add(Format('"%s"="%s"', [FileName, BaseFolder]);
    FFiles.Add(FileName);
end;

procedure TTransportArchive.AddFiles(const FileMask, BaseFolder: string);
begin
   FFiles.Add(FileMask);
end;

constructor TTransportArchive.Create(const Prefix: string; ControlChar: Char);
begin
  FArchiveExt := '.lzh';
  MakeArchiveName(Prefix, ControlChar);
  FFiles := TStringList.Create;
  TStringList(FFiles).Duplicates := dupIgnore;
  TStringList(FFiles).CaseSensitive := False;
end;

destructor TTransportArchive.Destroy;
begin
  FreeAndNil(FFiles);
  inherited;
end;

class function TTransportArchive.GetDefControlChar: Char;
begin
  Result := FDefControlChar;
end;

procedure TTransportArchive.MakeArchive(Compressor: TCompBase);
const
  SwithValues: array[Boolean] of TSwitch = (swAdd, swMove);
begin
  Compressor.Switch := SwithValues[MoveMode];
  Compressor.RecurseDirs := False;
  Compressor.FileSpec.Assign(FFiles);
  Compressor.StoredDirNames := sdNone;
  Compressor.Compress;
end;

function GetChar(i: integer): string;
const
  SChars = '~!()_-';
begin
  if i <= 9 then
    Result := IntToStr(i)
  else begin
    if i < 36 then
      Result := Chr(i-9+64)
    else
      Result := SChars[i-36+1];
    end;
end;

function DecTo41(Decimal: integer): string;
begin
  Result := '';
  if (Decimal div 41) > 0 then
    Result := DecTo41(Decimal div 41) + GetChar(Decimal mod 41)
  else
    Result := GetChar(Decimal mod 41);
  Result := UpperCase(Result);
end;

function GetEncodedDate: string;
var
Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  DecodeDateTime(Now, Year, Month, Day, Hour, Min, Sec, MSec);
  Result := DecTo41(Day*86400 + Hour*3600 + Min*60 + Sec);
  if Length(Result) < 4 then
    Result := StringOfChar('0', 4-Length(Result)) + Result;
end;

procedure TTransportArchive.MakeArchiveName(const Prefix: string; ControlChar: Char);
//var
//  CurrentTime : TDateTime;
begin
//   CurrentTime := Now;
   if ControlChar = #0 then
     ControlChar := GetDefControlChar;

//   while SecondsBetween(CurrentTime, Now) < 1 do ;

   FArchiveName := Prefix + ControlChar + GetEncodedDate;
end;

class procedure TTransportArchive.SetDefControlChar(ControlChar: Char);
begin
  FDefControlChar := ControlChar;
end;

procedure TTransportArchive.SaveTo(const DirName: string);
var
  Compressor: TCompBase;
begin
  Compressor := CreateComp(ArchiveExt);
  try
   Compressor.ArchiveFile := IncludeTrailingPathDelimiter(DirName)
         + ArchiveName + ArchiveExt;
   MakeArchive(Compressor);
   MakeCover(Compressor.ArchiveFile);
  finally
    Compressor.Free;
  end;
end;

function AnsiToOem(const AnsiStr: string): string;
begin
  SetLength(Result, Length(AnsiStr));
  if Length(Result) > 0 then
    CharToOem(PChar(AnsiStr), PChar(Result));
end;

function Delim(i: integer): char;
begin
  Result := cDelimiterCodes[i];
end;

function CenterString(const AStr: string; const ALength: integer): string;
var
  LeftShift: integer;
begin
  LeftShift := (ALength - Length(AStr)) div 2;
  Result := AnsiToOem(
    StringOfChar(' ', LeftShift) +
    Copy(AStr, 1, ALength) +
    StringOfChar(' ', ALength - LeftShift - (Length(AStr)))
  );
end;

function GetFileSize(const AFileName: string): integer;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(AFileName, faAnyFile, SearchRec) = 0 then
    Result := SearchRec.Size
  else
    Result := 0;
end;

procedure TTransportArchive.MakeCover(const FileName: String);
var
  Cover: TStringList;
  fno, fname, fdscr, fsize: string;
begin
   Cover := TStringList.Create;
   try
     { сформировать заголовок }
     Cover.Add(CenterString('Сопроводительный документ ' + ChangeFileExt(ExtractFileName(FileName), SCoverFileExt)   , cCoverWidth));
     Cover.Add(CenterString('Составлен: ' + FormatDateTime('DD-MM-YY в HH:MM:SS', Now) , cCoverWidth));
     Cover.Add(CenterString('---------------------------------------------------------', cCoverWidth));
     Cover.Add(CenterString('Таможня: ' + FromName                                                     , cCoverWidth));
     Cover.Add(CenterString('Исполнитель: ' + Performer                                , cCoverWidth));
     Cover.Add(CenterString('Кому: ' + ToName                                       , cCoverWidth));
     Cover.Add(CenterString(' '                                                        , cCoverWidth));

     { сформировать шапку таблицы }
     Cover.Add(Delim(1)+   StringOfChar(Delim(2),cNoWidth)   +Delim(3)+   StringOfChar(Delim(2)   ,cNameWidth)   +Delim(3)+   StringOfChar(Delim(2)      ,cSizeWidth)   +Delim(3)+   StringOfChar(Delim(2)        ,cTypeWidth)   +Delim(4));
     Cover.Add(Delim(5)+   CenterString('№'     ,cNoWidth)   +Delim(6)+   CenterString('Имя файла',cNameWidth)   +Delim(6)+   CenterString('Размер файла',cSizeWidth)   +Delim(6)+   CenterString('Тип информации',cTypeWidth)   +Delim(5));
     Cover.Add(Delim(5)+   CenterString('пп'    ,cNoWidth)   +Delim(6)+   CenterString(' '        ,cNameWidth)   +Delim(6)+   CenterString('(байт)'      ,cSizeWidth)   +Delim(6)+   CenterString(' '             ,cTypeWidth)   +Delim(5));
     Cover.Add(Delim(7)+   StringOfChar(Delim(2),cNoWidth)   +Delim(8)+   StringOfChar(Delim(2)   ,cNameWidth)   +Delim(8)+   StringOfChar(Delim(2)      ,cSizeWidth)   +Delim(8)+   StringOfChar(Delim(2)        ,cTypeWidth)   +Delim(9));

     { сформировать содержимое таблицы }
     fno   := IntToStr(1);
     fname := ExtractFileName(FileName);
     fdscr := InfoType;
     fsize := IntToStr(GetFileSize(FileName));
     Cover.Add(Delim(5) +  CenterString(fno     ,cNoWidth)   +Delim(6)+   CenterString(fname      ,cNameWidth)   +Delim(6)+   CenterString(fsize         ,cSizeWidth)   +Delim(6)+   CenterString(fdscr           ,cTypeWidth)   +Delim(5));
     Cover.Add(Delim(14)+  StringOfChar(Delim(2),cNoWidth)   +Delim(15)+  StringOfChar(Delim(2)   ,cNameWidth)   +Delim(15)+  StringOfChar(Delim(2)      ,cSizeWidth)   +Delim(15)+  StringOfChar(Delim(2)        ,cTypeWidth)   +Delim(16));

     Cover.Add('');
     Cover.Add(AnsiToOem(Description));

     { сохранить сопроводительное письмо }
     Cover.SaveToFile(ChangeFileExt(FileName, SCoverFileExt));
   finally
     Cover.Free;
   end;
end;

end.
