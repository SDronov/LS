unit XLSReportByPeriodFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportFrm,XLSReportByDateFrm, Menus, cxLookAndFeelPainters, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, OracleData, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, FDCCustomDataset, fdcQuery;

type
  TXLSReportByPeriodForm = class(TXLSReportByDateForm)
    liDateFrom: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    dsParamDATE_FROM: TDateField;
    procedure dsParamDATE_FROMChange(Sender: TField);
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

procedure TXLSReportByPeriodForm.dsParamDATE_FROMChange(Sender: TField);
begin
  inherited;
  if (dsParamDATE_FROM.Value > dsParamDATE_TO.Value) then
    dsParamDATE_TO.Value := dsParamDATE_FROM.Value;
end;

procedure TXLSReportByPeriodForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsParamDATE_FROM.Value := dsParamSYSDATE.Value;
end;

procedure TXLSReportByPeriodForm.CheckParams;
begin
  inherited;
  CheckDate(dsParamDATE_FROM);
  CmpDate(dsParamDATE_FROM, dsParamDATE_TO);
end;

procedure TXLSReportByPeriodForm.TransferParams;
begin
  inherited;
  with xlReport.Params.Add do
  begin
    Name := 'DATE_FROM_TEXT';
    Value := DateAsText(dsParamDATE_FROM.Value);
  end;
  with xlReport.Params.Add do
  begin
    Name := 'DATE_PERIOD';
    Value := 'с '+FormatDateTime('DD.MM.YYYY по ', dsParamDATE_FROM.Value)+
             FormatDateTime('DD.MM.YYYY', dsParamDATE_TO.Value);
  end;
  with xlReport.Params.Add do
  begin
    Name := 'DATE_PERIOD_TEXT';
    Value := 'с '+DateAsText(dsParamDATE_FROM.Value)+' по '+
             DateAsText(dsParamDATE_TO.Value);
  end;
end;

initialization
  RegisterClass(TXLSReportByPeriodForm);
end.
