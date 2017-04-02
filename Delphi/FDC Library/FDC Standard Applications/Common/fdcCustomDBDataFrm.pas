{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomDBDataFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
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
  private
    TimeStamp: TDateTime;
    FLastQueryTime: TDateTime;
    function GetReadOnly: boolean;
  protected
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

end.
