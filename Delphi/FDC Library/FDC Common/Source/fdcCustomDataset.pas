{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomDataset.pas $
  $Revision: 689 $
  $Author: alexvolo $
  $Date: 2005-12-15 18:35:15 +0400 (Р§С‚, 15 РґРµРє 2005) $
}
unit FDCCustomDataset;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, {FDCUpdateSQL,} ActiveX, Variants;

const
  bfNA = TBookmarkFlag(Ord(High(TBookmarkFlag)) + 1);
  usInvalid = TUpdateStatus(Ord(High(TUpdateStatus)) + 1);

  SortFieldTypes = [ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
    ftFloat, ftCurrency, ftDate, ftTime, ftDateTime, ftAutoInc,
    ftBCD, ftFixedChar, ftWideString, ftLargeInt];

type

  TCompareOption = (coDescending, coCaseInsensitive, coPartialKey);
  TCompareOptions = set of TCompareOption;

  TRecInfo = record
    RecNo: integer;
    PhisRecNo: integer; //phisical rec number, necessary for sort and filter
    BookmarkFlag: TBookmarkFlag;
    State: TUpdateStatus;
  end;
  PRecInfo = ^TRecInfo;

  TRecord = class;

  TRecordItem = class
  private
    procedure SetOriginalValue(const Value: OleVariant);
    procedure SetValue(const Value: OleVariant);
    function GetOriginalValue: OleVariant;
    function GetValue: OleVariant;
  protected
    fOriginalValue: variant;
    fValue: variant;
    fState: TUpdateStatus;
  public
    property OriginalValue: OleVariant read GetOriginalValue write
      SetOriginalValue;
    property Value: OleVariant read GetValue write SetValue;
    property State: TUpdateStatus read fState write fState;
    constructor Create(Rec: TRecord);
  end;

  TRecord = class(TList)
  public
    State: TUpdateStatus;
    PhisRecNo: integer;
    constructor Create;
    destructor Destroy; override;
  end;

  TfdcCustomDataset = class;
  TCustomDataLink = class(TDetailDataLink)
  private
    FDataset: TfdcCustomDataset;
  protected
    procedure ActiveChanged; override;
    procedure RecordChanged(Field: TField); override;
    function GetDetailDataSet: TDataSet; override;
    procedure CheckBrowseMode; override;
  public
    constructor Create(ADataset: TfdcCustomDataset);
  end;

  TfdcCustomDataset = class(TDataSet)
  private
    FParams: TParams;
    FDataLink: TDataLink;
    FSQL: TStrings;

    FEnabledBCD: boolean;
    FIsOpen: Boolean;
    StartCalc: integer;
    FRecNo: integer;
    FParamCheck: Boolean;
    {filter}
    FFilterBuffer: PChar;
    {sort}
    FSortFieldNames: string;
    FSortOptions: TCompareOptions;
    FSorted: boolean;
    FReadOnly: boolean;

    //FConnectionName: string;

    //FUpdateObject: TFDCUpdateSQL;

    {IProviderSupport}
    FOnUpdateRecord: TUpdateRecordEvent;

    FUpdatesInTran: boolean;
    FUpdatesForceReopen: boolean;
    FLocalDataSet: boolean;
    FOnUpdateError: TUpdateErrorEvent;

    function GetSQL: TStrings;
    procedure SetSQL(const Value: TStrings);

    function GetActiveRecordBuffer: PChar;
    procedure NewRecordInit(r: TRecord);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetSortFieldNames(const Value: string);
    procedure BuildFieldList(List: TList; const FieldNames: string);
    //procedure SetConnectionName(const Value: string);
    //procedure SetUpdateObject(const Value: TFDCUpdateSQL);
    function GetTotalRecordCount: integer;
  protected
    fSourceServerObject: string;
    FIntRectCount: integer;
    FRecCountCalculated: boolean;

    {abstract methods for data population routines}
    procedure FillRecords; virtual; abstract;
    procedure FillFieldDefs; virtual; abstract;
    procedure CheckRequiredFields; virtual;
    //	function GetConnection: TOzCustomConn; virtual; abstract;
    //	procedure SetConnection(const Value: TOzCustomConn); virtual; abstract;
  protected
    { IProviderSupport }
    procedure PSEndTransaction(Commit: Boolean); override;
    {    procedure PSExecute; virtual;
     function PSExecuteStatement(const ASQL: string; AParams: TParams;
       ResultSet: Pointer = nil): Integer; virtual;
     procedure PSGetAttributes(List: TList); virtual;
     function PSGetDefaultOrder: TIndexDef; virtual;
     function PSGetKeyFields: string; virtual;
     function PSGetParams: TParams; virtual;
     function PSGetQuoteChar: string; virtual;
     function PSGetTableName: string; virtual;
     function PSGetIndexDefs(IndexTypes: TIndexOptions): TIndexDefs; virtual;
       }function PSGetUpdateException(E: Exception; Prev: EUpdateError):
         EUpdateError; override;
    function PSInTransaction: Boolean; override;
    function PSIsSQLBased: Boolean; override;
    function PSIsSQLSupported: Boolean; override;
    procedure PSReset; override; //?
    procedure PSSetParams(AParams: TParams); override;
    procedure PSSetCommandText(const CommandText: string); override;
    procedure PSStartTransaction; override; //no
    function PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean;
      override; //no
  protected
    { Protected declarations }
    FRecords: TList;
    procedure InternalOpen; override;
    procedure InternalClose; override;
    procedure InternalInitFieldDefs; override;
    function IsCursorOpen: Boolean; override;
    function GetCanModify: Boolean; override;
    function GetRecordSize: Word; override;
    function AllocRecordBuffer: PChar; override;
    procedure FreeRecordBuffer(var Buffer: PChar); override;
    procedure InternalFirst; override;
    procedure InternalLast; override;
    procedure InternalInitRecord(Buffer: PChar); override;
    procedure InternalHandleException; override;

    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean):
      TGetResult; override;

    procedure OpenCursor(InfoQuery: Boolean); override;
    procedure InternalSetToRecord(Buffer: PChar); override;
    function InternalGetRecNoByPhisRecNo(bookmark: Pointer): integer;
      //for sort and filtering
    procedure InternalGotoBookmark(Bookmark: Pointer); override;
    function GetBookMarkFlag(Buffer: PChar): TBookMarkFlag; override;
    procedure SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); override;
    procedure GetBookmarkData(Buffer: PChar; Data: Pointer); override;
    procedure SetBookmarkData(Buffer: PChar; Data: Pointer); override;
    procedure ClearCalcFields(Buffer: PChar); override;
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
    procedure InternalDelete; override;
    procedure InternalPost; override;
    procedure InternalEdit; override;
    procedure InternalCancel; override;
    procedure InternalInsert; override;

    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
    procedure SetFiltered(Value: Boolean); override;

    function GetRecordCount: integer; override;
    function GetRecNo: integer; override;
    function InternalGetFilteredRecNo(aFiltRecNo: integer): integer;
    procedure SetRecNo(value: integer); override;
    procedure SetCursorOpen(Value: boolean); virtual;
    {params}
    procedure ReadParamData(Reader: TReader);
    procedure WriteParamData(Writer: TWriter);
    procedure SetParams(Value: TParams);
    procedure RefreshParams;
    procedure SetParamsFromCursor;
    procedure DefineProperties(Filer: TFiler); override;
    function GetParamsCount: Word;
    property DataLink: TDataLink read FDataLink;
    function GetDataSource: TDataSource; override;
    procedure QueryChanged(Sender: TObject); virtual;
    {filter}
    function FilterRecord(r: integer): boolean;
    {sort and search}
    procedure InternalSort;
    procedure InternalQuickSort(L, R: Integer; FieldList: TList);
    function InternalCompareRecords(Record1, Record2: TRecord; FieldList: TList;
      compOptions: TCompareOptions): Integer;
    function InternalCompare(Value1, Value2: Variant; ft: TFieldType;
      CompOptions: TCompareOptions): integer;
    function InternalLocate(KeyFields: string; KeyValues: Variant; Options:
      TLocateOptions): boolean;
    function InternalLocateNearest(KeyField: string; KeyValue: Variant):
      boolean;
    {Cached Updates}
    function InternalApplyUpdates(Rec: integer): TUpdateAction; virtual;
    procedure PrepareCachedUpdates(Dest: TfdcCustomDataset; Rec: integer);
      virtual;
    procedure AssignCachedUpdatesValues(Src: TfdcCustomDataset; Rec: integer;
      UpdKind: TUpdateKind); virtual;
    procedure InternalRevertRecord(aRecNo: integer); virtual;
    procedure InternalDeleteRecord(aRecNo: integer); virtual;
    {HourGlassCursor}
    procedure InternalSaveScreenCursor;
    procedure InternalRestoreScreenCursor;

  public
    { Public declarations }
    constructor Create(anOwner: TComponent); override;
    destructor Destroy; override;
    property ReadOnly: boolean read FReadOnly write FReadOnly;
    procedure Post; override;
    property TotalRecordCount: integer read GetTotalRecordCount;

    {params}
    procedure GetDetailLinkFields(MasterFields, DetailFields: TList); override;
    function ParamByName(const Value: string): TParam;
    property ParamCount: Word read GetParamsCount;

    {sort}
    property SortFields: string read FSortFieldNames write SetSortFieldNames;
    procedure Sort;
    property SortOptions: TCompareOptions read FSortOptions write FSortOptions;

    {Query}
    property SQL: TStrings read GetSQL write SetSQL;
    property SourceServerObject: string read fSourceServerObject write
      fSourceServerObject;
    property EnableBCD: boolean read FEnabledBCD write FEnabledBCD default
      false;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Params: TParams read FParams write SetParams stored False;
    property ParamCheck: Boolean read FParamCheck write FParamCheck default
      True;
    procedure ExecSQL;
    function BookmarkValid(Bookmark: TBookmark): Boolean; override;
    function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer;
      override;
    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
      override;
    function GetBlobFieldData(FieldNo: Integer; var Buffer: TBlobByteData):
      Integer; override;
    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
    function GetFieldData(FieldNo: Integer; Buffer: Pointer): Boolean; overload;
      override;
    function Locate(const KeyFields: string; const KeyValues: Variant; Options:
      TLocateOptions): Boolean; override;
    function Lookup(const KeyFields: string; const KeyValues: Variant; const
      ResultFields: string): Variant; override;
    function LocateNearest(KeyField: string; KeyValue: Variant): boolean;
      virtual;
    procedure ReQuery; virtual;

    {Connection}
    //property ConnectionName: string read fConnectionName write SetConnectionName;
    //property Connection: TOzCustomConn read GetConnection write SetConnection;

    {Cached Updates}
    function UpdateStatus: TUpdateStatus; override;
    procedure RevertCurrent;
    procedure RevertRecords;
    property UpdatesInTran: boolean read FUpdatesInTran write FUpdatesInTran;
    property UpdatesForceReopen: boolean read FUpdatesForceReopen write
      FUpdatesForceReopen;
    procedure ApplyUpdates;
    function ApplyCurrent: boolean;
    //property UpdateObject: TFDCUpdateSQL read FUpdateObject write
    //  SetUpdateObject;
    property OnUpdateError: TUpdateErrorEvent read FOnUpdateError write
      FOnUpdateError;

    {IProviderSupport}
    property OnUpdateRecord: TUpdateRecordEvent read FOnUpdateRecord write
      FOnUpdateRecord;
    {work as mem table}
    property LocalDataSet: boolean read FLocalDataSet write FLocalDataSet default
      false;
  end;

  TfdcBlobStream = class(TMemoryStream)
  private
    FField: TBlobField;
    FDataSet: TfdcCustomDataset;
    FMode: TBlobStreamMode;
    FFieldNo: Integer;
    FOpened: Boolean;
    FModified: Boolean;
    FPosition: Longint;
    FData: Variant;
    function GetBlobSize: Longint;
    procedure ReadBlobData;
    procedure WriteBlobData;
  public
    constructor Create(Field: TBlobField; Mode: TBlobStreamMode);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    procedure Truncate;
  end;

  EFieldRequiredError = class(EDatabaseError)
  private
    FField: TField;
  public
    constructor Create(AField: TField);
    property Field: TField read FField write FField;
  end;


