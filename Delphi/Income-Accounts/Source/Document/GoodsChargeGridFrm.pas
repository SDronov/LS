{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 3344 $
  $Author: sbalezin $
  $Date: 2007-09-26 19:12:26 +0400 (Ср, 26 сен 2007) $
}
unit GoodsChargeGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  cxCalc;

type
  TGoodsChargeGridForm = class(TObjectGridForm)
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
    grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_MODE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_MODE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_MODE_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GoodsChargeGridForm: TGoodsChargeGridForm;

implementation

{$R *.dfm}

procedure TGoodsChargeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('DECL_GOODS_ID').Value := Params.ParamValues['DECL_GOODS_ID'];
end;

initialization
   RegisterClass(TGoodsChargeGridForm);

end.
