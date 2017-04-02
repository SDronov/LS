unit fdcObjectLinkEdit;

interface

uses
  Windows, Forms, Classes, Controls, cxEdit, cxDBEdit, DB, Messages,
  SysUtils, Variants, cxTextEdit, fdcObjectCore, fdcObjectServices,
  fdcParamsHolder;

type
  TfdcObjectLinkEdit = class;

  { TfdcObjectLinkEditDataBinding }
  TfdcObjectLinkEditDataBinding = class(TcxDBTextEditDataBinding)
  private
    FDataKeyField: string;
    FTypeSysName: string;
    FSearchFormClass: string;

    function CanAcceptObject(const AObject: TfdcObject): boolean;
    procedure AcceptObject(const AObject: TfdcObject);
    function GetKeyField: TField;
    function GetEdit: TfdcObjectLinkEdit;
    procedure SetTypeSysName(const Value: string);
    procedure SetSearchFormClass(const Value: string);
  protected
    property Edit: TfdcObjectLinkEdit read GetEdit;
  public
    constructor Create(AEdit: TcxCustomEdit); override;
    procedure Assign(Source: TPersistent); override;
    property KeyField: TField read GetKeyField;
  published
    property DataKeyField: string read FDataKeyField write FDataKeyField;
    property TypeSysName: string read FTypeSysName write SetTypeSysName;
    property SearchFormClass: string read FSearchFormClass write SetSearchFormClass;
  end;

  { TfdcObjectLinkEdit }
  TOnBeforeAcceptObjectEvent = procedure (Sender: TObject; AObject: TfdcObject; var Accept : boolean) of object;
  TOnAfterAcceptObjectEvent = TNotifyEvent;
  TfdcObjectLinkEdit = class(TcxDBButtonEdit)
  private
    FAcceptObjects: boolean;
    FSearchForm: TForm;

    FOnBeforeAcceptObject: TOnBeforeAcceptObjectEvent;
    FOnAfterAcceptObject: TOnAfterAcceptObjectEvent;
    FObjectServices: IfdcObjectServices;
    FParamsHolder: TfdcParamsHolder;

    function GetObjectLinkEditDataBinding: TfdcObjectLinkEditDataBinding;
    procedure WMClear(var Message: TMessage); message WM_CLEAR;
    function GetField: TField;
    function GetKeyField: TField;
    function CanAcceptDragSource(Source: TObject): boolean;
    function GetSearchButton: TcxEditButton;
    function GetParams: TParams;
    procedure SetParamsHolder(const Value: TfdcParamsHolder);
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoSearchFinished(const ADragObject: TfdcDragObject);
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure DblClick; override;
    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
    procedure PropertiesChanged(Sender: TObject); override;

    property ObjectLinkEditDataBinding: TfdcObjectLinkEditDataBinding read GetObjectLinkEditDataBinding;
    property SearchButton: TcxEditButton read GetSearchButton;
    property Params: TParams read GetParams;
  public
  	 constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean); override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;

    procedure AcceptObject(const AObject: TfdcObject);
    function CanAcceptObject(const AObject: TfdcObject): boolean;

    property ObjectServices: IfdcObjectServices read FObjectServices write FObjectServices;
    property ParamsHolder: TfdcParamsHolder read FParamsHolder write SetParamsHolder;
    property Field: TField read GetField;
    property KeyField: TField read GetKeyField;
  published
  	 property AcceptObjects: boolean read FAcceptObjects write FAcceptObjects default True;
    property OnBeforeAcceptObject: TOnBeforeAcceptObjectEvent read FOnBeforeAcceptObject write FOnBeforeAcceptObject;
    property OnAfterAcceptObject: TOnAfterAcceptObjectEvent read FOnAfterAcceptObject write FOnAfterAcceptObject;
  end;

implementation

uses fdcUtils, cxContainer;

{ TfdcObjectLinkEditDataBinding }

constructor TfdcObjectLinkEditDataBinding.Create(AEdit: TcxCustomEdit);
begin
  inherited;
  SearchFormClass := '';
end;

