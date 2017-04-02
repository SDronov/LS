unit XLSReportByDateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportFrm, Menus, cxLookAndFeelPainters, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, OracleData, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, FDCCustomDataset, fdcQuery;

type
  TXLSReportByDateForm = class(TXLSReportForm)
    lgPeriod: TdxLayoutGroup;
    liDateTo: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    dsParamDATE_TO: TDateField;
    procedure dsParamAfterOpen(DataSet: TDataSet);
  private
  protected
    procedure CheckParams; override;
    procedure TransferParams; override;
  public
    { Public declarations }
  end;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}


procedure TXLSReportByDateForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsParamDATE_TO.Value := dsParamSYSDATE.Value;
end;

procedure TXLSReportByDateForm.CheckParams;
begin
  inherited;
  CheckDate(dsParamDATE_TO);
end;

procedure TXLSReportByDateForm.TransferParams;
begin
  inherited;
  with xlReport.Params.Add do
  begin
    Name := 'DATE_TO_TEXT';
    Value := DateAsText(dsParamDATE_TO.Value);
  end;
end;

initialization
  RegisterClass(TXLSReportByDateForm);
end.
