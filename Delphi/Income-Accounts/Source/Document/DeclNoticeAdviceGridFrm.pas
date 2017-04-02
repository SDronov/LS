unit DeclNoticeAdviceGridFrm;

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
  cxLabel, dxStatusBar, dxBarExtItems;

type
  TDeclNoticeAdviceGridForm = class(TDocumentGridForm)
    cbTypeDoc: TcxComboBox;
    dcciTypeDoc: TdxBarControlContainerItem;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure cbTypeDocPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclNoticeAdviceGridForm: TDeclNoticeAdviceGridForm;

implementation

uses fdcCustomDBDataFrm;

{$R *.dfm}

procedure TDeclNoticeAdviceGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  TfdcQuery(DataSet).Params.ParamByName('sign_type').AsInteger := cbTypeDoc.ItemIndex;
  inherited;
end;

procedure TDeclNoticeAdviceGridForm.cbTypeDocPropertiesChange(
  Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
end;

initialization
  RegisterClass(TDeclNoticeAdviceGridForm);

end.
