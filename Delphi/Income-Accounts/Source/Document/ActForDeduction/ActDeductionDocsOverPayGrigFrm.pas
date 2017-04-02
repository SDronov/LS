unit ActDeductionDocsOverPayGrigFrm;

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
  dxStatusBar, QueryList, cxCheckBox, cxCurrencyEdit;

type
  TActDeductionDocsOverPayGrigForm = class(TObjectGridForm)
    QueryList1: TQueryList;
    sqlRemoveOverPay: TsqlOp;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataSUM_ACT: TFloatField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOM_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_ACT: TcxGridDBBandedColumn;
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses
  MainDM, fdcCustomDBDataFrm, fdcCustomDataFrm;

{$R *.dfm}

procedure TActDeductionDocsOverPayGrigForm.actDeleteExecute(
  Sender: TObject);
begin
  sqlRemoveOverPay.Exec( 'ACT_ID;ADVICE_ID', [dsData.ParamByName( 'id' ).AsInteger, dsData['id']] );
  RefreshData;
  RefreshWaiters;
end;

initialization
  RegisterClass( TActDeductionDocsOverPayGrigForm );
end.
