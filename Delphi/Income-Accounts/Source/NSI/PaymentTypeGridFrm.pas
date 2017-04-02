{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12218 $
  $Author: sbakum $
  $Date: 2011-01-14 10:30:22 +0400 (РџС‚, 14 СЏРЅРІ 2011) $
}

unit PaymentTypeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, NSIDictGridFrm,
  dxBarExtItems, Menus;

type
  TPaymentTypeGridForm = class(TNSIDictGridForm)
    dxBarButton1: TdxBarButton;
    acImport: TAction;
    edtCode: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    procedure acImportExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

var
  PaymentTypeGridForm: TPaymentTypeGridForm;

implementation

uses
  IaccLoader, LoaderWizardFrm, MainDm;

{$R *.dfm}

procedure TPaymentTypeGridForm.acImportExecute(Sender: TObject);
begin
  ExecuteLoader(TNsiPaymentTypeLoader, 'Виды платежей');
end;

procedure TPaymentTypeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('Code', Trim(edtCode.Text));
end;

procedure TPaymentTypeGridForm.actAddExecute(Sender: TObject);
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

procedure TPaymentTypeGridForm.actDeleteExecute(Sender: TObject);
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
  RegisterClass(TPaymentTypeGridForm);

end.
 