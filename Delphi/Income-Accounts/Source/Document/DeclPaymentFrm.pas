{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1998 $
  $Author: alexvolo $
  $Date: 2006-10-25 18:30:46 +0400 (Ср, 25 окт 2006) $
}
unit DeclPaymentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, fdcObjectCore;

type
  TPaymentDeduction1Form = class(TObjectForm)
  end;

  TPaymentDeductionForm = class(TObjectForm)
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataPAYER_INN: TStringField;
    dsDataPAYER_NAME: TStringField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    lcGeneralGroup1: TdxLayoutGroup;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem4: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    fdcObjectLinkEdit2: TfdcObjectLinkEdit;
    lcGeneralItem7: TdxLayoutItem;
    dsDataPAYMENT_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    edtPayer: TfdcObjectLinkEdit;
    lcGeneralItem8: TdxLayoutItem;
    dsDataPAYER_ID: TFloatField;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    dsDataDOC_NAME: TStringField;
    dsDataDOC_REST: TFloatField;
    dsDataDECL_NO: TStringField;
    lcGeneralItem2: TdxLayoutItem;
    edtDeclNo: TfdcObjectLinkEdit;
    procedure dsDataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentDeductionForm: TPaymentDeductionForm;

implementation

uses MainDm, fdcExceptions;

{$R *.dfm}

procedure TPaymentDeductionForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsDataDECL_ID.Value := Params.ParamValues['DECL_ID'];
  dsDataDECL_NO.Value := Params.ParamValues['DECL_NO'];
end;

initialization
    RegisterClass(TPaymentDeductionForm);

end.
