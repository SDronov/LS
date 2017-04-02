unit DecisionPaybackDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit,
  cxCurrencyEdit;

type
  TDecisionPaybackDlgForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item2: TdxLayoutItem;
    ceDecisionSum: TcxCurrencyEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    ceDebtSum: TcxCurrencyEdit;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Item3: TdxLayoutItem;
    ceDebtPaySum: TcxCurrencyEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    ceDebtProcSum: TcxCurrencyEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    ceDebtPenySum: TcxCurrencyEdit;
    procedure ceDebtSumPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetPaySum(const Value: Currency);
    procedure SetPenySum(const Value: Currency);
    procedure SetProcSum(const Value: Currency);
    procedure SetDecisionSum(const Value: Currency);
    function GetPaySum: Currency;
    function GetPenySum: Currency;
    function GetProcSum: Currency;
    function GetDecisionBaseSum: Currency;
    procedure SetDecisionBaseSum(const Value: Currency);
    function GetDecisionSum: Currency;
    function GetDebtSum: Currency;
    procedure SetDebtSum(const Value: Currency);
    procedure CalcDebtSum();
  public
    { Public declarations }
    property DecisionSum: Currency read GetDecisionSum write SetDecisionSum;
    property DecisionBaseSum: Currency read GetDecisionBaseSum write SetDecisionBaseSum;
    property DebtSum: Currency read GetDebtSum write SetDebtSum;
    property PaySum: Currency read GetPaySum write SetPaySum;
    property ProcSum: Currency read GetProcSum write SetProcSum;
    property PenySum: Currency read GetPenySum write SetPenySum;
  end;

var
//  DecisionPaybackDlgForm: TDecisionPaybackDlgForm;
  DecBaseSum: Currency;

implementation

{$R *.dfm}

{ TDecisionPaybackDlgForm }

procedure TDecisionPaybackDlgForm.SetPaySum(const Value: Currency);
begin
  ceDebtPaySum.Value := Value;
end;

procedure TDecisionPaybackDlgForm.SetPenySum(const Value: Currency);
begin
  ceDebtPenySum.Value := Value;
end;

procedure TDecisionPaybackDlgForm.SetProcSum(const Value: Currency);
begin
  ceDebtProcSum.Value := Value;
end;

procedure TDecisionPaybackDlgForm.ceDebtSumPropertiesChange(
  Sender: TObject);
begin
  CalcDebtSum;
end;

procedure TDecisionPaybackDlgForm.SetDecisionSum(const Value: Currency);
begin
 ceDecisionSum.Value := Value;
 actOk.Enabled:= (ceDecisionSum.Value > 0);
end;

function TDecisionPaybackDlgForm.GetDecisionSum: Currency;
begin
  Result := ceDecisionSum.Value;
end;

function TDecisionPaybackDlgForm.GetPaySum: Currency;
begin
  Result := ceDebtPaySum.Value;
end;

function TDecisionPaybackDlgForm.GetPenySum: Currency;
begin
  Result := ceDebtPenySum.Value;
end;

function TDecisionPaybackDlgForm.GetProcSum: Currency;
begin
  Result := ceDebtProcSum.Value;
end;

function TDecisionPaybackDlgForm.GetDecisionBaseSum: Currency;
begin
  Result := DecBaseSum;
end;

procedure TDecisionPaybackDlgForm.SetDecisionBaseSum(const Value: Currency);
begin
  DecBaseSum := Value;
end;

procedure TDecisionPaybackDlgForm.FormCreate(Sender: TObject);
begin
  inherited;
  ceDecisionSum.Properties.MinValue := 0;  
  ceDebtSum.Properties.MinValue := 0;  
  ceDebtPaySum.Properties.MinValue := 0;
  ceDebtProcSum.Properties.MinValue := 0;
  ceDebtPenySum.Properties.MinValue := 0;  
end;

function TDecisionPaybackDlgForm.GetDebtSum: Currency;
begin
  Result := ceDebtSum.Value;
end;

procedure TDecisionPaybackDlgForm.SetDebtSum(const Value: Currency);
begin
  ceDebtSum.Value := Value;
end;

procedure TDecisionPaybackDlgForm.actOkExecute(Sender: TObject);
begin
  ceDebtPaySum.PostEditValue;
  ceDebtPenySum.PostEditValue;
  ceDebtProcSum.PostEditValue;
  CalcDebtSum;
  dxLayoutControl1.Refresh;
  inherited;
end;

procedure TDecisionPaybackDlgForm.CalcDebtSum;
begin
  DebtSum := GetPaySum + GetProcSum + GetPenySum;
  DecisionSum := DecisionBaseSum - DebtSum;
end;

end.

