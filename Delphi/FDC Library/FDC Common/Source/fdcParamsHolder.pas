unit fdcParamsHolder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, DB, Contnrs, Variants;

type
  TAcceptedSource = (asParam, asField);
  TAcceptedSources = set of TAcceptedSource;

const
  AllAcceptedSources = [asParam, asField];

type
  TfdcParams = class;
  TfdcParamsHolder = class;

  { TfdcParam }
  TfdcParam = class(TParam)
  private
    FSourceField: TField;
    FSourceParamName: string;
    FAcceptedSources: TAcceptedSources;

    function GetParamsHolder: TfdcParamsHolder;
    procedure SetSourceField(const Value: TField);
    procedure SetValue(AValue: Variant; ADataType: TFieldType);
  protected
    function GetDisplayName: string; override;

    property ParamsHolder: TfdcParamsHolder read GetParamsHolder;
  public
    constructor Create(AParams: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property SourceField: TField read FSourceField write SetSourceField;
    property SourceParamName: string read FSourceParamName write FSourceParamName;
    property AcceptedSources: TAcceptedSources read FAcceptedSources write FAcceptedSources default AllAcceptedSources;
  end;

  { TfdcParams }
  TfdcParams = class(TParams)
  private
    FOwner: TfdcParamsHolder;

    function GetItem(i: integer): TfdcParam;
    procedure SetItem(i: integer; const Value: TfdcParam);
  protected
    function GetOwner: TPersistent; override;

    property ParamsHolder: TfdcParamsHolder read FOwner;
  public
    constructor Create(AOwner: TPersistent);

    procedure Fill(ADstParams: TParams);
    procedure FillBy(ASrcParams: TParams; ADoAdd: boolean = True); overload;
    procedure FillBy(ADataset: TDataset; ADoAdd: boolean = True); overload;

    function FindParam(const AParamName: string): TfdcParam;
    function ParamByName(const AParamName: string): TfdcParam;

    property Items[i: integer]: TfdcParam read GetItem write SetItem; default;
  end;

  { TfdcParamsHolder }
  TfdcParamsHolder = class(TComponent)
  private
    FParams: TfdcParams;
    FDataset: TDataset;
    FDefaultAcceptedSources: TAcceptedSources;
    FOnUpdateParams: TNotifyEvent;

    function GetParams: TfdcParams;
    procedure SetParams(const Value: TfdcParams);
    procedure SetDataset(const Value: TDataset);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure UpdateParams;

    property Params: TfdcParams read GetParams write SetParams;
    property Dataset: TDataset read FDataset write SetDataset;
    property DefaultAcceptedSources: TAcceptedSources read FDefaultAcceptedSources write FDefaultAcceptedSources default AllAcceptedSources;
    property OnUpdateParams: TNotifyEvent read FOnUpdateParams write FOnUpdateParams;
  end;

implementation

{ TfdcParam }

constructor TfdcParam.Create(AParams: TCollection);
begin
  inherited Create(AParams);

  if Assigned(ParamsHolder) then
    FAcceptedSources := ParamsHolder.DefaultAcceptedSources;
end;

function TfdcParam.GetParamsHolder: TfdcParamsHolder;
begin
  if Collection is TfdcParams then
    Result := (Collection as TfdcParams).ParamsHolder
  else
    Result := nil;  
end;

procedure TfdcParam.SetSourceField(const Value: TField);
begin
  if Assigned(FSourceField) then
    FSourceField.RemoveFreeNotification(ParamsHolder);
  FSourceField := Value;
  if Assigned(FSourceField)  and Assigned(ParamsHolder) then
    FSourceField.FreeNotification(ParamsHolder);
end;

procedure TfdcParam.SetValue(AValue: Variant; ADataType: TFieldType);
begin
  Value := AValue;
  if DataType = ftUnknown then
    DataType := ADataType;
end;

function TfdcParam.GetDisplayName: string;
var
  ParName, FldName: string;
begin
  Result := inherited GetDisplayName;

  { param name }
  if asParam in AcceptedSources then
    if SourceParamName <> '' then
      ParName := SourceParamName
    else
      ParName := Name
  else
    ParName := '';      

  { field name }
  if asField in AcceptedSources then
    if Assigned(SourceField) then
      FldName := SourceField.FieldName
    else
      if Assigned(Dataset) and
         Assigned(Dataset.FindField(Name)) then
        FldName := Name
      else
        FldName := ''    
  else
    FldName := '';

  { make display string }  
  if (ParName <> '') or
     (FldName <> '') then
    Result := Result + ' (' + ParName + '/' + FldName + ')';
end;

procedure TfdcParam.Assign(Source: TPersistent);
begin
  inherited;
  if Source is TfdcParam then
  begin
    SourceField     := (Source as TfdcParam).SourceField;
    SourceParamName := (Source as TfdcParam).SourceParamName;
    AcceptedSources := (Source as TfdcParam).AcceptedSources;
  end;
end;

{ TfdcParams }

constructor TfdcParams.Create(AOwner: TPersistent);
begin
  inherited Create(TfdcParam);
  if AOwner is TfdcParamsHolder then
    FOwner := AOwner as TfdcParamsHolder;
end;

function TfdcParams.GetItem(i: integer): TfdcParam;
begin
  Result := (inherited Items[i]) as TfdcParam;
end;

procedure TfdcParams.SetItem(i: integer; const Value: TfdcParam);
begin
  inherited SetItem(i, TCollectionItem(Value));
end;

function TfdcParams.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TfdcParams.FindParam(const AParamName: string): TfdcParam;
begin
  Result := (inherited FindParam(AParamName)) as TfdcParam;
end;

function TfdcParams.ParamByName(const AParamName: string): TfdcParam;
begin
  Result := (inherited ParamByName(AParamName)) as TfdcParam;
end;

procedure TfdcParams.Fill(ADstParams: TParams);
var
  i: integer;
  Param: TParam;
begin
  for i:=0 to Count-1 do
  begin
    Param := ADstParams.FindParam(Items[i].Name);
    if Assigned(Param) then
    begin
      Param.Value := Items[i].Value;
      if Param.DataType = ftUnknown then
        Param.DataType := Items[i].DataType;
    end;
  end;
end;

procedure TfdcParams.FillBy(ASrcParams: TParams; ADoAdd: boolean = True);
var
  i, j: integer;
  SrcParam: TParam;
  Param, DstParam: TfdcParam;
  SaveParams: TfdcParams;
begin
  if not Assigned(ASrcParams) then
    Exit;

  { update source params before transferring
    params between TfdcParamsHolder objects }
  SaveParams := nil;
  if (ASrcParams is TfdcParams) and
     Assigned((ASrcParams as TfdcParams).ParamsHolder) then
  begin
    SaveParams := TfdcParams.Create(ParamsHolder);
    SaveParams.Assign(ASrcParams);
    if assigned((ASrcParams as TfdcParams).ParamsHolder) then
        (ASrcParams as TfdcParams).ParamsHolder.UpdateParams;
  end;

  for i:=0 to ASrcParams.Count-1 do
  begin
    SrcParam := ASrcParams[i];

    { find dest param }
    DstParam := FindParam(SrcParam.Name);

    { fill dest params by source param }
    for j:=0 to Count-1 do
    begin
      Param := Items[j];
      if (AnsiCompareText(Param.SourceParamName, SrcParam.Name) = 0) or
         (
           (AnsiCompareText(Param.Name, SrcParam.Name) = 0) and
           (Param.SourceParamName = '')
         ) then
      begin
        if asParam in Param.AcceptedSources then
          Param.SetValue(SrcParam.Value, SrcParam.DataType);
      end;
    end;

    { create new dest param }
    if (DstParam = nil) and ADoAdd then
    begin
      DstParam := TfdcParam.Create(Self);
      DstParam.Name := SrcParam.Name;
      DstParam.SetValue(SrcParam.Value, SrcParam.DataType);
    end;
  end;

  { restore source params after transferring
    params between TfdcParamsHolder objects }
  if Assigned(SaveParams) then
    ASrcParams.Assign(SaveParams);
end;

procedure TfdcParams.FillBy(ADataset: TDataset; ADoAdd: boolean = True);
var
  i: integer;
  Field: TField;
  Param: TfdcParam;
begin
  if not Assigned(ADataset) then
    Exit;

  { fill params by dataset field values }
  for i:=0 to ADataset.Fields.Count - 1 do
  begin
    Field := ADataset.Fields[i];
    Param := FindParam(Field.FieldName) as TfdcParam;
    if (Param = nil) and ADoAdd then
    begin
      Param := TfdcParam.Create(Self);
      Param.Name := Field.FieldName;
      Param.AcceptedSources := [asField];
    end;
    if (Assigned(Param)) and
       (Assigned(Field)) and
       (asField in Param.AcceptedSources) and
       (Field.DataSet.Active) and
       (not Field.DataSet.IsEmpty) then
      Param.SetValue(Field.Value, Field.DataType);
  end;

  { fill params by source field values }
  for i:=0 to Count-1 do
  begin
    Param := Items[i];
    Field := Items[i].SourceField;
    if (Assigned(Param)) and
       (Assigned(Field)) and
       (asField in Param.AcceptedSources) and
       (Field.DataSet.Active) and
       (not Field.DataSet.IsEmpty) then
      Param.SetValue(Field.Value, Field.DataType);
  end;
end;

{ TfdcParamsHolder }

constructor TfdcParamsHolder.Create(AOwner: TComponent);
begin
  inherited;
  FParams := TfdcParams.Create(Self);
  FDefaultAcceptedSources := AllAcceptedSources;
end;

destructor TfdcParamsHolder.Destroy;
begin
  FParams.Free;
  inherited;
end;

function TfdcParamsHolder.GetParams: TfdcParams;
begin
  Result := FParams;
end;

procedure TfdcParamsHolder.SetDataset(const Value: TDataset);
begin
  if Assigned(FDataset) then
    FDataset.RemoveFreeNotification(Self);
  FDataset := Value;
  if Assigned(FDataset) then
    FDataset.FreeNotification(Self);
end;

procedure TfdcParamsHolder.SetParams(const Value: TfdcParams);
begin
  FParams.Assign(Value);
end;

procedure TfdcParamsHolder.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: integer;
begin
  inherited;
  if Operation = opRemove then
  begin
    { dataset }
    if (AComponent is TDataset) and
       (Dataset = AComponent) then
      Dataset := nil;

    { field }  
    if (AComponent is TField) then
      for i:=0 to Params.Count-1 do
        if Params[i].SourceField = AComponent then
          Params[i].SourceField := nil;
  end;
end;

procedure TfdcParamsHolder.UpdateParams;
begin
  { update params by dataset }
  Params.FillBy(Dataset);

  { fire OnUpdateParams event }
  if Assigned(FOnUpdateParams) then FOnUpdateParams(Self);
end;

end.

