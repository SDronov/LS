unit ActDeductionDedsGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxCheckBox;

type
  TActDeductionDedsGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYMENT_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataPAYMENT_MONTH: TDateTimeField;
    dsDataCHARGE_CURR_ID: TFloatField;
    dsDataCHARGE_SUMMA: TFloatField;
    dsDataCHARGE_ID: TFloatField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE1_ID: TFloatField;
    dsDataCONTRACT_ID: TFloatField;
    dsDataIS_ARCHIVE: TStringField;
    dsDataPO_NAME: TStringField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataKBK_SOURCE: TStringField;
    dsDataKBK_TARGET: TStringField;
    dsDataBUDGET_DATE: TDateTimeField;
    grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK_TARGET: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBUDGET_DATE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActDeductionDedsGridForm: TActDeductionDedsGridForm;

implementation

uses
  MainDM;

{$R *.dfm}

initialization
  RegisterClass(TActDeductionDedsGridForm);

end.
