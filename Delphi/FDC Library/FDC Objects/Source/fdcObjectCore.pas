unit fdcObjectCore;

interface

uses
  Windows, Classes, Controls, Graphics, ActnList, DB, Contnrs,
  FDCQuery, Messages, SysUtils, Oracle, ShellAPI;

const
  SFormPrefix       = 'T';
  SObjectFormSuffix = 'Form';
  SGridFormSuffix   = 'Grid';
  SActionPrefix     = 'act';

type

  { TfdcObjectType }
  TfdcObjectTypeFactory = class;
  TfdcObjectType = class(TComponent)
  private
    FID: double;
    FTypeName: string;
    FSysName: string;
    FTableName: string;
    FParentID: double;
    FParent: TfdcObjectType;
    FHasChildren: boolean;
    FImageIndex: integer;
    FIcon: TBitMap;
    FStateSchemeID: double;
    FStateSchemeName: string;
    FIsAbstract: boolean;

    function GetObjectTypes: TfdcObjectTypeFactory;
    function GetDefaultFormClass: string;
    function GetIcon: TBitMap;
    function GetHasStateScheme: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function DrawGridCell(ACanvas: TCanvas; ARect: TRect): boolean;
    procedure Read(ADataset: TDataset);
    procedure DefineParent;
    function IsKindOf(BaseSysName: string): boolean;

    property ID: double read FID;
    property TypeName: string read FTypeName;
    property SysName: string read FSysName;
    property TableName: string read FTableName;
    property ParentID: double read FParentID;
    property Parent: TfdcObjectType read FParent;
    property ImageIndex: integer read FImageIndex;
    property Icon: TBitMap read GetIcon;
    property StateSchemeID: double read FStateSchemeID;
    property StateSchemeName: string read FStateSchemeName;
    property IsAbstract: Boolean read FIsAbstract;
    property ObjectTypes: TfdcObjectTypeFactory read GetObjectTypes;
    property DefaultFormClass: string read GetDefaultFormClass;
    property HasChildren: boolean read FHasChildren;
    property HasStateScheme: boolean read GetHasStateScheme;
  end;

  { TfdcObjectTypeFactory }
  TfdcObjectTypeFactory = class(TComponent)
  private
    FActionList: TActionList;
    FLoadQuery: TfdcQuery;
    //FCheckQuery: TfdcQuery;

    function GetCount: integer;
    function GetItems(i: integer): TfdcObjectType;
    function GetImageList: TImageList;
  public
    procedure Load;
    function Find(ID: double; DoRaise: boolean = false): TfdcObjectType; overload;
    function Find(SysName: string; DoRaise: boolean = false): TfdcObjectType; overload;
    function TypeIsKindOf(TypeSysName, BaseTypesysName: string): boolean;
    function ObjectIs(ID: double; TypeSysName: string): boolean;

    function DefaultFormClass(SysName: string): string;
    function GetImageIndex(ID: double): integer; overload;
    function GetImageIndex(SysName: string): integer; overload;
    function GetIcon(ID: double): TBitMap;
    function GetIconBySysName(SysName: string): TBitMap;
    function GetRootTypeIcon: TBitmap;

    {
      Название акции должно формироваться по шаблону:
        act[Action][Category]
    }
    procedure SetActionImages;

    property Count: integer read GetCount;
    property Items[i: integer]: TfdcObjectType read GetItems; default;
    property LoadQuery: TfdcQuery read FLoadQuery write FLoadQuery;
    //property CheckQuery: TfdcQuery read FCheckQuery write FCheckQuery;
    property ActionList: TActionList read FActionList write FActionList;
    property ImageList: TImageList read GetImageList;
  end;

  { TfdcObject }
  TfdcObjectFactory = class;
  TfdcObject = class(TComponent)
  private
    FID: double;
    FObjName: string;
    FSysName: string;
    FTypeSysName: string;
    FValues: TParams;

    function GetTypeName: string;
    function GetObjects: TfdcObjectFactory;
    function GetIsNew: boolean;
    function GetObjectType: TfdcObjectType;
    function GetTypeID: double;
    procedure SetTypeID(const Value: double);
    function GetCaption: string;
    function GetFieldCount: integer;
    function GetFieldValues(const Name: string): Variant;
  public
    constructor Create(AOwner: TComponent); override;

    function IsOfType(ATypeSysName: string): boolean;
    procedure Read(ADataset: TDataSet);
    procedure Write(ADataset: TDataSet);

    property ID: double read FID write FID;
    property ObjName: string read FObjName write FObjName;
    property Caption: string read GetCaption;
    property SysName: string read FSysName;
    property TypeID: double read GetTypeID write SetTypeID;
    property TypeSysName: string read FTypeSysName write FTypeSysName;
    property TypeName: string read GetTypeName;
    property Objects: TfdcObjectFactory read GetObjects;
    property IsNew: boolean read GetIsNew;
    property ObjectType: TfdcObjectType read GetObjectType;
    property FieldCount: integer read GetFieldCount;
    property FieldValues[const Name: string]: Variant read GetFieldValues;
  end;

  { TfdcObjectList }
  TfdcObjectList = class(TComponentList)
  private
    function GetItems(i: integer): TfdcObject;
  public
    function Add(AObject: TfdcObject): integer;
    property Items[i: integer]: TfdcObject read GetItems; default;
  end;

  { TfdcObjectFactory }
  TfdcObjectFactory = class(TComponent)
  private
    FObjectTypes: TfdcObjectTypeFactory;
    FNextNewObjectID: integer;
    FLoadQueries: TfdcQueryList;

    function GetCount: integer;
    function GetItems(i: integer): TfdcObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function FindObject(ID: double): TfdcObject;
    function CreateObject(ATypeSysName: string): TfdcObject;
    function GetObject(AID: double; ADoRaise: boolean = False): TfdcObject; overload;
    function GetObject(ADataset: TDataset; ADoRaise: boolean = False): TfdcObject; overload;

    property Count: integer read GetCount;
    property Items[i: integer]: TfdcObject read GetItems; default;
    property LoadQueries: TfdcQueryList read FLoadQueries;
    property ObjectTypes: TfdcObjectTypeFactory read FObjectTypes write FObjectTypes;
  end;

  { TfdcDragObject }
  {
    Используется в механизме перетаскивания объектов (drag-drop).
    Объект содержит список перетаскиваемых объектов, который
    необходимо заполнить в обработчике OnStartDrag соответствующего
    компонента.
  }
  TfdcDragObject = class(TDragObject)
  private
    FObjects: TfdcObjectList;
    FSender: TObject;
    function GetSingleObject: TfdcObject;
  public
    constructor Create;
    destructor Destroy; override;

    function HasSingleObjectOfType   (ATypeSysName: string): boolean;
    function HasMultipleObjectsOfType(ATypeSysName: string): boolean;

    property Objects: TfdcObjectList read FObjects write FObjects;
    property SingleObject: TfdcObject read GetSingleObject;
    property Sender: TObject read FSender write FSender;
  end;

  { TOnSearchFinishedEvent }
  TOnSearchFinishedEvent = procedure (const ADragObject: TfdcDragObject) of object;

  { TfdcFileChangedStatus }
  TfdcFileChangedStatus = (fcsNotFound, fcsNotOpened, fcsNotChanged, fcsChanged);

  { TfdcFileInfo }
  { содержит информацию об открытом из приложения файле Веро }
  TfdcFileFactory = class;
  TfdcFileInfo = class(TComponent)
  private
    FID: double;
    FFileName: string;
    FTime: integer;
    FSize: integer;
    FIcon: TBitmap;
    function GetChanged: TfdcFileChangedStatus;
    function GetFileFactory: TfdcFileFactory;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ID: double read FID;
    property FileName: string read FFileName;
    property Time: integer read FTime;
    property Size: integer read FSize;
    property Icon: TBitmap read FIcon;
    property Changed: TfdcFileChangedStatus read GetChanged;
    property FileFactory: TfdcFileFactory read GetFileFactory;
  end;

  { TfdcFileFactory }
  { для работы с файлами в приложении }
  TfdcFileFactory = class(TComponent)
  private
    FLobQuery: TOracleQuery;
    FDirectory: string;

    function GetCount: integer;
    function GetFileInfo(i: integer): TfdcFileInfo;
    function GetFilePath(FileName: string): string;
  public
    property Directory: string read FDirectory write FDirectory;
    property FileInfo[i: integer]: TfdcFileInfo read GetFileInfo; default;
    property Count: integer read GetCount;
    property LobQuery: TOracleQuery read FLobQuery write FLobQuery;

    procedure UpdateFileInfo(ID: double; FileName: string);
    function FindByID(ID: double): TfdcFileInfo;
    function CheckStatus(ID: double): TfdcFileChangedStatus;

    function IsFileChanged(ID: double): boolean;
    function IsFileInDirectory(FileName: string; var SR: TSearchRec): boolean;
    procedure ImportFile(ID: double; FileName: string);
    procedure ExportFile(ID: double; FileName: string);
    procedure OpenFile(ID: double; FileName: string);
    procedure DeleteFile(ID: double);

    procedure CopyFileToDirectory(FileName: string);
    procedure SaveFileFromDirectory(ID: double; FileName: string);
  end;


