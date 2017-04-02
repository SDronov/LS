{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 2127 $
  $Author: charushin $
  $Date: 2006-12-20 18:19:35 +0400 (Ср, 20 дек 2006) $
}
unit CurrRateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, cxCurrencyEdit;

type
  TNsiCurrRateForm = class(TObjectForm)
    dsDataMULT: TIntegerField;
    dsDataCHANGE_RATE: TFloatField;
    dsDataBACK_RATE: TFloatField;
    dsDataRATE_DATE: TDateTimeField;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsDataCURRENCYNAME: TStringField;
    dsDataCURRENCYCODE: TStringField;
    fdcObjectLinkEdit2: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtMult: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtChangeRate: TcxDBCurrencyEdit;
    lcGeneralItem4: TdxLayoutItem;
    edtBackRate: TcxDBCurrencyEdit;
    lcGeneralItem5: TdxLayoutItem;
    edtRateDate: TcxDBDateEdit;
    lcGeneralItem6: TdxLayoutItem;
    dsDataBUK: TStringField;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure dsDataNewRecord(DataSet: TDataSet);
  private
  public
  end;

var
  NsiCurrRateForm: TNsiCurrRateForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TNsiCurrRateForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dsDataOWNER_OBJECT_ID.asFloat := Params.ParamByName('CURR_ID').asFloat;
  dsDataCURRENCYNAME.asString := Params.ParamByName('CURR_NAME').asString;
  dsDataCURRENCYCODE.asString := Params.ParamByName('CURR_CODE').asString;
end;

procedure TNsiCurrRateForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
//  dsDataRATE_DATE.AsDateTime := Now;
//  dsDataBACK_RATE.AsFloat := 0;
//  dsDataMULT.AsInteger := 1;
end;

initialization
  RegisterClass(TNsiCurrRateForm);

end.
