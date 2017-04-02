{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12218 $
  $Author: sbakum $
  $Date: 2011-01-14 10:30:22 +0400 (Пт, 14 янв 2011) $
}
unit CurrencyFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls;

type
  TNSICurrencyForm = class(TObjectForm)
    dsDataCODE: TStringField;
    dsDataACODE: TStringField;
    dsDataOLD_CODE: TStringField;
    edtCode: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtACode: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    edtOldCode: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    tabRate: TcxTabSheet;
    procedure tabRateShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRateGridForm: TForm;
  public
    { Public declarations }
  end;

implementation

uses MainDm;

{$R *.dfm}

procedure TNSICurrencyForm.tabRateShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FRateGridForm) then
     FRateGridForm := ShowForm('TNSICurrRateGridForm', Params, tabRate);
end;

procedure TNSICurrencyForm.actNewExecute(Sender: TObject);
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

procedure TNSICurrencyForm.actDeleteExecute(Sender: TObject);
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

procedure TNSICurrencyForm.actSaveExecute(Sender: TObject);
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

procedure TNSICurrencyForm.FormShow(Sender: TObject);
begin
  inherited;
  dxLayoutGroup1.Enabled := MainData.AccessModifyNSI;
end;

initialization
   RegisterClass(TNSICurrencyForm);

end.
