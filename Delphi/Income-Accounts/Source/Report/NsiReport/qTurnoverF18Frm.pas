unit qTurnoverF18Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomTurnoverSheetFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid;

type
  TqTurnoverF18Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOperation_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_KBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_peny: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRestored_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRestored_peny: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa_peny: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa_extpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRestored_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDop_peny: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcluded_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcluded_peny: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcluded_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_peny: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataOPERATION_DATE: TDateTimeField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA_AVSNS: TFloatField;
    dsetDataIN_SUMMA_CELEVOY: TFloatField;
    dsetDataIN_SUMMA_EXTPAY: TFloatField;
    dsetDataIN_UVED_AVANS_GOODS: TFloatField;
    dsetDataIN_UVED_AVANS_ZADOLG: TFloatField;
    dsetDataIN_UVED_AVANS_ITOGO: TFloatField;
    dsetDataIN_UVED_CELEVOY_GOODS: TFloatField;
    dsetDataIN_UVED_CELEVOY_ZADOLG: TFloatField;
    dsetDataIN_UVED_CELEVOY_ITOGO: TFloatField;
    dsetDataIN_UVED_EXTPAY: TFloatField;
    dsetDataOUT_UVED_AVANS: TFloatField;
    dsetDataOUT_UVED_CELEVOY: TFloatField;
    dsetDataOUT_UVED_EXTPAY: TFloatField;
    dsetDataOUT_SUMMA_AVSNS: TFloatField;
    dsetDataOUT_SUMMA_CELEVOY: TFloatField;
    dsetDataOUT_SUMMA_EXTPAY: TFloatField;
    grdTurnoverSheetDBBandedTableViewDocNumber: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewFio: TcxGridDBBandedColumn;
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
    function GetAccountKBKAvansCode : string;
    function GetAccountKBKCelevoyCode : string;
    function GetAccountExtPayCode : string;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
  public
  end;

implementation

{$R *.dfm}

function TqTurnoverF18Form.GetAccountCode : string;
begin
  Result := '03.05.00.заб'
end;

function TqTurnoverF18Form.GetAppendixNo : string;
begin
  Result := '20';
end;

function TqTurnoverF18Form.GetFormNo : string;
begin
  Result := '18';
end;

function TqTurnoverF18Form.GetXLSName : string;
begin
  Result := 'OB_F18.xls';
end;

procedure TqTurnoverF18Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF18Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
  var
   i: Integer;
   f: TField;
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF18Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF18Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF18Form , 'OB_F18_');

end.
