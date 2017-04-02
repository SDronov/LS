unit ActCorrectOperBalansTranGridFrm;

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
  TActCorrectOperBalansTranGridForm = class(TObjectGridForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataACT_ID: TFloatField;
    dsDataDOC_ID: TFloatField;
    dsDataKBK_ID: TFloatField;
    dsDataPAYMENT_TYPE_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataACCOUNT_ID: TFloatField;
    dsDataIS_DEBIT: TStringField;
    dsDataOPERATION_SUM: TFloatField;
    dsDataIS_TS: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataACCOUNT_CODE: TStringField;
    dsDataKBK_CODE: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_TYPESYSNAME: TStringField;
    dsDataDOC_TYPENAME: TStringField;
    dsDataDOC_SUBJECT: TStringField;
    dsDataDOC_SUMM: TFloatField;
    grdDataDBBandedTableViewDOC_TYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUBJECT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACCOUNT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_DEBIT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOPERATION_SUM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActCorrectOperBalansTranGridForm: TActCorrectOperBalansTranGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TActCorrectOperBalansTranGridForm);

end.
