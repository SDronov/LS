{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 14816 $
  $Author: sbakum $
  $Date: 2012-05-11 14:47:52 +0400 (Пт, 11 май 2012) $
}
unit DeclPaymentGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Grids,
  DBGrids, Menus, cxCalc, cxCheckBox, QueryList;

type
  TDeclPaymentGridForm = class(TObjectGridForm)
    dsDataPAYMENT_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYER_ID: TFloatField;
    dsDataDOC_NAME: TStringField;
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    dsDataAGG_SUMMA: TFloatField;
    dsDataKEY_P: TFloatField;
    actShowDetail: TAction;
    dxBarButton1: TdxBarButton;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataPAYMENT_MONTH: TDateTimeField;
    dsDataCHARGE_CURR_ID: TFloatField;
    dsDataCHARGE_SUMMA: TFloatField;
    grdDataDBBandedTableViewPAYMENT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_MONTH: TcxGridDBBandedColumn;
    dsDataACC_DATE: TDateTimeField;
    grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn;
    grdDataDBTableShortView: TcxGridDBTableView;
    grdDataDBTableShortViewColumn1: TcxGridDBColumn;
    grdDataDBTableShortViewColumn2: TcxGridDBColumn;
    grdDataDBTableShortViewColumn3: TcxGridDBColumn;
    dsDataBUDGET_DATE: TDateTimeField;
    grdDataDBBandedTableViewBUDGET_DATE: TcxGridDBBandedColumn;
    dsDataKBKCODE: TStringField;
    grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn;
    dsDataOPERATION_DATE: TDateTimeField;
    columnIS_ARCHIVE: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataIS_ARCHIVE: TStringField;
    QueryList1: TQueryList;
    sqlSetArchive: TsqlOp;
    sqlSetDeArchive: TsqlOp;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE1_ID: TFloatField;
    dsDataKBKCODE_SOURCE: TStringField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAYER_KPP: TStringField;
    dsDataDECL_NO: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataSERIAL_NO: TStringField;
    dsDataDECL_TYPENAME: TStringField;
    dsDataDECL_TYPESYSNAME: TStringField;
    dsDataDOC_REST: TFloatField;
    grdDataDBBandedTableViewKBKCODE_SOURCE: TcxGridDBBandedColumn;
    dsDataUIN: TStringField;
    grdDataDBBandedTableViewUIN: TcxGridDBBandedColumn;
    procedure actOpenExecute(Sender: TObject);
    procedure actShowDetailExecute(Sender: TObject);
    procedure actShowDetailUpdate(Sender: TObject);
    procedure dsDataFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure columnIS_ARCHIVEPropertiesEditValueChanged(Sender: TObject);
  private
    procedure SetShortView(OnOff: Boolean);
    { Private declarations }
  public
    procedure LoadLayout; override;
    { Public declarations }
  end;

var
  DeclPaymentGridForm: TDeclPaymentGridForm;

implementation

uses MainDm, fdcCustomGridFrm, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TDeclPaymentGridForm.actOpenExecute(Sender: TObject);
begin
//  inherited;
  ObjectServices.OpenObject(dsDataPAYMENT_ID.Value, nil);
end;

procedure TDeclPaymentGridForm.SetShortView(OnOff: Boolean);
begin
  dsData.Filtered := OnOff;
  if dsData.Active then dsData.Resync([]);
  if dsData.Filtered then grdDataLevel.GridView := grdDataDBTableShortView
  else grdDataLevel.GridView := grdDataDBBandedTableView;
  GridPopupMenu.PopupMenus[0].GridView := grdDataLevel.GridView;
end;

procedure TDeclPaymentGridForm.actShowDetailExecute(Sender: TObject);
begin
  inherited;
  SetShortView(not dsData.Filtered);
end;

procedure TDeclPaymentGridForm.actShowDetailUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Checked := not dsData.Filtered;
end;

procedure TDeclPaymentGridForm.dsDataFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := dsDataKEY_P.Value = 0;
end;

procedure TDeclPaymentGridForm.LoadLayout;
begin
  inherited;
  SetShortView(dxBarButton1.Down);
end;

procedure TDeclPaymentGridForm.FormShow(Sender: TObject);
var
  Is31: Boolean;
begin
  inherited;
  Is31 := Params.FindParam('PAYED_MONTHS') <> nil;
  grdDataDBBandedTableViewPAYMENT_MONTH.Visible := Is31;
  grdDataDBBandedTableViewPAYMENT_MONTH.Hidden := not Is31;

  grdDataDBBandedTableView.OptionsData.Editing := True;
  columnIS_ARCHIVE.Options.Editing             := True;
  columnIS_ARCHIVE.Visible := (uppercase(Owner.ClassName) <> 'TTPOFORM')
                              and (uppercase(Owner.ClassName) <> 'TTRFORM');
end;

procedure TDeclPaymentGridForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
{
  if DataSet.FieldByName( 'is_archive' ).AsString = 'Y' then
    sqlSetArchive.Exec( 'id', DataSet.FieldByName( 'id' ).AsInteger )
  else
    sqlSetDeArchive.Exec( 'id', DataSet.FieldByName( 'id' ).AsInteger );
  dsData.Session.Commit;}
end;

procedure TDeclPaymentGridForm.columnIS_ARCHIVEPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;

  dsData.Post;
end;

initialization
   RegisterClass(TDeclPaymentGridForm);

end.
