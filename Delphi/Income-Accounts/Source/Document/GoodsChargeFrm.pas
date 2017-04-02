{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 270 $
  $Author: alexvolo $
  $Date: 2005-11-02 10:54:11 +0400 (Ср, 02 ноя 2005) $
}
unit GoodsChargeFrm;

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
  TGoodsChargeForm = class(TObjectForm)
    dsDataDECL_GOODS_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataPAY_TYPE_NAME: TStringField;
    dsDataPAY_TYPE_CODE: TStringField;
    dsDataPAY_MODE_ID: TFloatField;
    dsDataPAY_MODE_NAME: TStringField;
    dsDataPAY_MODE_CODE: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURRENCY_NAME: TStringField;
    dsDataCURRENCY_CODE: TStringField;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    fdcObjectLinkEdit2: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    procedure dsDataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GoodsChargeForm: TGoodsChargeForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TGoodsChargeForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsDataDECL_GOODS_ID.Value := Params.ParamValues['DECL_GOODS_ID'];
end;

initialization
   RegisterClass(TGoodsChargeForm);

end.
 