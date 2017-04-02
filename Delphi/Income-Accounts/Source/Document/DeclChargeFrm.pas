{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 270 $
  $Author: alexvolo $
  $Date: 2005-11-02 10:54:11 +0400 (Ср, 02 ноя 2005) $
}
unit DeclChargeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit;

type
  TDeclChargeForm = class(TObjectForm)
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
    dsDataCURR_NAME: TStringField;
    edtDeclNo: TfdcObjectLinkEdit;
    lcGeneralItem4: TdxLayoutItem;
    dsDataDECL_NO: TStringField;
    lcGeneralGroup1: TdxLayoutGroup;
    procedure dsDataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclChargeForm: TDeclChargeForm;

implementation

uses MainDm, DictDm;

{$R *.dfm}

procedure TDeclChargeForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsDataDECL_ID.Value := Params.ParamValues['DECL_ID'];
  dsDataDECL_NO.Value := Params.ParamValues['DECL_NO'];
end;

initialization
   RegisterClass(TDeclChargeForm);

end.
