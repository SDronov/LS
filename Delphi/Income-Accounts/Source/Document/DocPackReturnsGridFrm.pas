unit DocPackReturnsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomObjectGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalendar, cxCheckBox, DocPackGridFrm, cxDropDownEdit,
  cxCurrencyEdit;

type
  TDocPackReturnsGridForm = class(TDocPackGridForm)
    dsDataREGIONAL_ACCOUNT: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCLAIMED_DOC_COUNT: TFloatField;
    dsDataCLAIMED_SPENDING: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDATE_IN: TDateTimeField;
    dsDataDATE_SEND: TDateTimeField;
    grdDataDBBandedTableViewREGIONAL_ACCOUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_IN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn;
    lcSearchCriteriaItem6: TdxLayoutItem;
    Label2: TLabel;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtFromDateSend: TcxDateEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    edtToDateSend: TcxDateEdit;
    grdDataDBBandedTableViewCLAIMED_DOC_COUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCLAIMED_SPENDING: TcxGridDBBandedColumn;
    lcSearchCriteriaItem9: TdxLayoutItem;
    Label3: TLabel;
    lcSearchCriteriaItem10: TdxLayoutItem;
    edtSumMin: TcxCurrencyEdit;
    lcSearchCriteriaItem11: TdxLayoutItem;
    edtSumMax: TcxCurrencyEdit;
    dsDataCUSTOMS_NAME: TStringField;
    dsDataDESTINATION: TStringField;
    dsDataDESTINATION_NAME: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCCUSTOMS_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESTINATION_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocPackReturnsGridForm: TDocPackReturnsGridForm;

implementation

{$R *.dfm}

uses
  MainDM
 ,fdcUtils;

procedure TDocPackReturnsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('FROM_DATE_SEND', edtFromDateSend.EditValue);
  SetSearchParam('TO_DATE_SEND', edtToDateSend.EditValue);
  SetSearchParam('SUM_MIN', edtSumMin.EditValue);
  SetSearchParam('SUM_MAX', edtSumMax.EditValue);
  //SetSearchParam('SEND', edtCodTSend.EditValue);
  //SetSearchParam('DEST', edtCodTDest.EditValue);
end;

procedure TDocPackReturnsGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  if AViewInfo.GridRecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> MainData.GetSoftCustomsCode then
    if AViewInfo.GridRecord.Selected then
      begin
        ACanvas.Brush.Color := clYellow;
        ACanvas.Font.Color  := clWindowText;
      end
    else
      ACanvas.Brush.Color := clYellowLight;
end;

initialization
  RegisterClass( TDocPackReturnsGridForm );

end.
