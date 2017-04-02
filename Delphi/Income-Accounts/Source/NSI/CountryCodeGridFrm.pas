unit CountryCodeGridFrm;

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
  TCountryCodeGridForm = class(TNSIDictGridForm)
    btnImport: TdxBarButton;
    actImport: TAction;
    grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    edtCode: TcxTextEdit;
    lciCode: TdxLayoutItem;
    edtCode2: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    procedure actImportExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm, MainDm;

procedure TCountryCodeGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TCountryCodeLoader, 'Коды стран');
end;


procedure TCountryCodeGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('CODE', Trim(edtCode.Text));
  SetSearchParam('CODE2', Trim(edtCode2.Text));
end;

procedure TCountryCodeGridForm.actAddExecute(Sender: TObject);
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

procedure TCountryCodeGridForm.actDeleteExecute(Sender: TObject);
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
  RegisterClass(TCountryCodeGridForm);

end.
