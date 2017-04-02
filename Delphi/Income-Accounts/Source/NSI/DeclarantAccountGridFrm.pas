{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1990 $
  $Author: charushin $
  $Date: 2006-10-23 15:46:10 +0400 (Пн, 23 окт 2006) $
}

unit DeclarantAccountGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDeclarantAccountGridForm = class(TObjectGridForm)
    dsDataDECLARANT_ID: TFloatField;
    dsDataACCOUNT_CURR_TYPE: TIntegerField;
    dsDataBANK_OKPO: TStringField;
    dsDataPAY_ACCOUNT: TStringField;
    dsDataCORR_ACCOUNT: TStringField;
    grdDataDBBandedTableViewDECLARANT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBANK_OKPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_ACCOUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCORR_ACCOUNT: TcxGridDBBandedColumn;
    dsDataCURR_TYPE: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    edtPayAccount: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtCorrAccount: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
  public
  end;

var
  DeclarantAccountGridForm: TDeclarantAccountGridForm;
                                  
implementation

{$R *.dfm}

procedure TDeclarantAccountGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  if Params.ParamByName('DECL_ID').IsNull then
    Params.ParamValues['DECL_ID'] := Params.ParamValues['ID'];
  inherited;
  SetSearchParam('Corr_Account', Trim(edtCorrAccount.Text));
  SetSearchParam('Pay_Account',  Trim(edtPayAccount.Text));
  SetSearchParam('BANK_OKPO',  Trim(edtName.Text));
end;

initialization
  RegisterClass(TDeclarantAccountGridForm);

end.