implementation

uses fdcUtils;

{ TfdcObjectTypeFactory }

function TfdcObjectTypeFactory.Find(ID: double; DoRaise: boolean = false):
  TfdcObjectType;
var
  i: integer;
begin
  result := nil;
  for i := 0 to Count - 1 do
    if Items[i].ID = ID then
    begin
      result := Items[i];
      break;
    end;
  if (result = nil) and (DoRaise) then
    raise Exception.create('Не найден тип по ID = ' + idToStr(ID));
end;

function TfdcObjectTypeFactory.DefaultFormClass(SysName: string): string;
var
  t: TfdcObjectType;
begin
  t := Find(SysName);
  if t = nil then
    raise Exception.create('Не определен класс для ' + SysName);
  result := t.DefaultFormClass;
end;

function TfdcObjectTypeFactory.Find(SysName: string; DoRaise: boolean = false):
  TfdcObjectType;
var
  i: integer;
begin
  result := nil;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].SysName, SysName) = 0 then
    begin
      result := Items[i];
      break;
    end;
  if (result = nil) and (DoRaise) then
    raise Exception.create('Не найден тип по SysName = ' + SysName);
end;

function TfdcObjectTypeFactory.GetCount: integer;
begin
  result := ComponentCount;
end;

function TfdcObjectTypeFactory.GetItems(i: integer): TfdcObjectType;
begin
  Result := Components[i] as TfdcObjectType;
