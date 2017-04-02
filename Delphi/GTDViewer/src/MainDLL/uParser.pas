unit uParser;

interface

uses Classes, Dialogs, SysUtils;

type
  EParserFatalError=class(Exception);

//  TParser=class;

  TCustomParserObject=class(TObject)
  private
    FObjectName, FObjectType: string;

  protected
    FScriptDir: string;
    procedure CheckParams(AProcedureName: string; AParamsCount: integer; AParams: TStrings);
  public
    constructor Create(AScriptDir, AObjectName, AObjectType: string);virtual;

    procedure ExecProcedure(AOwner, AProcedureName: string; AParams: TStrings);virtual;abstract;

    property ObjectName: string read FObjectName;
    property ObjectType: string read FObjectType;
  end;

  TCustomParserObjects=class(TStringList)
  private

  protected
    FScriptDir: string;
  public
    constructor Create;virtual;
    destructor Destroy;override;

    procedure ExecProcedure(AOwner, AProcedureName: string; AParams: TStrings);
    procedure AddObj(AParams: TStrings);
    procedure CreateObj(AObjectName, AObjectType: string);virtual;abstract;
    procedure ExecScript(AFileName: string);
    function GetParserObjectByName(AName: string): TCustomParserObject;
    procedure ClearAll;
  end;

  TParser=class(TObject)
  private
    FScript: TStringList;
    FParserObjects: TCustomParserObjects;
    FX, FY: integer;

    function EndOfScript: boolean;
    function NextChar: Char;
    function PrevChar: Char;
    function FirstChar: Char;
    function GetParserObject(AIndex: integer): TCustomParserObject;
  public
    constructor Create(AParserObjects: TCustomParserObjects);virtual;
    destructor Destroy;override;

    procedure LoadScript(FileName: string);
    procedure ParseScript;
    procedure ClearParser;

    property ParserObjects[AIndex: integer]: TCustomParserObject read GetParserObject;
  end;

implementation

{ TCustomParserObject }

procedure TCustomParserObject.CheckParams(AProcedureName: string;AParamsCount: integer; AParams: TStrings);
begin
  if AParamsCount<>AParams.Count then
    Raise EParserFatalError.Create('Неверное число аргументов процедуры "'+AProcedureName+'"!');
end;

constructor TCustomParserObject.Create(AScriptDir, AObjectName, AObjectType: string);
begin
  inherited Create;
  FObjectName:=AObjectName;
  FObjectType:=AObjectType;
  FScriptDir:=AScriptDir;
end;

{ TCustomParserObjects }

constructor TCustomParserObjects.Create;
begin
  inherited Create;

end;

destructor TCustomParserObjects.Destroy;
begin

  inherited Destroy;
end;

procedure TCustomParserObjects.AddObj(AParams: TStrings);
begin
  if AParams.Count<>2 then
    raise EParserFatalError.Create('Неверное число аргументов процедуры "NewObject"!');
  Add(AParams[0]);
  CreateObj(AParams[0],AParams[1]);
end;

procedure TCustomParserObjects.ExecProcedure(AOwner, AProcedureName: string;
  AParams: TStrings);
begin
  if (AOwner='') then
    begin
      if (AProcedureName='NewObject') then
        AddObj(AParams);
    end
  else
    TCustomParserObject(Objects[Count-1]).ExecProcedure(AOwner,AProcedureName,AParams);
end;

procedure TCustomParserObjects.ExecScript(AFileName: string);
var
  LParser: TParser;
begin
  LParser:=TParser.Create(Self);
  try
    LParser.LoadScript(AFileName);
    FScriptDir:=ExtractFilePath(AFileName);
    LParser.ParseScript;
  finally
    LParser.Free;
  end;
end;

function TCustomParserObjects.GetParserObjectByName(AName: string): TCustomParserObject;
var
  i: integer;
begin
  i:=IndexOf(AName);
  if i>=0 then Result:=TCustomParserObject(Objects[i])
  else Raise Exception.Create('Объект '+AName+' не создан!');
end;

procedure TCustomParserObjects.ClearAll;
begin
  while Count>0 do
    begin
      TCustomParserObject(Objects[0]).Free;
      Delete(0);
    end;
end;

{TParser}

constructor TParser.Create(AParserObjects: TCustomParserObjects);
begin
  inherited Create;
  FScript:=TStringList.Create;
  FParserObjects:=AParserObjects;
end;

