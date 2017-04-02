unit AdvDeclFeatureGridFrm;

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
  TAdvDeclFeatureGridForm = class(TNSIDictGridForm)
    actImport: TAction;
    dxBarButton1: TdxBarButton;
    procedure actImportExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;


implementation

{$R *.dfm}

uses
  IaccLoader, LoaderWizardFrm, MainDm;

procedure TAdvDeclFeatureGridForm.actImportExecute(Sender: TObject);
begin
  ExecuteLoader(TAdvDeclFeatureLoader, 'Виды таможенных деклараций');
end;

procedure TAdvDeclFeatureGridForm.actAddExecute(Sender: TObject);
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

procedure TAdvDeclFeatureGridForm.actDeleteExecute(Sender: TObject);
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
   RegisterClass(TAdvDeclFeatureGridForm);

end.
 