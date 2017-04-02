unit CustomModeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictGridFrm, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBarExtItems, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl,
  cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData;

type
  TCustomModeGridForm = class(TNSIDictGridForm)
    actImport: TAction;
    dxBarButton1: TdxBarButton;
    procedure actImportExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;


implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm, MainDm;

procedure TCustomModeGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TCustomModeLoader, 'Таможенные режимы');
end;

procedure TCustomModeGridForm.actDeleteExecute(Sender: TObject);
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
    RegisterClass(TCustomModeGridForm);

end.
