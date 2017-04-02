unit FormTuner;

interface

uses
  Classes, FormMngr, Forms, IniFiles;

type

  TFormTuner = class(TBaseFormNotifier)
  private
    procedure HandleForm(AForm: TCustomForm);
    procedure ApplyProperties(AComp: TComponent; PropValues: TStrings);
  protected
    procedure FormCreated(AForm: TCustomForm); override;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

uses
  TypInfo, SysUtils, PropSetIntf;

{ TSQLTextSetter }

constructor TFormTuner.Create;
begin
  inherited;
end;

destructor TFormTuner.Destroy;
begin
  inherited;
end;

procedure TFormTuner.FormCreated(AForm: TCustomForm);
begin
  inherited;
  HandleForm(AForm);
end;

type
  TStrings_ = class(TPersistent)
  protected
    FDefined: TStringsDefined;
    FDelimiter: Char;
    FQuoteChar: Char;
    FNameValueSeparator: Char;
    FUpdateCount: Integer;
  end;

procedure TFormTuner.ApplyProperties(AComp: TComponent; PropValues: TStrings);
var
  I: Integer;
  PropInfo: PPropInfo;
  PropName: String;
  PropValue: String;
  PropWriter: IPropSetter;
begin
  for I := 0 to PropValues.Count - 1 do
  begin
    PropName := PropValues.Names[I];
    PropValue := PropValues.ValueFromIndex[I];
    if PropValue <> '' then
    begin
      PropWriter := FindPropSetter(AComp, PropName);
      if PropWriter <> nil then
          PropWriter.SetProperty(AComp, PropName, PropValue)
      else
      begin
        PropInfo :=  GetPropInfo(AComp, PropName, []);
        if PropInfo <> nil then
          SetPropValue(AComp, PropName, PropValue);
      end;
    end;
  end;
end;

procedure TFormTuner.HandleForm(AForm: TCustomForm);
var
  AComp: TComponent;
  I: Integer;
  CompList: TStrings;
  PropValues: TStrings;
  IniValues: TMemIniFile;
  function GetIniForForm(const TypeName: String): TMemIniFile;
  begin
    Result := nil;
  end;
begin
  IniValues := TMemIniFile.Create('');
  try
    PropLoader.Load(IniValues, AForm.ClassName + '.%');
    CompList := TStringList.Create;
    try
      IniValues.ReadSections(CompList);
      PropValues := TStringList.Create;
      try
        for I := 0 to CompList.Count - 1 do
        begin
           AComp := AForm.FindComponent(Copy(ExtractFileExt(CompList[I]),2,MaxInt));
           if assigned(AComp) then
           begin
             IniValues.ReadSectionValues(CompList[I], PropValues);
             ApplyProperties(AComp, PropValues);
           end;
        end;
      finally
      	// free resources
        PropValues.Free;
      end;  // try/finally
    finally
    	// free resources
      CompList.Free;
    end;  // try/finally
  finally
  	IniValues.Free;
  end;  // try/finally
end;

type
  TStringsSetter = class(TInterfacedObject, IPropSetter)
  public
    function IsApply(AObject: TObject; const PropName: String): Boolean;
    procedure SetProperty(AObject: TObject; const PropName: String;
      const PropValue: String);
  end;

{ TStringsSetter }

function TStringsSetter.IsApply(AObject: TObject;
  const PropName: String): Boolean;
var
  S: string;
  PropInfo: PPropInfo;
  Obj: TObject;
begin
  Obj := nil;
  PropInfo := GetPropInfo(AObject, PropName, [tkClass]);
  if PropInfo <> nil then
    Obj := GetObjectProp(AObject, PropInfo);
  Result :=  Obj is TStrings;
end;

procedure TStringsSetter.SetProperty(AObject: TObject; const PropName,
  PropValue: String);
var
  S: string;
  PropInfo: PPropInfo;
  Strings: TStrings;
begin
  PropInfo := GetPropInfo(AObject, PropName, [tkClass]);

  // пытаемся избежать события onChange
  Strings := TStrings(GetObjectProp(AObject, PropInfo));
  Inc(TStrings_(Strings).FUpdateCount);
  try
    Strings.Text := PropValue;
  finally
    Dec(TStrings_(Strings).FUpdateCount);
  end;
end;

initialization
   FormManager.AddNotifier(TFormTuner.Create);
   RegisterPropSetter(TStringsSetter.Create);

end.


