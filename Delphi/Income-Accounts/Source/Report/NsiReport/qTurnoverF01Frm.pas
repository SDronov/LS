unit qTurnoverF01Frm;

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
  TqTurnoverF01Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewBezNal: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInPath: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse_y: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewItogo_in: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticeKindPay_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCNoticeKindPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticeKindPay_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewConfirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewItogo_out: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataBEZNAL: TFloatField;
    dsetDataINPATH: TFloatField;
    dsetDataREUSE_Y: TFloatField;
    dsetDataITOGO_IN: TFloatField;
    dsetDataNOTICEKINDPAY_AVANS: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetDataCNOTICEKINDPAY: TFloatField;
    dsetDataCONFIRMKINDPAY: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataREUSE: TFloatField;
    dsetDataITOGO_OUT: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure grdTurnoverSheetDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
  private
    fAccountID : integer; // 01.01.00
  protected
    function GetAccountCode : string; override;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
  public
  end;

implementation

{$R *.dfm}

function TqTurnoverF01Form.GetAccountCode : string;
begin
  Result := '01.01.00'
end;

function TqTurnoverF01Form.GetAppendixNo : string;
begin
  Result := '3';
end;

function TqTurnoverF01Form.GetFormNo : string;
begin
  Result := '1';
end;

function TqTurnoverF01Form.GetXLSName : string;
begin
  Result := 'OB_F01.xls';
end;

procedure TqTurnoverF01Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF01Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF01Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF01Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF01Form , 'OB_F01');

end.