function TfdcObjectLinkEditDataBinding.CanAcceptObject(
  const AObject: TfdcObject): boolean;
  function ObjectIsTypeOf(AObject: TfdcObject; TypeNames: string): boolean;
  var
    P: Integer;
    TypeSysName: string;
  begin
    P := 1;
    while True do
    begin
      TypeSysName := ExtractFieldName(TypeNames, P);
      if TypeSysName = '' then
      begin
        Result := False;
        Exit;
      end;
      if AObject.IsOfType(TypeSysName) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
begin
  Result :=
    Assigned(DataSource) and
    Assigned(Field) and
    Assigned(KeyField) and not KeyField.ReadOnly and
    (
      (not Assigned(AObject)) or
      (
        (TypeSysName <> '') and
//        AObject.IsOfType(TypeSysName)
          ObjectIsTypeOf(AObject, TypeSysName)  
      )
    );
end;

procedure TfdcObjectLinkEditDataBinding.AcceptObject(
  const AObject: TfdcObject);
begin
  { set object name field value }
  if Assigned(Field) then
  begin
    Field.DataSet.Edit;
    if Assigned(AObject) then
      Field.AsVariant := AObject.ObjName
    else
      Field.Clear;
   end;

  { set object id field value }
  if Assigned(KeyField) then
  begin
    Field.DataSet.Edit;
    if Assigned(AObject) then
      KeyField.AsVariant := AObject.ID
    else
      KeyField.Clear;
   end;
end;

function TfdcObjectLinkEditDataBinding.GetKeyField: TField;
begin
  Result := nil;
  if  Assigned(DataSource) and Assigned(DataSource.DataSet) then
      Result := DataSource.DataSet.FindField(DataKeyField);
end;

function TfdcObjectLinkEditDataBinding.GetEdit: TfdcObjectLinkEdit;
begin
  Result := (inherited Edit) as TfdcObjectLinkEdit;
end;

procedure TfdcObjectLinkEditDataBinding.SetTypeSysName(
  const Value: string);
begin
  FTypeSysName := Trim(Value);
end;

procedure TfdcObjectLinkEditDataBinding.SetSearchFormClass(
  const Value: string);
begin
  FSearchFormClass := Trim(Value);
  if Assigned(Edit.SearchButton) then
    Edit.SearchButton.Visible := FSearchFormClass <> '';
end;

procedure TfdcObjectLinkEditDataBinding.Assign(Source: TPersistent);
begin
  if Source is TfdcObjectLinkEditDataBinding then
    with Source as TfdcObjectLinkEditDataBinding do
    begin
      Self.DataKeyField := DataKeyField;
    end;
  inherited Assign(Source);
end;

{ TfdcObjectLinkEdit }

procedure TfdcObjectLinkEdit.WMClear(var Message: TMessage);
begin
    AcceptObject(nil);
end;

procedure TfdcObjectLinkEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key in [vk_Back, vk_Delete]) then
    PostMessage(Handle, WM_CLEAR, 0 , 0);
  inherited;
end;

procedure TfdcObjectLinkEdit.DoSearchFinished(const ADragObject: TfdcDragObject);
begin
  DragDrop(ADragObject, 0 , 0);
end;

class function TfdcObjectLinkEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TfdcObjectLinkEditDataBinding;
end;

function TfdcObjectLinkEdit.GetObjectLinkEditDataBinding: TfdcObjectLinkEditDataBinding;
begin
  Result := DataBinding as TfdcObjectLinkEditDataBinding;
end;

function TfdcObjectLinkEdit.CanAcceptDragSource(Source: TObject): boolean;
begin
  Result :=
    Assigned(Source) and
    (Source is TfdcDragObject) and
    (TfdcDragObject(Source).Sender <> Self) and
    (TfdcDragObject(Source).Objects.Count = 1) and
    CanAcceptObject(TfdcDragObject(Source).Objects[0]);
end;

function TfdcObjectLinkEdit.CanAcceptObject(const AObject: TfdcObject): boolean;
begin
  Result :=  Assigned(KeyField) and not KeyField.ReadOnly and
    AcceptObjects and ObjectLinkEditDataBinding.CanAcceptObject(AObject);
end;

procedure TfdcObjectLinkEdit.AcceptObject(const AObject: TfdcObject);
var
  Accept : boolean;
