unit qTurnoverF17_1Frm;

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
  TqTurnoverF17_1Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataDOC_TYPE: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataIN_UVED: TFloatField;
    dsetDataOUT_UVED: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIN_SUMMA: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIN_UVED: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOUT_UVED: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOUT_SUMMA: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure grdTurnoverSheetDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
    procedure dsetDataAfterOpen(DataSet: TDataSet);
  private
    fAccountID : integer; 
    fAccountKBKAvansID : integer;
    fAccountKBKCelevoyID : integer;
    fAccountExtPayID : integer;
    fAccountConfirmID : integer;
  protected
    function GetAccountCode : string; override;
    function GetAccountKBKAvansCode : string;
    function GetAccountKBKCelevoyCode : string;
    function GetAccountExtPayCode : string;
    function GetAccountConfirmCode : string;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
  public
  end;

implementation

{$R *.dfm}

function TqTurnoverF17_1Form.GetAccountCode : string;
begin
  Result := '12.02.00'
end;

function TqTurnoverF17_1Form.GetAccountKBKAvansCode : string;
begin
  Result := '12.02.01'
end;

function TqTurnoverF17_1Form.GetAccountKBKCelevoyCode : string;
begin
  Result := '12.02.02'
end;

function TqTurnoverF17_1Form.GetAccountExtPayCode : string;
begin
  Result := '12.02.03'
end;

function TqTurnoverF17_1Form.GetAccountConfirmCode : string;
begin
  Result := '12.03.00'
end;

function TqTurnoverF17_1Form.GetAppendixNo : string;
begin
  Result := '17.1';
end;

function TqTurnoverF17_1Form.GetFormNo : string;
begin
  Result := '17.1';
end;

function TqTurnoverF17_1Form.GetXLSName : string;
begin
  Result := 'OB_F17_1.xls';
end;

procedure TqTurnoverF17_1Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  fAccountKBKAvansID := GetAccountID( GetAccountKBKAvansCode );
  fAccountKBKCelevoyID := GetAccountID( GetAccountKBKCelevoyCode );
  fAccountExtPayID := GetAccountID( GetAccountExtPayCode );
  fAccountConfirmID := GetAccountID( GetAccountConfirmCode );
end;

procedure TqTurnoverF17_1Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
  //--
  Sender.SetVariable('account_kbkavans_id', fAccountKBKAvansID);
  Sender.SetVariable('account_kbkavans_code', GetAccountKBKAvansCode);
  //--
  Sender.SetVariable('account_kbkcelevoy_id', fAccountKBKCelevoyID);
  Sender.SetVariable('account_kbkcelevoy_code', GetAccountKBKCelevoyCode);
  //--
  Sender.SetVariable('account_extpay_id', fAccountExtPayID);
  Sender.SetVariable('account_extpay_code', GetAccountExtPayCode);
  //--
  Sender.SetVariable('account_confirm_id', fAccountConfirmID);
  Sender.SetVariable('account_confirm_code', GetAccountConfirmCode);
end;

procedure TqTurnoverF17_1Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF17_1Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF17_1Form.dsetDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  grdTurnoverSheetDBBandedTableViewDOC_TYPE.Width := 120;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF17_1Form , 'OB_F17_1');

end.
