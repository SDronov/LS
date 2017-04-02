unit xParams;

interface

uses
  DB;

type

  TxParams = class;

  IParams = interface
    ['{6BCF8916-D7AF-4B7C-9076-1EF8CE859535}']
    function Add(const AParamName: string; const AParamValue: Variant; const
      ADataType: TFieldType = ftUnknown): TxParams; overload;
    function Add: TParam; overload;
    function GetParams: TParams;
    property AsParams: TParams read GetParams;
  end;

  TxParams = class(TInterfacedObject, IParams)
  private
    FParams: TParams;
  public
    constructor Create();
    destructor Destroy; override;
    function Add(const AParamName: string; const AParamValue: Variant; const
      ADataType: TFieldType = ftUnknown): TxParams; overload;
    function Add: TParam; overload;
    function GetParams: TParams;
    property AsParams: TParams read FParams;
  end;

function CreateParams: IParams;

implementation

uses SysUtils;

function CreateParams: IParams;
begin
  Result := TxParams.Create;
end;

procedure TestIt;
var
 P: TParams;
begin
  P := 
  CreateParams
    .Add('ID1', '')
    .Add('ID2', 1)
    .AsParams;
end;

{ TxParams }

function TxParams.Add(const AParamName: string; const AParamValue: Variant;
  const ADataType: TFieldType): TxParams;
var
  AParam: TParam;
begin
  AParam := TParam.Create(FParams, ptUnknown);
  AParam.DataType := ADataType;
  AParam.Name := AParamName;
  AParam.Value := AParamValue;
  Result := Self;
end;

function TxParams.Add: TParam;
begin
  Result := TParam(FParams.Add);
end;

constructor TxParams.Create;
begin
  FParams := TParams.Create;
end;

destructor TxParams.Destroy;
begin
  FreeAndNil(FParams);
  inherited;
end;

function TxParams.GetParams: TParams;
begin
  Result := FParams;
end;

end.

