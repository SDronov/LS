{
  Copyright c Fors Development Center.
  All rights reserved.

  $Workfile: fdcQuery.pas $
  $Revision: 1425 $
  $Author: alexvolo $
  $Date: 2006-04-12 16:20:23 +0400 (РЎСЂ, 12 Р°РїСЂ 2006) $
}
unit fdcQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, fdcCustomDataset, Oracle, Variants, fdcOracleSession, Contnrs;

const
  fdcSCH = '#SCH.';

type
  TGetStringEvent = procedure(Sender: TObject; var aStr: string) of object;

  { TfdcQuery }
  TfdcQuery = class(TfdcCustomDataset)
  private
    FInfoQuery: boolean;

    fMaxRecords: Integer;
    fSession: TOracleSession;
    fOracleQuery: TOracleQuery;
    fAutoCommit: boolean;
    fAutoRollback: boolean;
    fStoppedOnMax: boolean;
    fOnGetSchemeName: TGetStringEvent;

    procedure SetOracleQueryParams;
    procedure SetSession(const Value: TOracleSession);
    function GetReadBuffer: integer;
    procedure SetReadBuffer(const Value: integer);
    procedure GetVarValues;
    procedure SetDefaultValues;
  protected
    procedure FillRecords; override;
    procedure FillFieldDefs; override;
    function InternalApplyUpdates(Rec: integer): TUpdateAction; override;

    procedure QueryChanged(Sender: TObject); override;
    function GetDefSchemeName: string;
    procedure DoOnNewRecord; override;
    procedure OpenCursor(InfoQuery: Boolean); override;
  public

    constructor Create(anOwner: TComponent); override;
    destructor Destroy; override;

    property StoppedOnMax: boolean read fStoppedOnMax;
    procedure GuessSourceServerObject;

  published

    property Session: TOracleSession read fSession write SetSession;
    property MaxRecords: integer read fMaxRecords write fMaxRecords default 0;
    property ReadBuffer: integer read GetReadBuffer write SetReadBuffer default
      1024;
    property AutoCommit: boolean read fAutoCommit write fAutoCommit default
      true;
    property AutoRollback: boolean read fAutoRollback write fAutoRollback default
      true;
    property OnGetSchemeName: TGetStringEvent read fOnGetSchemeName write
      fOnGetSchemeName;

    property Active;
    property AutoCalcFields;
    property DataSource;
    property Filtered;
    property FilterOptions;
    property LocalDataSet;

    property Params;
    property ParamCheck;
    property ReadOnly;
    property SQL;
    property SourceServerObject;
    //property UpdateObject;
    property OnUpdateError;

    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
  end;

  { TfdcQueryList }
  TfdcQueryList = class(TObjectList)
  private
    function GetItems(i: integer): TfdcQuery;
  public
    property Items[i: integer]: TfdcQuery read GetItems; default;
  end;

implementation

uses
  fdcUtils;

{ TfdcQuery }

function FieldTypeByOT(ot: integer): TFieldType;
begin
  case ot of
    otInteger: result := ftInteger;
    otFloat: result := ftFloat;
    otString: result := ftString;
    otDBChar: result := ftString;
    otChar: result := ftString;
    otPLSQLString: result := ftString;
    otSubst: result := ftString;

    otDate: result := ftDateTime;
    otBoolean: result := ftBoolean;

    otRaw: result := ftVarBytes;

    otLong: result := ftMemo;
    otCLOB: result := ftMemo;

    otLongRaw: result := ftBlob;
    otBLOB: result := ftBlob;
    otBFile: result := ftBlob;
    otObject: result := ftBlob;
    otReference: result := ftBlob;

    otCursor: result := ftCursor;

    else
      result := ftUnknown;
  end;
end;

function OTypeByFieldType(ft: TFieldType): integer;
begin
  case ft of
    ftInteger: result := otInteger;
    ftLargeint: result := otInteger;
    ftSmallint: result := otInteger;
    ftFloat: result := otFloat;
    ftString: result := otString;
    ftDateTime: result := otDate;
    ftDate: result := otDate;
    ftBoolean: result := otInteger; //otBoolean;

    ftVarBytes: result := otRaw;

    ftBlob: result := otBLOB;
    ftOraBlob: result := otBLOB;

    ftMemo: result := otLong;
    ftOraClob: result := otCLOB;

    ftCursor: result := otCursor;
    else
      raise Exception.create('Oracle type undefined');
  end;