end;

procedure TfdcObjectTypeFactory.Load;
var
  ObjectType: TfdcObjectType;
  i: integer;
begin
  DestroyComponents;

  LoadQuery.ReQuery;
  try
    while not LoadQuery.Eof do
    begin
      ObjectType := TfdcObjectType.Create(Self);
      ObjectType.Read(LoadQuery);
      LoadQuery.Next;
    end;
  finally
    LoadQuery.Close;
  end;  

  for i := 0 to Count - 1 do
    Items[i].DefineParent;

  SetActionImages;
end;

function TfdcObjectTypeFactory.TypeIsKindOf(TypeSysName,
  BaseTypesysName: string): boolean;
var
  t: TfdcObjectType;
begin
  t := Find(TypeSysName, true);
  result := t.IsKindOf(BaseTypesysName);
end;

function TfdcObjectTypeFactory.GetImageIndex(ID: double): integer;
var
  i: integer;
begin
  result := 0;
  for i := 0 to Count-1 do
    if Items[i].ID = ID then
    begin
      result := Items[i].ImageIndex;
      break;
    end;
end;

function TfdcObjectTypeFactory.GetIcon(ID: double): TBitMap;
var
  t: TfdcObjectType;
begin
  Result := nil;
  t := Find(ID, false);
  if t <> nil then
    Result := t.Icon;
end;

function TfdcObjectTypeFactory.GetIconBySysName(SysName: string): TBitMap;
var
  t: TfdcObjectType;
