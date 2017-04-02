unit DocReuseAmountDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxLookAndFeels, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, cxControls, DB, OracleData, cxDBEdit, dxmdaset;

type
  TDocReuseAmountDlgForm = class(TfdcCustomDlgForm)
    dsetParams: TdxMemData;
    ceReuseAmount: TcxDBCurrencyEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsParams: TDataSource;
    dsetParamsAMOUNT: TCurrencyField;
    ceMaxSum: TcxCurrencyEdit;
    itemMax: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure ceReuseAmountPropertiesChange(Sender: TObject);
  private
    function GetMaxValue: Currency;
    procedure SetMaxValue(const Value: Currency);
    function GetAmount: Currency;
    procedure SetAmount(const Value: Currency);
    { Private declarations }
  public
    property MaxValue : Currency read GetMaxValue write SetMaxValue;
    property Amount: Currency read GetAmount write SetAmount;
  end;

var
  DocReuseAmountDlgForm: TDocReuseAmountDlgForm;

implementation

{$R *.dfm}

uses
  MainDM;

procedure TDocReuseAmountDlgForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsetParams.Open;
  dsetParams.Append;
  ceReuseAmount.Properties.MinValue := 0;
end;

procedure TDocReuseAmountDlgForm.ceReuseAmountPropertiesChange(
  Sender: TObject);
begin
  if (ceReuseAmount.EditingValue < ceReuseAmount.Properties.MinValue) then
    begin
      ceReuseAmount.Value := ceReuseAmount.Properties.MinValue;
    end;
  actOk.Enabled := (ceReuseAmount.EditingValue > 0)
               and (ceReuseAmount.EditingValue <= ceReuseAmount.Properties.MaxValue);
end;

function TDocReuseAmountDlgForm.GetMaxValue: Currency;
begin
  Result := ceReuseAmount.Properties.MaxValue;
end;

procedure TDocReuseAmountDlgForm.SetMaxValue(const Value: Currency);
begin
  ceReuseAmount.Properties.MaxValue := Value;
  ceMaxSum.Value := Value;
  itemMax.Visible := True;
end;

function TDocReuseAmountDlgForm.GetAmount: Currency;
begin
  Result := ceReuseAmount.Value; //dsetParamsAMOUNT.Value;
end;

procedure TDocReuseAmountDlgForm.SetAmount(const Value: Currency);
begin
  dsetParamsAMOUNT.Value := Value;
end;

end.
