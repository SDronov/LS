unit CashOrderFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PaymentOrderFrm, cxLookAndFeelPainters, QueryList, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxButtons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit, cxDBEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxCalendar, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, cxGraphics, Menus, cxCheckBox, OracleData,
  cxGroupBox, PaymentOrderCreditFrm;

type
  TCashOrderForm = class(TPaymentOrderCreditForm)
    edtCashDesk: TfdcObjectLinkEdit;
    lcGeneralItem13: TdxLayoutItem;
    dsDataCASHDESK_ID: TFloatField;
    dsDataCASHDESK_NAME: TStringField;
    sqlGetBank: TsqlOp;
    dsetInAggrOrder: TOracleDataSet;
    actAggrPayment: TAction;
    barBtnAggrPayment: TdxBarButton;
    sqlActivate: TsqlOp;
    procedure dsDataCASHDESK_IDChange(Sender: TField);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actLinkUpdate(Sender: TObject);
    procedure actAggrPaymentUpdate(Sender: TObject);
    procedure actAggrPaymentExecute(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
  private
    FSubjINN : string;
    FSubjKPP : string;
    FSubjName: string;
    procedure ExecuteGetBank;
    function GetRatio: string;
  protected
    function GetVisibleConfirmTab: boolean; Virtual;
    procedure DoActivate; virtual;
  public
    { Public declarations }
    function GetSubjectINN: String; override ;
    function GetSubjectKPP: String; override ;
    function GetSubjectName: String; override ;
  end;

var
  CashOrderForm: TCashOrderForm;

implementation

uses
  fdcCustomObjectFrm
 ,MainDm
 ,DictDM
 ,fdcUtils, fdcCustomDBDataFrm, fdcCustomCardFrm;

{$R *.dfm}

function TCashOrderForm.GetSubjectINN: String;
begin
  Result := FSubjINN;
end;

function TCashOrderForm.GetSubjectKPP: String;
begin
  Result := FSubjKPP;
end;

function TCashOrderForm.GetSubjectName: String;
begin
  Result := FSubjName;
end;

function TCashOrderForm.GetRatio: string;
begin
  Result := sqlGetBank.ParamValues['pRatio'];
end;

procedure TCashOrderForm.ExecuteGetBank;
begin
  sqlGetBank.ParamValues['pId'] := dsData.FieldValues['CASHDESK_ID'];
  sqlGetBank.Exec;
  FSubjINN  := sqlGetBank.ParamValues['pBankInn'];
  FSubjKPP  := sqlGetBank.ParamValues['pBankKpp'];
  FSubjName := sqlGetBank.ParamValues['pBankName'];
end;

procedure TCashOrderForm.dsDataCASHDESK_IDChange(Sender: TField);
begin
  inherited;
  ExecuteGetBank;
end;

procedure TCashOrderForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ExecuteGetBank;
  tabConfirmation.TabVisible := GetVisibleConfirmTab;

  if not IsNew then
    begin
      dsetInAggrOrder.SetVariable( 'id', DataSet.FieldByName( 'id' ).AsFloat );
      if dsetInAggrOrder.Active then
        dsetInAggrOrder.Refresh
      else
        dsetInAggrOrder.Open;

      if not dsetInAggrOrder.IsEmpty then
        actAggrPayment.Caption := 'Суммарный платёж: ' + dsetInAggrOrder.FieldByName( 'ObjName' ).AsString;
    end
  else // IsNew
    begin
      dsDataRECIPIENT_ID.Value   := MainData.GetCustomsID;
      dsDataRECIPIENT_NAME.Value := MainData.GetSystemValue('CustomsName', rvString);
      dsDataRECIPIENT_INN.Value  := MainData.GetSystemValue('CustomINN', rvString);
      dsDataRECIPIENT_KPP.Value  := MainData.GetSystemValue('CustomKPP', rvString);
      dsDataCURRENCY_ID.Value    := DictData.dsCurrency.Lookup( 'CODE', '643', 'ID' );
    end;
end;

function TCashOrderForm.GetVisibleConfirmTab: boolean;
const
  cRatio_1T1 = '1T1';
begin
  Result := (getRatio = cRatio_1T1);
end;

procedure TCashOrderForm.actLinkUpdate(Sender: TObject);
begin
  (Sender as TAction).Visible := not IsNew
                             and dsDataSUMMA.IsNull
                             and dsetInAggrOrder.Active
                             and dsetInAggrOrder.IsEmpty;
end;

procedure TCashOrderForm.actAggrPaymentUpdate(Sender: TObject);
begin
  (Sender as TAction).Visible := not IsNew
                             and dsetInAggrOrder.Active
                             and not dsetInAggrOrder.IsEmpty;
end;

procedure TCashOrderForm.actAggrPaymentExecute(Sender: TObject);
begin
  if     dsetInAggrOrder.Active
     and not dsetInAggrOrder.IsEmpty then
    ObjectServices.OpenObject( dsetInAggrOrder.FieldByName( 'object_id' ).AsFloat, nil );
end;

procedure TCashOrderForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'currency_id' ).AsFloat := DictData.dsCurrency.Lookup( 'code', '643', 'id' );
end;

procedure TCashOrderForm.actSaveExecute(Sender: TObject);
begin
  inherited;

  DoActivate;
end;

procedure TCashOrderForm.DoActivate;
begin
  if dsData.FieldByName( 'is_active' ).AsString <> 'Y' then
    begin
      sqlActivate.Exec;

      RefreshData;
    end;
end;

initialization
  RegisterClass(TCashOrderForm);

end.
