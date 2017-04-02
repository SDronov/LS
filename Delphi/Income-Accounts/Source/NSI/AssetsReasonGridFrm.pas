unit AssetsReasonGridFrm;

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
  TAssetsReasonGridForm = class(TNSIDictGridForm)
    grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn;
    dxBarButton1: TdxBarButton;
    actImport: TAction;
    dsDataDOCUM: TStringField;
    grdDataDBBandedTableViewDOCUM: TcxGridDBBandedColumn;
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

procedure TAssetsReasonGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TAssetsReasonLoader, 'Основания для возвратов\зачетов');
end;

procedure TAssetsReasonGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  Self.ReadOnly := True;
end;

procedure TAssetsReasonGridForm.actAddExecute(Sender: TObject);
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

procedure TAssetsReasonGridForm.actDeleteExecute(Sender: TObject);
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
  RegisterClass(TAssetsReasonGridForm);

end.
