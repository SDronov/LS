unit uReportScript;

interface

uses Classes, SysUtils, uParser, RpRave, RpCon, RpDefine, DBTables, DB,
     OracleData, Oracle, mdaUREPLACE;

type
  TConnectionKind=(ckBDE,ckDOA);
  TCreateConnectionEvent=procedure(AObjectName: string) of object;

  TTemplate=class(TCustomParserObject)
  private

  public
    PRvTemplateFile: string;
    //RvProjectGTD: TRvProject;

    constructor Create(AScriptDir, AObjectName, AObjectType: string);virtual;
    destructor Destroy;override;

    procedure ExecProcedure(AOwner, AProcedureName: string; AParams: TStrings);override;
  end;

  TCustomReportConnection=class(TCustomParserObject)
  private
    FieldsList: TStringList;
  public
    CK: TConnectionKind;
    CustomQuery: TDataSet;
    DOASession: TOracleSession;
//    RVCustomConnection: TRvCustomConnection;
    BlocksFields: TStringList;
    BlocksCount, InitRec: integer;
    BlocksIndexField,
    FilterTemplate, LinkTemplate: string;

    constructor Create(AScriptDir, AObjectName, AObjectType: string);virtual;
    destructor Destroy;override;

    procedure ExecProcedure(AOwner, AProcedureName: string; AParams: TStrings);override;
    procedure InitDS;
    procedure RVCustomConnectionOpen(Connection: TRvCustomConnection);
    procedure RVCustomConnectionGetCols(Connection: TRvCustomConnection);
    procedure RVCustomConnectionGetRow(Connection: TRvCustomConnection);
  end;

  TReportObjects=class(TCustomParserObjects)
  private
    FDOASession: TOracleSession;
    FBDEDataBase: TDataBase;
    FOnCreateConnection: TCreateConnectionEvent;
  public
    Filtered: boolean;

    destructor Destroy;override;

    procedure CreateObj(AObjectName, AObjectType: string);override;
    procedure SetFilter(ACondition: String);
    procedure InitAllDS;
    procedure SetDOASession(ADOASession: TOracleSession);

    property OnCreateConnection: TCreateConnectionEvent read FOnCreateConnection write FOnCreateConnection;
  end;


implementation

{ TReportObjects }

destructor TReportObjects.Destroy;
var
  i: integer;
begin
  for i:=0 to Count-1 do
    TCustomParserObject(Objects[i]).Free;
  inherited;
end;

procedure TReportObjects.CreateObj(AObjectName, AObjectType: string);
var
  k: integer;
begin
  k:=IndexOf(AObjectName);
  if k<0 then
    Raise EParserFatalError.Create('Объект '+AObjectName+' отсутствует в списке!');
  if AObjectType='TTemplate' then
    begin
      Objects[k]:=TTemplate.Create(FScriptDir, AObjectName, AObjectType);
    end
  else if AObjectType='TBDEReportConnection' then
    begin
      Objects[k]:=TCustomReportConnection.Create(FScriptDir, AObjectName, AObjectType);
      if Assigned(FOnCreateConnection) then FOnCreateConnection(AObjectName);
    end
  else if AObjectType='TDOAReportConnection' then
    begin
      Objects[k]:=TCustomReportConnection.Create(FScriptDir, AObjectName, AObjectType);
      if Assigned(FOnCreateConnection) then FOnCreateConnection(AObjectName);
      if FDOASession<>nil then
        TOracleDataSet(TCustomReportConnection(Objects[k]).CustomQuery).Session:=FDOASession;
    end;
end;

procedure TReportObjects.SetFilter(ACondition: String);
var
  i,j: integer;
  LListParams, LList: TStringList;
  s,sl,LObj,LField: string;
