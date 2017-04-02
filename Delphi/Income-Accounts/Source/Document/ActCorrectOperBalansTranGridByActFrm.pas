unit ActCorrectOperBalansTranGridByActFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActCorrectOperBalansTranGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar;

type
  TActCorrectOperBalansTranGridByActForm = class(TActCorrectOperBalansTranGridForm)
    procedure actAddUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActCorrectOperBalansTranGridByActForm: TActCorrectOperBalansTranGridByActForm;

implementation

{$R *.dfm}

procedure TActCorrectOperBalansTranGridByActForm.actAddUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := (Sender as TAction).Enabled
                             and (Sender as TAction).Visible
                             and  Assigned(ObjectServices);
end;

initialization
  RegisterClass(TActCorrectOperBalansTranGridByActForm);

end.
