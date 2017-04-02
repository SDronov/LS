unit qTurnoverF13Frm;

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
  TqTurnoverF13Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewSumma_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewin_BezNal: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse_out: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZach_ExPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZach_money_lien: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewSpisano_money_zalog: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataDOC_SUMMA: TFloatField;
    dsetDataKBK: TStringField;
    dsetDataIN_WAY: TStringField;
    dsetDataIN_BEZNAL: TFloatField;
    dsetDataZACH_EXPAY: TFloatField;
    dsetDataZACH_MONEY_LIEN: TFloatField;
    dsetDataOUT_NACH_TYPE: TStringField;
    dsetDataOUT_PAY: TFloatField;
    dsetDataSPISANO_MONEY_ZALOG: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataREUSE_OUT: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetDBBandedTableViewIN_WAY: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOUT_NACH_TYPE: TcxGridDBBandedColumn;
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

function TqTurnoverF13Form.GetAccountCode : string;
begin
  Result := '06.00.00'
end;

function TqTurnoverF13Form.GetAppendixNo : string;
begin
  Result := '15';
end;

function TqTurnoverF13Form.GetFormNo : string;
begin
  Result := '13';
end;

function TqTurnoverF13Form.GetXLSName : string;
begin
  Result := 'OB_F13.xls';
end;

procedure TqTurnoverF13Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF13Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF13Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewItem_no.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewInn.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewName.Index ] = null)
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

procedure TqTurnoverF13Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF13Form , 'OB_F13');

end.
