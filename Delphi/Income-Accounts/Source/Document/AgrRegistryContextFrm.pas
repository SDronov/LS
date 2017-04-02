unit AgrRegistryContextFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, DB, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TAgrRegistryContextForm = class(TfdcCustomGridForm)
    dsDataND_40: TStringField;
    dsDataND: TStringField;
    dsDataDECL_TYPE: TStringField;
    dsDataG43: TStringField;
    dsDataZ_31: TIntegerField;
    dsDataZ_VD: TStringField;
    dsDataNUM_RASP: TStringField;
    dsDataDAT_RASP: TDateTimeField;
    dsDataV_PL: TStringField;
    dsDataKOD_W: TStringField;
    dsDataSUM_PL: TFloatField;
    grdDataDBBandedTableViewND: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewND_40: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewG43: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewZ_31: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewZ_VD: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNUM_RASP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDAT_RASP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewV_PL: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKOD_W: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_PL: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AgrRegistryContextForm: TAgrRegistryContextForm;

implementation

uses MainDm;

{$R *.dfm}

end.
