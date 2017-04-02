unit qTurnoverF02Frm;

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
  TqTurnoverF02Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
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
    dsetDataITEM_NO: TStringField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataBEZNAL: TFloatField;
    dsetDataINPATH: TFloatField;
    dsetDataREUSE_Y: TFloatField;
    dsetDataITOGO_IN: TFloatField;
    dsetDataNOTICEKINDPAY_AVANS: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetDataCNOTICEKINDPAY: TFloatField;
    dsetDataCONFIRMKINDPAY: TFloatField;
    dsetDataITOGO_OUT: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataREUSE: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
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

function TqTurnoverF02Form.GetAccountCode : string;
begin
  Result := '01.01.00'
end;

function TqTurnoverF02Form.GetAppendixNo : string;
begin
  Result := '4';
end;

function TqTurnoverF02Form.GetFormNo : string;
begin
  Result := '2';
end;

function TqTurnoverF02Form.GetXLSName : string;
begin
  Result := 'OB_F02.xls';
end;

procedure TqTurnoverF02Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
end;

procedure TqTurnoverF02Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF02Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF02Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF02Form , 'OB_F02');

end.
