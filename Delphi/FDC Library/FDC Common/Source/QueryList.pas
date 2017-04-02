{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 5663 $
  $Author: dnovokshonov $
  $Date: 2008-10-30 14:04:16 +0400 (Р§С‚, 30 РѕРєС‚ 2008) $
}

unit QueryList;

interface

uses
  SysUtils, Classes, Controls, DB, Oracle, OracleData;

type
  TsqlOp = class;

  EOracleSQLError = class(EOracleError)
  private
    FSQLText: string;
    FVariables: TStrings;
   public
    constructor Create(E: EOracleError; Query: TOracleQuery);
    destructor Destroy; override;
    property SQLText: string read FSQLText;
    property Variables: TStrings read FVariables;
  end;

  TQueryList = class(TComponent)
   protected
    FQuery: TOracleQuery;
    FQueries: TList;
    FExecuted: Boolean;
    FLastOp: TSqlOp;
    function GetAfterQuery: TNotifyEvent;
    function GetBeforeQuery: TNotifyEvent;
    function GetCursor: TCursor;
    function GetDebug: Boolean;
    function GetOnThreadError: TThreadErrorEvent;
    function GetOnThreadExecuted: TOracleQueryEvent;
    function GetOnThreadFinished: TOracleQueryEvent;
    function GetOnThreadRecord: TOracleQueryEvent;
    function GetSession: TOracleSession;
    function GetThreaded: Boolean;
    procedure SetAfterQuery(const Value: TNotifyEvent);
    procedure SetBeforeQuery(const Value: TNotifyEvent);
    procedure SetCursor(const Value: TCursor);
    procedure SetDebug(const Value: Boolean);
    procedure SetOnThreadError(const Value: TThreadErrorEvent);
    procedure SetOnThreadExecuted(const Value: TOracleQueryEvent);
    procedure SetOnThreadFinished(const Value: TOracleQueryEvent);
    procedure SetOnThreadRecord(const Value: TOracleQueryEvent);
    procedure SetSession(const Value: TOracleSession);
    procedure SetThreaded(const Value: Boolean);
    function GetThreadSynchronized: Boolean;
    procedure SetThreadSynchronized(const Value: Boolean);
    function GetParamValues(const ParamName: string): Variant;
    procedure SetParamValues(const ParamName: string;
      const Value: Variant);
    procedure AddQuery(Value: TsqlOp);
    procedure RemoveQuery(Value: TsqlOp);
    function GetQueryCount: Integer;
    function GetQuery(Index: Integer): TsqlOp;
    procedure UpdateParamValues(const ParamName: string;
      const Value: Variant);
    procedure SetDataSetVariables(DataSet: TDataSet; VarList: TStrings);
    procedure GetDataSetVariables(DataSet: TDataSet);
    procedure UpdateDataSetVariables(DataSet: TDataSet);
   protected
    procedure ClearQueryVariables;
    function ExecuteText(const Text: string; DataSet: TDataSet = nil; Modify: Boolean = False; IsSQL: Boolean = False): Variant;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SetChildOrder(Component: TComponent; Order: Integer); override;
    procedure CreateQuery;
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ParamValues[const ParamName: string]: Variant read GetParamValues write SetParamValues;
    property Query[Index: Integer]: TsqlOp read GetQuery; default;
    property QueryCount:Integer read GetQueryCount;
   published
    property Session: TOracleSession read GetSession write SetSession;
    property Cursor: TCursor read GetCursor write SetCursor default crSQLWait;
