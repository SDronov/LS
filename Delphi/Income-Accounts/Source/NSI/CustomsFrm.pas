{
  Copyright Й Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15717 $
  $Author: sbakum $
  $Date: 2012-11-20 11:11:29 +0400 (Р’С‚, 20 РЅРѕСЏ 2012) $
}

unit CustomsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TCustomsForm = class(TSubjectForm)
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataDT_START: TDateTimeField;
    dsDataTTT: TStringField;
    dsDataCERT_SUBJECT: TStringField;
    dsDataSYSCRYPTO: TStringField;
    lcMainGroup1: TdxLayoutGroup;
    lcMainItem1: TdxLayoutItem;
    edCustomsCode: TcxDBMaskEdit;
    lcMainItem2: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    edtTTT: TcxDBTextEdit;
    lcMainGroup2: TdxLayoutGroup;
    lcMainItem5: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem6: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    dsDataDT_END: TDateTimeField;
    Label1: TLabel;
    lcMainItem4: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcMainItem7: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcMainItem8: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    dsDataTZONE: TIntegerField;
    lciedtTzone: TdxLayoutItem;
    edtTzone: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure cxDBEditPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataValidate(Sender: TField);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  end;

var
  CustomsForm: TCustomsForm;

implementation

uses
  IaccUtils, MainDm, fdcCustomFrm, fdcCustomObjectFrm;

{$R *.dfm}

procedure TCustomsForm.FormCreate(Sender: TObject);
begin
  SetDefaultParamTypes([dsInsert.Params, dsUpdate.Params]);
  inherited;
  Modified := False;
end;

procedure TCustomsForm.cxDBEditPropertiesChange(Sender: TObject);
begin
  Modified := True;
end;

procedure TCustomsForm.FormShow(Sender: TObject);
begin
  inherited;
  edCustomsCode.SetFocus;
  if not(MainData.AccessModifyNSI) then
    begin
      edtOGRN.Properties.ReadOnly := True;
      edtOKPO.Properties.ReadOnly := True;
      edtINN.Properties.ReadOnly := True;
      edtKPP.Properties.ReadOnly := True;
      edtSOATO.Properties.ReadOnly := True;
      cxDBTextEdit1.Properties.ReadOnly := True;
      cxDBTextEdit3.Properties.ReadOnly := True;
      edtAddress.Properties.ReadOnly := True;
      edtPhone.Properties.ReadOnly := True;
      edtFax.Properties.ReadOnly := True;
      edtTelex.Properties.ReadOnly := True;
      edtTeletype.Properties.ReadOnly := True;
      edtTeleGraph.Properties.ReadOnly := True;
      edCustomsCode.Properties.ReadOnly := True;
      edtTTT.Properties.ReadOnly := True;
    end;
end;

procedure TCustomsForm.dsDataValidate(Sender: TField);
begin
  inherited;
  if AnsiSameText(Sender.FieldName, 'CUSTOMS_CODE') and (Trim(Sender.Text) <> '')
    and (Length(Sender.Text) <> 5) then
      raise Exception.Create('Код таможни должен состоять из 5 символов');
end;

procedure TCustomsForm.actNewExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TCustomsForm.actDeleteExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

initialization
  RegisterClass(TCustomsForm);

end.
