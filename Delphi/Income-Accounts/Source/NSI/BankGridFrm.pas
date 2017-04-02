{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 14594 $
  $Author: adavletyarov $
  $Date: 2012-04-06 15:25:00 +0400 (РџС‚, 06 Р°РїСЂ 2012) $
}
unit BankGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  QueryList;

type
  TBankGridForm = class(TSubjectGridForm)
    edtBic: TcxTextEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    grdDataDBBandedTableViewADDRESS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn;
    dsDataRUR_LIC_DATE: TDateTimeField;
    dsDataVAL_LIC_DATE: TDateTimeField;
    dsDataCHIEF_NAME: TStringField;
    dsDataCHIEF_ACC_NAME: TStringField;
    grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRUR_LIC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewVAL_LIC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHIEF_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHIEF_ACC_NAME: TcxGridDBBandedColumn;
    acImport: TAction;
    dxBarButton1: TdxBarButton;
    dsDataBIC: TStringField;
    dsDataCORR_ACCOUNT: TStringField;
    grdDataDBBandedTableViewCORR_ACCOUNT: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure acImportExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  BankGridForm: TBankGridForm;

implementation

uses
  fdcCustomGridFrm, fdcUtils, IaccLoader, LoaderWizardFrm;

{$R *.dfm}

procedure TBankGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  ParamsHolder.Params[0].AsFloat := 0;
  inherited;
  SetSearchParam('BIC', Trim(edtBic.Text));
  SetSearchParam('OKPO', Trim(edtOKPO.Text));
end;

procedure TBankGridForm.acImportExecute(Sender: TObject);
begin
  ExecuteLoader(TBankLoader, 'Справочник банков');
end;

procedure TBankGridForm.FormShow(Sender: TObject);
begin
  inherited;
   FTypeSysName := 'Bank';
end;

initialization
     RegisterClass(TBankGridForm);

end.