begin
  LListParams:=TStringList.Create;
  try
    for i:=0 to Count-1 do
      begin
        LListParams.CommaText:=ACondition;
        if (Objects[i] is TCustomReportConnection) then
          begin
            s:=TCustomReportConnection(Objects[i]).FilterTemplate;
            if s<>'' then
              begin
                s:=mdaReplaceString(s,LListParams);
                //s:=' AND '+s;
              end;
            sl:=TCustomReportConnection(Objects[i]).LinkTemplate;
            if sl<>'' then
              begin
                LListParams.Clear;
                LList:=TStringList.Create;
                try
                  LList.Add(sl);
                  mdaGetShablonParams(LList,LListParams);
                finally
                  LList.Free;
                end;
              end;
          end;

        if TCustomParserObject(Objects[i]).ObjectType='TBDEReportConnection' then
          begin
            if sl<>'' then
              for j:=0 to LListParams.Count-1 do
                begin
                  LObj:=Copy(LListParams[j],1,Pos('.',LListParams[j])-1);
                  LField:=Copy(LListParams[j],Pos('.',LListParams[j])+1,Length(LListParams[j]));
                  if (LObj<>'') and (LField<>'') then
                    LListParams[j]:=LListParams[j]+'='+TQuery(TCustomReportConnection(GetParserObjectByName(LObj)).CustomQuery).FieldByName(LField).AsString;
                  sl:=mdaReplaceString(sl,LListParams);
                  if s<>'' then s:=s+' AND '+sl
                  else s:=sl;
                end;

            TQuery(TCustomReportConnection(Objects[i]).CustomQuery).Close;
            if Filtered then
              TQuery(TCustomReportConnection(Objects[i]).CustomQuery).SQL.Delete(TQuery(TCustomReportConnection(Objects[i]).CustomQuery).SQL.Count-1);
            sl:=TQuery(TCustomReportConnection(Objects[i]).CustomQuery).SQL[0];
            system.insert(' '+s+' AND ',sl,pos('WHERE',sl)+5);
            TQuery(TCustomReportConnection(Objects[i]).CustomQuery).SQL[0]:=sl;
            //TQuery(TCustomReportConnection(Objects[i]).CustomQuery).SQL.Add(s);
            TQuery(TCustomReportConnection(Objects[i]).CustomQuery).Open;
          end
        else if TCustomParserObject(Objects[i]).ObjectType='TDOAReportConnection' then
          begin
            if sl<>'' then
              for j:=0 to LListParams.Count-1 do
                begin
                  LObj:=Copy(LListParams[j],1,Pos('.',LListParams[j])-1);
                  LField:=Copy(LListParams[j],Pos('.',LListParams[j])+1,Length(LListParams[j]));
                  if (LObj<>'') and (LField<>'') then
                    LListParams[j]:=LListParams[j]+'='+TQuery(TCustomReportConnection(GetParserObjectByName(LObj)).CustomQuery).FieldByName(LField).AsString;
                  sl:=mdaReplaceString(sl,LListParams);
                  if s<>'' then s:=s+' AND '+sl
                  else s:=sl;
                end;

            TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).Close;
            if Filtered then
              TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).SQL.Delete(TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).SQL.Count-1);
            sl:=TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).SQL[0];
            system.insert(' '+s+' AND ',sl,pos('WHERE',sl)+5);
            TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).SQL[0]:=sl;
            //TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).SQL.Add(s);
            TOracleDataSet(TCustomReportConnection(Objects[i]).CustomQuery).Open;
          end;
      end;
  finally
    LListParams.Free;
  end;
end;

procedure TReportObjects.InitAllDS;
var
  i: integer;
begin
  for i:=0 to Count-1 do
    begin
      if (TCustomParserObject(Objects[i]).ObjectType='TBDEReportConnection')
         or (TCustomParserObject(Objects[i]).ObjectType='TDOAReportConnection')
      then
        TCustomReportConnection(Objects[i]).InitDS;
    end;
end;

procedure TReportObjects.SetDOASession(ADOASession: TOracleSession);
begin
  FDOASession:=ADOASession;
end;

{ TTemplate }

constructor TTemplate.Create;
begin
  inherited Create(AScriptDir, AObjectName, AObjectType);
//  RvProjectGTD:=TRvProject.Create(Nil);
end;

destructor TTemplate.Destroy;
begin
//  RvProjectGTD.Close;
//  RvProjectGTD.Free;
  inherited Destroy;
end;

procedure TTemplate.ExecProcedure(AOwner, AProcedureName: string;
  AParams: TStrings);
begin
  if AProcedureName='SetFileName' then
    begin
      CheckParams(AProcedureName,1,AParams);
      PRvTemplateFile:=FScriptDir+AParams[0];
//      RvProjectGTD.ProjectFile:=FScriptDir+AParams[0];
//      RvProjectGTD.Open;
    end;
end;

{ TCustomReportConnection }

constructor TCustomReportConnection.Create(AScriptDir, AObjectName,
  AObjectType: string);
begin
  inherited;
  if AObjectType='TDOAReportConnection' then CK:=ckDOA
  else if AObjectType='TBDEReportConnection'then CK:=ckBDE;
  case CK of
    ckBDE: CustomQuery:=TQuery.Create(Nil);
    ckDOA: begin
      CustomQuery:=TOracleDataSet.Create(Nil);
      TOracleDataSet(CustomQuery).QueryAllRecords:=False;
    end;
  end;
  {RVCustomConnection:=TRvCustomConnection.Create(Nil);
  RVCustomConnection.Name:='RVCustomConnection';
  RVCustomConnection.RuntimeVisibility:=rtDeveloper;
  RVCustomConnection.LocalFilter:=True;
  RVCustomConnection.Version:='5.0.04 (VCL7)';
  RVCustomConnection.OnOpen:=RVCustomConnectionOpen;
  RVCustomConnection.OnGetCols:=RVCustomConnectionGetCols;
  RVCustomConnection.OnGetRow:=RVCustomConnectionGetRow;}
  FieldsList:=TStringList.Create;
  BlocksFields:=TStringList.Create;
  BlocksCount:=0;
  BlocksIndexField:='';
  InitRec:=1;
