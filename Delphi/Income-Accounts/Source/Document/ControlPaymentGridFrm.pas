unit ControlPaymentGridFrm;

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
  TControlPaymentGridForm = class(TObjectGridForm)
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataK92: TStringField;
    dsDataK93: TDateTimeField;
    dsDataK94: TFloatField;
    dsDataK95: TFloatField;
    dsDataK96: TDateTimeField;
    dsDataK_VAL: TStringField;
    dsDataPRIZ: TStringField;
    dsDataWHO: TStringField;
    dsDataSP: TStringField;
    dsDataCRYPT: TStringField;
    dsDataCODE: TStringField;
    dsDataBANK_ID: TStringField;
    dsDataVP: TStringField;
    dsDataBK: TStringField;
    dsDataIRET: TIntegerField;
    colOKPO: TcxGridDBBandedColumn;
    colINN: TcxGridDBBandedColumn;
    colKPP: TcxGridDBBandedColumn;
    colPaymentDocNumber: TcxGridDBBandedColumn;
    colPaymentDocDate: TcxGridDBBandedColumn;
    colChargeSum: TcxGridDBBandedColumn;
    colPaymentSum: TcxGridDBBandedColumn;
    colPaymentDate: TcxGridDBBandedColumn;
    colK_VAL: TcxGridDBBandedColumn;
    colSP: TcxGridDBBandedColumn;
    colPRIZ: TcxGridDBBandedColumn;
    colWHO: TcxGridDBBandedColumn;
    colCRYPT: TcxGridDBBandedColumn;
    colCODE: TcxGridDBBandedColumn;
    colBANK_ID: TcxGridDBBandedColumn;
    colVP: TcxGridDBBandedColumn;
    colBK: TcxGridDBBandedColumn;
    colIRET: TcxGridDBBandedColumn;
    dsDataNBLKTC1: TStringField;
    colNblKtc: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
initialization
   RegisterClass(TControlPaymentGridForm);

end.
