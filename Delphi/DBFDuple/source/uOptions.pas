unit uOptions;

interface

type
  TOptions = class
    FFileName: string;
  public
    doPack   : boolean;
    Constructor Create;
    procedure Load;
    procedure Save;
  published
    property FileName : string read FFileName;
  end;

const

  secDBF      = 'DBF';
    cDoPack   = 'doPack';
    dfDoPack  = False;


implementation

uses
  Forms,
  SysUtils,
  IniFiles;

Constructor TOptions.Create;
begin
  FFileName := ChangeFileExt(Application.ExeName, '.ini');
end;

procedure TOptions.Load;
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  doPack := Ini.ReadBool(secDBF, cDoPack, dfDoPack);

  Ini.Free;
end;

procedure TOptions.Save;
begin
end;

end.
 