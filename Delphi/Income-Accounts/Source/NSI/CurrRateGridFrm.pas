{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 2126 $
  $Author: charushin $
  $Date: 2006-12-20 18:13:08 +0400 (Ср, 20 дек 2006) $
}
unit CurrRateGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxDropDownEdit, cxCalendar, Menus;

type
  TNSICurrRateGridForm = class(TObjectGridForm)
    dsDataMULT: TIntegerField;
    dsDataCHANGE_RATE: TFloatField;
    dsDataBACK_RATE: TFloatField;
    dsDataRATE_DATE: TDateTimeField;
    grdDataDBBandedTableViewMULT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHANGE_RATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBACK_RATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRATE_DATE: TcxGridDBBandedColumn;
    edtBeginDate: TcxDateEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtEndDate: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    dxBarButton1: TdxBarButton;
    dsDataBUK: TStringField;
    grdDataDBBandedTableViewBUK: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  end;

var
  NSICurrRateGridForm: TNSICurrRateGridForm;

implementation

uses
  MainDm, CurrRateFrm, fdcCustomObjectGridFrm, fdcCustomGridFrm, fdcUtils, IaccLoader;

{$R *.dfm}

procedure TNSICurrRateGridForm.actAddExecute(Sender: TObject);
begin
  RegisterAsWaiterFor(ObjectServices.CreateObject('NsiCurrRate',
    False, Params));
end;

procedure TNSICurrRateGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('BeginDate', IfElse(edtBeginDate.Text <> '', edtBeginDate.Date,
    Null));
  SetSearchParam('EndDate', IfElse(edtEndDate.Text <> '', edtEndDate.Date,
    Null));
end;

initialization
  RegisterClass(TNSICurrRateGridForm);

end.

