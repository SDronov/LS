unit DocPackReturnsYGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCheckBox, DocPackGridFrm, cxDropDownEdit, cxCalendar,
  OracleData, cxCurrencyEdit;

type
  TDocPackReturnsYGridForm = class(TDocPackGridForm)
    dsDataDATE_INCOMING: TDateTimeField;
    odaSetAdd: TOracleDataSet;
    dxBarButton1: TdxBarButton;
    actAllPackFormed: TAction;
    dsDataCLAIMED_DOC_COUNT: TIntegerField;
    dsDataCLAIMED_SPENDING: TFloatField;
    grdDataDBBandedTableViewCLAIMED_DOC_COUNT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCLAIMED_SPENDING: TcxGridDBBandedColumn;
    dsDataDESTINATION: TStringField;
    grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn;
    procedure actAddUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actAllPackFormedExecute(Sender: TObject);
  private
  public
  end;

implementation

uses MainDm;

{$R *.dfm}

procedure TDocPackReturnsYGridForm.actAddUpdate(Sender: TObject);
begin
  inherited;
  if not odaSetAdd.EOF and (odaSetAdd.FieldByName('CustomLevel').AsInteger < 2) then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TDocPackReturnsYGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
    odaSetAdd.Open;
end;

procedure TDocPackReturnsYGridForm.actAllPackFormedExecute(
  Sender: TObject);
begin
  MainData.pkgCommon.PackageName := 'p_DocPack_ReturnsY';
  MainData.pkgCommon.CallProcedure('CreateAllPackage', []);
  MainData.pkgCommon.Session.Commit;
  actRefresh.Execute;
end;

initialization
  RegisterClass( TDocPackReturnsYGridForm );

end.