//    property Debug: Boolean read GetDebug write SetDebug default False;
    property Threaded: Boolean read GetThreaded write SetThreaded default False;
    property ThreadSynchronized: Boolean read GetThreadSynchronized write SetThreadSynchronized default True;
    property AfterQuery: TNotifyEvent read GetAfterQuery write SetAfterQuery;
    property BeforeQuery: TNotifyEvent read GetBeforeQuery write SetBeforeQuery;
    property OnThreadExecuted: TOracleQueryEvent read GetOnThreadExecuted write SetOnThreadExecuted;
    property OnThreadRecord: TOracleQueryEvent read GetOnThreadRecord write SetOnThreadRecord;
    property OnThreadFinished: TOracleQueryEvent read GetOnThreadFinished write SetOnThreadFinished;
    property OnThreadError: TThreadErrorEvent read GetOnThreadError write SetOnThreadError;
  end;

  TsqlOp = class(TComponent)
   private
    FQueryList: TQueryList;
    FSQL: TStrings;
    FDataSet: TDataSet;
    FModify: Boolean;
    FDebug: Boolean; // выполнение оператора изменяет БД
    function GetParamValues(const ParamName: string): Variant;
    procedure SetDataSet(const Value: TDataSet);
    procedure SetParamValues(const ParamName: string;
      const Value: Variant);
    procedure SetQueryList(const Value: TQueryList);
    procedure SetSQL(const Value: TStrings);
   protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetParentComponent(AParent: TComponent); override;
    procedure ReadState(Reader: TReader); override;
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  GetParentComponent: TComponent; override;
    function  HasParent: Boolean; override;
    function Exec: Variant; overload;
    function Exec(const ParamNames: string; const ParamValues: Variant): Variant; overload;
    function Exec(const ParamNames: string; const ParamValues: array of Variant): Variant; overload;
    function Query: TOracleQuery; overload;
    function Query(const ParamNames: string; const ParamValues: Variant): TOracleQuery; overload;
    function Query(const ParamNames: string; const ParamValues: array of Variant): TOracleQuery; overload;
    function StealQuery: TOracleQuery;
    property ParamValues[const ParamName: string]: Variant read GetParamValues write SetParamValues; default;
    property QueryList: TQueryList read FQueryList write SetQueryList;
    property Modify: Boolean read FModify write FModify default False;
   published
    property SQL: TStrings read FSQL write SetSQL;
    property Debug: Boolean read FDebug write FDebug default False;
    property DataSet: TDataSet read FDataSet write SetDataSet;
  end;

implementation

uses  OracleTypes, Variants;

{ TQueryList }

procedure TQueryList.AddQuery(Value: TsqlOp);
begin
 FQueries.Add(Value);
 Value.FQueryList := Self;
 Value.FreeNotification(Self);
end;

procedure TQueryList.ClearQueryVariables;
begin
 if FExecuted then
  begin
   FQuery.DeleteVariables;
   FExecuted := False;
 end;
end;

constructor TQueryList.Create(AOwner: TComponent);
begin
 inherited;
 CreateQuery;
 FQueries := TList.Create;
end;

destructor TQueryList.Destroy;
var
 I: Integer;
begin
 for I := FQueries.Count - 1 downto 0 do
          TObject(FQueries[I]).Free;
 FQueries.Free;
 FQuery.Free;
 inherited;
end;

function VarExists(Vars: TVariables; const VarName: string): Boolean;
var
 I: Integer;
begin
 for i := 0 to Vars.Count - 1 do
  with Vars.Data(i) do
     if Name = VarName then
      begin
       Result := True;
       Exit;
     end;
 Result := False;
end;

procedure TQueryList.SetDataSetVariables(DataSet: TDataSet; VarList: TStrings);
var
 VarName: string;
 F: TField;
 I: Integer;
 VarType: Integer;
 Value: Variant;
begin
 try
   for I := 0 to VarList.Count - 1 do
    begin
     VarName := VarList[I];
     if VarName[1] = ':' then System.Delete(VarName, 1, 1);
     if VarName = 'DOA__ROWID' then
      if DataSet is TOracleDataSet then
       begin
        FQuery.DeclareVariable(VarName, otString);
        FQuery.SetVariable(VarName, TOracleDataSet(DataSet).RowId);
        Continue;
      end;
     F := DataSet.FindField(VarName);
     if F <> nil then Value := F.Value
      else if Copy(VarName, 1, 4) = 'OLD_' then
       begin
        F := DataSet.FindField(Copy(VarName, 5, MaxInt));
        if F <> nil then Value := F.OldValue;
      end;
     if F <> nil then
      begin
       case F.DataType of
        ftString:    VarType := otString;
        ftDate,
        ftTime,
        ftDateTime:  VarType := otDate;
        ftFloat,
        ftCurrency:  VarType := otFloat;
        ftBoolean :  VarType := otInteger;
        ftSmallInt,
        ftLargeint,
        ftInteger:   VarType := otInteger;
        ftBlob:      VarType := otBLOB;