begin
  Result := nil;
  t := Find(SysName);
  if t <> nil then
    Result := GetIcon(t.ID);
end;

function TfdcObjectTypeFactory.GetRootTypeIcon: TBitmap;
begin
  Result := GetIconBySysName('Object');
end;

procedure TfdcObjectTypeFactory.SetActionImages;
//var
//  i: integer;
//  SuffixPos: integer;
//  Action: TAction;
begin
  {for i := 0 to ActionList.ActionCount - 1 do
  begin
    Action := ActionList[i] as TAction;
    SuffixPos := Pos(Action.Category, Action.Name);
    if SuffixPos > 0 then
      Action.ImageIndex := GetImageIndex(Copy(Action.Name,
        Length(SActionPrefix) + 1, SuffixPos - Length(SActionPrefix) - 1));
  end;}
end;

function TfdcObjectTypeFactory.GetImageIndex(SysName: string): integer;
var
  ObjectType: TfdcObjectType;
begin
  { find object type }
  ObjectType := Find(SysName);

  { found type }
  if Assigned(ObjectType) then
    Result := GetImageIndex(ObjectType.ID)
  else
  { tab sheet }
  { TODO: add TabSheet type into metadata and then remove the following condition }
  if SysName = 'TabSheet' then
    Result := 10
  { default }
  else
    Result := -1;
end;

function TfdcObjectTypeFactory.ObjectIs(ID: double; TypeSysName: string): boolean;
begin
  {CheckQuery.ParamByName('ID').AsFloat := ID;
  CheckQuery.ParamByName('TypeSysName').AsString := TypeSysName;
  CheckQuery.execSQL;
  Result := CheckQuery.ParamByName('Res').AsInteger = 1;}
  Result := False;
end;

function TfdcObjectTypeFactory.GetImageList: TImageList;
begin
  Result := ActionList.Images as TImageList;
end;

{ TfdcObjectType }

constructor TfdcObjectType.Create(AOwner: TComponent);
begin
  inherited;
  if not (AOwner is TfdcObjectTypeFactory) then
    raise Exception.CreateFmt('Указан неверный тип %s владельца объектного типа. ' +
      'Владельцем объектов может быть только контейнер объектных типов %s.',
      [AOwner.ClassName, TfdcObjectTypeFactory.ClassName]);

  FIcon := nil;
end;

destructor TfdcObjectType.Destroy;
begin
  if FIcon <> nil then
    FreeAndNil(FIcon);
  inherited;
end;

procedure TfdcObjectType.DefineParent;
begin
  fParent := nil;
  if SysName = 'Object' then
    exit;

  fParent := ObjectTypes.Find(ParentID);

  if Parent = nil then
    raise Exception.create('Не определен базовый тип для типа ' + SysName)
  else
    fParent.fHasChildren := true;
end;

