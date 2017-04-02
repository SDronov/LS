unit qdbfload;

interface

uses Oracle, DB, Classes, SysUtils;

type

  TDataSetLoader = class
  private
    FOraSession: TOracleSession;
    FDoCommitBtwStep: Boolean;
    FRecordsInStep: Integer;
    FCurrentCnt: Integer;
    FTotalCnt: Integer;
    FTerminated: Boolean;
    FOnError: TArrayErrorEvent;
    procedure DoOnError(Sender: TOracleQuery; Index,
      ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
  protected
    procedure DoLoad(DataSet: TDataSet; OraQuery: TOracleQuery);
    function MakeQuery(DataSet: TDataSet;
      const TableName: string): TOracleQuery;
  public
    constructor Create(Session: TOracleSession); overload;
    destructor Destroy; override;
    procedure Load(DataSet: TDataSet; const TableName: string);
    procedure Terminate;
    property RecordsInStep: Integer read FRecordsInStep write FRecordsInStep;
    property CurrentCnt: Integer read FCurrentCnt;
    property TotalCnt: Integer read FTotalCnt;
    property DoCommitBtwStep: Boolean read FDoCommitBtwStep write
      FDoCommitBtwStep;
    property OnError: TArrayErrorEvent read FOnError write FOnError;
  end;

implementation

destructor TDataSetLoader.Destroy;
begin
  inherited;
end;

procedure TDataSetLoader.DoLoad(DataSet: TDataSet; OraQuery: TOracleQuery);
var
  ValueArr: array of array of Variant;
  i, j, k: Integer;
begin
  FTerminated := False;
  SetLength(ValueArr, OraQuery.VariableCount);

  for i := 0 to (OraQuery.VariableCount - 1) do
    SetLength(ValueArr[i], RecordsInStep);

  DataSet.First;

  k := 0;
  for i := 0 to (DataSet.RecordCount - 1) do
  begin
    if FTerminated then
    begin
      if DoCommitBtwStep then FOraSession.Rollback;
      Exit;
    end;

    for j := 0 to (OraQuery.VariableCount - 1) do
      ValueArr[j, k] := DataSet[Copy(OraQuery.VariableName(j), 2, MaxInt)];
    if (((i + 1) mod RecordsInStep = 0) or (i = (DataSet.RecordCount - 1))) then
    begin
      for j := 0 to (OraQuery.VariableCount - 1) do
        OraQuery.SetVariable(j, ValueArr[j]);
      OraQuery.ExecuteArray(0, (k + 1));
      Inc(FCurrentCnt, (k + 1));
      if (DoCommitBtwStep) then
        OraQuery.Session.Commit;
      k := -1;
    end;
    DataSet.Next;
    Inc(k);
  end;
end;

function TDataSetLoader.MakeQuery(DataSet: TDataSet; const TableName: string):
  TOracleQuery;
var
  i: Integer;
  FieldsStr: string;
  F: TField;
begin
  Result := TOracleQuery.Create(nil);
  try
    Result.Session := FOraSession;
    Result.SQL.Text := Format('select * from %s where 1=2', [TableName]);
    Result.Describe;

    for i := 0 to (Result.FieldCount - 1) do
    begin
      F := DataSet.FindField(Result.FieldName(I));
      if assigned(F) then
      begin
        FieldsStr := FieldsStr + F.FieldName + ',';
        Result.DeclareVariable(F.FieldName, Result.FieldType(I));
      end;
    end;
    FieldsStr := Copy(FieldsStr, 1, Length(FieldsStr) - 1);

    Result.SQL.Text := Format('insert into %s(%s) values(:%s)',
      [TableName, FieldsStr, StringReplace(FieldsStr, ',', ',:', [rfReplaceAll,
        rfIgnoreCase])]);
  except
    Result.Free;
    raise;
  end;
end;

procedure TDataSetLoader.Load(DataSet: TDataSet; const TableName: string);
var
  Query: TOracleQuery;
begin
  Query := MakeQuery(DataSet, TableName);
  try
    Query.OnArrayError := DoOnError;
    FCurrentCnt := 0;
    FTotalCnt := DataSet.RecordCount;
    if Query.VariableCount > 0 then
      DoLoad(DataSet, Query);
  finally
    Query.Free;
  end;
end;

constructor TDataSetLoader.Create(Session: TOracleSession);
begin
  FOraSession := Session;
  FRecordsInStep := 1000;
end;

procedure TDataSetLoader.Terminate;
begin
  FTerminated := True;
end;

procedure TDataSetLoader.DoOnError(Sender: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: string; var Continue: Boolean);
begin
 if assigned(OnError) then
    OnError(Sender, Index, ErrorCode, ErrorMessage, Continue);
 if not Continue then
    Terminate;
end;

end.