//        ftMemo:      VarType := otCLOB;
        ftMemo:      VarType := otString;
       else
        raise Exception.CreateFmt('Неверный тип данных для поля %s [индекс %d]', [F.FieldName, ord(F.DataType)]);
       end;
       FQuery.DeclareVariable(VarName, VarType);
       FQuery.SetVariable(VarName, Value);
     end;
   end;
 except
   FQuery.DeleteVariables;
   raise;
 end;
end;

function AlmostEqual(D1, D2: Double): Boolean;
begin
  if D2 <> 0 then D1 := (D1 - D2) / D2;
  Result := Abs(D1) < 0.0000000001;
end;

function VariantEqual(const Var1, Var2: Variant): Boolean;
var
 Var1N, Var2N: Boolean;
begin
 Result := False;
 Var1N := (TVarData(Var1).VType in [varNull, varEmpty])
              or ((TVarData(Var1).VType = varString) and (TrimRight(Var1) = ''));
 Var2N := (TVarData(Var2).VType in [varNull, varEmpty])
              or ((TVarData(Var2).VType = varString) and (TrimRight(Var2) = ''));
 if not (Var1N xor Var2N)  then
   if not (Var1N and Var2N) then
     case VarType(Var1) of
      varString: Result :=  VarToStr(Var1) = TrimRight(Var2);
      varDouble: Result :=  AlmostEqual(Var1, Var2);
      varDate: Result := Abs(TDateTime(Var1) - TDateTime(Var2)) < 1 / (24 * 60 * 60);
      else Result := Var1 = Var2;
     end
    else Result := True;
end;

type
 TMyDataSet = class(TDataSet)
  protected
    Records: TRecordDataList;
    DMLQuery: TOracleQuery;
    FExternalCursor: TOracleQuery;
    CursorQuery: TOracleQuery;
    CursorValid: Boolean;
    CursorCreated: Boolean;
    FirstSync: Boolean;
    NoDataEvents: Boolean;
    Posting: Boolean;
    ActiveOnLoading: Boolean;
    MasterBookmark: Integer;
    FieldInfoList: TList;
    RowIdIndex: Integer;
    FRecBufSize: Integer;
    FRecordSize: Integer;
    FCurRec: Integer;
    FLastBookmark: Integer;
    FQuery: TOracleQuery;
    FTableName: string;
    FHasRowId: Boolean;
    FFilterBuffer: PRecordData;
    FilterExpr: TObject;
    FMaster: TOracleDataSet;
    FMasterFields: string;
    FDetailFields: string;
    FDetails: TList;
    FReadOnly: Boolean;
    FSequenceField: TSequenceField;
    FOracleDictionary: TOracleDictionary;
    FOnTranslateMessage: TTranslateMessageEvent;
    FBeforeQuery: TOracleDataSetEvent;
    FAfterQuery: TOracleDataSetEvent;
    FOnApplyRecord: TApplyRecordEvent;
    FAfterRefreshRecord: TOracleDataSetEvent;
    FAfterFetchRecord: TAfterFetchRecordEvent;
    FLockingMode: TLockingModeOptions;
    FQueryAllRecords: Boolean;
    FUnidirectional: Boolean;
    FCountAllRecords: Boolean;
    FRefreshOptions: TRefreshOptions;
    FUpdatingTable: string;
    FCollectionTypes: TStringList;
    FCollectionNames: TStringList;
    FCommitOnPost: Boolean;
    FDesignActivation: Boolean;
    FDetachable: Boolean;
    FirstFetch: Boolean;
    IdColumns: TStringList;
    Query: TOracleQuery;
    WorkBlobs: TBlobList;
    ChangeLog: TCollection;
    FLogChanges: Boolean;
    FCachedUpdates: Boolean;
    FLogRec: Integer;
    Applying: Boolean;
    JustData: Boolean;
 end;
procedure TQueryList.GetDataSetVariables(DataSet: TDataSet);
const
 NewStates: array[Boolean] of TDataSetState = (dsNewValue, dsCurValue);
