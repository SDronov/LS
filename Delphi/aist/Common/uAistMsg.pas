unit uAistMsg;

interface

uses
  Contnrs, DB, dxmdaset, uAistMsgIntf;

type
  TAistMsg = class(TInterfacedObject, IAistMsg)
  private
    fDataSetList : TObjectList;
    fOtvet       : TdxMemData;
    function GetTables(NameOfTable: string): TDataSet;
    function GetTablesByIndex(Index: Integer): TDataSet;
  public
    constructor Create;
    destructor Destroy;

    property Tables[NameOfTable:string] : TDataSet read GetTables;
    property TablesByIndex[Index:Integer] : TDataSet read GetTablesByIndex;
    function TablesCount : Integer;

    procedure AssignFieldDefs( ADS, AFieldDefs : pointer );
    procedure LoadDataSet( ATarget, ASource : TDataSet );
    property Otvet : TdxMemData read fOtvet write fOtvet;

    { IAistMsg }
    procedure SetDataSet( TableName : PChar; FieldDefs : Pointer; Data : OleVariant; out ErrCode : Integer); stdcall;
    procedure GetOtvet( out Data : OleVariant ); stdcall;
  end;

implementation

uses
  uAistConsts
 ,SysUtils
 ,Variants;

{ TAistMsg }

procedure TAistMsg.AssignFieldDefs(ADS, AFieldDefs: pointer);
  var
    ds : TDataSet;
    fd : TFieldDefs;
    i  : Integer;
begin
  ds := TDataSet( ADS );
  fd := TFieldDefs( AFieldDefs );
  ds.FieldDefs.Clear;
  for i := 0 to fd.Count - 1 do
    with TFieldDef(fd.Items[i]) do
      ds.FieldDefs.Add( Name, DataType, Size, Required );
end;

constructor TAistMsg.Create;
  var
    i : Integer;
begin
  fDataSetList := TObjectList.Create;
  fOtvet       := nil;

  for i := 0 to sTableNames.Count - 1 do
    begin
      fDataSetList.Add( TdxMemData.Create( nil ) );
      TdxMemData( fDataSetList[i] ).Name := UpperCase( sTableNames[i] );
    end;
end;

destructor TAistMsg.Destroy;
  var
    ds : TdxMemData;
begin
  while fDataSetList.Count > 0 do
    begin
      ds := TdxMemData( fDataSetList[0] );
      fDataSetList.Remove( ds );
      if ds.Active then
        ds.Close;
      ds.Free;
    end;
end;

procedure TAistMsg.GetOtvet(out Data: OleVariant);
begin

end;

function TAistMsg.GetTables(NameOfTable: string): TDataSet;
  var
    i : Integer;
    s : string;
begin
  Result := nil;

  s := UpperCase( NameOfTable );
  for i := 0 to fDataSetList.Count - 1 do
    if TdxMemData( fDataSetList[i] ).Name = s then
      begin
        Result := TDataSet( fDataSetList[i] );
        break;
      end;
end;

function TAistMsg.GetTablesByIndex(Index: Integer): TDataSet;
begin
  if Index < fDataSetList.Count then
    Result := TDataSet(fDataSetList[Index]) 
  else
    Result := nil;
end;

procedure TAistMsg.LoadDataSet(ATarget, ASource: TDataSet);
begin
  if not ASource.Active then
    Exit;

  if ATarget.Active then
    ATarget.Close;
  ATarget.FieldDefs.Clear;
  ATarget.Fields.Clear;

  ASource.First;
  AssignFieldDefs( ATarget, ASource.FieldDefs );
  TdxMemData( ATarget ).LoadFromDataSet( ASource );
end;

procedure TAistMsg.SetDataSet(TableName: PChar; FieldDefs: Pointer;
  Data: OleVariant; out ErrCode : Integer);
  var
    ds : TDataSet;
    i  : Integer;
    j  : Integer;
begin
  ErrCode := 0;

  ds := Tables[ TableName ];
  if not Assigned( ds ) then
    begin
      ErrCode := cMsgErr_NoTableFound;
      Exit;
    end;

  if ds.Active then
    ds.Close;
  ds.FieldDefs.Clear;
  ds.Fields.Clear;
  AssignFieldDefs( ds, FieldDefs );

  ds.Open;
  for i := VarArrayLowBound( Data, 1 ) to VarArrayHighBound( Data, 1 ) do
    for j := VarArrayLowBound( Data[i], 1 ) to VarArrayHighBound( Data[i], 1 ) do
      ds.AppendRecord( Data[i] );
end;

function TAistMsg.TablesCount: Integer;
begin
  Result := fDataSetList.Count;
end;

end.
