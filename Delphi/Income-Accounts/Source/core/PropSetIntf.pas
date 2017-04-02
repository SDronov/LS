unit PropSetIntf;

interface

uses
  Classes, IniFiles;

type

  IPropSetter = interface
   ['{B1BE223C-8ED4-4D8B-B5A2-1C478BF2E862}']
    function IsApply(AObject: TObject; const PropName: String): Boolean;
    procedure SetProperty(AObject: TObject; const PropName, PropValue: String);
  end;

  IPropLoader = interface
    ['{6448A1E7-50AC-4C3A-BBA1-E1B29C4EC946}']
     procedure  Load(IniMem: TMemIniFile; const ASectionName: string = ''; const APropName: string = '');
  end;

  TIniPropLoader = class(TInterfacedObject, IPropLoader)
  private
    FIniFile: TMemIniFile;
  protected
    procedure LoadFromFile(const FileName: string);
  public
    constructor  Create(const AFileName: string = ''); overload;
    constructor  Create(const Lines: TStrings); overload;
    procedure Load(IniMem: TMemIniFile; const ASectionName: String = '';
      const APropName: String = '');
    destructor Destroy; override;
  end;

  procedure RegisterPropSetter(ASetter: IPropSetter);
  procedure UnRegisterPropSetter(ASetter: IPropSetter);
  function FindPropSetter(AObject: TObject; const PropName: String): IPropSetter;

  procedure SetPropLoader(ALoader: IPropLoader);
  function  PropLoader: IPropLoader;

implementation

uses
  SysUtils, StrUtils;

type
   TStringListEx = class(TStringList)
  protected
    procedure SetTextStr(const Value: string); override;
   end;

var
  FSetterList: TInterfaceList;
  FPropLoader: IPropLoader;


function  PropLoader: IPropLoader;
begin
  if FPropLoader = nil then
      FPropLoader := TIniPropLoader.Create();
  Result := FPropLoader;
end;

function FindPropSetter(AObject: TObject; const PropName: String): IPropSetter;
var
  I: Integer;
begin
  for I := 0 to FSetterList.Count - 1 do    // Iterate
  begin
    Result := IPropSetter(FSetterList[I]);
    if Result.IsApply(AObject, PropName) then
       Exit;
  end;    // for
  Result := nil;
end;

procedure RegisterPropSetter(ASetter: IPropSetter);
begin
  if FSetterList.IndexOf(ASetter) < 0 then
       FSetterList.Add(ASetter);
end;

procedure SetPropLoader(ALoader: IPropLoader);
begin
  FPropLoader := ALoader;
end;

procedure UnRegisterPropSetter(ASetter: IPropSetter);
begin
  FSetterList.Remove(ASetter);
end;

procedure  Initialize;
begin
  FSetterList := TInterfaceList.Create;
end;

procedure  Finalize;
begin
  FPropLoader := nil;
  FreeAndNil(FSetterList);
end;


function Like(p1: PChar; l1: Integer; p2: PChar; l2: Integer;
  percent_char, underline_char, escape_char: Char): Boolean; forward;

