unit qTurnoverF09Frm;

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
  TqTurnoverF09Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocDate: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocSumma: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINST: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRest: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRESET: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcl: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZab: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableView117: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOUT_SUMMA_ITOGO: TcxGridDBBandedColumn;
    dsetDataITEM_NO: TStringField;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataPENY_ZADOLG: TStringField;
    dsetDataIN_SUMMA_ITOGO: TFloatField;
    dsetDataDOCNUMBER: TStringField;
    dsetDataDOCDATE: TDateTimeField;
    dsetDataDOCSUMMA: TFloatField;
    dsetDataINST: TFloatField;
    dsetDataRESET: TFloatField;
    dsetDataOUT_SUMMA_ITOGO: TFloatField;
    grdTurnoverSheetDBBandedTableViewPENY_ZADOLG: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure grdTurnoverSheetDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
  private
    fAccountID : integer;
    fAccount_030101_ID : integer;
    fAccount_030103_ID : integer;
  protected
    function GetAccountCode : string; override;
    function GetAccount_030101_Code : string;
    function GetAccount_030103_Code : string;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
  public
  end;

implementation

{$R *.dfm}

function TqTurnoverF09Form.GetAccountCode : string;
begin
  Result := '03.00.00'
end;

function TqTurnoverF09Form.GetAccount_030101_Code : string;
begin
  Result := '03.01.01'
end;

function TqTurnoverF09Form.GetAccount_030103_Code : string;
begin
  Result := '03.01.03'
end;

function TqTurnoverF09Form.GetAppendixNo : string;
begin
  Result := '11';
end;

function TqTurnoverF09Form.GetFormNo : string;
begin
  Result := '9';
end;

function TqTurnoverF09Form.GetXLSName : string;
begin
  Result := 'OB_F09.xls';
end;

procedure TqTurnoverF09Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  fAccount_030101_ID := GetAccountID( GetAccount_030101_Code );
  fAccount_030103_ID := GetAccountID( GetAccount_030103_Code );
end;

procedure TqTurnoverF09Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
  Sender.SetVariable('account_030101_id', fAccount_030101_ID);
  Sender.SetVariable('account_030103_id', fAccount_030103_ID);
end;

procedure TqTurnoverF09Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF09Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF09Form , 'OB_F09');

end.
