{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1705 $
  $Author: mkazanov $
  $Date: 2006-07-04 13:43:50 +0400 (Вт, 04 июл 2006) $
}
unit SubjDoublesGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  QueryList;

type
  TSubjDoublesGridForm = class(TObjectGridForm)
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtOKPO: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    dsDataADDRESS: TStringField;
    dsDataFULL_NAME: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataOGRN: TStringField;
    dsDataSOATO: TStringField;
    dsDataKPP: TStringField;
    dsDataPHONE: TStringField;
    dsDataFAX: TStringField;
    dsDataTELEX: TStringField;
    dsDataTELEGRAPH: TStringField;
    dsDataTELETYPE: TStringField;
    grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn;
    dsDataDUPL_SUBJ_ID: TFloatField;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    QueryList1: TQueryList;
    sqlMarkAsDouble: TsqlOp;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjDoublesGridForm: TSubjDoublesGridForm;

implementation

uses fdcCustomGridFrm, MainDm, ObjServices;

{$R *.dfm}

procedure TSubjDoublesGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('INN', Trim(edtInn.Text));
  SetSearchParam('OKPO', Trim(edtOKPO.Text));
end;

procedure TSubjDoublesGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  ObjectServices := GetObjectServices;
  if Self.ClassType = TSubjDoublesGridForm then
  begin
    grdDataDBBandedTableViewADDRESS_.Visible := True ;
    grdDataDBBandedTableViewINN_.Visible := True;
    grdDataDBBandedTableViewKPP_.Visible := True;
    grdDataDBBandedTableViewADDRESS_.Hidden := False;
    grdDataDBBandedTableViewINN_.Hidden := False;
    grdDataDBBandedTableViewKPP_.Hidden := False;
  end;
end;

procedure TSubjDoublesGridForm.dxBarButton1Click(Sender: TObject);
begin
  inherited;
  sqlMarkAsDouble.Exec('ID;SUBJ_ID',[dsDataID.AsFloat,dsData.ParamByName('SUBJ_ID').AsFloat]);
  dsData.Session.Commit;
  Self.RefreshData;
  //RefreshWaiters;
end;

initialization
   RegisterClass(TSubjDoublesGridForm);

end.
