unit qVEDRefundAccountGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportGridFrm, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, xlcClasses,
  xlEngine, xlReport, OracleData, fdcParamsHolder, dxBar, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxStatusBar, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxBarExtItems, cxMemo,
  cxNavigator, cxDBNavigator;

type
  TqVEDRefundAccountGridForm = class(TqCustomReportGridForm)
    dxBarStatic1: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    ColumnINN: TcxGridDBBandedColumn;
    ColumnCUSTOMSFULLNAME: TcxGridDBBandedColumn;
    ColumnACCOUNT_K: TcxGridDBBandedColumn;
    ColumnBIK_K: TcxGridDBBandedColumn;
    ColumnBANK_NAME: TcxGridDBBandedColumn;
    ColumnOPER_DATE: TcxGridDBBandedColumn;
    ColumnCUSTOMS_CODE: TcxGridDBBandedColumn;
    ColumnDEC_TYPE: TcxGridDBBandedColumn;
    ColumnDEC_DATE: TcxGridDBBandedColumn;
    ColumnDEC_NUMBER: TcxGridDBBandedColumn;
    ColumnDOC_NUMBER: TcxGridDBBandedColumn;
    ColumnDOC_DATE: TcxGridDBBandedColumn;
    ColumnSUMMA: TcxGridDBBandedColumn;
    ColumnKPP: TcxGridDBBandedColumn;
    ColumnNAME: TcxGridDBBandedColumn;
    dsetDataOPER_DATE: TDateTimeField;
    dsetDataCUSTOMS_CODE: TStringField;
    dsetDataCUSTOMSFULLNAME: TStringField;
    dsetDataDEC_TYPE: TStringField;
    dsetDataDEC_DATE: TDateTimeField;
    dsetDataDEC_NUMBER: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataSUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataKPP: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPENAME: TStringField;
    dsetDataACCOUNT_K: TStringField;
    dsetDataBIK_K: TStringField;
    dsetDataBANK_NAME: TStringField;
    cxMaskEditAccount: TcxMaskEdit;
    procedure actExcelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cxMaskEditAccountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMaskEditAccountPropertiesChange(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qVEDRefundAccountGridForm: TqVEDRefundAccountGridForm;

implementation

{$R *.dfm}

procedure TqVEDRefundAccountGridForm.actExcelExecute(Sender: TObject);
begin
  excelExport.ParamByName['Account'].AsString := VarToStr(dsetData.GetVariable('ACCOUNT'));
  inherited;
end;

procedure TqVEDRefundAccountGridForm.actRefreshExecute(Sender: TObject);
begin
  dsetData.Close;
  dsetData.SetVariable('ACCOUNT', cxMaskEditAccount.Text);
  inherited;
end;

procedure TqVEDRefundAccountGridForm.cxMaskEditAccountKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     RefreshData;
end;

procedure TqVEDRefundAccountGridForm.cxMaskEditAccountPropertiesChange(
  Sender: TObject);
begin
  actExcel.Update;
  actRefresh.Update;
end;

procedure TqVEDRefundAccountGridForm.actRefreshUpdate(Sender: TObject);
begin
  actRefresh.Enabled := Length(cxMaskEditAccount.Text) = 20;
end;

initialization
  RegisterClass (TqVEDRefundAccountGridForm);


end.

