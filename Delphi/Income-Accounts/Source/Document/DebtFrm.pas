{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12026 $
  $Author: anaumenkov $
  $Date: 2010-12-15 23:06:35 +0400 (Ср, 15 дек 2010) $
}
unit DebtFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxGraphics;

type
  TDebtForm = class(TObjectForm)
    edtPaymentName: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtSumma: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    lcGeneralItem3: TdxLayoutItem;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    edtDeclNo: TfdcObjectLinkEdit;
    lcGeneralItem4: TdxLayoutItem;
    dsDataDECL_NO: TStringField;
    lcGeneralGroup1: TdxLayoutGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DebtForm: TDebtForm;

implementation

uses MainDm, DictDm;

{$R *.dfm}

initialization
   RegisterClass(TDebtForm);

end.