begin
  { check possible object acceptance }
  Accept := CanAcceptObject(AObject);

  { fire before accept object event }
  if Accept and
     Assigned(OnBeforeAcceptObject) then
    OnBeforeAcceptObject(Self, AObject, Accept);

  { exit if object is not accepted }
  if not Accept then Exit;

  { accept object }
  ObjectLinkEditDataBinding.AcceptObject(AObject);

  { fire after accept object event }
  if Assigned(OnAfterAcceptObject) then
    OnAfterAcceptObject(Self);
end;

constructor TfdcObjectLinkEdit.Create(AOwner: TComponent);
begin
  inherited;
  FAcceptObjects := True;
end;

destructor TfdcObjectLinkEdit.Destroy;
begin
  FObjectServices := nil;
  inherited;
end;

procedure TfdcObjectLinkEdit.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept :=
    Accept or
    CanAcceptDragSource(Source);
end;

procedure TfdcObjectLinkEdit.DragDrop(Source: TObject; X, Y: Integer);
begin
  inherited;
  if CanAcceptDragSource(Source) then
    AcceptObject(TfdcDragObject(Source).Objects[0]);
end;

function TfdcObjectLinkEdit.GetField: TField;
begin
  Result := ObjectLinkEditDataBinding.Field;
end;

function TfdcObjectLinkEdit.GetKeyField: TField;
begin
  Result := ObjectLinkEditDataBinding.KeyField;
end;

function TfdcObjectLinkEdit.GetSearchButton: TcxEditButton;
var
  i: integer;
begin
  Result := nil;
  for i:=0 to Properties.Buttons.Count-1 do
    if Properties.Buttons[i].Kind = bkEllipsis then
    begin
      Result := Properties.Buttons[i];
      Exit;
    end;
end;

procedure TfdcObjectLinkEdit.Loaded;
begin
  inherited;
  { ignore value for the inherited ReadOnly property }
  Properties.ReadOnly := True;
end;

procedure TfdcObjectLinkEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
  begin
    if AComponent = FParamsHolder then
      FParamsHolder := nil;
    if AComponent = FSearchForm then
      FSearchForm := nil;
  end;
end;

procedure TfdcObjectLinkEdit.DblClick;
begin
  inherited;
  
  { try to open object }
  if Assigned(ObjectServices) and
     Assigned(KeyField) and
     (not KeyField.IsNull) and
     (not IsNewID(KeyField.AsFloat)) then
    ObjectServices.OpenObject(KeyField.AsFloat, Params);
end;

procedure TfdcObjectLinkEdit.DoButtonClick(AButtonVisibleIndex: Integer);
begin
  if not Focused then 
  begin  
    Invalidate;
    Exit;
  end;
  inherited;

  { try to execute object searching }
  if (Assigned(ObjectServices)) and
     (AcceptObjects) and
     (ObjectLinkEditDataBinding.SearchFormClass <> '') and
     (Properties.Buttons[AButtonVisibleIndex] = GetSearchButton)
  then
    if Assigned(FSearchForm) then
      FSearchForm.BringToFront
    else begin
      FSearchForm := ObjectServices.SearchObject(
        ObjectLinkEditDataBinding.SearchFormClass,
        ObjectLinkEditDataBinding.TypeSysName,
        ObjectLinkEditDataBinding.KeyField.AsFloat,
        Params, Self, False, DoSearchFinished);
      FSearchForm.FreeNotification(Self);
    end;
end;

function TfdcObjectLinkEdit.GetParams: TParams;
begin
  if Assigned(ParamsHolder) then
    Result := ParamsHolder.Params
  else
    Result := nil;
end;

procedure TfdcObjectLinkEdit.SetParamsHolder(
  const Value: TfdcParamsHolder);
begin
  if Assigned(FParamsHolder) then
    FParamsHolder.RemoveFreeNotification(Self);
  FParamsHolder := Value;
  if Assigned(FParamsHolder) then
    FParamsHolder.FreeNotification(Self);
end;

procedure TfdcObjectLinkEdit.PropertiesChanged(Sender: TObject);
begin
  inherited;
  ActiveProperties.Buttons[0].Enabled := Assigned(KeyField) and not KeyField.ReadOnly;
//  (ObjectLinkEditDataBinding <> nil) and (ObjectLinkEditDataBinding.GetKeyField <> nil) and
//          not ObjectLinkEditDataBinding.GetKeyField.ReadOnly;
end;

end.

