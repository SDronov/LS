unit BankforCashGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TBankforCashGridForm = class(TObjectGridForm)
    dsDataBANK_NAME: TStringField;
    dsDataBIC: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataBANK_ID: TFloatField;
    dsDataPAYMENT_TO_ORDER_RATIO: TStringField;
    dsDataFILE_FORMAT_CODE: TStringField;
    grdDataDBBandedTableViewBANK_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBANK_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_TO_ORDER_RATIO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFILE_FORMAT_CODE: TcxGridDBBandedColumn;
    dsDataPAYMENT_TO_ORDER_RATIO_NAME: TStringField;
    grdDataDBBandedTableViewPAYMENT_TO_ORDER_RATIO_NAME: TcxGridDBBandedColumn;
    cxTextEdit1: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    cxTextEdit2: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BankforCashGridForm: TBankforCashGridForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TBankforCashGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('BANK_NAME', Trim(cxTextEdit1.Text));
  SetSearchParam('FFC', Trim(cxTextEdit2.Text));
end;

initialization
  RegisterClass(TBankforCashGridForm);

end.