end;

procedure TfdcQuery.FillFieldDefs;
var
  i: integer;
  s: string;
  Field: TField;
  FieldType: TFieldType;
begin
  if LocalDataSet then
    exit;
  FieldDefs.Clear;
  SetOracleQueryParams;

  try
    if FInfoQuery then fOracleQuery.Describe
       else fOracleQuery.Execute;
  except on E: Exception do
    begin
      if (Session <> nil) and
        (Session is TFDCOracleSession) and
        ((Session as TFDCOracleSession).TraceException) then
      begin
        s := E.Message + #13#10;
        if self.Owner <> nil then
          s := s + self.Owner.ClassName + '.';
        s := s + self.Name + ':' + #13#10 + SQL.text;
        raise Exception.Create(s);
      end
      else
        raise;
    end;
  end;

  for i := 0 to fOracleQuery.FieldCount - 1 do
  begin
     FieldType := FieldTypeByOT(fOracleQuery.FieldType(i));
     if FieldType in [ftInteger, ftFloat] then
     begin
       Field := FindField(fOracleQuery.FieldName(i));
       if (Field <> nil) then
          FieldType := Field.DataType;
     end;
    TFieldDef.create(FieldDefs,
      fOracleQuery.FieldName(i),
      FieldType,
//      FieldTypeByOT(fOracleQuery.FieldType(i)),
      fOracleQuery.FieldSize(i),
      false, i);
  end;

//  fOracleQuery.Close;
end;

destructor TfdcQuery.Destroy;
begin
  fOracleQuery.Free;
  fOracleQuery := nil;
  inherited Destroy;
end;

procedure TfdcQuery.FillRecords;
var
  i: integer;
  r: TRecord;
  itm: TRecordItem;
  RecCnt: integer;
  s: string;
begin

  FRecCountCalculated := false;

  fStoppedOnMax := false;

  if LocalDataSet then
  begin
    {if FieldDefList.Count = 0 then
     raise Exception.Create('Dataset cannot be opened: SQL Statement is not available and FieldDefs are not defined.');
    }

    SetCursorOpen(true);

    if DefaultFields then
      CreateFields;

    BindFields(True);
    exit;
  end;

  InternalSaveScreenCursor;
  try
    SetCursorOpen(true);

    FieldDefs.Updated := False;
    FieldDefs.Update;

    if DefaultFields then
      CreateFields;

    BindFields(True);

    try
//      SetOracleQueryParams;
//      try
//        fOracleQuery.execute;
//      except on E: Exception do
//        begin
//          if (Session <> nil) and
//            (Session is TFDCOracleSession) and
//            ((Session as TFDCOracleSession).TraceException) then
//          begin
//            s := E.Message + #13#10;
//            if self.Owner <> nil then
//              s := s + self.Owner.ClassName + '.';
//            s := s + self.Name + ':' + #13#10 + SQL.text;
//            raise Exception.Create(s);
//          end
//          else
//            raise;
//        end;
//      end;

      GetVarValues;
      RecCnt := 0;

      while not fOracleQuery.EOF do
      begin

        if (fMaxRecords > 0) and (RecCnt >= fMaxRecords) then
        begin
          fStoppedOnMax := true;
          break;
        end;

        r := TRecord.Create;
        fRecords.Add(r);

        r.State := usUnmodified;
        r.PhisRecNo := RecCnt;

        for i := 0 to FieldDefs.Count - 1 do
        begin
          itm := TRecordItem.Create(r);
          itm.Value := null;
          itm.OriginalValue := null;
          itm.State := usUnModified;

          itm.Value := fOracleQuery.Field(i);

          itm.OriginalValue := itm.Value;
        end;
        inc(RecCnt);
        fOracleQuery.Next;
      end;
      if (Session <> nil) and AutoCommit then
        Session.Commit;

    except on E: Exception do
      begin
        if (Session <> nil) and AutoRollback then
          Session.Rollback;
        raise;
      end;
    end;

  finally
    InternalRestoreScreenCursor;
    fOracleQuery.Close;
  end;
end;