end;

destructor TCustomReportConnection.Destroy;
var
  i: integer;
begin
  BlocksFields.Free;
  for i:=0 to FieldsList.Count-1 do
    if FieldsList.Objects[i]<>Nil then TStringList(FieldsList.Objects[i]).Free;
  FieldsList.Free;
//  RVCustomConnection.Free;
  CustomQuery.Close;
  CustomQuery.Free;
  inherited;
end;

procedure TCustomReportConnection.ExecProcedure(AOwner, AProcedureName: string;
  AParams: TStrings);
begin
  inherited;
  if AProcedureName='ConnectionString' then
    begin
      CheckParams(AProcedureName,1,AParams);
      case CK of
        ckBDE: TQuery(CustomQuery).DatabaseName:=AParams[0];
        {ckDOA: begin
          DOASession.LogonDatabase:=AParams[0];
          TOracleDataSet(CustomQuery).Session:=DOASession;
        end;}
      end;
    end
  else if AProcedureName='SQL' then
    begin
      CheckParams(AProcedureName,1,AParams);
      case CK of
        ckBDE: begin
          TQuery(CustomQuery).SQL.Clear;
          TQuery(CustomQuery).SQL.Add(AParams[0]);
        end;
        ckDOA: begin
          TOracleDataSet(CustomQuery).SQL.Clear;
          TOracleDataSet(CustomQuery).SQL.Add(AParams[0]);
        end;
      end;
    end
  else if AProcedureName='Connect' then
    begin
      InitDS;
    end
  else if AProcedureName='PublicField' then
    begin
      CheckParams(AProcedureName,5,AParams);
      if AParams[4]='dtMemo' then
        FieldsList.AddObject(AParams.CommaText,TStringList.Create)
      else
        FieldsList.Add(AParams.CommaText);
    end
  else if AProcedureName='BlocksOnList' then
    begin
      CheckParams(AProcedureName,2,AParams);
      BlocksCount:=StrToInt(AParams[0]);
      BlocksIndexField:=AParams[1];
    end
  else if AProcedureName='AddFieldToBlock' then
    begin
      CheckParams(AProcedureName,1,AParams);
      BlocksFields.Add(AParams[0]);
    end
  else if AProcedureName='SetFilter' then
    begin
      CheckParams(AProcedureName,1,AParams);
      FilterTemplate:=AParams[0];
    end
  else if AProcedureName='SetLink' then
    begin
      CheckParams(AProcedureName,1,AParams);
      LinkTemplate:=AParams[0];
    end
  else if AProcedureName='InitRec' then
    begin
      CheckParams(AProcedureName,1,AParams);
      InitRec:=StrToInt(AParams[0]);
    end;
end;

procedure TCustomReportConnection.InitDS;
var
  i: integer;
begin
  if not CustomQuery.Active then CustomQuery.Open;
  CustomQuery.First;
  if InitRec>1 then
    for i:=1 to InitRec-1 do CustomQuery.Next;
end;

procedure TCustomReportConnection.RVCustomConnectionGetCols(
  Connection: TRvCustomConnection);
var
  i,k: integer;
  LList: TStringList;
  LFieldType: TRPDataType;
begin
  LList:=TStringList.Create;
  try
    k:=BlocksCount;
    repeat
      for i:=0 to FieldsList.Count-1 do
        begin
          LList.Clear;
          LList.CommaText:=FieldsList[i];
          if LList[4]='dtString' then LFieldType:=dtString
          else if LList[4]='dtMemo' then LFieldType:=dtMemo;
          if BlocksCount>1 then
            Connection.WriteField(LList[0]+'_B'+IntToStr(BlocksCount-k),LFieldType,StrToInt(LList[1]),LList[2]+'_B'+IntToStr(BlocksCount-k),LList[2]+'_B'+IntToStr(BlocksCount-k))
          else
            Connection.WriteField(LList[0],LFieldType,StrToInt(LList[1]),LList[2],LList[2]);
        end;
      Dec(k);
    until (k<=0);
  finally
    LList.Free;
  end;
end;

procedure TCustomReportConnection.RVCustomConnectionGetRow(
  Connection: TRvCustomConnection);
var
  i,k,LSize: integer;
  LList: TStringList;
  LStream: TMemoryStream;
  LP: Pointer;
  LIndexFieldValue: string;
  LFlag: boolean;
