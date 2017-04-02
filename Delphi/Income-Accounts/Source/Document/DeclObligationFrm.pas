{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 176 $
  $Author: alexvolo $
  $Date: 2005-08-25 15:43:13 +0400 (Чт, 25 авг 2005) $
}
unit DeclObligationFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit;

type
  TDeclObligationForm = class(TObjectForm)
    edtPaymentName: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtSumma: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtCurrName: TfdcObjectLinkEdit;
    lcGeneralItem3: TdxLayoutItem;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    procedure dsDataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclObligationForm: TDeclObligationForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TDeclObligationForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsDataDECL_ID.Value := Params.ParamValues['DECL_ID'];
end;

initialization
   RegisterClass(TDeclObligationForm);

end.
