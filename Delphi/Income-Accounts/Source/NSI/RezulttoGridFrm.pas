unit RezulttoGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBarExtItems, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TRezulttoGridForm = class(TNSIDictGridForm)
    dxBarButton1: TdxBarButton;
    actImport: TAction;
    dxBarButton2: TdxBarButton;
    edtCode: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    procedure actImportExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm;


procedure TRezulttoGridForm.actImportExecute(Sender: TObject);
begin
  inherited;
  ExecuteLoader(TRezulttoLoader, 'Решения принимаемые ТО (REZULTTO)');
end;

procedure TRezulttoGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('Code', edtCode.Text);
end;

initialization
  RegisterClass(TRezulttoGridForm);


end.
