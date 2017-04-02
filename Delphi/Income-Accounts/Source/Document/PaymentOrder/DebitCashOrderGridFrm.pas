unit DebitCashOrderGridFrm;

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
  dxStatusBar;

type
  TDebitCashOrderGridForm = class(TObjectGridForm)
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataBIK_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataNREF: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataNAME_K: TStringField;
    dsDataINN_K: TStringField;
    dsDataKPP_K: TStringField;
    dsDataBIC_K: TStringField;
    dsDataACCOUNT_K: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataNOTE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataNLS: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataIN_REG: TStringField;
    dsDataDESTCUSTOMSCODE: TStringField;
    dsDataKBK: TStringField;
    dsDataVAL_PAYMENT_REASON: TStringField;
    dsDataVAL_DOC_NUMBER: TStringField;
    dsDataVAL_DOC_DATE: TDateTimeField;
    dsDataVAL_PAYMENT_TYPE: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_KPP: TStringField;
    dsDataPO_NAME: TStringField;
    dsDataPO_INN: TStringField;
    dsDataPO_KPP: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataPAY_TYPE_CODE: TStringField;
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIK_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCOUNT_P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNREF: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRECIPIENT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIC_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCOUNT_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNLS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIN_REG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_PAYMENT_REASON: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_DOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_PAYMENT_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TDebitCashOrderGridForm);
end.
