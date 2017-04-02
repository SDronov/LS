unit AggrPaymentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderFrm, cxLookAndFeelPainters, QueryList, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxButtons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit, cxDBEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, cxCheckBox, cxGraphics, Menus, OracleData,
  cxGroupBox, CashOrderFrm;

type
  TAggrPaymentForm = class(TCashOrderForm)
    cxTabSheet1: TcxTabSheet;
    procedure cxTabSheet1Show(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    fcashorder: TForm;
  protected
    procedure HandleRefresh; override;
    function GetVisibleConfirmTab: boolean; override;
    procedure DoActivate; override;
  public
  end;

implementation

uses FormUtils, fdcCustomObjectGridFrm;
{$R *.dfm}

procedure TAggrPaymentForm.cxTabSheet1Show(Sender: TObject);
var
  AParams: TfdcParams;
begin
  inherited;
  if FCashorder = nil then
  begin
    AParams := TfdcParams.Create(nil);
    try
      AParams.FillBy(Params);
      with TfdcParam(AParams.Add) do
        begin
          Name  := 'CURRENCY_ID';
          Value := dsDataCURRENCY_ID.Value;
        end;
      with TfdcParam(AParams.Add) do
        begin
          Name  := 'KBK';
          Value := dsDataKBK.Value;
        end;
      ShowTabForm(fcashorder,'TCashOrderGridForm',aparams,TWinControl(sender),Self);
      TfdcCustomObjectGridForm(fcashorder).actDelete.Visible := dsDataSUMMA.IsNull;
    finally
       AParams.Free;
    end;
  end;
end;

procedure TAggrPaymentForm.HandleRefresh;
begin
  inherited;
  RefreshWaiters;
end;

procedure TAggrPaymentForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
    dsDataDoc_No.Value := '-';

  tabDeduction.TabVisible := False;
  tabLock.TabVisible      := False;
  tabPayFor.TabVisible    := False;
  tabDocPack.TabVisible   := False;
  if Assigned(fcashorder) then
    TfdcCustomObjectGridForm(fcashorder).actDelete.Visible := dsDataSUMMA.IsNull;
end;

function TAggrPaymentForm.GetVisibleConfirmTab: boolean;
begin
  Result := True;
end;

procedure TAggrPaymentForm.DoActivate;
begin
  ;
end;

procedure TAggrPaymentForm.FormShow(Sender: TObject);
begin
  inherited;
  tabRest.TabVisible := False;
end;

initialization
  RegisterClass(TAggrPaymentForm);

end.