implementation

uses
  fdcUtils, DBConsts;

{ TfdcCustomDataset }

procedure TfdcCustomDataset.InternalOpen;
begin
  FIsOpen := False;
  StartCalc := SizeOf(TRecInfo);
  FRecNo := -1;
  BookmarkSize := sizeof(Integer);
  FillRecords; //here FIsOpen must be set thru SetCursorOpen
end;

procedure TfdcCustomDataset.InternalClose;
var
  i: integer;
begin
  for i := 0 to FRecords.count - 1 do
    TRecord(FRecords[i]).Free;
  FRecords.clear;
  FIsOpen := False;
  BindFields(False);
  FSorted := false;
  FRecNo := -1;
  if DefaultFields then
    DestroyFields;
end;

function TfdcCustomDataset.IsCursorOpen: Boolean;
begin
  result := FIsOpen;
end;

function TfdcCustomDataset.GetCanModify: Boolean;
begin
  result := not FReadOnly;
end;

function TfdcCustomDataset.GetRecordSize: Word;
begin
  Result := SizeOf(TRecInfo) + CalcFieldsSize;
end;

function TfdcCustomDataset.AllocRecordBuffer: PChar;
begin
  GetMem(Result, GetRecordSize);
  if Result <> nil then
    FillChar(Result^, GetRecordSize, 0);
end;

procedure TfdcCustomDataset.FreeRecordBuffer(var Buffer: PChar);
begin
  Freemem(Buffer, GetRecordSize);
  Buffer := nil;
end;

procedure TfdcCustomDataset.InternalFirst;
begin
  FRecNo := -1;
end;

procedure TfdcCustomDataset.InternalLast;
begin
  FRecNo := FRecords.Count;
end;

procedure TfdcCustomDataset.InternalInitRecord(Buffer: PChar);
begin
  FillChar(Buffer^, GetRecordSize, 0);
end;

function TfdcCustomDataset.GetBlobFieldData(FieldNo: Integer; var Buffer:
  TBlobByteData): Integer;
begin
  result := inherited GetBlobFieldData(FieldNo, Buffer);
end;

function TfdcCustomDataset.GetFieldData(Field: TField; Buffer: Pointer):
  Boolean;
var
  SourceBuffer: PChar;
  r: TRecord;
  IsNullData: boolean;
  Value: variant;
