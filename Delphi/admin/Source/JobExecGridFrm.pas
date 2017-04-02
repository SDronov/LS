unit JobExecGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar,MainDm;

type
  TJobExecGridForm = class(TfdcCustomGridForm)
    dsDataID: TFloatField;
    dsDataJOBLIST_ID: TFloatField;
    dsDataWHEN_STARTED: TDateTimeField;
    dsDataWHEN_STOPPED: TDateTimeField;
    dsDataIS_ERRORS: TStringField;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewJOBLIST_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewWHEN_STARTED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewWHEN_STOPPED: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ERRORS: TcxGridDBBandedColumn;
    actOpen: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    procedure actOpenExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JobExecGridForm: TJobExecGridForm;

implementation

uses ObjServices;

{$R *.dfm}

procedure TJobExecGridForm.actOpenExecute(Sender: TObject);
begin
  inherited;
  Params.FillBy(dsData);
  GetObjectServices.ShowForm('TJobExecForm',params,nil);
end;

procedure TJobExecGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  inherited;
  if grdData.ActiveView.GetHitTest(grdData.ScreenToClient(Mouse.CursorPos)).HitTestCode = htCell then
    actOpen.Execute
end;

initialization
  RegisterClass(TJobExecGridForm);

end.
