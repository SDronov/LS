unit RManPaymentOrderGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCurrencyEdit, PaymentOrderGridFrm, cxCalc, QueryList,
  cxMemo, cxDropDownEdit, cxCalendar, fdcObjectCore, cxCheckBox;

type
  TRManPaymentOrderGridForm = class(TPaymentOrderGridForm)
    sqlAddPaymentOrder: TsqlOp;
    sqlDelPaymentOrder: TsqlOp;
    dsDataRELATION_ID: TFloatField;
    procedure actAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
  protected
    procedure DoDeleteObject; override;
  public
  end;

implementation
uses
  SelectPOWizardFrm;

{$R *.dfm}

procedure SetParamValue(Params: TParams; const AParamName: string; const AValue: Variant);
var
  AParam: TParam;
begin
  AParam := Params.FindParam(AParamName);
  if AParam = nil then
  begin
    AParam := TParam(Params.Add);
    AParam.Name := AParamName;
  end;
  AParam.Value := AValue;
end;

procedure TRManPaymentOrderGridForm.actAddExecute(Sender: TObject);
var
  AParams : TfdcParams;
begin
{  AParams := TfdcParams.Create(nil);

  SetParamValue(AParams, 'GL_SUBJECT_ID', Params.ParamValues['SUBJECT_ID']);

  ObjectServices.SearchObject('TPaymentOrderGridForm', 'PaymentOrder', 0, AParams, nil, True, OnSearchFinished);
  AParams.Free;}

end;

procedure TRManPaymentOrderGridForm.OnSearchFinished(const ADragObject: TfdcDragObject);
var
  i : Integer;
begin
  try
    for i := 0 to ADragObject.Objects.Count - 1 do
      sqlAddPaymentOrder.Exec('RMAN_ID;PO_ID', [Params.ParamValues['ID'], ADragObject.Objects[i].ID]);
    qlPOG.Session.Commit;
    RefreshData;
    RefreshWaiters;
  except
    qlPOG.Session.Rollback;
    raise;
  end;
end;

procedure TRManPaymentOrderGridForm.FormShow(Sender: TObject);
begin
  inherited;
  cmbxViewMode.Visible := ivNever;
end;

procedure TRManPaymentOrderGridForm.DoDeleteObject;
begin
  try
    sqlDelPaymentOrder.Exec();
    qlPOG.Session.Commit;
  except
    qlPOG.Session.Rollback;
    raise;
  end;
end;

initialization
  RegisterClass(TRManPaymentOrderGridForm);

end.
