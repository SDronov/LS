unit qBackOrPaymentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportByPeriodFrm, Menus, cxLookAndFeelPainters, DB,
  dxmdaset, xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, StdCtrls, cxButtons, cxControls, cxCheckBox, QueryList, Oracle;

type
  TqBackOrPaymentForm = class(TXLSReportByPeriodForm)
    chkAppendix: TcxDBCheckBox;
    liAppendix: TdxLayoutItem;
    dsParamAppendix: TIntegerField;
    dsAppendix: TfdcQuery;
    dsSum: TOracleQuery;
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure xlReportBeforeBuild(Report: TxlReport);
  private
    { Private declarations }
  public
    procedure CreateDataSources; override;
    procedure TransferParams; override;
  end;

implementation

uses MainDm, qReportUtil, XLSReportFrm, Math, StrUtils;
{$R *.dfm}

procedure TqBackOrPaymentForm.CreateDataSources;
begin
  inherited;
  if (dsParamAppendix.Value = 1) then
   with xlReport.DataSources.Add do
   begin
     DataSet := dsAppendix;
     Alias := 'dsAppendix';
     Range := 'rngAppendix';
     Options := [xrgoAutoOpen, xrgoAutoClose, xrgoPreserveRowHeight];
   end;
end;

procedure TqBackOrPaymentForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsParamAppendix.Value := 0;
end;

procedure TqBackOrPaymentForm.TransferParams;

  procedure AddParam(AColNo : Integer; const AReason : string;
   const ACourt: boolean = False; const AExcise: boolean = False;
   const ADecType :string = '');
    var
      vStr: string;
      vCodes: TStrings;
      i: Integer;
  begin
    dsSum.SetVariable('DEC_TYPE', IfThen( ADecType <> EmptyStr, 'and t.typesysname = '+ QuotedStr(ADecType)));
    dsSum.SetVariable('COURT',  IfThen(ACourt, 'and t.decision_court = ''Y'''));
    dsSum.SetVariable('EXCISE', IfThen(AExcise, 'and t.excise_pay = ''Y'''));

    if Pos(',', AReason) > 0 then
    begin
      vCodes := TStringList.Create;
      try
        vStr := 'and t.sub_code in (';
        vCodes.CommaText := AReason;
        for i:=0 to vCodes.Count - 1 do
          vStr := vStr + QuotedStr(vCodes[i])+', ';
        vStr := Copy(vStr, 1, Length(vStr)- 2) +')';
      finally
        vCodes.Free;
      end;
    end
    else
      vStr := IfThen(AReason <> EmptyStr, 'and t.sub_code = '+ QuotedStr(AReason));
    dsSum.SetVariable('REASON', vStr);
    dsSum.Execute;

    with xlReport.Params.Add do
    begin
      Name := 'SUM_'+IntToStr(AColNo);
      AsFloat := dsSum.Field('SUMMA');
    end;
    with xlReport.Params.Add do
    begin
      Name := 'CNT_'+IntToStr(AColNo);
      AsInteger := dsSum.Field('CNT');
    end;
  end;

begin
  inherited;
  dsSum.SetVariable('DATE_FROM', dsParamDATE_FROM.Value);
  dsSum.SetVariable('DATE_TO', dsParamDATE_TO.Value);
  if AnsiContainsText(xlReport.XLSTemplate, 'зачет') then
    begin
      dsSum.SQL.Text := AnsiReplaceText(dsSum.SQL.Text, 'fdc_rep_payback_lst', 'fdc_rep_dec_payment_lst');
      AddParam(2, '149');
      AddParam(3, '149', True);
      AddParam(4, '147');
      AddParam(5, '147', True);
      AddParam(6, '99,148,191');
      AddParam(7, '99,148,191', True);
    end
  else
    begin
      AddParam(2, '122');
      AddParam(3, '122', False, True);
      AddParam(4, '122', True);
      AddParam(5, '149');
      AddParam(6, '149', True);
      AddParam(7, '147');
      AddParam(8, '147', True);
      AddParam(9, '99,148,191');
      AddParam(10, '99,148,191', True);
      AddParam(11, '', False, False, 'DecPaybackTimeOut');
      AddParam(12, '', True, False, 'DecPaybackTimeOut');
    end;
end;

procedure TqBackOrPaymentForm.xlReportBeforeBuild(Report: TxlReport);
begin
  inherited;
  if (dsParamAppendix.Value = 0) then
    Report.MacroBefore := 'RemoveAppendix'
  else
    Report.MacroAfter := 'Лист2.SetSummaryBold';
end;

initialization
  RegisterClass(TqBackOrPaymentForm);
end.
