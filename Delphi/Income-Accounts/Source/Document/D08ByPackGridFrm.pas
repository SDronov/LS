unit D08ByPackGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TD08ByPackGridForm = class(TfdcCustomGridForm)
    dsDataKODT: TStringField;
    dsDataNLS: TStringField;
    dsDataNUM_RTU: TStringField;
    dsDataDAT_RTU: TDateTimeField;
    dsDataDOC_RTU: TStringField;
    dsDataNUM_V: TStringField;
    dsDataDAT_DOC: TDateTimeField;
    dsDataNUM_DOC: TStringField;
    dsDataNUM_VG: TStringField;
    dsDataDAT_DOCG: TDateTimeField;
    dsDataNUM_DOCG: TStringField;
    dsDataINN_K: TStringField;
    dsDataKOD_VP: TStringField;
    dsDataSUM_VP: TFloatField;
    dsDataSUM_DOC: TFloatField;
    dsDataDAT_SP: TDateTimeField;
    dsDataNAME_K: TStringField;
    dsDataUPD_DATE: TDateTimeField;
    dsDataUPD_TIME: TStringField;
    dsDataDOC_PACK_ID: TFloatField;
    grdDataDBBandedTableViewKODT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNLS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_RTU: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDAT_RTU: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_RTU: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_V: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDAT_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_VG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDAT_DOCG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_DOCG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKOD_VP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_VP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_DOC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDAT_SP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  D08ByPackGridForm: TD08ByPackGridForm;

implementation

{$R *.dfm}

uses
  MainDM;

initialization
  RegisterClass( TD08ByPackGridForm );

end.
