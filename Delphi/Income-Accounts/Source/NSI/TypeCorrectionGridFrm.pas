unit TypeCorrectionGridFrm;

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
  TTypeCorrectionGridForm = class(TNSIDictGridForm)
    dxBarButton1: TdxBarButton;
    actImportExecute: TAction;
    procedure actImportExecuteExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeCorrectionGridForm: TTypeCorrectionGridForm;

implementation

uses
  IaccLoader, LoaderWizardFrm;
{$R *.dfm}
procedure TTypeCorrectionGridForm.actImportExecuteExecute(Sender: TObject);
begin
  ExecuteLoader(TTypeCorrectionLoader, 'Типы корректировки ДТ');
end;

procedure TTypeCorrectionGridForm.actAddExecute(Sender: TObject);
begin
  RegisterAsWaiterFor(ObjectServices.CreateObject('NSITypeCorrection', True, Params));
end;

initialization
    RegisterClass(TTypeCorrectionGridForm);

end.