var
 VarName: string;
 F: TField;
 I: Integer;
 Value: Variant;
 OldState: TDataSetState;
 NewState: TDataSetState;
 DoEdit: Boolean;
 ChangeState: Boolean;
begin
 DoEdit := not ((DataSet is TOracleDataSet) and TMyDataSet(DataSet).Applying);
 NewState := NewStates[DoEdit];
 ChangeState := (DataSet is TOracleDataSet);
 for I := 0 to FQuery.VariableCount - 1 do
  begin
   VarName := FQuery.VariableName(I);
   if VarName[1] = ':' then System.Delete(VarName, 1, 1);
   F := DataSet.FindField(VarName);
   if (F <> nil) and not F.IsBlob then
    begin
     Value := FQuery.GetVariable(VarName);
     if not VariantEqual(F.Value, Value) then
      begin
       if DoEdit and not (DataSet.State in dsEditModes) then
        begin
         DataSet.Edit;
         DoEdit := False;
       end;
//       OldState := TMyDataSet(DataSet).SetTempState(NewState);
       try
        case VarType(Value) of
         varNull,
         varEmpty: F.Clear;
         else if F.DataType = ftString then F.Value := TrimRight(Value)
             else F.Value := Value;
        end;
       finally
//       if ChangeState then  TMyDataSet(DataSet).RestoreState(OldState);
        TMyDataSet(DataSet).DataEvent(deFieldChange, Integer(F));
       end;
     end;
    end;
 end;
end;

procedure TQueryList.UpdateDataSetVariables(DataSet: TDataSet);
var
 VarName: string;
 F: TField;
 I: Integer;
 Value: Variant;
begin
 for I := 0 to FQuery.VariableCount - 1 do
  begin
   VarName := FQuery.VariableName(I);
   if VarName[1] = ':' then System.Delete(VarName, 1, 1);
   if VarName = 'DOA__ROWID' then
    if DataSet is TOracleDataSet then
     begin
      FQuery.SetVariable(VarName, TOracleDataSet(DataSet).RowId);
      Continue;
    end;
   F := DataSet.FindField(VarName);
   if F <> nil then Value := F.Value
    else if Copy(VarName, 1, 4) = 'OLD_' then
     begin
      F := DataSet.FindField(Copy(VarName, 5, MaxInt));
      if F <> nil then Value := F.OldValue;
    end;
   if F <> nil then  FQuery.SetVariable(VarName, Value);
 end;
end;


function TQueryList.ExecuteText(const Text: string; DataSet: TDataSet; Modify: Boolean; IsSQL: Boolean): Variant;
const
  RESULT_NAME = ':RESULT';
var
 Vars: TStringList;
 I: Integer;
begin
 if not FExecuted or (FQuery.SQL.Text <> Text) then
  begin
   ClearQueryVariables;
   FQuery.SQL.Text := Text;
   Vars := FindVariables(Text, False);
   try
    I := Vars.IndexOf('');
    if I >= 0 then  Vars.Delete(I);
    if DataSet <> nil then SetDataSetVariables(DataSet, Vars);
    if Vars.Count > FQuery.VariableCount then
     for I := 0 to Vars.Count - 1 do
      if not VarExists(FQuery.Variables, ':'+Vars[I]) then
          FQuery.DeclareVariable(Vars[I], otString);
   finally
    Vars.Free;
   end;
  end
   else
    if DataSet <> nil then UpdateDataSetVariables(DataSet);
 try
  FExecuted := True;
//  try
   FQuery.Execute;
//  except
//   on E: EOracleError do
   // existing state of "object" has been changed
//    if E.ErrorCode = 4068 then FQuery.Execute
//     else raise;
//  end;
 except
  on E: EOracleError do
    raise EOracleSQLError.Create(E, FQuery);
 end;
 if IsSQL then Exit;
 if FQuery.Debug and Assigned(Oracle.InternalDebug) then Oracle.InternalDebug(FQuery); 
 if DataSet <> nil then  GetDataSetVariables(DataSet);
 if VarExists(FQuery.Variables, RESULT_NAME) then
    Result := FQuery.GetVariable(RESULT_NAME)
       else Result := NULL;
 if Modify then FQuery.Session.Tag := 1;
end;

