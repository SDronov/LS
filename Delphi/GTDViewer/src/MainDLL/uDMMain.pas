unit uDMMain;

interface

uses
  SysUtils, Classes, RpDefine, RpCon, uReportScript;

type
  TDMMain = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FScript: TReportObjects;

    procedure SetScript(Value: TReportObjects);
  public
    ConnectionList: TStringList;

    procedure CreateConnection(AConnectionName: string);
    procedure RVCustomConnectionOpen(Connection: TRvCustomConnection);
    procedure RVCustomConnectionGetCols(Connection: TRvCustomConnection);
    procedure RVCustomConnectionGetRow(Connection: TRvCustomConnection);
    procedure ClearAll;

    property Script: TReportObjects write SetScript;
  end;

var
  DMMain: TDMMain;

implementation

{$R *.dfm}

procedure TDMMain.DataModuleCreate(Sender: TObject);
begin
  ConnectionList:=TStringList.Create;
end;

procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
  while ConnectionList.Count>0 do
    begin
      TRvCustomConnection(ConnectionList.Objects[0]).Free;
      ConnectionList.Delete(0);
    end;
  ConnectionList.Free;
end;

{private}

procedure TDMMain.SetScript(Value: TReportObjects);
begin
  FScript:=Value;
  FScript.OnCreateConnection:=CreateConnection;
end;

{public}

procedure TDMMain.CreateConnection(AConnectionName: string);
var
  LInd: integer;
begin
  LInd:=ConnectionList.AddObject(AConnectionName,TRvCustomConnection.Create(Self));
  TRvCustomConnection(ConnectionList.Objects[LInd]).Name:=AConnectionName;
  TRvCustomConnection(ConnectionList.Objects[LInd]).RuntimeVisibility:=rtDeveloper;
  TRvCustomConnection(ConnectionList.Objects[LInd]).OnOpen:=RVCustomConnectionOpen;
  TRvCustomConnection(ConnectionList.Objects[LInd]).OnGetCols:=RVCustomConnectionGetCols;
  TRvCustomConnection(ConnectionList.Objects[LInd]).OnGetRow:=RVCustomConnectionGetRow;
end;

procedure TDMMain.RVCustomConnectionGetCols(
  Connection: TRvCustomConnection);
begin
  TCustomReportConnection(FScript.GetParserObjectByName(Connection.Name)).RVCustomConnectionGetCols(Connection);
end;

procedure TDMMain.RVCustomConnectionGetRow(
  Connection: TRvCustomConnection);
begin
  TCustomReportConnection(FScript.GetParserObjectByName(Connection.Name)).RVCustomConnectionGetRow(Connection);
end;

procedure TDMMain.RVCustomConnectionOpen(Connection: TRvCustomConnection);
begin
  TCustomReportConnection(FScript.GetParserObjectByName(Connection.Name)).RVCustomConnectionOpen(Connection);
end;

procedure TDMMain.ClearAll;
begin
  while ConnectionList.Count>0 do
    begin
      TRvCustomConnection(ConnectionList.Objects[0]).Free;
      ConnectionList.Delete(0);
    end;
end;

end.
