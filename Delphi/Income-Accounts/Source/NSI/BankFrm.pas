{
  Copyright ɠFors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12736 $
  $Author: rrykunov $
  $Date: 2011-03-16 15:14:31 +0400 (Ср, 16 мар 2011) $
}
unit BankFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TBankForm = class(TSubjectForm)
    dsDataRUR_LIC_DATE: TDateTimeField;
    dsDataVAL_LIC_DATE: TDateTimeField;
    dsDataCHIEF_NAME: TStringField;
    dsDataCHIEF_ACC_NAME: TStringField;
    dsDataBIC: TStringField;
    dsDataCORR_ACCOUNT: TStringField;
    lcMainGroup1: TdxLayoutGroup;
    lcMainItem1: TdxLayoutItem;
    edtBIC: TcxDBMaskEdit;
    lcMainItem3: TdxLayoutItem;
    edtRurLicDate: TcxDBDateEdit;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainItem4: TdxLayoutItem;
    edtValLicDate: TcxDBDateEdit;
    lcMainItem5: TdxLayoutItem;
    edtChiefName: TcxDBTextEdit;
    lcMainItem6: TdxLayoutItem;
    edtChiefAccName: TcxDBTextEdit;
    lcMainItem7: TdxLayoutItem;
    edtCorrAcount: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
  end;

var
  BankForm: TBankForm;

implementation

uses
  MainDm, IaccUtils;

{$R *.dfm}

procedure TBankForm.FormShow(Sender: TObject);
var
  MinHeight: Integer;
  MinWidth: Integer;
begin
  inherited;
  MinHeight := ClientHeight - lcMain.Height + lcMain.ViewInfo.ContentHeight;
  MinWidth := ClientWidth - lcMain.Width + lcMain.ViewInfo.ContentWidth;
  ClientHeight := MinHeight;
  ClientWidth := MinWidth;
  tabBroker.TabVisible := True;
end;

initialization
   RegisterClass(TBankForm);

end.