destructor TParser.Destroy;
begin
  ClearParser;
  FScript.Free;
  inherited Destroy;
end;

{TParser.private}

function TParser.EndOfScript: boolean;
begin
  Result:=False;
  if FScript.Count=0
  then
    Result:=True
  else
  if (FX=FScript.Count-1) and (FY=Length(FScript[FX]))
  then
    begin
      if FScript[FX][FY]<>'}' then
        Raise EParserFatalError.Create('Неверное завершение скрипта. Ожидается "}"!')
      else
        Result:=True;
    end;
end;

function TParser.NextChar: Char;
begin
  if not EndOfScript then
    begin
      if FY<Length(FScript[FX]) then
        Inc(FY)
       else
        begin
          Inc(FX);
          FY:=1;
        end;
      Result:=FScript[FX][FY];
    end;
end;

function TParser.PrevChar: Char;
begin
  if (FScript.Count>0) and ((FX<>0) or (FY<>1)) then
    begin
      if FY>1 then
        Dec(FY)
      else
        begin
          Dec(FX);
          FY:=Length(FScript[FX]);
        end;
      Result:=FScript[FX][FY];
    end;
end;

function TParser.FirstChar: Char;
begin
  if FScript.Count>0 then Result:=FScript[0][1];
end;

function TParser.GetParserObject(AIndex: integer): TCustomParserObject;
begin
  Result:=TCustomParserObject(FParserObjects[AIndex]);
end;

{TParser.public}

procedure TParser.LoadScript(FileName: string);
var
  LFileScript:Text;
  Str:string;
begin
  try
    Assign(LFileScript,FileName);
    Reset(LFileScript);
  except
    MessageDlg('Не удалось открыть файл '+FileName,mtError,[mbOK],0);
    Exit;
  end;
  while not SeekEof(LFileScript) do begin
    ReadLn(LFileScript,Str);
    Str:=Trim(Str);
    if Copy(Str,1,2)='//' then Continue;
    fScript.Add(Str);
  end;
  System.Close(LFileScript);
  FX:=0;
  FY:=1;
end;

procedure TParser.ParseScript;
var
  k: integer;
  s: string;
  cc: Char;
  LOwnerName, LProcedureName : string;
  LParams: TStringList;
  ExitFlag: boolean;
begin
  try
    if fScript.Count=0 then
      Raise EParserFatalError.Create('Файл скрипта не загружен!');
    LParams:=TStringList.Create;
    try
      cc:=FirstChar;
      while not EndOfScript do
        begin
          case cc of
          '{':begin
                s:='';
              end;
          '}':begin

              end;
          '.':begin
                LOwnerName:=Trim(s);
                s:='';
              end;
          '(':begin
                LProcedureName:=Trim(s);
                s:='';
              end;
          '"':begin
                ExitFlag:=False;
                while not ExitFlag do
                  begin
                    cc:=NextChar;
                    if (EndOfScript) then
                      Raise EParserFatalError.Create('Ожидается """ или ";"! Строка '+IntToStr(FX)+', символ '+IntToStr(FY));
                    if (cc='"') then
                      begin
                        cc:=NextChar;
                        if (cc in ['+',',',')',';',' ']) then ExitFlag:=True
                        else
                        if cc<>'"' then
                          Raise EParserFatalError.Create('Ожидается """! Строка '+IntToStr(FX)+', символ '+IntToStr(FY));
                        cc:=PrevChar;
                      end
                    else
                      s:=s+cc;
                  end;
              end;
          ',':begin
                LParams.Add(Trim(s));
                s:='';
              end;
          ')':begin
                LParams.Add(Trim(s));
                s:='';
              end;
          ';':begin
                if LProcedureName<>'' then
                  begin
                    k:=FParserObjects.IndexOf(LOwnerName);
                    if (LOwnerName<>'') and (k<0) then
                      Raise EParserFatalError.Create('Объект '+LOwnerName+' не создан! Строка '+IntToStr(FX));
                    FParserObjects.ExecProcedure(LOwnerName,LProcedureName,LParams);
                  end;
                s:='';
                LOwnerName:='';
                LProcedureName:='';
                LParams.Clear;
              end;
          else
            s:=s+cc;
          end;
          cc:=NextChar;
        end;
    finally
      LParams.Free;
    end;
  except
    ClearParser;
    Raise;
  end;
end;

procedure TParser.ClearParser;
begin
  FScript.Clear;
end;

end.
