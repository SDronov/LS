unit GoodsChargeCorrectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxMemo,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DB,
  FDCCustomDataset, fdcQuery, Math, cxCurrencyEdit, QueryList;

type
  TGoodsChargeCorrectForm = class(TfdcCustomSimpleDlgForm)
    dsData: TfdcQuery;
    srcData: TDataSource;
    dsDataSUMMA: TFloatField;
    edtDesc: TcxMemo;
    edtDate: TcxDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsDataDELTA: TFloatField;
    dsDataOLD_SUMMA: TFloatField;
    edtDelta: TcxDBCurrencyEdit;
    edtSumma: TcxDBCurrencyEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Item4: TdxLayoutItem;
    QueryList1: TQueryList;
    sqlModifyCharge: TsqlOp;
    dsDataDECL_GOODS_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataPAY_MODE_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure edtSummaPropertiesChange(Sender: TObject);
    procedure edtDeltaPropertiesChange(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure edtSummaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edtDeltaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
  public
  end;

  function CorrectGoodsCharge(ChargeId: Double): Boolean;

implementation

{$R *.dfm}

function CorrectGoodsCharge(ChargeId: Double): Boolean;
var
  F: TGoodsChargeCorrectForm;
begin
  F := TGoodsChargeCorrectForm.Create(nil);
  try
    F.dsData.ParamByName('ID').Value := ChargeId;
    F.dsData.Open;
    F.dsData.Edit;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TGoodsChargeCorrectForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtDate.Date := Now;
end;

procedure TGoodsChargeCorrectForm.edtSummaPropertiesChange(
  Sender: TObject);
var
  EditValue: Variant;
begin
  inherited;
  try
    if edtSumma.Focused then
    begin
       edtSumma.PrepareEditValue(edtSumma.Text, EditValue, True);
       if VarIsNull(EditValue) then
                 dsDataDELTA.Clear
      else  dsDataDELTA.AsCurrency :=  RoundTo(EditValue, -2)  - dsDataOLD_SUMMA.AsCurrency;
    end;
  except
    dsDataDELTA.Clear;
  end;
end;

procedure TGoodsChargeCorrectForm.edtDeltaPropertiesChange(
  Sender: TObject);
var
  EditValue: Variant;
begin
  inherited;
  try
    if edtDelta.Focused then
    begin
       edtDelta.PrepareEditValue(edtDelta.Text, EditValue, True);
       if VarIsNull(EditValue) then
                 dsDataSUMMA.AsCurrency := dsDataOLD_SUMMA.AsCurrency
      else dsDataSUMMA.AsCurrency :=  RoundTo(EditValue, -2) + dsDataOLD_SUMMA.AsCurrency;
    end;
  except
    dsDataDELTA.Clear;
  end;
end;

procedure TGoodsChargeCorrectForm.actOkExecute(Sender: TObject);
begin
  inherited;
  try
    dsData.Post;
    sqlModifyCharge.Exec('change_desc;change_date', [edtDesc.Lines.Text, edtDate.EditValue]);
    sqlModifyCharge.QueryList.Session.Commit;
  except
    sqlModifyCharge.QueryList.Session.Rollback;
    ModalResult := mrNone;
    raise;
  end;
  ModalResult := mrOk;
end;

procedure TGoodsChargeCorrectForm.edtSummaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue<=0 then
    begin
    ErrorText:= 'Сумма товара должна быть положительной';
    Error:= True;
    end;
end;

procedure TGoodsChargeCorrectForm.edtDeltaPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if dsDataSUMMA.Value<=0 then
    begin
    ErrorText:= 'Сумма товара должна быть положительной';
    Error:= True;
    end;
end;

end.
