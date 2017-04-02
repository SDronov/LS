{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomDBDataFrm.pas $
  $Revision: 10600 $
  $Author: anaumenkov $
  $Date: 2010-05-28 07:52:59 +0400 (РџС‚, 28 РјР°Р№ 2010) $
}

unit fdcCustomDBDataFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Oracle,
  OracleData, fdcCustomDataFrm, DB, FDCCustomDataset, fdcQuery, dxBar,
  ActnList, fdcParamsHolder, ImgList, Controls, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels;

type

  { Базовая форма доступа к данным БД }
  TfdcCustomDBDataForm = class(TfdcCustomDataForm)
    dsData: TFDCQuery;
    srcData: TDataSource;
    actRefresh: TAction;
    btnRefresh: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
  private
    TimeStamp: TDateTime;
    FLastQueryTime: TDateTime;
  protected
    function GetReadOnly: boolean; virtual;
    procedure HandleRefresh; override;
    procedure SetSession(ASession: TOraclesession); virtual;
  public
    procedure RefreshData; virtual;

    property ReadOnly: boolean read GetReadOnly;
    property LastQueryTime: TDateTime read FLastQueryTime;
  end;

implementation

uses
  fdcUtils;

{$R *.dfm}

{ TfdcCustomDBDataForm }

function TfdcCustomDBDataForm.GetReadOnly: boolean;
begin
  Result := dsData.ReadOnly;
end;

procedure TfdcCustomDBDataForm.HandleRefresh;
begin
  inherited;
  RefreshData;
end;

procedure TfdcCustomDBDataForm.SetSession(ASession: TOraclesession);
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
  
    { TfdcQuery }
    if (Components[i] is TfdcQuery) and
       (not Assigned((Components[i] as TfdcQuery).Session)) then
      (Components[i] as TfdcQuery).Session := ASession;

    { TOracleDataset }
    if (Components[i] is TOracleDataset) and
       (not Assigned((Components[i] as TOracleDataset).Session)) then
      (Components[i] as TOracleDataset).Session := ASession;

    { TOracleQuery }
    if (Components[i] is TOracleQuery) and
       (not Assigned((Components[i] as TOracleQuery).Session)) then
      (Components[i] as TOracleQuery).Session := ASession;

    { TOraclePackage }
    if (Components[i] is TOraclePackage) and
       (not Assigned((Components[i] as TOraclePackage).Session)) then
      (Components[i] as TOraclePackage).Session := ASession;

  end;
end;

procedure TfdcCustomDBDataForm.RefreshData;
begin
  { reopen dataset }
  if (not (csDestroying in ComponentState)) and { <- IMPORTANT!!!}
     (Assigned(dsData.Session)) and
     (dsData.Session.Connected) then
     
    dsData.ReQuery;
end;

procedure TfdcCustomDBDataForm.FormShow(Sender: TObject);
begin
  inherited;
  { reopen inactive dataset }
  if not dsData.Active then
    RefreshData;
end;

procedure TfdcCustomDBDataForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  { fill dataset params }
  Params.Fill(dsData.Params);
  { save query start time }
  TimeStamp := Now;
end;

procedure TfdcCustomDBDataForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FLastQueryTime := Now - TimeStamp;
end;

procedure TfdcCustomDBDataForm.actRefreshUpdate(Sender: TObject);
begin
  inherited;
  { enable data refreshing only if connection is active }
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     Assigned(dsData.Session) and
     dsData.Session.Connected;
end;

procedure TfdcCustomDBDataForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
  { refresh data }
  RefreshData;
end;

procedure TfdcCustomDBDataForm.dsDataBeforePost(DataSet: TDataSet);
var
  I: Integer;
begin
  with dsData do
  for I := 0 to Fields.Count - 1 do
    with Fields[I] do
      if Required and not ReadOnly and (FieldKind = fkData) and (not IsNull) and (Fields[I] is TStringField) then
        Value := Trim(AsString);
end;

end.
