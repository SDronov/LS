unit qTurnoverF12Frm;

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
  TqTurnoverF12Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewreturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewinclude_uved: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA_ITOGO: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataINCLUDE_UVED: TFloatField;
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
    fAccountPercentID : integer;
  protected
    function GetAccountCode : string; override;
    function GetAccountPercentCode : string;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
  public
  end;

implementation

{$R *.dfm}

function TqTurnoverF12Form.GetAccountCode : string;
begin
  Result := '05.01.00'
end;

function TqTurnoverF12Form.GetAccountPercentCode : string;
begin
  Result := '05.01.02'
end;

function TqTurnoverF12Form.GetAppendixNo : string;
begin
  Result := '14';
end;

function TqTurnoverF12Form.GetFormNo : string;
begin
  Result := '12';
end;

function TqTurnoverF12Form.GetXLSName : string;
begin
  Result := 'OB_F12.xls';
end;

procedure TqTurnoverF12Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  fAccountPercentID := GetAccountID( GetAccountPercentCode );
end;

procedure TqTurnoverF12Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
  Sender.SetVariable('account_percent_id', fAccountPercentID);
  Sender.SetVariable('account_percent_code', GetAccountPercentCode);
end;

procedure TqTurnoverF12Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF12Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF12Form , 'OB_F12');

end.
