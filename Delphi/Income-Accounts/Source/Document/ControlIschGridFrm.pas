unit ControlIschGridFrm;

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
  TControlIschGridForm = class(TObjectGridForm)
    dsDataG071: TStringField;
    dsDataG072: TDateTimeField;
    dsDataG073: TStringField;
    dsDataG32: TFloatField;
    dsDataG470: TStringField;
    dsDataG471: TStringField;
    dsDataG471_1: TStringField;
    dsDataG472: TFloatField;
    dsDataG473: TFloatField;
    dsDataG4731: TStringField;
    dsDataG4732: TStringField;
    dsDataG4733: TStringField;
    dsDataG474: TFloatField;
    dsDataG4741: TStringField;
    dsDataG475: TStringField;
    dsDataNPP: TFloatField;
    colGoodNumber: TcxGridDBBandedColumn;
    colG470: TcxGridDBBandedColumn;
    colPaymentType: TcxGridDBBandedColumn;
    colPaymentSubType: TcxGridDBBandedColumn;
    colG472: TcxGridDBBandedColumn;
    colRate: TcxGridDBBandedColumn;
    colRateCurrency: TcxGridDBBandedColumn;
    colG4733: TcxGridDBBandedColumn;
    colSum: TcxGridDBBandedColumn;
    colSumCurrency: TcxGridDBBandedColumn;
    colPaymentMethod: TcxGridDBBandedColumn;
    colReserve: TcxGridDBBandedColumn;
    colG4731: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TControlIschGridForm);

end.