begin
  Result := False;
  IsNullData := false; //to parse null data
  SourceBuffer := GetActiveRecordBuffer;
  if SourceBuffer = nil then
    exit;
  if not FIsOpen then
    Exit;
  if (Field.FieldKind = fkCalculated) or (Field.FieldKind = fkLookup) then
  begin
    Inc(SourceBuffer, StartCalc + Field.Offset);
    if (SourceBuffer[0] = #0) or (Buffer = nil) then
      Exit
    else
      CopyMemory(Buffer, @SourceBuffer[1], Field.DataSize);
  end
  else
  begin
    r := TRecord(FRecords[PRecInfo(SourceBuffer).RecNo]);
    if self.State = dsOldValue then
      Value := TRecordItem(r.Items[Field.FieldNo - 1]).OriginalValue
    else
      Value := TRecordItem(r.Items[Field.FieldNo - 1]).Value;

    if Buffer = nil then //for TField.isnull function
    begin
      result := not (VarIsNull(Value) or VarIsEmpty(Value));
      exit;
    end;
    case Field.DataType of
      ftInteger, ftSmallInt:
        begin
          if not (VarIsNull(Value) or VarIsEmpty(Value) or (VarToStr(Value) =
            '')) then
            Integer(Buffer^) := Integer(Value)
          else
            IsNullData := true;
        end;
      ftLargeInt:
        begin
          LargeInt(Buffer^) := Decimal(Value).Lo64;
        end;
      ftFloat, ftCurrency:
        begin
          if not (VarIsNull(Value) or VarIsEmpty(Value) or (VarToStr(Value) =
            '')) then
          begin
            Double(Buffer^) := Double(Value)
          end
          else
            IsNullData := true;
        end;
      ftBoolean:
        begin
          if not (VarIsNull(Value) or VarIsEmpty(Value) or (VarToStr(Value) =
            '')) then
            Boolean(Buffer^) := Boolean(Value)
          else
            IsNullData := true;
        end;
      ftBCD:
        begin
          //?????
        end;
      ftString, ftGuid, ftFixedChar, ftWideString:
        begin
          if not (VarIsNull(Value) or VarIsEmpty(Value) or (VarToStr(Value) =
            '')) then
          begin
            StrLCopy(Buffer, PChar(string(Value)), Length(string(Value)) + 1);
            PChar(Buffer)[Field.Size] := #0;
          end
          else
            IsNullData := true;
        end;
      ftDateTime, ftDate:
        begin
          if VarIsNull(Value) then
            IsNullData := true
          else if VarIsEmpty(Value) then
            IsNullData := true
          else
          begin
            if VarType(Value) = varDate then
              Double(Buffer^) := TimeStampToMSecs(DateTimeToTimeStamp(VarToDateTime(Value)))
             else
            Double(Buffer^) :=
              TimeStampToMSecs(DateTimeToTimeStamp(StrToDateTime(string(Value))));
          end;
        end;
    end;
  end;
  Result := not IsNullData;
end;

procedure TfdcCustomDataset.SetFieldData(Field: TField; Buffer: Pointer);
var
  DestBuffer: PChar;
  DTmp: TDateTime;
begin
  DestBuffer := GetActiveRecordBuffer;
  if DestBuffer = nil then
    exit;
  if FRecords.count = 0 then
    exit;
  if not FIsOpen then
    Exit;
  //if not (State in dsWriteModes) then Edit;

  if (Field.FieldKind = fkCalculated) or (Field.FieldKind = fkLookup) then
  begin
    Inc(DestBuffer, StartCalc + Field.Offset);
    Boolean(DestBuffer[0]) := (Buffer <> nil);
    if Boolean(DestBuffer[0]) then
      CopyMemory(@DestBuffer[1], Buffer, Field.DataSize);
  end
  else
  begin
    if State = dsCalcFields then
      raise Exception.Create('Dataset not in edit or insert mode');
    if Field.ReadOnly and not (State in [dsSetKey, dsFilter]) then
      raise Exception.CreateFmt('Field ''%s'' cannot be modified',
        [Field.DisplayName]);

  if (State in [dsEdit, dsInsert]) {and (not QBEMode) and (not NoFieldValidation)} then
    Field.Validate(Buffer);

    with
      TRecordItem(TRecord(FRecords[PRecInfo(DestBuffer)^.RecNo]).Items[Field.FieldNo - 1]) do
    begin
      Value := null;
      case Field.DataType of
        ftInteger, ftSmallInt:
          begin
            if Buffer <> nil then
              Value := Integer(Buffer^);
          end;
        ftLargeInt:
          begin
            if Buffer <> nil then
            begin
              TVarData(fValue).VType := VT_DECIMAL;
              Decimal(fValue).Lo64 := Int64(Buffer^);
            end;
          end;
        ftFloat, ftCurrency:
          begin
            if Buffer <> nil then
              Value := Double(Buffer^);
          end;
        ftDateTime, ftDate:
          begin
            if Buffer <> nil then
            begin
              DTmp := TimeStampToDateTime(MSecsToTimeStamp(Double(Buffer^)));
              Value := DateTimeToStr(DTmp);
            end;
          end;
        ftString, ftGUID:
          begin
            if (Buffer <> nil) and (PChar(Buffer)^ <> #0) then
              Value := string(PChar(Buffer));
          end;
      end; {case}
      if InternalCompare(Value, OriginalValue, Field.DataType, []) <> 0 then
        State := usModified;

    end;
  end;
  if not (State in [dsCalcFields, dsFilter, dsNewValue]) then
    DataEvent(deFieldChange, Longint(Field));
end;

function TfdcCustomDataset.GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck:
  Boolean): TGetResult;
var
  Accept: boolean;
begin
  Result := grOK;
  repeat
    Accept := true;
    case GetMode of
      gmCurrent:
        begin
          if FRecNo >= FRecords.Count then
            Result := grEOF
          else if FRecNo < 0 then
            Result := grBOF;
        end;
      gmNext:
        begin
          if FRecNo >= FRecords.Count then
            result := grEOF
          else
            FRecNo := FRecNo + 1;
          //for dbgrid vusual bug fixing
          if (State = dsInsert) and (FRecords.Count = 1) then
            result := grEOF;
        end;
      gmPrior:
        begin
          if FRecNo < 0 then
            result := grBOF
          else
            FRecNo := FRecNo - 1;
          //for dbgrid vusual bug fixing
          if (State = dsInsert) and (FRecords.Count = 1) then
            result := grEOF;
        end;
    end; {case}
    if FRecNo < 0 then
      Result := grBOF
    else if (FRecNo >= FRecords.Count) then
    begin
      Result := grEOF;
      FRecNo := FRecords.Count;
    end;
    if Result = grOk then
    begin
      {фильтрация и работа с удаленными записями в FilterRecord}
      Accept := FilterRecord(FRecNo);
      if Accept then
      begin
        PRecInfo(Buffer)^.RecNo := FRecNo;
        PRecInfo(Buffer)^.PhisRecNo := TRecord(FRecords[FRecNo]).PhisRecNo;
        PRecInfo(Buffer)^.State := TRecord(FRecords[FRecNo]).State;
        PRecInfo(Buffer)^.BookmarkFlag := bfCurrent;
      end
      else if (GetMode = gmCurrent) then
        Result := grError
    end;
  until Accept or (Result <> grOk);
  if Result = grOk then
  begin
    ClearCalcFields(Buffer);
    GetCalcFields(Buffer);
  end;
end;

procedure TfdcCustomDataset.InternalSetToRecord(Buffer: PChar);
begin
  FRecNo := PRecInfo(Buffer).RecNo;
end;

function TfdcCustomDataset.InternalGetRecNoByPhisRecNo(bookmark: Pointer):
  integer;
var
  i, phis: integer;
begin
  result := -1;
  phis := PInteger(Bookmark)^;
  for i := 0 to FRecords.count - 1 do
  begin
    if TRecord(FRecords[i]).PhisRecNo = phis then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TfdcCustomDataset.InternalGotoBookmark(Bookmark: Pointer);
begin
  FRecNo := InternalGetRecNoByPhisRecNo(Bookmark);
end;

function TfdcCustomDataset.GetBookMarkFlag(Buffer: PChar): TBookMarkFlag;
begin
  Result := PRecInfo(Buffer).BookmarkFlag;
end;

procedure TfdcCustomDataset.SetBookmarkFlag(Buffer: PChar; Value:
  TBookmarkFlag);
begin
  PRecInfo(Buffer).BookmarkFlag := Value;
end;

procedure TfdcCustomDataset.GetBookmarkData(Buffer: PChar; Data: Pointer);
begin
  PInteger(Data)^ := PRecInfo(Buffer).PhisRecNo;
end;

procedure TfdcCustomDataset.SetBookmarkData(Buffer: PChar; Data: Pointer);
begin
  PRecInfo(Buffer).PhisRecNo := Pinteger(Data)^;
end;

function TfdcCustomDataset.BookmarkValid(Bookmark: TBookmark): Boolean;
begin
  Result :=
    (Assigned(Bookmark)) and
    (PInteger(Bookmark)^ >= 0) and
    (PInteger(Bookmark)^ < FRecords.Count);
end;

procedure TfdcCustomDataset.ClearCalcFields(Buffer: PChar);
begin
  FillChar(Buffer[StartCalc], CalcFieldsSize, 0);
end;

procedure TfdcCustomDataset.InternalAddRecord(Buffer: Pointer; Append: Boolean);
var
  r: TRecord;
begin
  r := TRecord.Create();
  NewRecordInit(r);
  if Append then
    PRecInfo(Buffer).RecNo := FRecords.Add(r)
  else
  begin
    FRecords.insert(FRecNo, r);
    PRecInfo(Buffer).RecNo := FRecNo;
  end;
  r.PhisRecNo := FRecords.count;
  PRecInfo(Buffer).PhisRecNo := r.PhisRecNo;
end;

procedure TfdcCustomDataset.InternalDelete;
var
  buf: PChar;
begin
  buf := GetActiveRecordBuffer;
  if buf = nil then
    exit;
  if PRecInfo(buf)^.State = usInserted then
    InternalDeleteRecord(PRecInfo(buf)^.RecNo)
  else
    TRecord(FRecords[PRecInfo(buf)^.RecNo]).State := usDeleted;
end;

procedure TfdcCustomDataset.CheckRequiredFields;
var
  I: Integer;
begin
  for I := 0 to Fields.Count - 1 do
    with Fields[I] do
      if Required and not ReadOnly and (FieldKind = fkData) and IsNull then
      begin
        FocusControl;
        raise EFieldRequiredError.Create(Fields[I]);
      end;
end;

procedure TfdcCustomDataset.InternalPost;
var
  r, i: integer;
begin
  CheckRequiredFields;
  r := PRecInfo(GetActiveRecordBuffer)^.RecNo;
  //если не модифицирована, то проверим, иначе и проверять не надо
  if not (TRecord(FRecords[r]).State = usUnModified) then
    exit;
  for i := 0 to TRecord(FRecords[r]).Count - 1 do
  begin
    if TRecordItem(TRecord(FRecords[r]).Items[i]).State = usModified then
    begin
      TRecord(FRecords[r]).State := usModified;
      exit;
    end;
  end;
end;

procedure TfdcCustomDataset.InternalCancel;
var
  r: integer;
begin
  if not (State in [dsInsert]) then
    exit;
  r := PRecInfo(GetActiveRecordBuffer)^.RecNo;
  TRecord(FRecords[r]).Free;
  FRecords.Delete(r);
end;

procedure TfdcCustomDataset.InternalEdit;
begin
  //вроде ничего не надо здесь
  //showmessage('internaledit');
end;

procedure TfdcCustomDataset.InternalInsert;
begin
  if GetActiveRecordBuffer <> nil then
    InternalAddRecord(GetActiveRecordBuffer, true);
end;

procedure TfdcCustomDataset.SetFiltered(Value: Boolean);
var
  m: TBookmark;
begin
  //inherited;

  m := GetBookmark;
  DisableControls;
  try
    FRecCountCalculated := false;

    if Active then
    begin
      CheckBrowseMode;
      if Filtered <> Value then
        inherited SetFiltered(Value);
      First;
    end
    else
      inherited SetFiltered(Value);

    GetRecordCount;

    try
      GotoBookmark(m);
    except
    end;

  finally
    EnableControls;
    FreeBookmark(m);
  end;

end;

{-----------------------------------------------------}

constructor TfdcCustomDataset.Create(anOwner: TComponent);
begin
  inherited Create(anOwner);
  FSQL := TStringList.Create;
  TStringList(FSQL).OnChange := QueryChanged;
  FRecords := TList.Create;
  FParams := TParams.Create(Self);
  FDataLink := TCustomDataLink.Create(self);
  ParamCheck := True;
  FReadOnly := false;
  FEnabledBCD := false;
  FUpdatesInTran := false;
  FLocalDataSet := false;
end;

destructor TfdcCustomDataset.Destroy;
begin
  if Active then
    close;
  FSQL.free;
  FRecords.free;
  FParams.Free;
  FDataLink.free;
  inherited;
end;

function TfdcCustomDataset.GetSQL: TStrings;
begin
  result := FSQL;
end;

procedure TfdcCustomDataset.SetSQL(const Value: TStrings);
begin
  if SQL.Text <> Value.Text then
  begin
    close;
    SQL.BeginUpdate;
    try
      SQL.Assign(Value);
    finally
      SQL.EndUpdate;
    end;
  end;
end;

function TfdcCustomDataset.GetRecordCount: integer;
var
  i: integer;
  cnt: integer;
begin
  cnt := 0;
  if not FRecCountCalculated then
  begin
    if not Active then
    begin
      FIntRectCount := 0;
      result := FIntRectCount;
      exit;
      //raise Exception.Create('Cannot perform this operation on a closed dataset');
    end;
    for i := 0 to FRecords.Count - 1 do
      if FilterRecord(i) then
        Inc(cnt);

    FIntRectCount := cnt;
    FRecCountCalculated := true;
  end;

  result := FIntRectCount;
end;

procedure TfdcCustomDataset.OpenCursor(InfoQuery: Boolean);
begin
  if FIsOpen then
    exit;

  if InfoQuery then
  begin
    InternalInitFieldDefs;
    exit;
  end;

  if FDataLink.DataSource <> nil then
    SetParamsFromCursor;
  inherited OpenCursor; //(InfoQuery);
  if not FIsOpen then
    CloseCursor;
end;

function TfdcCustomDataset.GetActiveRecordBuffer: PChar;
begin
  case State of
    dsBrowse: if IsEmpty then
        Result := nil
      else
        Result := ActiveBuffer;
    dsCalcFields: Result := CalcBuffer;
    dsFilter: Result := FFilterBuffer;
    dsEdit,
      dsInsert,
      dsOldValue,
      dsNewValue: Result := ActiveBuffer;
    else
      Result := nil;
  end;
end;

function TfdcCustomDataset.GetRecNo: integer;
var
  i: integer;
begin
  result := 0;
  if not Active then
  begin
    Result := -1;
    exit;
  end;

  if (ActiveBuffer = nil) then
    Result := -1
  else if IsEmpty or (State = dsInsert) then
    Result := -1
  else if FRecords.Count = 0 then
    Result := 0
  else
  begin
    //чтобы правильно работал скроллер в гриде при наличии фильтра или удаленных записей
    for i := 0 to PRecInfo(ActiveBuffer)^.RecNo do
      if FilterRecord(i) then
        result := result + 1;
  end;
end;

procedure TfdcCustomDataset.NewRecordInit(r: TRecord);
var
  i: integer;
begin
  if FieldDefs.count = 0 then
    raise Exception.Create('FieldDefs are empty. Can''t init new record');
  r.PhisRecNo := FRecords.count;
  r.State := usInserted;
  for i := 0 to FieldDefs.count - 1 do
    TRecordItem.Create(r);
end;

function TfdcCustomDataset.InternalGetFilteredRecNo(aFiltRecNo: integer):
  integer;
var
  i, RealRecNo: integer;
begin
  result := -1;
  if Filtered then
  begin
    RealRecNo := 0;
    for i := 0 to FRecords.Count - 1 do
    begin
      if FilterRecord(i) then
        RealRecNo := RealRecNo + 1;
      if RealRecNo = aFiltRecNo then
      begin
        result := i;
        break;
      end;
    end;
  end
  else
    Result := aFiltRecNo;
end;

procedure TfdcCustomDataset.SetRecNo(value: integer);
var
  i, NewPos: integer;
begin
  CheckBrowseMode;
  if (Value > 0) and (Value <= FRecords.Count) then
  begin
    //     FRecNo := InternalGetFilteredRecNo(Value);
    if Filtered then
    begin
      NewPos := 0;
      for i := 0 to FRecords.Count - 1 do
      begin
        if FilterRecord(i) then
          NewPos := NewPos + 1;
        if NewPos = value then
        begin
          FRecNo := i;
          break;
        end;
      end;
    end
    else
      FRecNo := Value;
    Resync([rmExact]);
  end;
end;

procedure TfdcCustomDataset.ReadParamData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FParams);
end;

