unit AddLChargeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, DB, dxmdaset, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, cxCurrencyEdit, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls, cxButtons,
  cxControls, fdcParamsHolder, QueryList;

type
  TAddLChargeForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    cmbxPayType: TfdcObjectLookupEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtPaymentOrder: TfdcObjectLinkEdit;
    dsData: TdxMemData;
    dsDataSUMMA: TCurrencyField;
    srcData: TDataSource;
    dsDataPO_ID: TFloatField;
    dsDataPO_NAME: TStringField;
    dsDataPAYTYPE_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    Params: TfdcParamsHolder;
    dsDataDECL_ID: TFloatField;
    QueryList1: TQueryList;
    sqlAddLPay: TsqlOp;
    dsDataGOODS_CODE: TStringField;
    cxDBMaskEdit1: TcxDBMaskEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure dsDataCURRENCY_IDValidate(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    function AutoSaveLayout: Boolean; override;
    { Public declarations }
  end;

var
  AddLChargeForm: TAddLChargeForm;

implementation

uses DictDm, fdcObjectServices, fdcObjectCore;

{$R *.dfm}

procedure TAddLChargeForm.FormCreate(Sender: TObject);
var
  Param: TParam;
begin
  inherited;
  dsData.Active := True;
  edtPaymentOrder.ParamsHolder :=  Params;
  Param := TParam(edtPaymentOrder.ParamsHolder.Params.Add);
  Param.Name := 'NA';
  Param.Value := 3;
  Param := TParam(edtPaymentOrder.ParamsHolder.Params.Add);
  Param.Name := 'CURRENCY_ID';
  edtPaymentOrder.ObjectServices := GetObjectServices;
end;

procedure TAddLChargeForm.dsDataCURRENCY_IDValidate(Sender: TField);
begin
  inherited;
  edtPaymentOrder.ParamsHolder.Params.FindParam('CURRENCY_ID').Value := dsDataCURRENCY_ID.Value;
  dsDataPO_ID.Clear;
  dsDataPO_NAME.Clear;
end;

procedure TAddLChargeForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
end;

function TAddLChargeForm.AutoSaveLayout: Boolean;
begin
  Result := False;
end;

procedure TAddLChargeForm.actOkExecute(Sender: TObject);
begin
  dsData.CheckBrowseMode;
  sqlAddLPay.Exec;
  ModalResult := mrOk;
end;

end.
