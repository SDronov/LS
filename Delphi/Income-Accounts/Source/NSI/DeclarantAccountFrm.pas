{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1544 $
  $Author: alexvolo $
  $Date: 2006-04-20 20:15:17 +0400 (Р§С‚, 20 Р°РїСЂ 2006) $
}

unit DeclarantAccountFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer, ObjectFrm,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxGroupBox, cxRadioGroup,
  cxMaskEdit, cxButtonEdit;

type
  TDeclarantAccountForm = class(TObjectForm)
    dxLayoutControl1: TdxLayoutControl;
    edtPayAccount: TcxDBMaskEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtCorrAccount: TcxDBMaskEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsDataDECLARANT_ID: TFloatField;
    dsDataACCOUNT_CURR_TYPE: TIntegerField;
    dsDataBANK_OKPO: TStringField;
    dsDataPAY_ACCOUNT: TStringField;
    dsDataCORR_ACCOUNT: TStringField;
    rgAccountType: TcxDBRadioGroup;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dsCheckAcc: TfdcQuery;
    edtBankOKPO: TcxDBButtonEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsCheckAcc2: TfdcQuery;
    procedure dsDataValidate(Sender: TField);
    procedure DataChange(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
  private
    procedure CheckAccount(Sender: TField);
  end;

var
  DeclarantAccountForm: TDeclarantAccountForm;

implementation

uses
  CheckUtils, Math, StrUtils, IaccUtils, fdcDbUtils;

{$R *.dfm}

procedure TDeclarantAccountForm.dsDataValidate(Sender: TField);
begin
  with Sender do
    if SameText(FieldName, 'bank_okpo') then
    begin
      if Trim(Text) <> '' then
      begin
        if Length(Text) <> 8 then
          raise Exception.Create('ОКПО банка должно состоять из 8 цифр');
        if not cReqCheckFuncs[Tag](Text) then
          raise Exception.Create('ОКПО банка: неправильная контрольная сумма');
      end;
    end
    else
      CheckAccount(Sender);
end;

procedure TDeclarantAccountForm.CheckAccount(Sender: TField);
var
  I: Integer;
  Acc: string;
type
  TAccCheckFunc = function(const Value, BIC: string): Boolean;
const
  cAccCheckFunc: array [0..1] of TAccCheckFunc = (IsRSValid, IsKSValid);
begin
  inherited;

  I := Length(VarToStr(dsData[Sender.FieldName]));
  if I > 0 then
  try
    if I <> 20 then // CheckKS/RS also checks 20-symb length
      raise Exception.Create(Sender.DisplayName + ' должен состоять из 20 цифр');

    dsCheckAcc2.ParamByName('acc').AsString := dsData[Sender.FieldName];
    dsCheckAcc2.Open;
    if dsCheckAcc2.Eof then
      raise Exception.Create(Sender.DisplayName + ': неизвестная валюта');
  finally
    dsCheckAcc2.Close;
  end;

  if VarToStr(dsData['Bank_Okpo']) <> '' then
    try
      // todo: dblookupcombo 4 banks ?
      dsCheckAcc.ParamByName('okpo').Value := dsData['Bank_Okpo'];
      dsCheckAcc.Open;
      if not dsCheckAcc.Eof then
      begin
        Acc := VarToStr(dsData[Sender.FieldName]);
        if (Acc <> '') and not cAccCheckFunc[IfThen(SameText(Sender.FieldName, 'pay_account'), 0, 1)](Acc, dsCheckAcc['BIC']) then
          raise Exception.Create(Sender.DisplayName + ': не верна контрольная сумма');
      end;
    finally
      dsCheckAcc.Close;
    end;

  dsInsert.ParamByName('Decl_ID').AsFloat := Params.ParamByName('Decl_ID').AsFloat;
end;

procedure TDeclarantAccountForm.DataChange(Sender: TObject);
begin
  Modified := True;
end;

procedure TDeclarantAccountForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
  if rgAccountType.ItemIndex < 0 then
  begin
    rgAccountType.SetFocus;
    raise Exception.Create('Не задан вид валюты счета');
  end;
end;

procedure TDeclarantAccountForm.actSaveExecute(Sender: TObject);
begin
  dsInsert.ParamByName('Decl_ID').AsFloat := Params.ParamByName('Decl_ID').AsFloat;
  try
    inherited;
  except on e: exception do begin
    if (UpperCase(copy(e.Message,1,9)) = 'ORA-00001') then
      e.Message := 'Данный счет уже существует';
    raise;
  end end;
end;

initialization
  RegisterClass(TDeclarantAccountForm);

end.