function LikeStr(const AStr, APatternStr: string; APercent, AUnderline: Char): Boolean;
begin
  Result := Like(PChar(AStr), Length(AStr), PChar(APatternStr),
    Length(APatternStr), APercent, AUnderline, #0);
end;

function Like(p1: PChar; l1: Integer; p2: PChar; l2: Integer;
  percent_char, underline_char, escape_char: Char): Boolean;
var
  c: Char;
  AEscapeFlag: Boolean;
begin
  AEscapeFlag := False;
  repeat
    Dec(l2);
    if l2 < 0 then Break;
    c := p2^;
    p2 := p2 + 1;
    if (escape_char <> #0) and not AEscapeFlag and (c = escape_char) then
    begin
      AEscapeFlag := True;
      Continue;
    end;
    if not AEscapeFlag and (c = percent_char) then
    begin
      if l2 = 0 then
      begin
        Result := True;
        Exit;
      end;
      while l1 > 0 do
      begin
        if Like(p1, l1, p2, l2, percent_char, underline_char, escape_char) then
        begin
          Result := True;
          Exit;
        end;
        p1 := p1 + 1;
        Dec(l1);
      end;
      Result := False;
      Exit;
    end;
    Dec(l1);
    if l1 < 0 then
    begin
      Result := False;
      Exit;
    end;
    if (AEscapeFlag or (c <> underline_char)) and (c <> p1^) then
    begin
      Result := False;
      Exit;
    end;
    AEscapeFlag := False;
    p1 := p1 + 1;
  until False;
  Result := l1 = 0;
end;

{ TStringListEx }

procedure TStringListEx.SetTextStr(const Value: string);
var
  P, Start: PChar;
  S: string;
  S1: String;
begin
  S1 := '';
  BeginUpdate;
  try
    Clear;
    P := Pointer(Value);
    if P <> nil then
      begin
        while P^ <> #0 do
        begin
          Start := P;
          while not (P^ in [#0, #10, #13]) do Inc(P);
          if (P > Start) and ((P-1)^ = '\') then
          begin
             SetString(S, Start, P - Start - 1);
             if S1 <> '' then
                S1 := S1 + #13#10;
             S1 := S1 + S;
          end
          else
          begin
            SetString(S, Start, P - Start);
            if S1 <> '' then
              S1 := S1 + #13#10;
            Add(S1 + S);
            S1 := '';
          end;
          if P^ = #13 then Inc(P);
          if P^ = #10 then Inc(P);
        end;
        if S1 <> '' then
          Add(S1);
    end;
  finally
    EndUpdate;
  end;
end;

{ TFilePropLoader }

constructor TIniPropLoader.Create(const AFileName: string);
var
  Lines: TStrings;
  FileName: String;
begin
  Lines := TStringListEx.Create;
  try
    FileName := IfThen(AFileName = '', ChangeFileExt(ParamStr(0), '.properties'), AFileName);
    if FileExists(FileName) then
        Lines.LoadFromFile(FileName);
    Create(Lines);
  finally
    Lines.Free;
  end;
end;

constructor TIniPropLoader.Create(const Lines: TStrings);
begin
  FIniFile := TMemIniFile.Create('');
  FIniFile.SetStrings(Lines);
end;

destructor TIniPropLoader.Destroy;
begin
  FreeAndNil(FIniFile);
  inherited;
end;

procedure TIniPropLoader.Load(IniMem: TMemIniFile; const ASectionName,
  APropName: String);
var
  I, J: Integer;
  Sections: TStrings;
  Props: TStrings;
  SectionName: string;
  PropName: string;
begin
  SectionName := IfThen(ASectionName = '', '%', UpperCase(ASectionName));
  PropName := IfThen(APropName = '', '%', UpperCase(APropName));
  IniMem.Clear;

  Sections := TStringList.Create;
  try
    FIniFile.ReadSections(Sections);
    Props := TStringList.Create;
    try
      for I := 0 to Sections.Count - 1 do    // Iterate
      begin
        if LikeStr(UpperCase(Sections[I]), SectionName, '%', '_') then
        begin
          FIniFile.ReadSectionValues(Sections[I], Props);
          for J := 0 to Props.Count - 1 do
            if LikeStr(UpperCase(Props.Names[J]), PropName, '%', '_') then
                IniMem.WriteString(Sections[I], Props.Names[J], Props.ValueFromIndex[J]);
        end;
      end;    // for
    finally
    	// free resources
      Props.Free;
    end;  // try/finally
  finally
    // free resources
  	Sections.Free;
  end;  // try/finally
end;

procedure TIniPropLoader.LoadFromFile(const FileName: string);
var
  Lines: TStrings;
begin
  Lines := TStringListEx.Create;
  try
    Lines.LoadFromFile(FileName);
    FIniFile.SetStrings(Lines);
  finally
    Lines.Free;
  end;
end;


initialization
  Initialize;

finalization
  Finalize;

end.
