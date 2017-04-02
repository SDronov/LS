unit rptDesisionPayback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportByPeriodFrm, Menus, cxLookAndFeelPainters, DB,
  dxmdaset, xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, StdCtrls, cxButtons, cxControls;

type
  TDesisionPaybackRpt = class(TXLSReportByPeriodForm)
    procedure xlReportAfterBuild(Report: TxlReport);
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure dsParamDATE_TOChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }    //
  end;

implementation
uses DateUtils;

{$R *.dfm}

procedure TDesisionPaybackRpt.xlReportAfterBuild(Report: TxlReport);
begin
  inherited;
 report.ActiveSheet:= 'Титульный';
end;

procedure TDesisionPaybackRpt.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsParamDATE_TO.Value := dsParamSYSDATE.Value;
end;

procedure TDesisionPaybackRpt.dsParamDATE_TOChange(Sender: TField);
begin
  inherited;
  dsParamDATE_FROM.Value := encodeDate( yearOf( dsParamDATE_TO.AsDateTime ), 1, 1 );
end;

initialization
 RegisterClass(TDesisionPaybackRpt);

end.
