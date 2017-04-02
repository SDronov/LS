unit SelectPOFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, cxLookAndFeelPainters, cxCurrencyEdit,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookAndFeels, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, ExtCtrls, cxControls, fdcObjectServices, fdcObjectCore,
  Menus, cxGraphics, DB, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, dxmdaset, cxDBEdit,
  fdcObjectLinkEdit, QueryList, fdcParamsHolder, fdcMessages;
  
type
  TSelectPOForm = class(TfdcCustomSimpleDlgForm)
    dsData: TdxMemData;
    dsDataNEED_SUMM: TCurrencyField;
    dsDataPO_ID: TFloatField;
    dsDataPO_REST: TCurrencyField;
    dsDataPO_CURR_ID: TFloatField;
    dsDataSUMM_CURR_ID: TFloatField;
    dsDataRATE: TFloatField;
    dsDataTOTAL_PO_SUMM: TCurrencyField;
    dsDataSUMMA: TCurrencyField;
    dxLayoutControl1Item6: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    srcData: TDataSource;
    dxLayoutControl1Item9: TdxLayoutItem;
    fdcObjectLookupEdit2: TfdcObjectLookupEdit;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dxLayoutControl1Item12: TdxLayoutItem;
    fdcObjectLookupEdit3: TfdcObjectLookupEdit;
    dxLayoutControl1Item13: TdxLayoutItem;
    dsDataPO_NAME: TStringField;
    Params: TfdcParamsHolder;
    edtPaySumma: TcxDBCurrencyEdit;
    dxLayoutControl1Item14: TdxLayoutItem;
    dxLayoutControl1Item15: TdxLayoutItem;
    edtChargeSumma: TcxDBCurrencyEdit;
    dxLayoutControl1Item16: TdxLayoutItem;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    dxLayoutControl1Item17: TdxLayoutItem;
    cxDBCurrencyEdit4: TcxDBCurrencyEdit;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Group4: TdxLayoutGroup;
    dxLayoutControl1Group6: TdxLayoutGroup;
    dxLayoutControl1Group5: TdxLayoutGroup;
    dsDataCHARGE_SUMMA: TCurrencyField;
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    dsDataPAYER_NAME: TStringField;
    dsDataSUBJECT_ID: TIntegerField;
    cxDBTextEdit2: TcxDBTextEdit;
    dsDataKBK_ID: TFloatField;
    procedure actOkUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPaySummaPropertiesChange(Sender: TObject);
    procedure edtChargeSummaPropertiesChange(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
    FMinSumma: Currency;
    FFlag: Integer;
  public
    { Public declarations }
    function AutoSaveLayout: Boolean; override;
  end;

function EditPaymentOrder(P: TFdcParams; const CurrId: Double; const MaxSum: Currency; const MinSum: Currency = 0.01; const Flag: Integer = 0): Boolean;


implementation

uses
  Math, DictDm, MainDm;

{$R *.dfm}

procedure Synchronize(edt1: TcxDBCurrencyEdit; Field: TFloatField; Rate: double);
var
  EditValue: Variant;
begin
   edt1.PrepareEditValue(edt1.Text, EditValue, edt1.Focused);
   Field.DataSet.Edit;
   if VarIsNull(EditValue) then
             Field.Clear
    else  Field.AsCurrency :=  SimpleRoundTo(EditValue * Rate, -2);
end;

function EditPaymentOrder(P: TFdcParams; const CurrId: Double; const MaxSum: Currency; const MinSum: Currency = 0.01; const Flag: Integer = 0): Boolean;
var
  F: TSelectPOForm;
begin
  Result := False;
  F := TSelectPOForm.Create(nil);
  try
    F.FMinSumma := MinSum;
    F.dsData.Active := True;
    F.dsData.Insert;
    F.dsData['PO_NAME;RATE;PO_ID;PO_REST_SUMM;PO_CURR_ID;SUMMA;CHARGE_SUMMA;PAYER_NAME;KBK_ID'] :=
      P.ParamValues['NAME;RATE;ID;REST_SUMM;CURR_ID;CURR_SUMMA;SUMMA;PAYER_NAME;KBK_ID'];
    F.dsDataNEED_SUMM.Value := MaxSum;
    F.dsDataSUMM_CURR_ID.Value := CurrId;
    F.FFlag := Flag;

    if F.ShowModal = mrOk then begin
      P.Clear;
      P.FillBy(F.dsData);
      Result := True;
    end;
  finally // wrap up
    F.Free;
  end;    // try/finally
end;


procedure TSelectPOForm.actOkUpdate(Sender: TObject);
var
  Summa: Variant;
  Charge: Variant;
begin
  try
   edtPaySumma.PrepareEditValue(edtPaySumma.Text, Summa, edtPaySumma.Focused);
   edtChargeSumma.PrepareEditValue(edtChargeSumma.Text, Charge, edtChargeSumma.Focused);

//    dsData.UpdateRecord;
    TAction(Sender).Enabled := ({dsDataCHARGE_SUMMA.AsCurrency} Charge >= FMinSumma) and ({dsDataCHARGE_SUMMA.AsCurrency} Charge <= dsDataNEED_SUMM.AsCurrency)
        and ({dsDataSUMMA.AsCurrency} Summa <= dsDataPO_REST.AsCurrency);
  except
    TAction(Sender).Enabled := False;
  end;
end;

procedure TSelectPOForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight + 14 * 2;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
end;

procedure TSelectPOForm.edtPaySummaPropertiesChange(Sender: TObject);
begin
  inherited;
  if edtPaySumma.Focused then
    if dsDataRATE.Value > 0 then
      Synchronize(edtPaySumma, dsDataCHARGE_SUMMA, dsDataRATE.Value);
end;

procedure TSelectPOForm.edtChargeSummaPropertiesChange(Sender: TObject);
begin
  inherited;
  if edtChargeSumma.Focused then
    if dsDataRATE.Value > 0 then
      Synchronize(edtChargeSumma, dsDataSUMMA, 1 / dsDataRATE.Value);
end;

function TSelectPOForm.AutoSaveLayout: Boolean;
begin
  Result := False;
end;

procedure TSelectPOForm.actOkExecute(Sender: TObject);
begin
  if Self.FFlag = 1 then
  begin
    if WarningDlg(
    'ѕодтвердите погашение задолженности',
    '¬ы пытаетесь зачесть ввозную таможенную пошлину или специальную или антидемпинговую или ' +
    'компенсационную пошлину в счет погашени€ задолженности. ¬ы уверены, что эту ' +
    'задолженность разрешено погасить?'
    ) = mrNo then
    begin
      ModalResult := mrCancel;
      Exit;
    end;
  end;

  dsData.CheckBrowseMode;
  ModalResult := mrOk;
end;

end.