procedure TfdcCustomDataset.WriteParamData(Writer: TWriter);
begin
  Writer.WriteCollection(Params);
end;

procedure TfdcCustomDataset.SetParams(Value: TParams);
begin
  FParams.AssignValues(Value);
end;

procedure TfdcCustomDataset.RefreshParams;
var
  DS: TDataSet;
begin
  DisableControls;
  try
    if FDataLink.DataSource <> nil then
    begin
      DS := FDataLink.DataSource.DataSet;
      if DS <> nil then
        if DS.Active and (DS.State <> dsSetKey) then
        begin
          Close;
          Open;
        end;
    end;
  finally
    EnableControls;
  end;
end;

procedure TfdcCustomDataset.SetParamsFromCursor;
var
  I: Integer;
  DataSet: TDataSet;
  fld: TField;
begin
  if (FDataLink.DataSource = nil) or (FDataLink.DataSource.DataSet = nil) then
    exit;

  DataSet := FDataLink.DataSource.DataSet;

  DataSet.FieldDefs.Update;
  for I := 0 to FParams.Count - 1 do
    if not (FParams[I].Bound or (FParams[I].ParamType = ptResult)) then
    begin
      fld := DataSet.FindField(FParams[I].Name);
      if fld <> nil then
      begin
        FParams[I].AssignField(fld);
        FParams[I].Bound := False;
      end;
    end;
end;

procedure TfdcCustomDataset.DefineProperties(Filer: TFiler);
  function WriteData: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FParams.IsEqual(TfdcCustomDataset(Filer.Ancestor).FParams)
    else
      Result := FParams.Count > 0;
  end;
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('ParamData', ReadParamData, WriteParamData, WriteData);
end;

