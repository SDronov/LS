{
  Copyright c Fors Development Center.
  All rights reserved.                                    

  $Source$
  $Revision: 12254 $
  $Author: anaumenkov $
  $Date: 2011-01-18 22:32:29 +0400 (Вт, 18 янв 2011) $
}

unit PaymentTypeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TPaymentTypeForm = class(TNSIDictForm)
    cmbxKBK: TcxDBLookupComboBox;
    lcGeneralItem8: TdxLayoutItem;
    dsKBK: TfdcQuery;
    StringField1: TStringField;
    StringField7: TStringField;
    srcKBK: TDataSource;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
  public
  end;

var
  PaymentTypeForm: TPaymentTypeForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TPaymentTypeForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsKBK.Open;
end;

procedure TPaymentTypeForm.actNewExecute(Sender: TObject);
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

procedure TPaymentTypeForm.actDeleteExecute(Sender: TObject);
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

procedure TPaymentTypeForm.actSaveExecute(Sender: TObject);
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
  RegisterClass(TPaymentTypeForm);

end.