function TQueryList.GetAfterQuery: TNotifyEvent;
begin
 @Result := @FQuery.AfterQuery;
end;

function TQueryList.GetBeforeQuery: TNotifyEvent;
begin
 @Result := @FQuery.BeforeQuery;
end;

procedure TQueryList.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  Query: TsqlOp;
begin
  for I := 0 to FQueries.Count - 1 do
  begin
    Query := FQueries[I];
    if Query.Owner = Root then Proc(Query);
  end;
end;

function TQueryList.GetCursor: TCursor;
begin
 Result := FQuery.Cursor;
end;

function TQueryList.GetDebug: Boolean;
begin
 Result := FQuery.Debug;
end;

function TQueryList.GetOnThreadError: TThreadErrorEvent;
begin
 @Result := @FQuery.OnThreadError;
end;

function TQueryList.GetOnThreadExecuted: TOracleQueryEvent;
begin
 @Result := @FQuery.OnThreadExecuted;
end;

function TQueryList.GetOnThreadFinished: TOracleQueryEvent;
begin
 @Result := @FQuery.OnThreadFinished;
end;

function TQueryList.GetOnThreadRecord: TOracleQueryEvent;
begin
 @Result := @FQuery.OnThreadRecord;
end;

procedure GetNameList(List: TStrings;  const ParamNames: string);
var
 Pos: Integer;
begin
 Pos := 1;
 while Pos <= Length(ParamNames) do
   List.Add(ExtractFieldName(ParamNames, Pos));
end;

function TQueryList.GetParamValues(const ParamName: string): Variant;
var
 Params: TStringList;
 I: Integer;
begin
 if Pos(';', ParamName) <> 0 then
  begin
   Params := TStringList.Create;
   try
    GetNameList(Params, ParamName);
    Result := VarArrayCreate([0, Params.Count - 1], varVariant);
    for I := 0 to Params.Count - 1 do
     Result[I] := FQuery.GetVariable(Params[I]);
   finally
    Params.Free;
   end;
  end
   else Result := FQuery.GetVariable(ParamName);
end;

function TQueryList.GetQuery(Index: Integer): TsqlOp;
begin
 Result := TsqlOp(FQueries[Index]);
end;

function TQueryList.GetQueryCount: Integer;
begin
 Result := FQueries.Count;
end;

function TQueryList.GetSession: TOracleSession;
begin
 Result := FQuery.Session;
end;

function TQueryList.GetThreaded: Boolean;
begin
 Result := FQuery.Threaded;
end;

function TQueryList.GetThreadSynchronized: Boolean;
begin
 Result := FQuery.ThreadSynchronized;
end;

procedure TQueryList.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
 inherited;
 if Operation = opRemove then
  if AComponent is TsqlOp then RemoveQuery(TsqlOp(AComponent));
end;

procedure TQueryList.RemoveQuery(Value: TsqlOp);
begin
 if FQueries.Remove(Value) >= 0 then Value.FQueryList := nil; 
end;

procedure TQueryList.SetAfterQuery(const Value: TNotifyEvent);
begin
 @FQuery.AfterQuery := @Value;
end;

procedure TQueryList.SetBeforeQuery(const Value: TNotifyEvent);
begin
 @FQuery.BeforeQuery := @Value;
end;

procedure TQueryList.SetChildOrder(Component: TComponent; Order: Integer);
begin
//  if FQueries.IndexOf(Component) >= 0 then
//    TsqlOp(Component). .Index := Order;
end;

procedure TQueryList.SetCursor(const Value: TCursor);
begin
 FQuery.Cursor := Value;
end;

procedure TQueryList.SetDebug(const Value: Boolean);
begin
 FQuery.Debug := Value;
end;

procedure TQueryList.SetOnThreadError(const Value: TThreadErrorEvent);
begin
 FQuery.OnThreadError := Value;
end;

procedure TQueryList.SetOnThreadExecuted(const Value: TOracleQueryEvent);
begin
 FQuery.OnThreadExecuted := Value;
end;

procedure TQueryList.SetOnThreadFinished(const Value: TOracleQueryEvent);
begin
 FQuery.OnThreadFinished := Value;
end;

