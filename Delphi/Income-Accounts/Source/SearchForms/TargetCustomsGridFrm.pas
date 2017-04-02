unit TargetCustomsGridFrm;

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
  TTargetCustomsGridForm = class(TSubjectGridForm)
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataDT_START: TDateTimeField;
    grdDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDT_START: TcxGridDBBandedColumn;
    acImport: TAction;
    dxBarButton1: TdxBarButton;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtCode: TcxTextEdit;
    dsDataTTT: TStringField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    procedure acImportExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
  public
  end;

var
  CustomsGridForm: TTargetCustomsGridForm;

implementation

uses
  IaccLoader, LoaderWizardFrm;

{$R *.dfm}

procedure TTargetCustomsGridForm.acImportExecute(Sender: TObject);
begin
  ExecuteLoader(TCustomsLoader, 'Справочник таможен');
end;

procedure TTargetCustomsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('CODE', Trim(edtCODE.Text));
end;

initialization
  RegisterClass(TTargetCustomsGridForm);

end.
