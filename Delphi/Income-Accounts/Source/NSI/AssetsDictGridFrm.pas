unit AssetsDictGridFrm;

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
  TAssetsDictGridForm = class(TNSIDictGridForm)
    grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn;
    dxBarButton1: TdxBarButton;
    actImport: TAction;
    procedure actImportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm, MainDm;

procedure TAssetsDictGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TAssetsDictLoader, 'Справочник возвратов\зачетов');
end;

procedure TAssetsDictGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  Self.ReadOnly := True;
end;

procedure TAssetsDictGridForm.actAddExecute(Sender: TObject);
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

procedure TAssetsDictGridForm.actDeleteExecute(Sender: TObject);
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
  RegisterClass(TAssetsDictGridForm);

end.