function TfdcCustomDataset.GetParamsCount: Word;
begin
  result := FParams.Count;
end;

procedure TfdcCustomDataset.GetDetailLinkFields(MasterFields, DetailFields:
  TList);
  function AddFieldToList(const FieldName: string; DataSet: TDataSet; List:
    TList): Boolean;
  var
    Field: TField;
  begin
    Field := DataSet.FindField(FieldName);
    if (Field <> nil) then
      List.Add(Field);
    Result := Field <> nil;
  end;
var
  i: Integer;
begin
  MasterFields.Clear;
  DetailFields.Clear;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    for i := 0 to Params.Count - 1 do
      if AddFieldToList(Params[i].Name, DataSource.DataSet, MasterFields) then
        AddFieldToList(Params[i].Name, Self, DetailFields);
end;

function TfdcCustomDataset.ParamByName(const Value: string): TParam;
begin
  Result := FParams.ParamByName(Value);
end;

function TfdcCustomDataset.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TfdcCustomDataset.SetDataSource(const Value: TDataSource);
begin
  if IsLinkedTo(Value) then
    raise Exception.Create('Circular datalinks are not allowed');
  FDataLink.DataSource := Value;
end;

function TfdcCustomDataset.FilterRecord(r: integer): boolean;
var
  SaveState: TDatasetState;
  Buffer: PChar;
begin
  result := true;
  if TRecord(FRecords[r]).State = usDeleted then
  begin
    result := false;
    exit;
  end;
  if not Filtered then
    exit;

  Buffer := AllocRecordBuffer;
  SaveState := SetTempState(dsFilter);
  try
    PRecInfo(Buffer)^.RecNo := r;
    PRecInfo(Buffer)^.State := TRecord(FRecords[r]).State;
    PRecInfo(Buffer)^.BookmarkFlag := bfCurrent;
    FFilterBuffer := Buffer;

    //пока уберу, не знаю, что делать тут
    //if FRecalcOnIndex then
    //begin
    //     ClearCalcFields(Buffer);
    //     GetCalcFields(Buffer);
    //end;

    if Filtered and Assigned(OnFilterRecord) then
      OnFilterRecord(self, Result);
  finally
    RestoreState(SaveState);
    FreeRecordBuffer(Buffer);
  end;
end;

{ сортировка }

procedure TfdcCustomDataset.SetSortFieldNames(const Value: string);
begin
  FSortFieldNames := Value;
  if FIsOpen then
  begin
    FSorted := False;
    Sort;
  end;
end;

procedure TfdcCustomDataset.BuildFieldList(List: TList; const FieldNames:
  string);
var
  p: integer;
  fld: TField;
  //    sdvField: string;
begin
  List.Clear;
  p := 1;
  //FRecalcOnIndex:=false;
  while p <= length(FieldNames) do
  begin
    fld := FieldByName(ExtractFieldName(FieldNames, p));
    if ((fld.FieldKind = fkData) or (fld.FieldKind = fkCalculated)) and
      (fld.DataType in SortFieldTypes) then
      List.Add(fld)
    else
      raise Exception.CreateFmt('Can''t sort on field %s', [fld.DisplayName]);
    //     if fld.FieldKind=fkCalculated then FRecalcOnIndex:=true;
  end;
end;

procedure TfdcCustomDataset.Sort;
begin
  InternalSort;
end;

procedure TfdcCustomDataset.InternalSort;
var
  Pos: TBookmarkStr;
  FieldList: TList;
begin
  if (not Active) or (FRecords.Count = 0) then
    exit;
  FieldList := TList.create;
  try
    Pos := Bookmark;
    BuildFieldList(FieldList, FSortFieldNames);
    if FieldList.Count = 0 then
      exit;

    if coPartialKey in FSortOptions then
      FSortOptions := FSortOptions - [coPartialKey];
    InternalQuickSort(0, FRecords.Count - 1, FieldList);
    SetBufListSize(0);
    try
      SetBufListSize(BufferCount + 1);
    except
      SetState(dsInactive);
      CloseCursor;
      raise;
    end;
  finally
    //First;
    if Active then
      Bookmark := Pos;
    FieldList.free;
  end;
  FSorted := true;
end;

procedure TfdcCustomDataset.InternalQuickSort(L, R: Integer; FieldList: TList);
var
  I, J: Integer;
  P: TRecord;
  T: Pointer;
