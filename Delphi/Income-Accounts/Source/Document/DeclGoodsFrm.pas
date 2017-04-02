{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 176 $
  $Author: alexvolo $
  $Date: 2005-08-25 15:43:13 +0400 (Чт, 25 авг 2005) $
}
unit DeclGoodsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit;

type
  TDeclGoodsForm = class(TObjectForm)
    lcMain: TdxLayoutControl;
    cxDBMemo1: TcxDBMemo;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dsDataDECL_ID: TFloatField;
    dsDataNO: TIntegerField;
    dsDataGOODS_ID: TFloatField;
    dsDataGOODS_CODE: TStringField;
    dsDataGOODS_NAME: TStringField;
    dsDataG36: TStringField;
    dsDataG37: TStringField;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcMainItem1: TdxLayoutItem;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcMainItem2: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem4: TdxLayoutItem;
    tabCharge: TcxTabSheet;
    procedure dsDataNewRecord(DataSet: TDataSet);
    procedure tabChargeShow(Sender: TObject);
  private
    { Private declarations }
    FChargeForm: TForm;
  public
    { Public declarations }
  end;

var
  DeclGoodsForm: TDeclGoodsForm;

implementation

{$R *.dfm}

procedure TDeclGoodsForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsDataDECL_ID.asFloat := Params.ParamByName('DECL_ID').asFloat;
end;

procedure TDeclGoodsForm.tabChargeShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FChargeForm) then
     FChargeForm := ObjectServices.ShowForm('TGoodsChargeGridForm', Params, tabCharge);
end;

initialization
    RegisterClass(TDeclGoodsForm);

end.
