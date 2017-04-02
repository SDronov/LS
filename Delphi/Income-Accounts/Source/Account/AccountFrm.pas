{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 270 $
  $Author: alexvolo $
  $Date: 2005-11-02 10:54:11 +0400 (Ср, 02 ноя 2005) $
}
unit AccountFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit;

type
  TAccountForm = class(TObjectForm)
    dsDataOPEN_DATE: TDateTimeField;
    dsDataLAST_DATE: TDateTimeField;
    dsDataCLOSE_DATE: TDateTimeField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCUR_NAME: TStringField;
    dsDataSALDO: TFloatField;
    dsDataDEBET_TURNOVER: TFloatField;
    dsDataCREDIT_TURNOVER: TFloatField;
    dsDataOWNER_NAME: TStringField;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    fdcObjectLinkEdit2: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem4: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcGeneralItem5: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem6: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem7: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    cxDBDateEdit3: TcxDBDateEdit;
    lcGeneralItem8: TdxLayoutItem;
    dsDataSUBJECT_ID: TFloatField;
    cxTabSheet1: TcxTabSheet;
    procedure cxTabSheet1Show(Sender: TObject);
  private
    { Private declarations }
    FAccEntry: TForm;
  public
    { Public declarations }
  end;

var
  AccountForm: TAccountForm;

implementation

uses MainDm, fdcCustomObjectFrm;

{$R *.dfm}

procedure TAccountForm.cxTabSheet1Show(Sender: TObject);
begin
  inherited;
  if not Assigned(FAccEntry) then
      FAccEntry := ShowForm('TAccountEntryGridForm', Params, TWinControl(Sender));
end;

initialization
    RegisterClass(TAccountForm);
end.
