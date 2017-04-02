unit qTurnoverF04Frm;

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
  TqTurnoverF04Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTransaction: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataKPP: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataKBK: TStringField;
    dsetDataPOSTUPILO: TFloatField;
    dsetDataTransaction: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    dsetDataHOLDER_MK: TStringField;
    grdTurnoverSheetDBBandedTableViewHOLDER_MK: TcxGridDBBandedColumn;
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

function TqTurnoverF04Form.GetAccountCode : string;
begin
  Result := '01.03.01'
end;

function TqTurnoverF04Form.GetAppendixNo : string;
begin
  Result := '6';
end;

function TqTurnoverF04Form.GetFormNo : string;
begin
  Result := '4';
end;

function TqTurnoverF04Form.GetXLSName : string;
begin
  Result := 'OB_F04.xls';
end;

procedure TqTurnoverF04Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF04Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF04Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewItem_no.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewinn.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewname.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewHOLDER_MK.Index ] = null)
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

procedure TqTurnoverF04Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF04Form , 'OB_F04');

end.
