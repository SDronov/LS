unit ActDeductionDocsDepositGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDBLookupComboBox, cxCheckBox, cxCurrencyEdit, QueryList;

type
  TActDeductionDocsDepositGridForm = class(TObjectGridForm)
    dsDataCUSTOM_MODE_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    dsDataMODIFY_DATE: TDateTimeField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataSUM_RUB: TFloatField;
    dsDataRESERVE_SUMMA: TFloatField;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_RUB: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRESERVE_SUMMA: TcxGridDBBandedColumn;
    dsDataCURR_CODE: TStringField;
    QueryList1: TQueryList;
    sqlRemoveDeposit: TsqlOp;
    procedure actDeleteExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActDeductionDocsDepositGridForm: TActDeductionDocsDepositGridForm;

implementation

{$R *.dfm}

uses
  MainDM;

procedure TActDeductionDocsDepositGridForm.actDeleteExecute(
  Sender: TObject);
begin
  sqlRemoveDeposit.Exec( 'act_id;deposit_id', [dsData.ParamByName( 'id' ).AsInteger, dsData['id']] );
  RefreshData;
  RefreshWaiters;
end;

procedure TActDeductionDocsDepositGridForm.dsDataAfterOpen(
  DataSet: TDataSet);
begin
  inherited;

  {grdDataDBBandedTableViewSUM_RUB.ApplyBestFit;
  grdDataDBBandedTableViewRESERVE_SUMMA.ApplyBestFit;}
end;

initialization
  RegisterClass( TActDeductionDocsDepositGridForm );

end.
