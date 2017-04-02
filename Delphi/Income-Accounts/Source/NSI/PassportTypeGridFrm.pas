unit PassportTypeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  dxBarExtItems;

type
  TPassportTypeGridForm = class(TDictGridForm)
    grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn;
    actImport: TAction;
    btnImport: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarStatic1: TdxBarStatic;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    CustomdxBarCombo1: TCustomdxBarCombo;
    edtCode: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarButton1: TdxBarButton;
    procedure actImportExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
  public
  end;


implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm;


procedure TPassportTypeGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TPassportTypeLoader, '¬иды документов удостовер€ющих личность');
end;

procedure TPassportTypeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('CODE', Trim(edtCode.Text));
end;

initialization
  RegisterClass(TPassportTypeGridForm);


end.
 