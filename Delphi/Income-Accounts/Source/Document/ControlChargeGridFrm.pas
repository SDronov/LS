unit ControlChargeGridFrm;

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
  TControlChargeGridForm = class(TObjectGridForm)
    dsDataG071: TStringField;
    dsDataG072: TDateTimeField;
    dsDataG073: TStringField;
    dsDataGB0: TStringField;
    dsDataGB1: TStringField;
    dsDataGB1_1: TStringField;
    dsDataGB2: TFloatField;
    dsDataGB3: TStringField;
    dsDataGB4: TFloatField;
    colGB0: TcxGridDBBandedColumn;
    colPaymentType: TcxGridDBBandedColumn;
    colPaymentSubType: TcxGridDBBandedColumn;
    colPaymentSum: TcxGridDBBandedColumn;
    colCurrencyCode: TcxGridDBBandedColumn;
    colCurrencyRate: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TControlChargeGridForm);

end.
