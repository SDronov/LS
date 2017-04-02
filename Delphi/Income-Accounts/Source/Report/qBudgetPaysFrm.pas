unit qBudgetPaysFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportByDateFrm, Menus, cxLookAndFeelPainters, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, StdCtrls, cxButtons, cxControls, QueryList, Oracle;

type
  TqBudgetPaysForm = class(TXLSReportByDateForm)
    qList: TQueryList;
    qSum_TPO: TsqlOp;
    qSum_Decl: TsqlOp;
    qSum_PayType: TsqlOp;
  private
    { Private declarations }
  public
    procedure TransferParams; override;
  end;

implementation

uses MainDm, qReportUtil;

{$R *.dfm}

{ TqBudgetPaysForm }

procedure TqBudgetPaysForm.TransferParams;

  var  l_fmt: AnsiString;

  procedure AddMoneyParam(const AParamName:string; ASum: Variant);
  begin
    with xlReport.Params.Add do
    begin
      Name := AParamName;
      //Value := ASum;
      Value := StrToFloat(VarToStr(ASum));
      //AsFloat := ASum;
    end;
  end;

begin
  l_fmt := '9999999999999999999990'+DecimalSeparator+'9999';
  inherited;
  AddMoneyParam('SUM_1111', qSum_TPO.Exec('fmt;DATE_TO;REGIM', [l_fmt,dsParamDATE_TO.Value, '»Ã']));
  AddMoneyParam('SUM_1112', qSum_Decl.Exec('fmt;DATE_TO;REGIM', [l_fmt,dsParamDATE_TO.Value, '»Ã']));
  AddMoneyParam('SUM_1121', qSum_TPO.Exec('fmt;DATE_TO;REGIM', [l_fmt,dsParamDATE_TO.Value, '› ']));
  AddMoneyParam('SUM_1122', qSum_Decl.Exec('fmt;DATE_TO;REGIM', [l_fmt,dsParamDATE_TO.Value, '› ']));
  AddMoneyParam('SUM_12', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '1030']));
  AddMoneyParam('SUM_13', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '1020']));
  AddMoneyParam('SUM_21', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '6010']));
  AddMoneyParam('SUM_22', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '6020']));
  AddMoneyParam('SUM_23', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '6021']));
  AddMoneyParam('SUM_3', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '9040']));
  AddMoneyParam('SUM_4', qSum_PayType.Exec('fmt;DATE_TO;PAY_TYPE', [l_fmt,dsParamDATE_TO.Value, '9050']));
end;
initialization
  RegisterClass(TqBudgetPaysForm);
end.
