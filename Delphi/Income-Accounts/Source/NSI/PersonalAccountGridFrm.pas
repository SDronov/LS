unit PersonalAccountGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBarExtItems, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalendar;

type
  TPersonalAccountGridForm = class(TObjectGridForm)
    dsDataSUBJECT_NAME: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    lcSearchInn: TdxLayoutItem;
    edtINN: TcxTextEdit;
    lcSearchKpp: TdxLayoutItem;
    edtKPP: TcxTextEdit;
    dsDataSDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataPARENT_ID: TFloatField;
    grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actDeleteUpdate(Sender: TObject);
  private
    { Private declarations }
  public
     lv_viewmode :integer;
    { Public declarations }
  end;

var
  PersonalAccountGridForm: TPersonalAccountGridForm;

implementation

{$R *.dfm}
procedure TPersonalAccountGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSubsParam('viewmode', lv_viewmode);
  SetSearchParam('INN', Trim(edtINN.Text));
  SetSearchParam('KPP', Trim(edtKPP.Text));
end;

procedure TPersonalAccountGridForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
    (Sender as TAction).Enabled := False;
end;

initialization
  RegisterClass(TPersonalAccountGridForm);
end.
