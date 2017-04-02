unit qKTSFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportByPeriodFrm, Menus, cxLookAndFeelPainters, DB,
  dxmdaset, xlcClasses, xlEngine, xlReport, OracleData, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, StdCtrls, cxButtons, cxControls, cxGroupBox, cxRadioGroup,
  FDCCustomDataset, fdcQuery;

type
  TqKTSForm = class(TXLSReportByPeriodForm)
    rgTypeRep: TcxDBRadioGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    rgTS: TcxDBRadioGroup;
    dxLayoutControl1Item2: TdxLayoutItem;
    dsParamTS: TIntegerField;
    dsParamRTYPE: TIntegerField;
    procedure dsParamAfterOpen(DataSet: TDataSet);
  protected
    procedure TransferParams; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TqKTSForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsParamRTYPE.Value := 0;
  dsParamTS.Value := 0;
end;

procedure TqKTSForm.TransferParams;
begin
  inherited;
  with xlReport.Params.Add do
  begin
    Name := 'REPORT_TYPE';
    Value := rgTypeRep.Properties.Items[rgTypeRep.ItemIndex].Caption;
  end;
  with xlReport.Params.Add do
  begin
    Name := 'BELONG_TS';
    Value := rgTS.Properties.Items[rgTS.ItemIndex].Caption;
  end;
end;

initialization
  RegisterClass(TqKTSForm);

end.
