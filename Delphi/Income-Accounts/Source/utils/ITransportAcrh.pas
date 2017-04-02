unit ITransportAcrh;

interface

uses
  Classes, TransportAcrh;

type
  TIAccTransportArchive = class;

  TOnFillArchiveEvent = procedure(Archive: TIAccTransportArchive) of object;

  TIAccTransportArchive = class(TTransportArchive)
  private
    FArchPath: string;
  public
    constructor CreateForType(const TAType: string);
    property ArchPath: string read FArchPath;
    procedure Save;
  end;

function CreateTransportArchive(const TAType: string; var Archive:
  TIAccTransportArchive; const LastPath :string = ''): boolean;

procedure MakeTransportArchive(const TAType: string; OnFillArchive: TOnFillArchiveEvent); overload;
procedure MakeTransportArchive(const TAType: string; Lines: TStrings; Descript:
  string; AFileName: string); overload;

implementation

uses
  MainDm, IniFiles, IaccUtils, fdcUtils, SysUtils;

function CreateTransportArchive(const TAType: string; var Archive:
  TIAccTransportArchive; const LastPath :string): boolean;
var
  Path: string;
begin
  Path := LastPath;
  Result :=
    SelectDirectoryEx('Выберите каталог для сохранения транспортного архива',
      '',
    Path, 0);
  if Result then
  begin
    Archive := TIaccTransportArchive.CreateForType(TAType);
    Archive.FArchPath := Path;
  end;
end;

procedure MakeTransportArchive(const TAType: string; Lines: TStrings; Descript:
  string; AFileName: string);
var
  Archive: TIaccTransportArchive;
  FileName: string;
begin
  if CreateTransportArchive(TAType, Archive) then
  begin
    try
     Archive.Description := Descript;
     if (AFileName <> '') and (AFileName[1] = '.') then
       FileName := IncludeTrailingPathDelimiter(GetAppTempDir) +
         ChangeFileExt(Archive.ArchiveName, AFileName)
     else
       FileName := IncludeTrailingPathDelimiter(GetAppTempDir) + AFileName;
     Lines.SaveToFile(FileName);
     Archive.AddFile(FileName);
     Archive.SaveTo(Archive.ArchPath);
    finally
      Archive.Free;
    end;
  end;
end;

procedure MakeTransportArchive(const TAType: string; OnFillArchive: TOnFillArchiveEvent);
var
  Archive: TIaccTransportArchive;
begin
  if CreateTransportArchive(TAType, Archive) then
  begin
    try
      OnFillArchive(Archive);
      Archive.Save;
    finally
      Archive.Free;
    end;
  end;
end;

{ TIAccTransportArchive }

constructor TIAccTransportArchive.CreateForType(const TAType: string);
var
  Ini: TMemIniFile;
  S: string;
begin
  inherited Create(MainData.UserContext('CustomsTTT', '100'));
  Ini := TMemIniFile.Create('');
  try
    S := 'System.TA.' + TAType;
    MainData.GetDBAppParams(Ini, S);
    Self.Performer := Ini.ReadString(S, 'Performer',
      MainData.UserContext('FIO'));
    Self.ToName := Ini.ReadString(S, 'ToName', MainData.UserContext('DefTATo'));
    Self.FromName := MainData.UserContext('CustomsName');
    Self.InfoType := Ini.ReadString(S, 'InfoType', '');
    MoveMode := True;
  finally
    Ini.Free;
  end;
end;

procedure TIAccTransportArchive.Save;
begin
  SaveTo(ArchPath);
end;

end.

