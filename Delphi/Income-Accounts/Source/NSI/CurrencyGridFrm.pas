{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12219 $
  $Author: sbakum $
  $Date: 2011-01-14 11:23:01 +0400 (РџС‚, 14 СЏРЅРІ 2011) $
}
unit CurrencyGridFrm;

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
  dxBarExtItems, Menus;

type
  TNSICurrencyGridForm = class(TObjectGridForm)
    edtCode: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    dsDataCODE: TStringField;
    dsDataACODE: TStringField;
    dsDataOLD_CODE: TStringField;
    dsDataRATE: TFloatField;
    grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOLD_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRATE: TcxGridDBBandedColumn;
    edtRateDate: TdxBarDateCombo;
    dxBarButton1: TdxBarButton;
    acImport: TAction;
    acImportRates: TAction;
    dxBarButton2: TdxBarButton;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure edtRateDateChange(Sender: TObject);
    procedure acImportExecute(Sender: TObject);
    procedure acImportRatesExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    FLoader: TObject;
  end;

var
  NSICurrencyGridForm: TNSICurrencyGridForm;

implementation

uses
  MainDm, fdcCustomGridFrm, fdcCustomDBDataFrm, IaccLoader, LoaderWizardFrm;

{$R *.dfm}

procedure TNSICurrencyGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('Code', Trim(edtCode.Text));
end;

procedure TNSICurrencyGridForm.edtRateDateChange(Sender: TObject);
begin
  inherited;
  dsData.Params.ParamValues['RATE_DATE'] := edtRateDate.Date;
  RefreshData;
end;

procedure TNSICurrencyGridForm.acImportExecute(Sender: TObject);
begin
  ExecuteLoader(TCurrencyLoader, 'Справочник валют');
end;

procedure TNSICurrencyGridForm.acImportRatesExecute(Sender: TObject);
begin
  ExecuteLoader(TCurrencyRateLoader, 'Справочник курсов валют');
end;

procedure TNSICurrencyGridForm.actAddExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

procedure TNSICurrencyGridForm.actDeleteExecute(Sender: TObject);
begin
  if (MainData.AccessModifyNSI) then
    begin
      inherited;
    end
  else
    begin
      msg_action_disabled;
    end;
end;

initialization
   RegisterClass(TNSICurrencyGridForm);

end.