function TfdcObjectType.DrawGridCell(ACanvas: TCanvas; ARect: TRect): boolean;
begin
  Result := False;
  if not Assigned(Icon) then Exit;

  { fill bounds rect }
  ACanvas.FillRect(ARect);

  { draw type image }
  ARect.Left := ARect.Left + (ARect.Right - ARect.Left) div 2 - Icon.Width div 2;
  ACanvas.Draw(ARect.Left, ARect.Top, Icon);

  { draw type image with text 
  ARect.Left := ARect.Left + 11;
  ACanvas.Draw(ARect.Left, ARect.Top, Icon);
  ARect.Left := ARect.Left + Icon.Width + 20;
  ARect.Top := ARect.Top + 2;
  ACanvas.TextRect(ARect, ARect.Left, ARect.Top, TypeName);

  { successfull draw }
  Result := True;
end;

function TfdcObjectType.GetDefaultFormClass: string;
var
  FormClassName: string;
begin
  FormClassName := SFormPrefix + SysName + SObjectFormSuffix;
  if GetClass(FormClassName) <> nil then
    Result := FormClassName
  else
  if Assigned(Parent) then
    Result := Parent.DefaultFormClass
  else
    raise Exception.CreateFmt('Не найден класс объектной формы для типа %s',
      [SysName]);
end;

function TfdcObjectType.GetHasStateScheme: boolean;
begin
  Result := not IsNewID(StateSchemeID);
end;

function TfdcObjectType.GetIcon: TBitMap;
begin
  result := fIcon;
  if (result = nil) and (Parent <> nil) then
    result := Parent.Icon;
end;

function TfdcObjectType.GetObjectTypes: TfdcObjectTypeFactory;
begin
  if (not Assigned(Owner)) or
     (not (Owner is TfdcObjectTypeFactory)) then
    raise Exception.Create('Не найден контейнер типов');

  Result := Owner as TfdcObjectTypeFactory;
end;

function TfdcObjectType.IsKindOf(BaseSysName: string): boolean;
begin
  result := false;
  if AnsiUpperCase(SysName) = AnsiUpperCase(BaseSysName) then begin
    result := true;
    exit;
  end;

  if Parent <> nil then
    result := Parent.IsKindOf(BaseSysName);
end;

procedure TfdcObjectType.Read(ADataset: TDataset);
var
  IconString: string;
  IconStream: TMemoryStream;
begin
  FID              := ADataset.FieldByName('ID').AsFloat;
  FTypeName        := ADataset.FieldByName('NAME').AsString;
  FSysName         := ADataset.FieldByName('SysName').AsString;
  FTableName       := ADataset.FieldByName('TableName').AsString;
  FParentID        := ADataset.FieldByName('Parent_Object_Type_ID').AsFloat;
  FStateSchemeID   := ADataset.FieldByName('State_Scheme_ID').AsFloat;
  FStateSchemeName := ADataset.FieldByName('State_SchemeName').AsString;
  FIsAbstract      := ADataset.FieldByName('ObjectTableInstance').AsInteger = 0;
  IconString       := trim(ADataset.FieldByName('Icon').AsString);
  if IconString <> '' then
  begin
    FIcon := TBitMap.create;
    IconStream := TMemoryStream.create;
    try
      WriteHexString(IconString, IconStream);
      FIcon.LoadFromStream(IconStream);
      FIcon.Transparent := True;
      FIcon.TransparentColor := FIcon.Canvas.Pixels[0, FIcon.Height - 1];
      FImageIndex := ObjectTypes.ImageList.AddMasked(FIcon, FIcon.TransparentColor);
    finally
      IconStream.Free;
    end;
  end else
  begin
    FIcon := nil;
    FImageIndex := 0;
  end;
end;

{ TfdcObjectFactory }

constructor TfdcObjectFactory.Create(AOwner: TComponent);
begin
  inherited;
  FNextNewObjectID := cNewIDNexus;
  FLoadQueries := TfdcQueryList.Create(False);
end;

destructor TfdcObjectFactory.Destroy;
begin
  FLoadQueries.Free;
  inherited;
end;

function TfdcObjectFactory.GetObject(AID: double; ADoRaise: boolean = False): TfdcObject;
var
  i: integer;
  q: TfdcQuery;
begin
  Result := FindObject(AID);

  for i:=0 to LoadQueries.Count-1 do
  begin
    if Assigned(Result) then Exit;

    q := LoadQueries[i];
    q.ParamByName('ID').AsFloat := AID;
    q.ReQuery;
    try
      if not q.Eof then
      begin
        Result := TfdcObject.Create(Self);
        Result.Read(q);
      end;
    finally
      q.Close;
    end;  
  end;

  if (not Assigned(Result)) and ADoRaise then
    raise Exception.Create('Не найдет объект по ID=' + idToStr(AID));
end;

function TfdcObjectFactory.GetObject(ADataset: TDataset;
                   ADoRaise: boolean = False): TfdcObject;
begin
  Result := nil;

  if (Assigned(ADataset)) or (not ADataset.Eof) then
     begin
       Result := FindObject(ADataset.FieldByName('ID').AsFloat);

       if not Assigned(Result) then
          begin
            Result := TfdcObject.Create(Self);
            Result.Read(ADataset);
          end;
     end;

  if (not Assigned(Result)) and ADoRaise then
     if Assigned(ADataset) then
        raise Exception.Create('Не найден объект по набору данных ' + ADataset.Name)
      else
        raise Exception.Create('Не найден объект по набору данных nil')
end;

function TfdcObjectFactory.GetCount: integer;
begin
  result := ComponentCount;
end;

function TfdcObjectFactory.GetItems(i: integer): TfdcObject;
begin
  result := Components[i] as TfdcObject;
end;

function TfdcObjectFactory.FindObject(ID: double): TfdcObject;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Items[i].ID = ID then
    begin
      Result := Items[i];
      Break;
    end;
end;

function TfdcObjectFactory.CreateObject(ATypeSysName: string): TfdcObject;
begin
  Result := TfdcObject.Create(Self);
  Result.ID := FNextNewObjectID;
  Result.TypeSysName := ATypeSysName;
  InterlockedDecrement(FNextNewObjectID);
end;

{ TfdcObject }

constructor TfdcObject.Create(AOwner: TComponent);
begin
  inherited;

  FID          := cNewIDNexus;
  FObjName     := '';
  FSysName     := '';
  FTypeSysName := '';

  FValues := TParams.Create(Self);

  if not (AOwner is TfdcObjectFactory) then
    raise Exception.CreateFmt('Указан неверный тип %s владельца объекта. ' +
      'Владельцем объектов может быть только контейнер объектов %s.',
      [AOwner.ClassName, TfdcObjectFactory.ClassName]);
end;

function TfdcObject.GetIsNew: boolean;
begin
  Result := IsNewID(ID);
end;

function TfdcObject.GetObjects: TfdcObjectFactory;
begin
  if (not Assigned(Owner)) or
     (not (Owner is TfdcObjectFactory)) then
    raise Exception.Create('Не определен контейнер объектов');

  Result := Owner as TfdcObjectFactory;
end;

function TfdcObject.GetObjectType: TfdcObjectType;
begin
  if Assigned(Objects) and
     Assigned(Objects.ObjectTypes) then
    Result := Objects.ObjectTypes.Find(TypeSysName, True)
  else
    Result := nil;  
end;

function TfdcObject.GetTypeID: double;
begin
  if Assigned(ObjectType) then
    Result := ObjectType.ID
  else
    Result := cNewIDNexus;
end;

function TfdcObject.GetTypeName: string;
begin
  if Assigned(ObjectType) then
    Result := ObjectType.TypeName
  else
    Result := '';
end;

function TfdcObject.IsOfType(ATypeSysName: string): boolean;
begin
  Result :=
    Assigned(Objects) and
    Assigned(Objects.ObjectTypes) and
    Objects.ObjectTypes.TypeIsKindOf(TypeSysName, ATypeSysName);
end;

procedure TfdcObject.Read(ADataset: TDataSet);
var
  I: Integer;
  AParam: TParam;
  AField: TField;
begin
  FID          := ReadField(ADataset, 'ID',          varDouble);
  FObjName     := ReadField(ADataset, 'NAME',        varString);
  FSysName     := ReadField(ADataset, 'SYSNAME',     varString);
  FTypeSysName := ReadField(ADataset, 'TYPESYSNAME', varString);

  FValues.Clear;
  for I := 0 to ADataSet.FieldCount - 1 do
  begin
    AParam := TParam.Create(FValues);
    AField := ADataSet.Fields[I];
    AParam.DataType := AField.DataType;
    AParam.Name := AField.FieldName;
    AParam.Value := AField.Value;
  end;
end;

procedure TfdcObject.Write(ADataset: TDataSet);
begin
  WriteField(ADataset, 'ID',          FID,          varDouble);
  WriteField(ADataset, 'NAME',        FObjName,     varString);
  WriteField(ADataset, 'SYSNAME',     FSysName,     varString);
  WriteField(ADataset, 'TYPESYSNAME', FTypeSysName, varString);
end;

procedure TfdcObject.SetTypeID(const Value: double);
begin
  if Assigned(Objects) and
     Assigned(Objects.ObjectTypes) then
    FTypeSysName := Objects.ObjectTypes.Find(Value).SysName;
end;

function TfdcObject.GetCaption: string;
begin
  if not IsNew then
    Result := ObjName + ' (' + AnsiLowerCase(TypeName) + ')'
  else
    Result := 'Новый объект: ' + AnsiLowerCase(TypeName);
end;

function TfdcObject.GetFieldCount: integer;
begin
  Result := FValues.Count;
end;

function TfdcObject.GetFieldValues(const Name: string): Variant;
begin
  Result := FValues.ParamValues[Name];
end;

{ TfdcObjectList }

function TfdcObjectList.Add(AObject: TfdcObject): integer;
begin
  Result := inherited Add(AObject);
end;

function TfdcObjectList.GetItems(i: integer): TfdcObject;
begin
  Result := TfdcObject(inherited Items[i]);
end;

{ TfdcDragObject }

constructor TfdcDragObject.Create;
begin
  inherited Create;
  FObjects := TfdcObjectList.Create(False);
  FSender := nil;
end;

destructor TfdcDragObject.Destroy;
begin
  FObjects.Free;
  FSender := nil;
  inherited;
end;

function TfdcDragObject.HasSingleObjectOfType(ATypeSysName: string): boolean;
begin
  Result :=
    (Objects.Count = 1) and
    (not Objects[0].IsNew) and
    (Objects[0].IsOfType(ATypeSysName));
end;

function TfdcDragObject.HasMultipleObjectsOfType(ATypeSysName: string): boolean;
var
  i: integer;
begin
  Result := False;
  for i:=0 to Objects.Count-1 do
    if (not Objects[i].IsNew) and
       Objects[i].IsOfType(ATypeSysName) then
    begin
      Result := True;
      Exit;
    end;
end;

function TfdcDragObject.GetSingleObject: TfdcObject;
begin
  Result := Objects[0];
end;

{ TfdcFileInfo }

constructor TfdcFileInfo.Create(AOwner: TComponent);
begin
  inherited;
  FIcon := TBitmap.Create;
  FIcon.Width := 16;
  FIcon.Height := 16;
  FIcon.Transparent := True;
  FIcon.TransparentColor := FIcon.Canvas.Pixels[0, FIcon.Height - 1];
end;

destructor TfdcFileInfo.Destroy;
begin
  FIcon.Free;
  inherited;
end;

function TfdcFileInfo.GetChanged: TfdcFileChangedStatus;
var
  sr: TSearchRec;
begin
  if not FileFactory.IsFileInDirectory(FileName, sr) then
     Result := fcsNotOpened
   else
     if (Time <> sr.Time) or (Size <> sr.Size) then
        Result := fcsChanged
      else
        Result := fcsNotChanged;
end;

function TfdcFileInfo.GetFileFactory: TfdcFileFactory;
begin
  if (not Assigned(Owner)) or
     (not (Owner is TfdcFileFactory)) then
    raise Exception.Create('Не найден список открытых приложением файлов');

  Result := Owner as TfdcFileFactory;
end;

{ TfdcFileFactory }

procedure TfdcFileFactory.UpdateFileInfo(ID: double; FileName: string);
var
  fname: string;
  fi: TfdcFileInfo;
  sr: TSearchRec;
  //shfile: TSHFileInfo;
begin
  fname := ExtractFileName(FileName);
  fi := FindByID(ID);

  if IsFileInDirectory(fname, sr) then
  begin
     if not Assigned(fi) then
      begin
        fi := TfdcFileInfo.Create(self);
        fi.FID := ID;
      end;

     { set general }
     fi.FFileName := fname;
     fi.FTime := sr.Time;
     fi.FSize := sr.Size;

     { set file icon
     SHGetFileInfo(PChar(FileName), FILE_ATTRIBUTE_NORMAL, shfile,
       SizeOf(TShFileInfo), SHGFI_ICON or SHGFI_USEFILEATTRIBUTES);
     fi.FIcon.Width := 16;
     fi.FIcon.Height := 16;
     if shfile.hIcon <> 0 then
       DrawIcon(fi.FIcon.Canvas.Handle, 0, 0, shfile.hIcon);}
  end;
end;

function TfdcFileFactory.CheckStatus(ID: double): TfdcFileChangedStatus;
var
  fi: TfdcFileInfo;
begin
  fi := FindByID(ID);

  if Assigned(fi) then
    Result := fi.Changed
  else
    Result := fcsNotFound;
end;

function TfdcFileFactory.FindByID(ID: double): TfdcFileInfo;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if FileInfo[i].ID = ID then
    begin
      Result := FileInfo[i];
      Break;
    end;
end;

function TfdcFileFactory.GetCount: integer;
begin
  Result := ComponentCount;
end;

function TfdcFileFactory.GetFileInfo(i: integer): TfdcFileInfo;
begin
  Result := Components[i] as TfdcFileInfo;
end;

function TfdcFileFactory.GetFilePath(FileName: string): string;
begin
  FileName := ExtractFileName(FileName);
  Result := FDirectory + '\' + FileName;
end;

function TfdcFileFactory.IsFileInDirectory(FileName: string; var SR: TSearchRec): boolean;
begin
  Result := (FindFirst(GetFilePath(FileName), faAnyFile, SR) = 0);
end;

procedure TfdcFileFactory.DeleteFile(ID: double);
var
  fi: TfdcFileInfo;
begin
  fi := FindByID(ID);
  try
    try
      if Assigned(fi) then
        fdcUtils.DeleteFile(GetFilePath(fi.FileName));
    except
      on E: Exception do
        raise Exception.Create('<<Не удалось удалить временный файл>>. ' +
          '<<При попытке удаления файла ' + GetFilePath(fi.FileName) + ' произошла ошибка. ' +
          'Возможно файл используется другими приложениями. Закройте эти приложения и повторите попытку.>>'#10 + E.Message);
    end;
  finally
    fi.Free;
  end;
end;

procedure TfdcFileFactory.ImportFile(ID: double; FileName: string);
begin
  try
    LOBQuery.SetVariable('ID', ID);
    LOBQuery.Execute;
    try
      LOBQuery.LOBField('BODY').LoadFromFile(FileName);
    finally
      LOBQuery.Close;
    end;
  except
    on E: Exception do
      raise Exception.Create('<<Ошибка импорта файла>>. ' +
        '<<При попытке импорта файла ' + FileName + ' произошла ошибка.>>'#10 + E.Message);
  end;
end;

procedure TfdcFileFactory.ExportFile(ID: double; FileName: string);
begin
  try
    LOBQuery.SetVariable('ID', ID);
    LOBQuery.Execute;
    try
      LOBQuery.LOBField('BODY').SaveToFile(FileName);
    finally
      LOBQuery.Close;
    end;
  except
    on e: Exception do
      raise Exception.Create('<<Ошибка экспорта файла>>. ' +
        'При попытке экспорта файла ' + FileName + ' произошла ошибка. ' +
        'Возможно файл используется другими приложениями. ' +
        'Закройте эти приложения и повторите попытку.>>' + E.Message);
  end;
end;

procedure TfdcFileFactory.OpenFile(ID: double; FileName: string);
begin
  if not IsNewID(ID) then
  begin
    ExportFile(ID, GetFilePath(FileName));
    UpdateFileInfo(ID, FileName);
  end;  
  ShellOpen(GetFilePath(FileName));
end;

procedure TfdcFileFactory.SaveFileFromDirectory(ID: double;
  FileName: string);
begin
  if FileExists(GetFilePath(FileName)) then
  begin
    ImportFile(ID, GetFilePath(FileName));
    UpdateFileInfo(ID, FileName);
  end;
end;

procedure TfdcFileFactory.CopyFileToDirectory(FileName: string);
begin
  fdcUtils.CopyFile(FileName, GetFilePath(ExtractFileName(FileName)));
end;

function TfdcFileFactory.IsFileChanged(ID: double): boolean;
var
  fi: TfdcFileInfo;
begin
  fi := FindByID(ID);
  Result := Assigned(fi) and (fi.Changed = fcsChanged);
end;

end.

