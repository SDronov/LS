unit ActDeductionDocsPaysGrigFrm;

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
  dxStatusBar, QueryList, cxCurrencyEdit;

type
  TActDeductionDocsPaysGrigForm = class(TObjectGridForm)
    dsDataOPERATE_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCASHDESK_ID: TFloatField;
    dsDataCARDNUM: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataNOTE: TStringField;
    dsDataNREF: TStringField;
    dsDataACCOUNT_K: TStringField;
    dsDataBIC_K: TStringField;
    dsDataNLS: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    dsDataCASHDESK_NAME: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataREST_SUMMA: TFloatField;
    dsDataLOCKED_SUMMA: TFloatField;
    dsDataCOMING_DATE: TDateTimeField;
    dsDataASSURE_DATE: TDateTimeField;
    dsDataDESCRIPT2: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataPO_NAME: TStringField;
    dsDataPO_INN: TStringField;
    dsDataPO_KPP: TStringField;
    dsDataS_NAME: TStringField;
    dsDataS_INN: TStringField;
    dsDataS_KPP: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE: TStringField;
    dsDataKBK: TStringField;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataVAL_PAYMENT_REASON: TStringField;
    dsDataVAL_DOC_NUMBER: TStringField;
    dsDataVAL_DOC_DATE: TDateTimeField;
    dsDataVAL_PAYMENT_TYPE: TStringField;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataRESERVE_ID: TFloatField;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    dsDataRESERVE_SUMMA: TFloatField;
    grdDataDBBandedTableViewRESERVE_SUMMA: TcxGridDBBandedColumn;
    QueryList1: TQueryList;
    sqlRemovePay: TsqlOp;
    procedure actDeleteExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActDeductionDocsPaysGrigForm: TActDeductionDocsPaysGrigForm;

implementation

uses
  MainDM, fdcCustomDBDataFrm, fdcCustomDataFrm;

{$R *.dfm}

procedure TActDeductionDocsPaysGrigForm.actDeleteExecute(Sender: TObject);
begin
  sqlRemovePay.Exec( 'act_id;reserve_id', [dsData.ParamByName( 'id' ).AsInteger, dsData['reserve_id']] );
  RefreshData;
  RefreshWaiters;
end;

procedure TActDeductionDocsPaysGrigForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  {grdDataDBBandedTableViewDOC_SUMMA.ApplyBestFit;
  grdDataDBBandedTableViewRESERVE_SUMMA.ApplyBestFit;}
end;

initialization
  RegisterClass( TActDeductionDocsPaysGrigForm );

end.
