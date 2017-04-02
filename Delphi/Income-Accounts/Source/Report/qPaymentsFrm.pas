unit qPaymentsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportByPeriodFrm, Menus, cxLookAndFeelPainters, DB,
  dxmdaset, xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, StdCtrls, cxButtons, cxControls, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, OracleData;

type
  TqPaymentsForm = class(TXLSReportByPeriodForm)
    dsParamINN: TStringField;
    dsParamFILTER_TO: TStringField;
    edtINN: TcxDBMaskEdit;
    liINN: TdxLayoutItem;
    dsCustoms: TOracleDataSet;
    dsetCustoms: TDataSource;
    lcbCustoms: TcxDBLookupComboBox;
    liCustoms: TdxLayoutItem;
    dsCustomsID: TFloatField;
    dsCustomsCODE: TStringField;
    dsCustomsNAME: TStringField;
    dsCustomsFULL_NAME: TStringField;
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dsParamBeforePost(DataSet: TDataSet);
  protected
    procedure TransferParams; override;
  public
    { Public declarations }
  end;

implementation
uses MainDM, XLSReportFrm;
{$R *.dfm}
procedure TqPaymentsForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsParamFILTER_TO.Value := 'Все';
end;

procedure TqPaymentsForm.FormShow(Sender: TObject);
begin
  inherited;
  if not dsCustoms.Active then
    dsCustoms.Open;
end;

procedure TqPaymentsForm.TransferParams;
begin
  if Trim(dsParamINN.Value) = EmptyStr then
    begin
      if dsParam.State <> dsEdit then
        dsParam.Edit;
      dsParamINN.Value := 'Все';
      dsParam.Post;
    end;
  inherited;
end;

procedure TqPaymentsForm.dsParamBeforePost(DataSet: TDataSet);
begin
  inherited;
  dsParamINN.Value := Trim(dsParamINN.Value);
end;

initialization
  RegisterClass(TqPaymentsForm);

end.