procedure TQueryList.SetOnThreadRecord(const Value: TOracleQueryEvent);
begin
 FQuery.OnThreadRecord := Value;
end;

function VarType2Ora(const Value: Variant): Integer;
begin
 case VarType(Value) and varTypeMask of
  varEmpty,
  varNull:    Result := otString;
  varSmallint,
  varInteger: Result := otInteger;
  varSingle,
  varDouble,
  varCurrency: Result := otFloat;
  varDate:    Result := otDate;
  varOleStr,
  varStrArg,
  varString: Result := otString;
  varByte: if VarIsArray(Result) then Result := otLongRaw else Result := otInteger; 
  else raise Exception.Create('Неверный тип bind переменной');
 end;
end;

procedure TQueryList.UpdateParamValues(const ParamName: string; const Value: Variant);
var
 Params: TStringList;
 I: Integer;
begin
 if Pos(';', ParamName) <> 0 then
  begin
   Params := TStringList.Create;
   try
    GetNameList(Params, ParamName);
    for I := 0 to Params.Count - 1 do
      FQuery.SetVariable(Params[I], Value[I]);
   finally
    Params.Free;
   end;
  end
   else FQuery.SetVariable(ParamName, Value);
end;

procedure TQueryList.SetParamValues(const ParamName: string;
  const Value: Variant);
var
 Params: TStringList;
 I: Integer;

 procedure SetQueryVariable(const VarName: string; const VarValue: Variant);
 const
  ArraySize = 150;
  StringSize: array[Boolean] of Integer = (0, 200);
 var
  VarType: Integer;
 begin
  VarType := VarType2Ora(VarValue);
  FQuery.DeclareVariable(VarName, VarType);
  if VarIsArray(VarValue) and (VarType <> otLongRaw) then
    FQuery.DimPLSQLTable(VarName, ArraySize, StringSize[VarType = otString]);
  FQuery.SetVariable(VarName, VarValue);
 end;
begin
 ClearQueryVariables;
 if Pos(';', ParamName) <> 0 then
  begin
   Params := TStringList.Create;
   try
    GetNameList(Params, ParamName);
    for I := 0 to Params.Count - 1 do
      SetQueryVariable(Params[I], Value[I]);
   finally
    Params.Free;
   end;
  end
   else SetQueryVariable(ParamName, Value);
end;

procedure TQueryList.SetSession(const Value: TOracleSession);
begin
 FQuery.Session := Value;
end;

procedure TQueryList.SetThreaded(const Value: Boolean);
begin
 FQuery.Threaded := Value;
end;

procedure TQueryList.SetThreadSynchronized(const Value: Boolean);
begin
 FQuery.ThreadSynchronized := True;
end;

procedure TQueryList.CreateQuery;
var
 Cursor: TCursor;
 ASession: TOracleSession;
begin
 if FQuery = nil then
  begin
   Cursor := crSQLWait;
   ASession := nil;
  end
 else
  begin
   Cursor := FQuery.Cursor;
   ASession := FQuery.Session;
 end;
 FQuery := TOracleQuery.Create(nil);
 FQuery.Cursor := Cursor;
 FQuery.Session := ASession;
end;

{ TsqlOp }

constructor TsqlOp.Create(AOwner: TComponent);
begin
 inherited;
 FSQL := TStringList.Create;
end;

destructor TsqlOp.Destroy;
begin
 FSQL.Free;
 QueryList := nil;
 inherited;
end;

function TsqlOp.Exec: Variant;
begin
// if QueryList.FLastOp <> Self then QueryList.ClearQueryVariables;
 if QueryList.FLastOp <> Self then QueryList.FQuery.DeleteVariables;
 QueryList.FQuery.Debug := Debug;
 QueryList.FLastOp := Self;
 Result := QueryList.ExecuteText(FSQL.Text, DataSet, Modify);
end;

function TsqlOp.Exec(const ParamNames: string;
  const ParamValues: Variant): Variant;
begin
 if QueryList.FExecuted and (QueryList.FLastOp = Self) and (QueryList.FQuery.SQL.Text = SQL.Text) then
     QueryList.UpdateParamValues(ParamNames, ParamValues)
  else Self.ParamValues[ParamNames] := ParamValues;
 Result := Exec;
