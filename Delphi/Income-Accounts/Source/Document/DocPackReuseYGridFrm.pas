unit DocPackReuseYGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, Oracle, cxDropDownEdit, cxCalendar;

type
  TDocPackReuseYGridForm = class(TDocPackGridForm)
    dsDataDATE_INCOMING: TDateTimeField;
    dsDataDESTINATION: TStringField;
    grdDataDBBandedTableViewDestination: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIncomeDate: TcxGridDBBandedColumn;
    actCreateConfirmPacks: TAction;
    pkgCommon: TOraclePackage;
    btnCreatePacks: TdxBarButton;
    dsDataCUSTOMS_NAME: TStringField;
    grdDataDBBandedTableViewColumnCUSTOMS_NAME: TcxGridDBBandedColumn;
    procedure actCreateConfirmPacksExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
  public
    { Public declarations }
  end;

var
  DocPackReuseYGridForm: TDocPackReuseYGridForm;

implementation

{$R *.dfm}
uses MainDM;

{ TDocPackReuseYGridForm }


procedure TDocPackReuseYGridForm.actCreateConfirmPacksExecute(
  Sender: TObject);
var
  cnt : integer;
begin
  pkgCommon.PackageName := 'p_DocPack_ReuseY';
  cnt := pkgCommon.CallIntegerFunction('CreateAllPackages', []);
  if cnt > 0 then
    begin
    pkgCommon.Session.Commit;
    actRefresh.Execute;
    end;
end;

procedure TDocPackReuseYGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Только для уровня РТУ и ФТС
  actCreateConfirmPacks.Visible := (MainData.GetCustomsLevel in [0, 1]);
end;

procedure TDocPackReuseYGridForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  actDelete.Enabled := False;
end;

initialization
  RegisterClass( TDocPackReuseYGridForm );
end.
