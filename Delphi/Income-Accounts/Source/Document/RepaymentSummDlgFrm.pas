unit RepaymentSummDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxDBEdit, QueryList, Menus;

type
  TRepaymentSummDlgForm = class(TfdcCustomDlgForm)
    cxDateEdit1: TcxDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDBCurrencyEdit1: TcxCurrencyEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    QueryList1: TQueryList;
    sqlPreparePayments: TsqlOp;
    sqlAddCharge: TsqlOp;
    sqlSummWithInterest: TsqlOp;
    procedure cxDateEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure cxDBCurrencyEdit1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    MaxSumm: double;
    MinSumm: double;
  public
    { Public declarations }
    RepaySumm: double;
    DeclId: double;
    RepayId: double;
    FromDate: TDate;
  end;

var
  RepaymentSummDlgForm: TRepaymentSummDlgForm;

implementation

{$R *.dfm}
procedure TRepaymentSummDlgForm.cxDateEdit1PropertiesEditValueChanged(
  Sender: TObject);
var
 SummWI: double;
begin
  inherited;
  if(cxDateEdit1.Date < FromDate) then
   raise Exception.Create('<<Ошибка задания даты оплаты>>.<<Дата оплаты не может быть меньше даты регистрации документа!>>');
  sqlSummWithInterest.ParamValues['SUMMWI'] := 0.0;
  sqlSummWithInterest.Exec('DECLID;REPAYID;TODATE;SUMM',[DeclId,RepayId,cxDateEdit1.Date,RepaySumm]);
  SummWI := sqlSummWithInterest.ParamValues['SUMMWI'];
  MaxSumm := SummWI;
  MinSumm := SummWI - RepaySumm;
  cxDBCurrencyEdit1.Value := SummWI;
end;

procedure TRepaymentSummDlgForm.actOkExecute(Sender: TObject);
begin
  //inherited;
   cxDBCurrencyEdit1.ValidateEdit(True);
   if(cxDateEdit1.Date < FromDate) then
   begin
    raise Exception.Create('<<Ошибка задания даты оплаты>>.<<Дата оплаты не может быть меньше даты регистрации документа!>>');
    Exit;
   end;
   if(cxDBCurrencyEdit1.Value < MinSumm) then
   begin
    raise Exception.Create('<<Ошибка указания суммы оплаты>>.<<Введенная сумма меньше суммы начисленных процентов!>>');
    Exit;
   end;
   if(cxDBCurrencyEdit1.Value > MaxSumm) then
   begin
    raise Exception.Create('<<Ошибка указания суммы оплаты>>.<<Веденная сумма больше суммы оплаты с начисленными процентами!>>');
    Exit;
   end;
   ModalResult := mrOK;    
end;

procedure TRepaymentSummDlgForm.cxDBCurrencyEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if(cxDBCurrencyEdit1.Value < MinSumm) then
   raise Exception.Create('<<Ошибка указания суммы оплаты>>.<<Введенная сумма меньше суммы начисленных процентов!>>');
  if(cxDBCurrencyEdit1.Value > MaxSumm) then
   raise Exception.Create('<<Ошибка указания суммы оплаты>>.<<Веденная сумма больше суммы оплаты с начисленными процентами!>>');
end;

initialization
  RegisterClass(TRepaymentSummDlgForm);

end.
