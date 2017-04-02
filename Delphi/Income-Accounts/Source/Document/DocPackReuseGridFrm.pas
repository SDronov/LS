unit DocPackReuseGridFrm;

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
  dxStatusBar, Oracle, cxDropDownEdit, cxCalendar, cxCurrencyEdit;

type
  TDocPackReuseGridForm = class(TDocPackGridForm)
    dsDataDATE_SEND: TDateTimeField;
    grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn;
    actCreateConfirmPacks: TAction;
    btnCreateConfirmPacks: TdxBarButton;
    pkgCommon: TOraclePackage;
    dsDataDESTINATION: TStringField;
    grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn;
    dsDataEXT_SOURCE: TStringField;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    dsDataAMOUNT: TFloatField;
    grdDataDBBandedTableViewAMOUNT: TcxGridDBBandedColumn;
    dsDataCUSTOMS_SOURCE: TStringField;
    dsDataCUSTOMS_TARGET: TStringField;
    grdDataDBBandedTableViewCUSTOMS_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_TARGET: TcxGridDBBandedColumn;
    procedure actCreateConfirmPacksExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  public
    { Public declarations }
  end;

var
  DocPackReuseGridForm: TDocPackReuseGridForm;

implementation

uses fdcCustomDBDataFrm, MainDM, fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TDocPackReuseGridForm.actCreateConfirmPacksExecute(
  Sender: TObject);
var
  cnt : integer;
begin
  pkgCommon.PackageName := 'p_DocPack_Reuse';
  cnt := pkgCommon.CallIntegerFunction('CreateAllPackages', []);
  if cnt > 0 then
    begin
     pkgCommon.Session.Commit;
     actRefresh.Execute;
    end;
end;


procedure TDocPackReuseGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Только для уровня РТУ
  actCreateConfirmPacks.Visible := (MainData.GetCustomsLevel = 0) or (MainData.GetCustomsLevel = 1);
  actAdd.Visible := not actCreateConfirmPacks.Visible;
end;

procedure TDocPackReuseGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ] <> MainData.GetSoftCustomsCode then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackAlienSelected
    else
      AStyle := MainData.stlDocPackAlien

  else if ARecord.Values[ grdDataDBBandedTableViewSTATE_NAME.Index ] = 'Отправлен' then
    if ARecord.Selected then
      AStyle := MainData.stlDocPackSendedSelected
    else
      AStyle := MainData.stlDocPackSended
    ;
end;

initialization
  RegisterClass( TDocPackReuseGridForm );

end.
