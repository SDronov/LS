unit qVEDRefundGridFrm;

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
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxBarExtItems, cxMemo, Oracle, Math,
  ExtCtrls, cxNavigator, cxDBNavigator;

type
  TqVEDRefundGridForm = class(TqCustomReportGridForm)
    dxBarStatic1: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    dxBarStatic2: TdxBarStatic;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    dxBarStatic3: TdxBarStatic;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    ColumnINN: TcxGridDBBandedColumn;
    ColumnCUSTOMS_FULL_NAME: TcxGridDBBandedColumn;
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
    ColumnLIST_ACCOUNTS: TcxGridDBBandedColumn;
    dsetDataOPER_DATE: TDateTimeField;
    dsetDataCUSTOMS_CODE: TStringField;
    dsetDataCUSTOMS_FULL_NAME: TStringField;
    dsetDataDEC_TYPE: TStringField;
    dsetDataDEC_DATE: TDateTimeField;
    dsetDataDEC_NUMBER: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataSUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataKPP: TStringField;
    dsetDataNAME: TStringField;
    dsetDataACCOUNT_K: TStringField;
    dsetDataBIK_K: TStringField;
    dsetDataBANK_NAME: TStringField;
    dsetDataLIST_ACC: TStringField;
    dsetDataIS_PRESENT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cxDateEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDateEdit2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actExcelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qVEDRefundGridForm: TqVEDRefundGridForm;

implementation

{$R *.dfm}

procedure TqVEDRefundGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  cxDateEdit1.Date := Date();
  cxDateEdit2.Date := Date();  
  dsetData.Filter := 'is_present = ''N''';
end;

procedure TqVEDRefundGridForm.cxDateEdit1PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if (cxDateEdit1.EditValue <> null) and (cxDateEdit2.EditValue <> null) and (cxDateEdit1.Date > cxDateEdit2.Date) then
    cxDateEdit2.Date := cxDateEdit1.Date;
end;

procedure TqVEDRefundGridForm.cxDateEdit2PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if (cxDateEdit1.EditValue <> null) and (cxDateEdit2.EditValue <> null) and (cxDateEdit1.Date > cxDateEdit2.Date) then
    cxDateEdit1.Date := cxDateEdit2.Date;
end;

procedure TqVEDRefundGridForm.actExcelExecute(Sender: TObject);
begin
  excelExport.ParamByName['DateFrom'].AsString := VarToStr(dsetData.GetVariable('DATE_FROM'));
  excelExport.ParamByName['DateTo'].AsString := VarToStr(dsetData.GetVariable('DATE_TO'));
  inherited;
end;

procedure TqVEDRefundGridForm.actRefreshExecute(Sender: TObject);
begin
  cxDateEdit1.PostEditValue;
  cxDateEdit2.PostEditValue;
  dsetData.Close;
  dsetData.SetVariable('DATE_FROM', cxDateEdit1.EditValue);
  dsetData.SetVariable('DATE_TO', cxDateEdit2.EditValue);
  inherited;
end;

procedure TqVEDRefundGridForm.cxCheckBox1PropertiesChange(
  Sender: TObject);
begin
  dsetData.Filtered := cxCheckBox1.Checked;
end;

initialization
  RegisterClass (TqVEDRefundGridForm);


end.

