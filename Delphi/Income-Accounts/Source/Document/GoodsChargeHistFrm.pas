unit GoodsChargeHistFrm;

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
  dxStatusBar, cxMemo, cxDBEdit;

type
  TGoodsChargeHistForm = class(TfdcCustomGridForm)
    dsDataCHANGE_DESC: TStringField;
    dsDataCHANGE_DATE: TDateTimeField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_CODE: TStringField;
    colDate: TcxGridDBBandedColumn;
    colSumma: TcxGridDBBandedColumn;
    colCurrencyCode: TcxGridDBBandedColumn;
    colDesc: TcxGridDBBandedColumn;
    Splitter1: TSplitter;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxButton1: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxDBMemo1: TcxDBMemo;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsDataDATE_BEGIN: TDateTimeField;
    dsDataDATE_END: TDateTimeField;
    dsDataMODE_CODE: TStringField;
    dsDataMODE_NAME: TStringField;
    grdDataDBBandedTableViewMODE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMODE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_BEGIN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_END: TcxGridDBBandedColumn;
    dsDataREASON_CODE: TStringField;
    dsDataREASON_NAME: TStringField;
    grdDataDBBandedTableViewREASON_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TGoodsChargeHistForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

initialization
   RegisterClass(TGoodsChargeHistForm);

end.
