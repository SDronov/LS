unit qTurnoverF11Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomTurnoverSheetFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu,
  ExtCtrls;

type
  TqTurnoverF11Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInst_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRest_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_uv_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcl_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZab_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPay_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableView117_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_uv_celevoy: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA_ITOGO: TFloatField;
    dsetDataINST_ITOGO: TFloatField;
    dsetDataINCLUDE_UV_AVANS: TFloatField;
    dsetDataINCLUDE_UV_CELEVOY: TFloatField;
    dsetDataINCLUDE_CONFIRM: TFloatField;
    dsetDataINCLUDE_ITOGO: TFloatField;
    dsetDataOUT_SUMMA_ITOGO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure grdTurnoverSheetDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
  private
    fAccountID : integer; 
  protected
    function GetAccountCode : string; override;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
  public
  end;

implementation

{$R *.dfm}

function TqTurnoverF11Form.GetAccountCode : string;
begin
  Result := '11.00.00'
end;

function TqTurnoverF11Form.GetAppendixNo : string;
begin
  Result := '13';
end;

function TqTurnoverF11Form.GetFormNo : string;
begin
  Result := '11';
end;

function TqTurnoverF11Form.GetXLSName : string;
begin
  Result := 'OB_F11.xls';
end;

procedure TqTurnoverF11Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF11Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF11Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewItem_no.Index ] = null)
     and not AViewInfo.Selected then
    begin
      ACanvas.Brush.Color := clMoneyGreen;
      ACanvas.Font.Style  := [fsBold];
    end;
  if (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewItem_no.Index ] = 'Итого') then
    begin
      ACanvas.Font.Style  := [fsBold];
    end;
end;

procedure TqTurnoverF11Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF11Form , 'OB_F11');

end.
