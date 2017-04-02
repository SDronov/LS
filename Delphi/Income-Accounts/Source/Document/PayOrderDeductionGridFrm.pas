unit PayOrderDeductionGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxCurrencyEdit, Menus, cxCalendar, cxCheckBox, cxCalc;

type
  TPayOrderDeductionGridForm = class(TObjectGridForm)
    dsDataPAYMENT_ID: TFloatField;
    dsDataCDECL_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn;
    dsDataARRG_SUMMA: TFloatField;
    dsDataFIRST_MASK: TFloatField;
    actShowPaytype: TAction;
    dxBarButton1: TdxBarButton;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataPAYMENT_MONTH: TDateTimeField;
    dsDataCORRECT_REASON: TStringField;
    grdDataDBBandedTableViewPAYMENT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCORRECT_REASON: TcxGridDBBandedColumn;
    vwgrdDataDBBandedTableAggrView: TcxGridDBBandedTableView;
    vwgrdDataDBBandedTableAggrViewDECL_NAME: TcxGridDBBandedColumn;
    vwgrdDataDBBandedTableAggrViewARRG_SUMMA: TcxGridDBBandedColumn;
    dsDataACC_DATE: TDateTimeField;
    grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn;
    dsDataKBKCODE: TStringField;
    grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    dsDataIS_ARCHIVE: TStringField;
    columnIS_ARCHIVE: TcxGridDBBandedColumn;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    grdDataDBBandedTableViewSUBJ_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJ_KPP: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dsDataDECL_ID: TFloatField;
    dsDataCHARGE_CURR_ID: TFloatField;
    dsDataCHARGE_SUMMA: TFloatField;
    dsDataCHARGE_ID: TFloatField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE1_ID: TFloatField;
    dsDataKBKCODE_SOURCE: TStringField;
    grdDataDBBandedTableViewKBKCODE_SOURCE: TcxGridDBBandedColumn;
    procedure actOpenExecute(Sender: TObject);
    procedure dsDataFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure actShowPaytypeExecute(Sender: TObject);
    procedure actShowPaytypeUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SaveLayout; override;
    procedure LoadLayout; override;
    { Public declarations }
    
  end;

var
  PayOrderDeductionGridForm: TPayOrderDeductionGridForm;

implementation

uses MainDm, fdcCustomObjectGridFrm, fdcCustomDBDataFrm, fdcCustomGridFrm;

{$R *.dfm}

procedure TPayOrderDeductionGridForm.actOpenExecute(Sender: TObject);
begin
//  inherited;
  ObjectServices.OpenObject(dsDataCDECL_ID.Value, nil);
end;

procedure TPayOrderDeductionGridForm.dsDataFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := dsDataFIRST_MASK.Value = 0;
end;

procedure TPayOrderDeductionGridForm.actShowPaytypeExecute(
  Sender: TObject);
begin
  inherited;
  dsData.Filtered := not dsData.Filtered;
  dsData.Resync([]);
  if dsData.Filtered then grdDataLevel.GridView := vwgrdDataDBBandedTableAggrView
  else grdDataLevel.GridView := grdDataDBBandedTableView;
  GridPopupMenu.PopupMenus[0].GridView := grdDataLevel.GridView;
end;

procedure TPayOrderDeductionGridForm.actShowPaytypeUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Checked := not dsData.Filtered;
end;

procedure TPayOrderDeductionGridForm.LoadLayout;
begin
  inherited;
end;

procedure TPayOrderDeductionGridForm.SaveLayout;
begin
  inherited;
end;

initialization
   RegisterClass(TPayOrderDeductionGridForm);

end.
