unit AdviceCDeclGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CDeclBaseGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxSpinEdit, cxLabel, dxStatusBar, QueryList,
  cxCurrencyEdit;

type
  TAdviceCDeclGridForm = class(TCDeclBaseGridForm)
    grdDataLevelPayTypes: TcxGridLevel;
    grdDataDBBandedTableViewDetail: TcxGridDBBandedTableView;
    dsCharges: TfdcQuery;
    dsChargesID: TFloatField;
    dsChargesDECL_ID: TFloatField;
    dsChargesPAY_TYPE_ID: TFloatField;
    dsChargesPAY_TYPE_CODE: TStringField;
    dsChargesSUMMA: TFloatField;
    dsChargesCURRENCY_ID: TFloatField;
    dsChargesCURR_CODE: TStringField;
    dsChargesCHANGE_REASON_ID: TFloatField;
    dsChargesCHANGE_DESC: TStringField;
    dsChargesCHANGE_DATE: TDateTimeField;
    dsChargesKBKCODE_ID: TFloatField;
    dsChargesKBK: TStringField;
    dsChargesCHARGE_MONTH: TDateTimeField;
    srcCharges: TDataSource;
    grdDataDBBandedTableViewDetailID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailDECL_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHANGE_REASON_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHANGE_DESC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHANGE_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailKBKCODE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailKBK: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDetailCHARGE_MONTH: TcxGridDBBandedColumn;
    dsChargesREASON_NAME: TStringField;
    grdDataDBBandedTableViewDetailREASON_NAME: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actAutoFilterExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  MainDM, fdcCustomDBDataFrm;

procedure TAdviceCDeclGridForm.FormShow(Sender: TObject);
begin
  inherited;
  cmbxViewMode.Visible := ivNever;
  cmbxCustCode.Visible := ivNever;
end;

procedure TAdviceCDeclGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  dsCharges.ParamByName( 'ID' ).Value := dsData.ParamByName( 'ID' ).Value;
  if dsCharges.Active then
    dsCharges.Refresh
  else
    dsCharges.Open;
end;

procedure TAdviceCDeclGridForm.actAutoFilterExecute(Sender: TObject);
begin
  inherited;

  grdDataDBBandedTableViewDetail.OptionsCustomize.ColumnFiltering := not grdDataDBBandedTableViewDetail.OptionsCustomize.ColumnFiltering;
end;

procedure TAdviceCDeclGridForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if dsCharges.Active then
  begin
    dsCharges.Close;
    dsCharges.Open;
  end;
end;

initialization
  RegisterClass(TAdviceCDeclGridForm);

end.