constructor TfdcQuery.Create(anOwner: TComponent);
begin
  inherited Create(anOwner);
  fOracleQuery := TOracleQuery.create(self);
  fOracleQuery.Session := fSession;
  fMaxRecords := 0;
  fOracleQuery.ReadBuffer := 1024;
  fAutoCommit := true;
  fAutoRollback := true;
  fStoppedOnMax := false;
end;

function ReplaceSubstr(str, substr, newsubstr: string; NoCase: boolean = false):
  string;
var
  p, sl: integer;
begin
  if NoCase then
    p := pos(AnsiUppercase(substr), AnsiUppercase(newsubstr))
  else
    p := pos(substr, newsubstr);
  if p > 0 then
  begin
    result := str;
    if NoCase and (AnsiUppercase(substr) = AnsiUppercase(newsubstr)) then
      exit
    else if substr = newsubstr then
      exit;
    raise Exception.create('Недопустимая рекурсивная замена');
  end;
  sl := length(substr);
  if NoCase then
    p := pos(AnsiUppercase(substr), AnsiUppercase(str))
  else
    p := pos(substr, str);
  while p > 0 do
  begin
    delete(str, p, sl);
    insert(newsubstr, str, p);
    if NoCase then
      p := pos(AnsiUppercase(substr), AnsiUppercase(str))
    else
      p := pos(substr, str);
  end;
  result := str;
end;

procedure TfdcQuery.QueryChanged(Sender: TObject);
var
  sch: string;
begin
  if (csReading in ComponentState) then
    exit;
  Close;
  inherited;
  sch := GetDefSchemeName;
  if Assigned(OnGetSchemeName) then
    OnGetSchemeName(self, sch);

  fOracleQuery.SQL.text := ReplaceSubstr(SQL.text, fdcSCH, sch, true);

  if (csDesigning in ComponentState) and (trim(fSourceServerObject) = '') then
    GuessSourceServerObject;

  fOracleQuery.SQL.Assign(SQL);
end;

procedure TfdcQuery.SetSession(const Value: TOracleSession);
begin
  if fSession = Value then
    exit;
  fOracleQuery.Close;
  fSession := Value;
  fOracleQuery.Session := fSession;
end;

procedure TfdcQuery.SetOracleQueryParams;
var
  i: integer;
  s, sch: string;
begin
  s := ReplaceSubstr(SQL.text, '::=', ':=');

  sch := GetDefSchemeName;
  if Assigned(OnGetSchemeName) then
    OnGetSchemeName(self, sch);

  fOracleQuery.SQL.Text := ReplaceSubstr(s, fdcSCH, sch, true);
  fOracleQuery.DeleteVariables;

  for i := 0 to Params.Count - 1 do
  begin
    fOracleQuery.DeclareVariable(Params[i].Name,
      OTypeByFieldType(Params[i].DataType));
    fOracleQuery.SetVariable(Params[i].Name, Params[i].value);
  end;
end;

function TfdcQuery.GetReadBuffer: integer;
begin
  result := fOracleQuery.ReadBuffer;
end;

procedure TfdcQuery.SetReadBuffer(const Value: integer);
begin
  fOracleQuery.ReadBuffer := Value;
end;

function TfdcQuery.InternalApplyUpdates(Rec: integer): TUpdateAction;
//var
//  Q: TfdcQuery;
//  UpdKind: TUpdateKind;
//  UpdAct: TUpdateAction;
begin
  Result := uaApplied;
  {Q := TfdcQuery((ClassType).NewInstance);
  Q.Create(self);
  UpdKind := ukModify;
  result := uaFail;
  try
      try
          Q.Session := Session;
          Q.AutoCommit := false;
          case TRecord(FRecords[Rec]).State of
              usInserted: UpdKind := ukInsert;
              usModified: UpdKind := ukModify;
              usDeleted:  UpdKind := ukDelete;
          end;

          if (UpdateObject = nil) or
             (UpdateObject.SQL[UpdKind].Text = '') then exit;

          Q.SQL.Assign(UpdateObject.SQL[UpdKind]);
          Q.Params.assign(UpdateObject.Params[UpdKind]);

          PrepareCachedUpdates(Q, Rec);
          if UpdateObject.ExecType[updKind] = etOpen then
           Q.Open
          else Q.ExecSQL;

          AssignCachedUpdatesValues(Q, Rec, UpdKind);

          if UpdateObject.ExecType[updKind] = etOpen then
           Q.close;
          result := uaApplied;
          except
                on e: exception do
                begin
                     UpdAct := uaFail;
                     if (E is EDatabaseError) and (Assigned(OnUpdateError)) then
                        OnUpdateError( Self, EDatabaseError(E), UpdKind, UpdAct);
                     result := UpdAct;
                     Session.Rollback;
                     if result = uaFail then
                          begin
                          Session.Rollback;
                          raise;
                          end;
                end;
          end;
      finally Q.free;
      end;}