begin
  repeat
    I := L;
    J := R;
    P := TRecord(FRecords[(L + R) shr 1]);
    repeat
      while InternalCompareRecords(TRecord(FRecords[I]), P, FieldList,
        FSortOptions) < 0 do
        Inc(I);
      while InternalCompareRecords(TRecord(FRecords[J]), P, FieldList,
        FSortOptions) > 0 do
        Dec(J);
      if I <= J then
      begin
        T := FRecords.List^[I];
        FRecords.List^[I] := FRecords.List^[J];
        FRecords.List^[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      InternalQuickSort(L, J, FieldList);
    L := I;
  until I >= R;
end;

function TfdcCustomDataset.InternalCompareRecords(Record1, Record2: TRecord;
  FieldList: TList; CompOptions: TCompareOptions): Integer;
  function GetCalcFieldValue(R: TRecord; fld: TField): variant;
  var
    Buffer: PChar;
    BufTemp: Pointer;
    DTmp: TDateTime;
  begin
    Result := null;
    if r = nil then
      exit;
    if fld = nil then
      exit;
    Buffer := AllocRecordBuffer;
    try
      PRecInfo(buffer)^.RecNo := FRecords.indexof(R);
      GetCalcFields(buffer);
      BufTemp := Buffer;
      if (PChar(Buffer)[StartCalc + Fld.Offset] = #0) then
        exit;
      inc(PChar(BufTemp), StartCalc + Fld.Offset + 1);
      case fld.DataType of
        ftInteger, ftSmallInt, ftLargeInt: result := integer(bufTemp^);
        ftFloat, ftCurrency: result := Double(bufTemp^);
        ftDateTime:
          begin
            DTmp := TimeStampToDateTime(MSecsToTimeStamp(Double(BufTemp^)));
            result := DateTimeToStr(DTmp);
          end;
        ftString: result := string(PChar(BufTemp));
      end; {case}
    finally
      FreeRecordBuffer(Buffer);
    end;
  end;
var
  fld: TField;
  Value1, Value2: variant;
  i: integer;
begin
  Result := 0;
  if (Record1 = nil) or (Record2 = nil) then
    exit;

  for i := 0 to FieldList.Count - 1 do
  begin
    fld := TField(FieldList[i]);
    if fld.FieldNo <= 0 then //calculated fields
    begin
      Value1 := GetCalcFieldValue(Record1, fld);
      Value2 := GetCalcFieldValue(Record2, fld);
    end
    else
    begin
      value1 := TRecordItem(Record1.Items[fld.FieldNo - 1]).Value;
      value2 := TRecordItem(Record2.Items[fld.FieldNo - 1]).Value;
    end;
    Result := InternalCompare(Value1, Value2, fld.DataType, CompOptions);
    if Result <> 0 then
      break;
  end;

  // Couldnt compare them according to fieldcontents, will now compare according to recnum.
  //if Result=0 then
  //   Result:=FRecords.IndexOf(Record1) - FRecords.IndexOf(Record2);
  if (coDescending in FSortOptions) then
    Result := -Result;
end;

function TfdcCustomDataset.InternalCompare(Value1, Value2: Variant; ft:
  TFieldType; CompOptions: TCompareOptions): integer;
var
  d: double;
begin
  result := 0;
  case ft of
    ftInteger, ftSmallInt, ftWord, ftLargeInt:
      begin
        if VarIsNull(Value1) or VarIsEmpty(Value1) then
          Value1 := 0;
        if VarIsNull(Value2) or VarIsEmpty(Value2) then
          Value2 := 0;
        Result := Longint(Value1) - Longint(Value2);
      end;
    ftFloat, ftCurrency:
      begin
        if VarIsNull(Value1) or VarIsEmpty(Value1) then
          Value1 := 0.0;
        if VarIsNull(Value2) or VarIsEmpty(Value2) then
          Value2 := 0.0;
        //because if Double(Value1)>Double(Value2) doesn't work correctly with equal ftCurrency values ...
        if Extended(Value1) > Extended(Value2) then
          Result := 1
        else if Extended(Value1) < Extended(Value2) then
          Result := -1;
      end;
    ftBoolean:
      begin
        if VarIsNull(Value1) or VarIsEmpty(Value1) then
          Value1 := 0;
        if VarIsNull(Value2) or VarIsEmpty(Value2) then
          Value2 := 0;
        if Boolean(Value1) > Boolean(Value2) then
          Result := 1
        else if Boolean(Value1) < Boolean(Value2) then
          Result := -1;
      end;
    ftBCD:
      begin
        //?????
      end;
    ftString, ftGuid, ftFixedChar, ftWideString:
      begin
        if VarIsNull(Value1) or VarIsEmpty(Value1) then
          Value1 := '';
        if VarIsNull(Value2) or VarIsEmpty(Value2) then
          Value2 := '';
        if coPartialKey in CompOptions then
          Value1 := copy(VarToStr(Value1), 0, Length(VarToStr(Value2)));
        if coCaseInsensitive in CompOptions then
          Result := AnsiCompareText(VarToStr(Value1), VarToStr(Value2))
        else
          Result := AnsiCompareStr(VarToStr(Value1), VarToStr(Value2));
      end;
    ftDateTime, ftDate, ftTime:
      begin
        if VarIsNull(Value1) or VarIsEmpty(Value1) then
          Value1 := 0;
        if VarIsNull(Value2) or VarIsEmpty(Value2) then
          Value2 := 0;
        d := VarToDateTime(Value1) - VarToDateTime(Value2);
        if d < 0.0 then
          Result := -1
        else if d > 0.0 then
          Result := 1
        else
          Result := 0;
      end;
  end;
end;

procedure TfdcCustomDataset.QueryChanged(Sender: TObject);
var
  List: TParams;
begin
  if not (csReading in ComponentState) then
  begin
    Close;
    if ParamCheck or (csDesigning in ComponentState) then
    begin
      List := TParams.Create(Self);
      try
        List.ParseSQL(SQL.Text, True);
        List.AssignValues(FParams);
        FParams.Clear;
        FParams.Assign(List);

      finally List.Free;
      end;
    end;
    DataEvent(dePropertyChange, 0);
  end;
end;

procedure TfdcCustomDataset.SetCursorOpen(Value: boolean);
begin
  FIsOpen := Value;
end;

procedure TfdcCustomDataset.InternalInitFieldDefs;
begin
  FillFieldDefs;
end;

procedure TfdcCustomDataset.ExecSQL;
begin
  if Active then
    Close;
  Open;
  Close;
end;

function TfdcCustomDataset.CompareBookmarks(Bookmark1,
  Bookmark2: TBookmark): Integer;
var
  b1, b2: integer;
begin
  if (Bookmark1 = nil) or (Bookmark2 = nil) then
  begin
    Result := 0;
    Exit;
  end;
  b1 := PInteger(Bookmark1)^;
  b2 := PInteger(Bookmark2)^;
  if b1 = b2 then
    Result := 0
  else if b1 < b2 then
    Result := -1
  else
    Result := 1;
end;

function TfdcCustomDataset.GetFieldData(FieldNo: Integer;
  Buffer: Pointer): Boolean;
begin
  Result := GetFieldData(Fields.FieldByNumber(FieldNo), Buffer);
end;

function TfdcCustomDataset.InternalLocate(KeyFields: string; KeyValues: Variant;
  Options: TLocateOptions): boolean;
var
  FieldList: TList;
  CompOptions: TCompareOptions;
  r: TRecord;
  i: integer;
begin
  result := false;
  r := nil;
  if VarArrayDimCount(KeyFields) > 1 then
    raise Exception.Create('Incorect KeyFields Value');
  if VarArrayDimCount(KeyValues) > 1 then
    raise Exception.Create('Incorect KeyValues Value');
  CheckBrowseMode;
  CursorPosChanged;

  CompOptions := [];
  if loCaseInsensitive in Options then
    CompOptions := CompOptions + [coCaseInsensitive];
  if loPartialKey in Options then
    CompOptions := CompOptions + [coPartialKey];

  FieldList := TList.Create;
  DisableControls;
  try
    BuildFieldList(FieldList, KeyFields);
    r := TRecord.Create; //fake record for InternalCompareRecords function
    NewRecordInit(r);

    if FieldList.count = 1 then
      TRecordItem(r.items[TField(FieldList[0]).FieldNo - 1]).value := KeyValues
    else
    begin
      for i := 0 to FieldList.count - 1 do
      begin
        TRecordItem(r.items[TField(FieldList[i]).FieldNo - 1]).value :=
          KeyValues[i];
      end;
    end;

    //if быстрый поиск по отсортированным полям
    //пока нету

    //последовательный поиск
    for i := 0 to FRecords.count - 1 do
    begin
      if not FilterRecord(i) then
        continue;
      if InternalCompareRecords(TRecord(FRecords[i]), r, FieldList, CompOptions)
        = 0 then
      begin
        result := true;
        FRecNo := i;
        break;
      end;
    end;
  finally
    EnableControls;
    FieldList.Free;
    if assigned(r) then
      r.Free;
    SetFound(Result);
  end;
end;

procedure TfdcCustomDataset.Requery;
//var
//  mark: TBookmark;
begin
  RefreshDataset(Self, True);
  {disableControls;
  try
     if active then
     begin
          mark := getBookmark;
          close;
          try
             open;
             try
                gotoBookmark(mark);
             except;
             end;
          finally
                 freeBookmark(mark);
          end;
     end
     else
         open;
  finally
         enableControls;
  end; }

end;

function TfdcCustomDataset.UpdateStatus: TUpdateStatus;
begin
  result := usInvalid;
  if GetActiveRecordBuffer <> nil then
    result := PRecInfo(GetActiveRecordBuffer)^.State;
end;

procedure TfdcCustomDataset.RevertCurrent;
var
  ri: TRecInfo;
begin
  if GetActiveRecordBuffer = nil then
    exit;
  CheckBrowseMode;
  ri := PRecInfo(GetActiveRecordBuffer)^;
  if ri.State = usUnModified then
    exit;
  InternalRevertRecord(ri.RecNo);
  Refresh;
end;

function TfdcCustomDataset.Locate(const KeyFields: string; const KeyValues:
  Variant; Options: TLocateOptions): Boolean;
begin
  result := false;
  DoBeforeScroll;
  if InternalLocate(KeyFields, KeyValues, Options) then
  begin
    Resync([rmExact, rmCenter]);
    DoAfterScroll;
    Result := true;
  end;
end;

function TfdcCustomDataset.Lookup(const KeyFields: string; const KeyValues:
  Variant; const ResultFields: string): Variant;
var
  pos: TBookmarkStr;
begin
  Result := Null;
  pos := Bookmark;
  try
    if Locate(KeyFields, KeyValues, []) then
    begin
      SetTempState(dsCalcFields);
      try
        CalculateFields(ActiveBuffer);
        Result := FieldValues[ResultFields];
      finally
        RestoreState(dsBrowse);
      end;
    end;
  finally
    Bookmark := pos;
  end;
end;

function TfdcCustomDataset.CreateBlobStream(Field: TField;
  Mode: TBlobStreamMode): TStream;
begin
  result := TfdcBlobStream.Create(Field as TBlobField, Mode);
end;

procedure TfdcCustomDataset.InternalHandleException;
begin
  Application.HandleException(self);
end;

{procedure TfdcCustomDataset.SetConnectionName(const Value: string);
begin
  FConnectionName := Value;
end;}

function TfdcCustomDataset.ApplyCurrent: boolean;
var
  buf: Pchar;
  res: TUpdateAction;
begin
  result := false;
  CheckBrowseMode;
  //if UpdateObject = nil then
  //  raise Exception.Create('UpdateObject property is not defined');
  buf := GetActiveRecordBuffer;
  if buf = nil then
    exit;
  if (PRecInfo(buf)^.State = usUnModified) or (PRecInfo(buf)^.State = usInvalid)
    then
  begin
    result := true;
    exit;
  end;
  repeat
    res := InternalApplyUpdates(PRecInfo(buf)^.RecNo);
  until res <> uaRetry;
  if res = uaAbort then
    exit;
  DataEvent(deRecordChange, 0);
  result := true;
end;

{procedure TfdcCustomDataset.SetUpdateObject(const Value: TFDCUpdateSQL);
begin
  if FUpdateObject = Value then
    exit;
  if FUpdateObject <> nil then
    FUpdateObject.RemoveFreeNotification(self);
  FUpdateObject := Value;
  if FUpdateObject <> nil then
    FUpdateObject.FreeNotification(self);
end;}

procedure TfdcCustomDataset.PrepareCachedUpdates(Dest: TfdcCustomDataset; Rec:
  integer);
var
  i: integer;
  Field: TField;
  PName: string;
  Old: Boolean;
begin
  for I := 0 to Dest.Params.Count - 1 do
  begin
    PName := Dest.Params[i].Name;
    Old := CompareText(Copy(PName, 1, 4), 'OLD_') = 0;
    if Old then
      System.Delete(PName, 1, 4);
    Field := FindField(PName);
    if not Assigned(Field) then
      Continue;
    if Old then
      Dest.Params[i].AssignFieldValue(Field,
        TRecordItem(TRecord(FRecords[Rec]).items[Field.FieldNo - 1]).OriginalValue)
    else
      Dest.Params[I].AssignFieldValue(Field,
        TRecordItem(TRecord(FRecords[Rec]).items[Field.FieldNo - 1]).Value);
  end;
end;

procedure TfdcCustomDataset.AssignCachedUpdatesValues(Src: TfdcCustomDataset;
  Rec: integer; UpdKind: TUpdateKind);
var
  i: integer;
  Fld: TField;
begin
  if UpdKind = ukDelete then
  begin
    TRecord(FRecords[Rec]).Free;
    FRecords.Delete(Rec);
    exit;
  end;
  for i := 0 to TRecord(FRecords[Rec]).Count - 1 do
  begin
    with TRecordItem(TRecord(FRecords[Rec]).Items[i]) do
    begin
      //revert values
      if State <> usUnModified then
      begin
        OriginalValue := Value;
        State := usUnModified;
      end;
    end;
  end;
  for i := 0 to Src.Params.Count - 1 do
  begin
    //     if (Src.Params[i].ParamType in [ptOutput, ptInputOutput, ptResult]) then
    begin
      Fld := Fields.FindField(Src.Params[i].name);
      if Fld = nil then
        Continue;
      if Fld.DataType = Src.Params[i].DataType then
        with TRecordItem(TRecord(FRecords[Rec]).Items[Fld.FieldNo - 1]) do
        begin
          OriginalValue := Src.Params[i].Value;
          Value := OriginalValue;
        end;
    end;
  end;
  {if (FUpdateObject.ExecType[UpdKind] = etOpen) then
  begin
    if Src.Active and (Src.RecordCount > 0) then
      for i := 0 to Src.Fields.Count - 1 do
      begin
        Fld := Fields.FieldByName(Src.Fields[i].FieldName);
        if Fld = nil then
          Continue;
        if Fld.DataType = Src.Fields[i].DataType then
          with TRecordItem(TRecord(FRecords[Rec]).Items[Fld.FieldNo - 1]) do
          begin
            OriginalValue := Src.Fields[i].Value;
            Value := OriginalValue;
          end;
      end;
  end;}
  TRecord(FRecords[Rec]).State := usUnModified;
end;

procedure TfdcCustomDataset.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  //if (operation = opRemove) and (Acomponent = FUpdateObject) then
  //  FUpdateObject := nil;
end;

function TfdcCustomDataset.InternalApplyUpdates(Rec: integer): TUpdateAction;
begin
  Result := uaApplied; // TODO
end;

procedure TfdcCustomDataset.PSEndTransaction(Commit: Boolean);
begin
end;

function TfdcCustomDataset.PSUpdateRecord(UpdateKind: TUpdateKind; Delta:
  TDataSet): Boolean;
var
  UpdateAction: TUpdateAction;
begin
  result := false;
  if Assigned(FOnUpdateRecord) then
  begin
    UpdateAction := uaFail;
    FOnUpdateRecord(Delta, UpdateKind, UpdateAction);
    Result := UpdateAction = uaApplied;
  end;
end;

procedure TfdcCustomDataset.PSStartTransaction;
begin
end;

procedure TfdcCustomDataset.PSSetCommandText(const CommandText: string);
begin
  if CommandText <> '' then
    SQL.Text := CommandText;
end;

procedure TfdcCustomDataset.PSSetParams(AParams: TParams);
begin
  if AParams = nil then
    exit;
  Params.Assign(AParams);
  Close;
end;

procedure TfdcCustomDataset.PSReset;
begin
  inherited;
end;

function TfdcCustomDataset.PSIsSQLSupported: Boolean;
begin
  Result := true;
end;

function TfdcCustomDataset.PSIsSQLBased: Boolean;
begin
  result := true;
end;

function TfdcCustomDataset.PSInTransaction: Boolean;
begin
  result := false;
end;

function TfdcCustomDataset.PSGetUpdateException(E: Exception; Prev:
  EUpdateError): EUpdateError;
begin
  result := inherited PSGetUpdateException(E, Prev);
end;

procedure TfdcCustomDataset.RevertRecords;
var
  i: integer;
  b: boolean;
begin
  CheckBrowseMode;
  CursorPosChanged;
  b := false;
  for i := FRecords.Count - 1 downto 0 do
  begin
    if TRecord(FRecords[i]).State <> usUnModified then
    begin
      InternalRevertRecord(i);
      b := true;
    end;
  end;
  if b then
    Refresh;
end;

procedure TfdcCustomDataset.InternalRevertRecord(aRecNo: integer);
var
  i: integer;
  r: TRecord;
begin
  r := TRecord(FRecords[aRecNo]);
  case r.State of
    usInserted:
      begin
        InternalDeleteRecord(aRecNo);
      end;
    usDeleted, usModified:
      begin
        r.State := usUnmodified;
        for i := 0 to Fields.count - 1 do
          with TRecordItem(r.Items[i]) do
          begin
            State := usUnModified;
            Value := OriginalValue;
          end;
      end;
  end;
end;

procedure TfdcCustomDataset.InternalDeleteRecord(aRecNo: integer);
begin
  TRecord(FRecords[aRecNo]).Free;
  FRecords.Delete(aRecNo);
end;

procedure TfdcCustomDataset.ApplyUpdates;
var
  i: integer;
  b: boolean;
  res: TUpdateAction;
begin
  b := false;
  CheckBrowseMode;
  {if FUpdatesInTran then
     Connection.BeginTran;}
  try
    for i := FRecords.Count - 1 downto 0 do
    begin
      if TRecord(FRecords[i]).State <> usUnModified then
      begin
        //if UpdateObject = nil then
        //  raise Exception.Create('No UpdateObject available');
        repeat
          res := InternalApplyUpdates(i);
        until res <> uaRetry;
        if res = uaAbort then
          exit;
        b := true;
      end;
    end;
    {if FUpdatesInTran then
       Connection.CommitTran;}
    if FUpdatesForceReopen then
      ReQuery
    else if b then
      Refresh;
  except
    //if FUpdatesInTran then Connection.RollbackTran;
    raise;
  end;
end;

procedure TfdcCustomDataset.Post;
begin
  if Recordcount > 0 then
  begin
    if not (State in dsEditModes) then
      Edit;
    inherited;
  end
  else
  begin
    if (State in dsEditModes) then
      inherited;
  end;
end;

procedure TfdcCustomDataset.InternalRestoreScreenCursor;
begin
  if GetCurrentThreadID <> MainThreadID then
    exit;
  Screen.Cursor := crDefault;
end;

procedure TfdcCustomDataset.InternalSaveScreenCursor;
begin
  if GetCurrentThreadID <> MainThreadID then
    exit;
  Screen.Cursor := crSQLWait;
end;

function TfdcCustomDataset.LocateNearest(KeyField: string; KeyValue: Variant):
  boolean;
begin
  result := false;
  DoBeforeScroll;
  if InternalLocateNearest(KeyField, KeyValue) then
  begin
    Resync([rmExact, rmCenter]);
    DoAfterScroll;
    Result := true;
  end;
end;

function TfdcCustomDataset.InternalLocateNearest(KeyField: string; KeyValue:
  Variant): boolean;
var
  FieldList: TList;
  CompOptions: TCompareOptions;
  r: TRecord;
  i, res, LastFiltered: integer;

begin
  result := false;
  r := nil;
  if VarArrayDimCount(KeyField) > 1 then
    raise Exception.Create('Incorect KeyField Value');
  if VarIsArray(KeyValue) then
    raise Exception.Create('KeyValue is VarArray');
  CheckBrowseMode;
  CursorPosChanged;

  CompOptions := [];
  CompOptions := CompOptions + [coCaseInsensitive, coPartialKey];

  FieldList := TList.Create;
  DisableControls;
  try
    BuildFieldList(FieldList, KeyField);
    r := TRecord.Create; //fake record for InternalCompareRecords function
    NewRecordInit(r);

    TRecordItem(r.items[TField(FieldList[0]).FieldNo - 1]).value := KeyValue;

    //только последовательный поиск
    LastFiltered := 0;
    for i := 0 to FRecords.count - 1 do
    begin
      if not FilterRecord(i) then
        continue;
      res := InternalCompareRecords(TRecord(FRecords[i]), r, FieldList,
        CompOptions);
      if res >= 0 then
      begin
        result := true;
        if res = 0 then
          FRecNo := i
        else
          FRecNo := i - 1;
        break;
      end;
      LastFiltered := i;
    end;
    if not result then
    begin
      result := true;
      FRecNo := LastFiltered;
    end;
  finally
    EnableControls;
    FieldList.Free;
    if assigned(r) then
      r.Free;
    SetFound(Result);
  end;
end;

function TfdcCustomDataset.GetTotalRecordCount: integer;
begin
  if not Active then
    raise Exception.Create('Cannot perform this operation on a closed dataset');
  result := FRecords.count;
end;

{ TRecord }

constructor TRecord.Create;
begin
  inherited Create;
  Capacity := 96;
end;

destructor TRecord.Destroy;
var
  i: integer;
begin
  for i := 0 to count - 1 do
    TRecordItem(items[i]).free;
  inherited;
end;

{ TCustomDataLink }

procedure TCustomDataLink.ActiveChanged;
begin
  if FDataset.Active then
    FDataset.RefreshParams;
end;

procedure TCustomDataLink.CheckBrowseMode;
begin
  if FDataset.Active then
    FDataset.CheckBrowseMode;
end;

constructor TCustomDataLink.Create(ADataset: TfdcCustomDataset);
begin
  inherited Create;
  FDataset := ADataset;
end;

function TCustomDataLink.GetDetailDataSet: TDataSet;
begin
  Result := FDataSet;
end;

procedure TCustomDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) and FDataset.Active then
    FDataset.RefreshParams;
end;

{---------------- TfdcBlobStream ------------------}

constructor TfdcBlobStream.Create(Field: TBlobField; Mode: TBlobStreamMode);
begin
  FMode := Mode;
  FField := Field;
  FDataSet := FField.DataSet as TfdcCustomDataset;
  FFieldNo := FField.FieldNo;
  FOpened := True;
  if Mode <> bmRead then
  begin
    if FField.ReadOnly then
      raise Exception.CreateFmt('Field %s is read only', [FField.DisplayName]);
  end;
  if Mode = bmWrite then
    Truncate
  else
    ReadBlobData;
end;

destructor TfdcBlobStream.Destroy;
begin
  if FModified then
  begin
    try
      FField.Modified := True;
      WriteBlobData;
      FDataSet.DataEvent(deFieldChange, Longint(FField));
    except
      Application.HandleException(Self);
    end;
  end;
end;

function TfdcBlobStream.GetBlobSize: Longint;
begin
  result := 0;
  if VarIsNull(FData) or VarIsEmpty(FData) then
    exit;
  if VarIsArray(FData) then
    result := VarArrayHighBound(FData, 1) + 1
  else
    result := length(VarToStr(FData));
end;

function TfdcBlobStream.Read(var Buffer; Count: Integer): Longint;
var
  s: string;
  p: pointer;
begin
  Result := 0;
  if not FOpened then
    exit;
  if not (VarIsNull(FData) or VarIsEmpty(FData)) then
  begin
    case FField.DataType of
      ftMemo:
        begin
          if not (VarIsNull(FData) or VarIsEmpty(FData)) then
          begin
            s := VarToStr(FData);
            Result := Length(s) - FPosition;
            if Result > 0 then
            begin
              if Result > Count then
                Result := Count;
              Move(PChar(s)[FPosition], Buffer, Result);
              Inc(FPosition, Result);
            end
            else
              Result := 0;
          end;
        end;
      ftBlob, ftGraphic:
        begin
          Result := VarArrayHighBound(FData, 1) + 1 - FPosition;
          if Result > 0 then
          begin
            if Result > Count then
              Result := Count;
            p := VarArrayLock(FData);
            try
              move(Pointer(Longint(p) + FPosition)^, Buffer, Result);
              if Result < FField.DataSize then
                FillChar((PChar(Buffer) + Result)^, FField.DataSize - Result,
                  0);
            finally
              VarArrayUnlock(FData);
            end;
            inc(FPosition, Count);
          end
          else
            Result := 0;
        end;
    end; {case}
  end;
end;

procedure TfdcBlobStream.ReadBlobData;
var
  n: integer;
  Buffer: PChar;
begin
  Buffer := FDataset.GetActiveRecordBuffer;
  if Buffer = nil then
    exit;
  n := PRecInfo(Buffer)^.RecNo;
  if FDataset.State = dsOldValue then
    FData := TRecordItem(TRecord(FDataset.FRecords[n]).items[FFieldNo -
      1]).OriginalValue
  else
    FData := TRecordItem(TRecord(FDataset.FRecords[n]).items[FFieldNo -
      1]).Value;
end;

function TfdcBlobStream.Seek(Offset: Integer; Origin: Word): Longint;
begin
  case Origin of
    0: FPosition := Offset;
    1: Inc(FPosition, Offset);
    2: FPosition := GetBlobSize + Offset;
  end;
  Result := FPosition;
end;

procedure TfdcBlobStream.Truncate;
begin
  FData := null;
  FModified := true;
end;

function TfdcBlobStream.Write(const Buffer; Count: Integer): Longint;
var
  p: pointer;
  s: string;
begin
  Result := 0;
  if not FOpened then
    exit;
  if (FPosition >= 0) and (Count >= 0) then
  begin
    case FField.DataType of
      ftMemo:
        begin
          if not (VarIsNull(FData) or VarIsEmpty(FData)) then
            s := VarToStr(FData);
          SetLength(s, FPosition + Count);
          move(buffer, PChar(s)[FPosition], Count);
          FData := s;
          FPosition := FPosition + Count;
          Result := Count;
          FModified := True;
        end;
      ftBlob, ftGraphic:
        begin
          if not (VarIsNull(FData) or VarIsEmpty(FData)) then
            VarArrayRedim(FData, FPosition + Count)
          else
            FData := VarArrayCreate([0, FPosition + Count - 1], varByte);

          p := VarArrayLock(FData);
          try
            move(Buffer, Pointer(LongInt(p) + FPosition)^, Count);
          finally
            VarArrayUnLock(FData);
          end;
          FPosition := FPosition + Count;
          Result := Count;
          FModified := True;
        end
    end; {case}
  end;
end;

procedure TfdcBlobStream.WriteBlobData;
var
  n: integer;
  Buffer: PChar;
begin
  Buffer := FDataset.GetActiveRecordBuffer;
  if Buffer = nil then
    exit;
  if FDataset.FRecords.count = 0 then
    exit;
  n := PRecInfo(Buffer)^.RecNo;
  with TRecordItem(TRecord(FDataset.FRecords[n]).items[FFieldNo - 1]) do
  begin
    if (State = usUnModified) then
    begin
      Value := FData;
      if VarIsNull(OriginalValue) or VarIsEmpty(OriginalValue) then
        State := usModified
      else if (Value <> OriginalValue) then
        State := usModified;
    end;
  end;
end;

{ TRecordItem }

constructor TRecordItem.Create(Rec: TRecord);
begin
  inherited Create;
  Rec.Add(self);
end;

function TRecordItem.GetOriginalValue: OleVariant;
begin
  result := fOriginalValue;
end;

function TRecordItem.GetValue: OleVariant;
begin
  result := fValue;
end;

procedure TRecordItem.SetOriginalValue(const Value: OleVariant);
begin
  fOriginalValue := Value;
end;

procedure TRecordItem.SetValue(const Value: OleVariant);
begin
  fValue := Value;
end;

{ EFieldRequiredError }

constructor EFieldRequiredError.Create(AField: TField);
begin
  FField := AField;
  inherited CreateFmt(SFieldRequired, [Field.DisplayName]);
end;

end.

