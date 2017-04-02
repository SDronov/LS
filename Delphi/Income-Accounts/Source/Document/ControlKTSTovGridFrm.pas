unit ControlKTSTovGridFrm;

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
  TControlKTSTovGridForm = class(TObjectGridForm)
    dsDataG071: TStringField;
    dsDataG072: TDateTimeField;
    dsDataG073: TStringField;
    dsDataTYP_KTC: TFloatField;
    dsDataK011: TStringField;
    dsDataK012: TStringField;
    dsDataK013: TStringField;
    dsDataK031: TFloatField;
    dsDataCH: TFloatField;
    dsDataK31_1: TStringField;
    dsDataK31_11: TStringField;
    dsDataK31_2: TFloatField;
    dsDataK31_2PART: TFloatField;
    dsDataK31_20: TStringField;
    dsDataK31_21: TStringField;
    dsDataK31_7: TFloatField;
    dsDataK31_8: TFloatField;
    dsDataK31_9: TFloatField;
    dsDataK32: TFloatField;
    dsDataK35: TFloatField;
    dsDataK38: TFloatField;
    dsDataK42: TFloatField;
    dsDataK43: TStringField;
    dsDataK451: TFloatField;
    dsDataK452: TFloatField;
    dsDataK46: TFloatField;
    dsDataK461: TStringField;
    dsDataK470: TFloatField;
    dsDataNBLKTC1: TStringField;
    dsDataNBLKTC2: TStringField;
    dsDataNBLKTC1P: TStringField;
    dsDataNZP: TFloatField;
    dsDataDMODIFY: TDateTimeField;
    dsDataTMODIFY: TStringField;
    dsDataP_EDOC_ID: TFloatField;
    grdDataDBBandedTableViewTYP_KTC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK011: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK012: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK013: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK031: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_11: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_2PART: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_20: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_7: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_8: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK31_9: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK32: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK35: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK38: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK42: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK43: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK451: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK452: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK46: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK461: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK470: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNBLKTC1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNBLKTC2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNBLKTC1P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNZP: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlKTSTovGridForm: TControlKTSTovGridForm;

implementation

{$R *.dfm}
initialization
  RegisterClass(TControlKTSTovGridForm);

end.