end;

procedure TfdcQuery.GetVarValues;
var
  i: integer;
  p: TParam;
  vName, pName: string;
begin
  for i := 0 to fOracleQuery.VariableCount - 1 do
  begin
    vName := fOracleQuery.VariableName(i);
    if pos(':', vName) = 1 then
      pName := copy(vName, 2, length(vName) - 1);
    p := Params.FindParam(pName);
    if p <> nil then
    begin
      p.Value := fOracleQuery.GetVariable(vName);
      p.Bound := false;
      //showMessage(p.Name+' => '+fOracleQuery.VariableName(i)+' = '+p.asString);
    end;
  end;
end;

function TfdcQuery.GetDefSchemeName: string;
begin
  result := '';
  if (Session = nil) or (not (Session is TFDCOracleSession)) then
    exit;
  result := (Session as TFDCOracleSession).DefSchemeName + '.';
end;

procedure TfdcQuery.GuessSourceServerObject;
var
  p: integer;
  i: integer;
  so, s: string;
begin
  //if not (csDesigning in ComponentState) then exit;

  s := upperCase(SQL.Text);

  p := pos('FROM', s);

  if p > 0 then
    s := trim(copy(s, p + 4, 64000));

  p := pos(fdcSCH, copy(s, 1, 64000));

  if p < 1 then
    exit;

  s := trim(copy(s, p + 5, 64000));

  for i := 1 to length(s) do
    if (not IsAlphaDigit(s[i])) and
      (s[i] <> '_') and
      (s[i] <> '$') then
    begin
      so := copy(s, 1, i - 1);
      break;
    end;

  if trim(so) <> '' then
    fSourceServerObject := so
  else
    fSourceServerObject := s;

end;

procedure TfdcQuery.SetDefaultValues;
var
  DefValue: Variant;
  I: Integer;
  SavedDecimalSeparator: Char;
  F: TField;
  
  function FakingGUID: string;
  var
    guid: TGUID;
  begin
    if CreateGUID(guid) = S_OK then
    begin
      Result := GUIDToString(guid);
    end;
  end;
begin
  SavedDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
    for I := 0 to FieldCount - 1 do
    begin
      F := Fields[I];

      if F.DefaultExpression <> '' then
      begin
        if F.DataType in [ftDate, ftDateTime, ftTime, ftTimeStamp] then
        begin
          if SameText(F.DefaultExpression, '$$DATE$$') then
            DefValue := Date
          else if SameText(F.DefaultExpression, '$$TIME$$') then
            DefValue := Time
          else if SameText(F.DefaultExpression, '$$DATETIME$$') then
            DefValue := Now
          else
            DefValue := Null; //XMLTimeToDateTime(F.DefaultExpression, True);
        end
        else if (F.DataType in [ftString, ftWideString]) and
          SameText(F.DefaultExpression, '$$GUID$$') then
          DefValue := FakingGUID
        else
          DefValue := F.DefaultExpression;
        F.Value := DefValue;
      end;
    end;
  finally
    DecimalSeparator := SavedDecimalSeparator;
  end;
end;

procedure TfdcQuery.DoOnNewRecord;
begin
  SetDefaultValues;
  inherited;
end;

procedure TfdcQuery.OpenCursor(InfoQuery: Boolean);
begin
  FInfoQuery := InfoQuery;
  inherited;
  if InfoQuery then
     fOracleQuery.Close;
end;

{ TfdcQueryList }

function TfdcQueryList.GetItems(i: integer): TfdcQuery;
begin
  Result := TfdcQuery(inherited Items[i]);
end;

end.