begin
  LList:=TStringList.Create;
  LStream:=TMemoryStream.Create;
  try
    k:=BlocksCount;
    repeat
      if (BlocksIndexField<>'') and (not CustomQuery.Eof) then
        repeat
          LIndexFieldValue:=CustomQuery.FieldByName(BlocksIndexField).AsString;
          for i:=0 to FieldsList.Count-1 do
            begin
              LList.Clear;
              LList.CommaText:=FieldsList[i];
              if (LList[4]='dtMemo') then
                TStringList(FieldsList.Objects[i]).Add(CustomQuery.FieldByName(LList[3]).AsString);
            end;
          CustomQuery.Next;
          LFlag:=(LIndexFieldValue<>CustomQuery.FieldByName(BlocksIndexField).AsString);
          if LFlag then CustomQuery.Prior;
        until LFlag or CustomQuery.Eof;
      for i:=0 to FieldsList.Count-1 do
        begin
          LList.Clear;
          LList.CommaText:=FieldsList[i];
          if (LList[4]='dtMemo') then
            begin
              LStream.Clear;
              TStringList(FieldsList.Objects[i]).SaveToStream(LStream);
              LP:=LStream.Memory;
              LSize:=LStream.Size;
              Connection.WriteBlobData(LP^,LSize);
              TStringList(FieldsList.Objects[i]).Clear;
            end
          else if LList[4]='dtString' then
            begin
              if CustomQuery.Eof then
                Connection.WriteStrData('','')
              else
                begin
                  if LList[3]<>'' then
                    Connection.WriteStrData('',CustomQuery.FieldByName(LList[3]).AsString)
                  else
                    Connection.WriteStrData('','');
                end;
            end;
        end;
//      if BlocksCount>1 then
      CustomQuery.Next;
      Dec(k);
    until (k<=0);
  finally
    LList.Free;
    LStream.Free;
  end;
end;

{procedure TCustomReportConnection.RVCustomConnectionGetCols(
  Connection: TRvCustomConnection);
var
  i,k: integer;
  LList: TStringList;
begin
  LList:=TStringList.Create;
  try
    k:=BlocksCount;
    repeat
      for i:=0 to FieldsList.Count-1 do
        begin
          LList.Clear;
          LList.CommaText:=FieldsList[i];
          if BlocksCount>1 then
            Connection.WriteField(LList[0]+'_B'+IntToStr(BlocksCount-k),dtString,StrToInt(LList[1]),LList[2]+'_B'+IntToStr(BlocksCount-k),LList[2]+'_B'+IntToStr(BlocksCount-k))
          else
            Connection.WriteField(LList[0],dtString,StrToInt(LList[1]),LList[2],LList[2]);
        end;
      Dec(k);
    until (k<=0);
  finally
    LList.Free;
  end;
end;

procedure TCustomReportConnection.RVCustomConnectionGetRow(
  Connection: TRvCustomConnection);
var
  i,j,k: integer;
  LList: TStringList;
begin
  LList:=TStringList.Create;
  try
    k:=BlocksCount;
    repeat
      for i:=0 to FieldsList.Count-1 do
        begin
          LList.Clear;
          LList.CommaText:=FieldsList[i];
          if CustomQuery.Eof then
            Connection.WriteStrData('','')
          else
            Connection.WriteStrData('',CustomQuery.FieldByName(LList[3]).AsString);
        end;
//      if BlocksCount>1 then
      CustomQuery.Next;
      Dec(k);
    until (k<=0);
  finally
    LList.Free;
  end;
end;}

procedure TCustomReportConnection.RVCustomConnectionOpen(
  Connection: TRvCustomConnection);
var
  LRecCount: integer;
  LIndexFieldValue: string;
begin
  if BlocksCount>1 then
    begin
      if BlocksIndexField<>'' then
        begin
          LRecCount:=1;
          LIndexFieldValue:=CustomQuery.FieldByName(BlocksIndexField).AsString;
          while not CustomQuery.Eof do
            begin
              if LIndexFieldValue<>CustomQuery.FieldByName(BlocksIndexField).AsString then
                begin
                  Inc(LRecCount);
                  LIndexFieldValue:=CustomQuery.FieldByName(BlocksIndexField).AsString;
                end;
              CustomQuery.Next;
            end;
          //CustomQuery.First;
        end
      else
        LRecCount:=CustomQuery.RecordCount;
      if Frac(LRecCount/BlocksCount)<>0 then LRecCount:=Trunc(LRecCount/BlocksCount)+1
      else LRecCount:=Trunc(LRecCount/BlocksCount);
      Connection.DataRows:=LRecCount;
    end
  else
    Connection.DataRows:=CustomQuery.RecordCount-InitRec+1;
  InitDS;
end;

end.