end;

function TsqlOp.Exec(const ParamNames: string;
  const ParamValues: array of Variant): Variant;
begin
 if High(ParamValues) = 0 then Result := Exec(ParamNames, ParamValues[0])
   else  Result := Exec(ParamNames, VarArrayOf(ParamValues));
end;

function TsqlOp.GetParamValues(const ParamName: string): Variant;
begin
 Result := QueryList.ParamValues[ParamName];
end;

function TsqlOp.GetParentComponent: TComponent;
begin
 Result := QueryList;
 if Result = nil then Result := inherited GetParentComponent;
end;

function TsqlOp.HasParent: Boolean;
begin
 if QueryList <> nil then Result := True
   else  Result := inherited HasParent;
end;

procedure TsqlOp.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
 inherited;
 if Operation = opRemove then
  if DataSet = AComponent then FDataSet := nil;
end;

function TsqlOp.Query: TOracleQuery;
begin
 QueryList.FQuery.Debug := Debug;
 QueryList.ExecuteText(FSQL.Text, DataSet, False, True);
 Result := QueryList.FQuery;
end;

function TsqlOp.Query(const ParamNames: string;
  const ParamValues: Variant): TOracleQuery;
begin
 if QueryList.FExecuted and (QueryList.FQuery.SQL.Text = SQL.Text) then
     QueryList.UpdateParamValues(ParamNames, ParamValues)
  else Self.ParamValues[ParamNames] := ParamValues;
 Result := Query;
end;

function TsqlOp.Query(const ParamNames: string;
  const ParamValues: array of Variant): TOracleQuery;
begin
 if High(ParamValues) = 0 then Result := Query(ParamNames, ParamValues[0])
    else Result := Query(ParamNames, VarArrayOf(ParamValues));
end;

procedure TsqlOp.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TQueryList then
    QueryList := TQueryList(Reader.Parent);
end;

procedure TsqlOp.SetDataSet(const Value: TDataSet);
begin
 if DataSet <> Value then
  begin
   FDataSet := Value;
   if Value <> nil then Value.FreeNotification(Self);
 end;
end;

procedure TsqlOp.SetParamValues(const ParamName: string;
  const Value: Variant);
begin
 if QueryList.FLastOp <> Self then QueryList.FExecuted := True; 
 QueryList.ParamValues[ParamName] := Value;
 QueryList.FLastOp := Self;
end;

procedure TsqlOp.SetParentComponent(AParent: TComponent);
begin
 if not (csLoading in ComponentState) and (AParent is TQueryList) then
    QueryList := TQueryList(AParent);
end;

procedure TsqlOp.SetQueryList(const Value: TQueryList);
begin
  if FQueryList <> Value then
   begin
    if FQueryList <> nil then FQueryList.RemoveQuery(Self);
    if Value <> nil then Value.AddQuery(Self);
  end;
end;

procedure TsqlOp.SetSQL(const Value: TStrings);
begin
 FSQL.BeginUpdate;
 try
   FSQL.Assign(Value);
 finally
   FSQL.EndUpdate;
 end;
end;

function TsqlOp.StealQuery: TOracleQuery;
begin
 Result := QueryList.FQuery;
 QueryList.CreateQuery;
end;

{ EOracleSQLError }

type
 EOracleErrorCrack = class(Exception)
  private
    FErrorCode: Integer;
 end;

constructor EOracleSQLError.Create(E: EOracleError; Query: TOracleQuery);
var
 I: Integer;
 V: Variant;
 S: String;
begin
 Message := E.Message;
 EOracleErrorCrack(Self).FErrorCode := E.ErrorCode;
 FSQLText := Query.SQL.Text;
 FVariables := TStringList.Create;
 for I := 0 to Query.VariableCount-1 do
  begin
   V := Query.GetVariable(Query.VariableName(I));
   if (VarType(V) and not varTypeMask) = 0 then S := VarToStr(V)
     else S := 'PL/SQL Table';
   FVariables.AddObject(Query.VariableName(I)+'='+S, Pointer(Query.VariableType(I)));
 end;
end;

destructor EOracleSQLError.Destroy;
begin
 FVariables.Free;
 inherited;
end;

end.
