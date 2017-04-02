unit PeriodicChargeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, cxGraphics, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxMaskEdit, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxMemo, cxTextEdit, cxPC, cxControls, cxCurrencyEdit;

type
  TPeriodicChargeForm = class(TObjectForm)
    lcGeneralItem1: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtPaymentName: TfdcObjectLinkEdit;
    dsDataPAYMENT_NAME: TStringField;
    dsDataMONTH_SUMMA: TFloatField;
    dsDataCURRENCY_ID: TIntegerField;
    dsDataDECL_ID: TIntegerField;
    dsDataDECL_NO: TStringField;
    dsDataPAY_TYPE_ID: TIntegerField;
    lcGeneralItem2: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    lcGeneralGroup1: TdxLayoutGroup;
    dsCheckCurrency: TfdcQuery;
    dsCheckCurrencyINIT_CURRENCY_ID: TIntegerField;
    lcGeneralItem4: TdxLayoutItem;
    cmbxPayType: TfdcObjectLookupEdit;
    lciKBK: TdxLayoutItem;
    cmbxKBK: TfdcObjectLookupEdit;
    dsDataKBK_CODE_ID: TFloatField;
    dsKBK: TfdcQuery;
    srcKBK: TDataSource;
    procedure dsDataNewRecord(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure cmbxPayTypePropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    IsFirstRun: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PeriodicChargeForm: TPeriodicChargeForm;


implementation

uses DictDm;

{$R *.dfm}
procedure TPeriodicChargeForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsDataDECL_ID.Value := Params.ParamValues['DECL_ID'];
  dsDataDECL_NO.Value := Params.ParamValues['DECL_NO'];
end;

procedure TPeriodicChargeForm.FormActivate(Sender: TObject);
begin
  inherited;
  dsCheckCurrency.Open;
  if not (dsCheckCurrency.Eof) then begin
    if (not dsCheckCurrencyINIT_CURRENCY_ID.IsNull) then begin
      dsDataCURRENCY_ID.Value := dsCheckCurrencyINIT_CURRENCY_ID.Value;
      cmbxedtCurrID.Enabled := False;
    end;
  end;
end;

procedure TPeriodicChargeForm.cmbxPayTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cmbxKBK.Properties.BeginUpdate;
  dsKBK.Close;
  dsKBK.ParamByName('PAY_TYPE_ID').Value := cmbxPayType.EditValue;
  dsKBK.Open;
  if not IsFirstRun or dsDataKBK_CODE_ID.IsNull then
    if not dsKBK.Eof then
      dsDataKBK_CODE_ID.Value := dsKBK.FieldValues['ID']
    else
      dsDataKBK_CODE_ID.Clear;
  cmbxKBK.Properties.EndUpdate(True);
  IsFirstRun := False;
end;

procedure TPeriodicChargeForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsFirstRun := True;
end;

initialization
  RegisterClass(TPeriodicChargeForm);

end.
