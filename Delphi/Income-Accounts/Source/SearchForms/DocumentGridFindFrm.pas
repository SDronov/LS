unit DocumentGridFindFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar;

type
  TDocumentGridFindForm = class(TDocumentGridForm)
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocumentGridFindForm: TDocumentGridFindForm;

implementation

{$R *.dfm}

uses
  MainFrm
 ,ObjectTypeTreeDlgFrm;
 
procedure TDocumentGridFindForm.actSearchOkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    (Sender as TAction).Visible
     and (grdDataDBBandedTableView.Controller.SelectedRowCount = 1);
end;

procedure TDocumentGridFindForm.actSearchOkExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(OnSearchFinished) then
       ModalResult := mrOk;
end;

initialization
    RegisterClass(TDocumentGridFindForm);

end.
