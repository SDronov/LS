unit qTurnoverF08Frm;

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
  TqTurnoverF08Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_tpo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_others: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_u_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_u_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataKBK: TStringField;
    dsetDataNACH_GTD: TFloatField;
    dsetDataNACH_TPO: TFloatField;
    dsetDataNACH_OTHERS: TFloatField;
    dsetDataNACH_ITOGO: TFloatField;
    dsetDataINCLUDE_U_AVANS: TFloatField;
    dsetDataINCLUDE_U_CELEVOY: TFloatField;
    dsetDataINCLUDE_CONFIRM: TFloatField;
    dsetDataINCLUDE_ITOGO: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    dsetDataZADOLG: TFloatField;
    grdTurnoverSheetDBBandedTableViewNach_gtd: TcxGridDBBandedColumn;
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

function TqTurnoverF08Form.GetAccountCode : string;
begin
  Result := '10.01.00'
end;

function TqTurnoverF08Form.GetAppendixNo : string;
begin
  Result := '10';
end;

function TqTurnoverF08Form.GetFormNo : string;
begin
  Result := '8';
end;

function TqTurnoverF08Form.GetXLSName : string;
begin
  Result := 'OB_F08.xls';
end;

procedure TqTurnoverF08Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF08Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF08Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF08Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF08Form , 'OB_F08');

end.
