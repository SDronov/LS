unit ControlKTSPltGridFrm;

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
  TControlKTSPltGridForm = class(TObjectGridForm)
    dsDataG071: TStringField;
    dsDataG072: TDateTimeField;
    dsDataG073: TStringField;
    dsDataK32: TFloatField;
    dsDataK470: TStringField;
    dsDataK471: TStringField;
    dsDataK472: TFloatField;
    dsDataK4721: TStringField;
    dsDataK473: TFloatField;
    dsDataK4731: TStringField;
    dsDataK4732: TStringField;
    dsDataK4733: TStringField;
    dsDataK4734: TFloatField;
    dsDataKPP: TFloatField;
    dsDataK474: TFloatField;
    dsDataK4741: TStringField;
    dsDataK475: TStringField;
    dsDataK476: TFloatField;
    dsDataK4761: TStringField;
    dsDataK473Z1_2: TStringField;
    dsDataK473_2: TFloatField;
    dsDataK4731_2: TStringField;
    dsDataK4732_2: TStringField;
    dsDataK4733_2: TStringField;
    dsDataK4734_2: TFloatField;
    dsDataK473Z1_3: TStringField;
    dsDataK473_3: TFloatField;
    dsDataK4731_3: TStringField;
    dsDataK4732_3: TStringField;
    dsDataK4733_3: TStringField;
    dsDataK4734_3: TFloatField;
    dsDataK473Z2_2: TFloatField;
    dsDataK477: TFloatField;
    dsDataK4730: TDateTimeField;
    dsDataK4740: TDateTimeField;
    dsDataNBLKTC1: TStringField;
    dsDataNBLKTC1P: TStringField;
    dsDataNZP: TFloatField;
    dsDataDMODIFY: TDateTimeField;
    dsDataTMODIFY: TStringField;
    dsDataP_EDOC_ID: TFloatField;
    dsDataDATELOAD: TDateTimeField;
    dsDataLOAD_ID: TFloatField;
    grdDataDBBandedTableViewK32: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK470: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK471: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK472: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4721: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK473: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4731: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4732: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4733: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4734: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK474: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4741: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK475: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK476: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4761: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK473Z1_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK473_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4731_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4732_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4733_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4734_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK473Z1_3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK473_3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4731_3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4732_3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4733_3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4734_3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK473Z2_2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK477: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4730: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewK4740: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNBLKTC1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNBLKTC1P: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNZP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDMODIFY: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTMODIFY: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlKTSPltGridForm: TControlKTSPltGridForm;

implementation

{$R *.dfm}
initialization
  RegisterClass(TControlKTSPltGridForm);

end.
