unit CDeclFindGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CDeclBaseGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxSpinEdit, cxLabel, dxStatusBar;

type
  TCDeclFindGridForm = class(TCDeclBaseGridForm)
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actSearchOkUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
procedure TCDeclFindGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('ObjectNames').AsString := SearchTypeSysName;
end;

procedure TCDeclFindGridForm.actSearchOkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    (Sender as TAction).Visible
     and (grdDataDBBandedTableView.Controller.SelectedRowCount > 0);
end;

initialization
  RegisterClass(TCDeclFindGridForm);

end.
