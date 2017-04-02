unit DecOffsetObligationPOGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxCheckBox, cxCalendar, QueryList;

type
  TDecOffsetObligationPOGridForm = class(TObjectGridForm)
    dsDataLOCKED_FOR_DECISION: TFloatField;
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
    dsDataBIK_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataNAME_K: TStringField;
    dsDataINN_K: TStringField;
    dsDataKPP_K: TStringField;
    dsDataVAL_PAYMENT_REASON: TStringField;
    dsDataVAL_DOC_NUMBER: TStringField;
    dsDataVAL_DOC_DATE: TDateTimeField;
    dsDataVAL_PAYMENT_TYPE: TStringField;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataIN_REG: TStringField;
    dsDataIS_TS: TStringField;
    dsDataAVAIL_SUMMA: TFloatField;
    dsDataIS_ARCHIVE: TStringField;
    grdDataDBBandedTableViewLOCKED_FOR_DECISION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn;
    QueryList1: TQueryList;
    qryGetMode: TsqlOp;
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecOffsetObligationPOGridForm: TDecOffsetObligationPOGridForm;

implementation

{$R *.dfm}

uses
  MainDM
 , fdcCustomDataFrm;

procedure TDecOffsetObligationPOGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if qryGetMode.Exec( 'id', [ParamByName( 'id' ).Value] ) = 0 then
    grdDataDBBandedTableViewLOCKED_FOR_DECISION.Caption := 'Списано по решению'
  else
    grdDataDBBandedTableViewLOCKED_FOR_DECISION.Caption := 'Заблокировано по решению';
end;

initialization
  RegisterClass( TDecOffsetObligationPOGridForm );

end.
