unit DeclChargeHistFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxMemo, cxDBEdit, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  StdCtrls, dxLayoutControl, cxButtons, ExtCtrls, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDeclChargeHistForm = class(TfdcCustomGridForm)
    dsDataDECL_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataCUR_CODE: TStringField;
    dsDataREASON_NAME: TStringField;
    dsDataCHANGE_DATE: TDateTimeField;
    dsDataCHANGE_DESC: TStringField;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxButton1: TcxButton;
    cxDBMemo1: TcxDBMemo;
    dxLayoutControl1Item2: TdxLayoutItem;
    Splitter1: TSplitter;
    grdDataDBBandedTableViewDECL_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHANGE_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHANGE_DESC: TcxGridDBBandedColumn;
    dsDataACC_DATE: TDateTimeField;
    grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn;
    dsDataCHARGE_MONTH: TDateTimeField;
    dsDataCODE_REASON: TStringField;
    grdDataDBBandedTableViewCODE_REASON: TcxGridDBBandedColumn;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclChargeHistForm: TDeclChargeHistForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TDeclChargeHistForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

initialization
    RegisterClass(TDeclChargeHistForm);

end.
