{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 2144 $
  $Author: alexvolo $
  $Date: 2006-12-22 00:00:11 +0400 (Пт, 22 дек 2006) $
}
unit AccountGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TAccountGridForm = class(TObjectGridForm)
    dsDataINN: TStringField;
    dsDataACC_NAME: TStringField;
    dsDataSALDO: TFloatField;
    dsDataDEBET_TURNOVER: TFloatField;
    dsDataCREDIT_TURNOVER: TFloatField;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSALDO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEBET_TURNOVER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCREDIT_TURNOVER: TcxGridDBBandedColumn;
    dsDataCODE: TStringField;
    fdcQuery1: TfdcQuery;
    edtAccName: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtCurCode: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    dxBarButton1: TdxBarButton;
    dsDataCURRENCY_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataPAYMENT_TYPE: TStringField;
    grdDataDBBandedTableViewPAYMENT_TYPE: TcxGridDBBandedColumn;
    edtKPP: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtINN: TcxTextEdit;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actDeleteExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure grdDataDBBandedTableViewTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
  private
  public
  end;

var
  AccountGridForm: TAccountGridForm;

implementation

uses MainDm, fdcCustomDBDataFrm, fdcCustomGridFrm, qDeclCard;

{$R *.dfm}

procedure TAccountGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  SetSearchParam('AccName', Trim(edtAccName.Text));
  SetSearchParam('CurCode', Trim(edtCurCode.Text));
  SetSearchParam('KPP', Trim(edtKPP.Text));
  SetSearchParam('INN', Trim(edtINN.Text));
  inherited;
end;

procedure TAccountGridForm.actDeleteExecute(Sender: TObject);
begin
  fdcQuery1.Open;
  fdcQuery1.Close;
  if actRefresh.Update then
     actRefresh.Execute;
end;

procedure TAccountGridForm.actDeleteUpdate(Sender: TObject);
begin
   TAction(Sender).Enabled := True;
end;

procedure TAccountGridForm.dxBarButton1Click(Sender: TObject);
begin
  inherited;
  ExecReport(Self.dsData.Session, dsDataName.AsString,
   dsDataSUBJECT_ID.AsVariant, dsDataCURRENCY_ID.AsVariant);
end;

procedure TAccountGridForm.grdDataDBBandedTableViewTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
  inherited;
  AText := Format('%s = %f', [dsData.FieldByName(TcxGridDBBandedTableSummaryItem(Sender).FieldName).DisplayLabel,
    double(AValue)]);
end;

initialization
//    RegisterClass(TAccountGridForm);

end.
