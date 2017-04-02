unit ARegisryContextFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, DB, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, dxBarExtItems,
  Oracle, cxCurrencyEdit;

type
  TAgrRegistryContextForm = class(TfdcCustomGridForm)
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    btnDoFormPack: TdxBarButton;
    dxBarButton2: TdxBarButton;
    pkgDocPackGtdKnp: TOraclePackage;
    actDoFormPack: TAction;
    dsDataNAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataCURR_CODE: TStringField;
    dsDataSUMMA: TFloatField;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    dsData_LevelKNP: TOracleQuery;
    procedure grdDataDBBandedTableViewDataControllerDataChanged(
      Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDoFormPackExecute(Sender: TObject);
    procedure actDoFormPackUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AgrRegistryContextForm: TAgrRegistryContextForm;

implementation

uses MainDm, fdcCustomDataFrm, ObjectFrm, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TAgrRegistryContextForm.grdDataDBBandedTableViewDataControllerDataChanged(
  Sender: TObject);
begin
  inherited;
//  TcxDBDataController(Sender).;
end;

procedure TAgrRegistryContextForm.FormShow(Sender: TObject);
begin
  inherited;
  actDoFormPack.Visible := (MainData.GetCustomsLevel = 2);
//  ActiveGridTableView.ApplyBestFit();
end;

procedure TAgrRegistryContextForm.actDoFormPackExecute(Sender: TObject);
begin
  pkgDocPackGtdKnp.CallProcedure( 'FormPackage', [ParamByName( 'ID' ).AsInteger] );
  RefreshData;
  RefreshWaiters;
  (Owner as TObjectForm).RefreshData;
  (Owner as TObjectForm).RefreshWaiters;
end;

procedure TAgrRegistryContextForm.actDoFormPackUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ParamByName('EnableFormPackage').AsBoolean;
end;

procedure TAgrRegistryContextForm.FormCreate(Sender: TObject);
begin
  if MainData.GetCustomsLevel in [3, 4] then
    dsData.SQL.Assign(dsData_LevelKNP.SQL);
  inherited;
end;

initialization
   RegisterClass(TAgrRegistryContextForm);

end.
