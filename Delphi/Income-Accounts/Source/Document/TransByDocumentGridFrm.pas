unit TransByDocumentGridFrm;

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
  dxStatusBar, cxCheckBox;

type
  TTransByDocumentGridForm = class(TObjectGridForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDOC_ID: TFloatField;
    dsDataACCOUNT_ID: TFloatField;
    dsDataKBK_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAYMENT_TYPE_ID: TFloatField;
    dsDataACCOUNT_CODE: TStringField;
    dsDataKBK_CODE: TStringField;
    dsDataSUBJECT: TStringField;
    dsDataCURRENCY_CODE: TStringField;
    dsDataPAYMENT_TYPE_CODE: TStringField;
    dsDataOPERATION_DATE: TDateTimeField;
    dsDataIS_DEBIT: TStringField;
    dsDataOPERATION_SUM: TFloatField;
    dsDataSUM_RUR: TFloatField;
    dsDataIS_TS: TStringField;
    dsDataIS_CURRENT: TIntegerField;
    grdDataDBBandedTableViewACCOUNT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOPERATION_SUM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_RUR: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    dsDataDEBIT_SIGN: TStringField;
    grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEBIT_SIGN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXCH_RATE: TcxGridDBBandedColumn;
    dsDataEXCH_RATE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransByDocumentGridForm: TTransByDocumentGridForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TTransByDocumentGridForm);

end.
