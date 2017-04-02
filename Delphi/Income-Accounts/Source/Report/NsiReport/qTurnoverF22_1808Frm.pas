unit qTurnoverF22_1808Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomTurnoverSheetFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu,
  ExtCtrls, cxGridDBTableView, DBClient, Provider, cxFilterControl;

type
  TqTurnoverF22_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticeKindPay_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCNoticeKindPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticeKindPay_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewConfirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewItogo_out: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_AVANS: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_CELEVOY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewCNOTICEKINDPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewCONFIRMKINDPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewREUSE: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewITOGO_OUT: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableViewNOTICEKINDPAY_AVANS_T: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNOTICEKINDPAY_CELEVOY_T: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCNOTICEKINDPAY_T: TcxGridDBBandedColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataKBK: TStringField;
    dsetDataPOSTUPILO: TFloatField;
    dsetDataNOTICEKINDPAY_AVANS: TFloatField;
    dsetDataNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetDataCNOTICEKINDPAY: TFloatField;
    dsetDataCNOTICEKINDPAY_T: TFloatField;
    dsetDataCONFIRMKINDPAY: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataREUSE: TFloatField;
    dsetDataITOGO_OUT: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogKBK: TStringField;
    dsetItogPOSTUPILO: TFloatField;
    dsetItogNOTICEKINDPAY_AVANS: TFloatField;
    dsetItogNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetItogNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetItogNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetItogCNOTICEKINDPAY: TFloatField;
    dsetItogCNOTICEKINDPAY_T: TFloatField;
    dsetItogCONFIRMKINDPAY: TFloatField;
    dsetItogRETURN: TFloatField;
    dsetItogREUSE: TFloatField;
    dsetItogITOGO_OUT: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
    grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_AVANS_T: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_CELEVOY_T: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewCNOTICEKINDPAY_T: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure grdTurnoverSheetDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
    procedure dsetDataAfterClose(DataSet: TDataSet);
    procedure dsetItogBeforeQuery(Sender: TOracleDataSet);
    procedure dsetDataAfterQuery(Sender: TOracleDataSet);
  private
    fAccountID : integer; // Р01.00.00
  protected
    function GetAccountCode : string; override;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
    function GetXLSDetailName: string;override;    
  public
  end;

implementation

uses cxGridDBDataDefinitions;

{$R *.dfm}

function TqTurnoverF22_1808Form.GetAccountCode : string;
begin
  Result := 'Р01.00.00'
end;

function TqTurnoverF22_1808Form.GetAppendixNo : string;
begin
  Result := '0';
end;

function TqTurnoverF22_1808Form.GetFormNo : string;
begin
  Result := '0';
end;

function TqTurnoverF22_1808Form.GetXLSName : string;
begin
  Result := 'OB_F22_1808.xls';
end;

procedure TqTurnoverF22_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF22_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF22_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF22_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF22_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF22_1808Form.dsetItogBeforeQuery(
  Sender: TOracleDataSet);
var
  I: Integer;
  F: TField;
begin
  for I := 0 to Sender.VariableCount - 1 do
  begin
    F := dsetParams.FindField( Copy( Sender.VariableName(I), 2, MaxInt ) );
    if Assigned( F ) then
      begin
        Sender.SetVariable(I, F.AsVariant);
      end;
  end;
  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
  with Sender do
    if dsetParams.FieldByName('CURRID').AsInteger <> -1 then
      begin
        if (VariableIndex('rur') >= 0) then
          begin
            SetVariable( 'rur',          '' );
          end;
        if (VariableIndex('curr_fields') >= 0) then
          begin
            SetVariable( 'curr_fields' , '' );
          end;
        if (VariableIndex(cNsiCurr) >= 0) then
          SetVariable(cNsiCurr , 'operation_sum');
      end
    else
      begin
        if (VariableIndex('rur') >= 0) then
          begin
            SetVariable( 'rur',          '_rur' );
          end;
        if (VariableIndex('curr_fields') >= 0) then
          begin
            SetVariable( 'curr_fields' , ':currid = :currid --' );
          end;
        if VariableIndex(cNsiCurr) >= 0 then
          SetVariable(cNsiCurr , 'sum_rur');
      end;
end;

procedure TqTurnoverF22_1808Form.dsetDataAfterQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  if (dsetItog.Active) then
    begin
      dsetItog.Refresh;
    end
  else
    begin
      dsetItog.Open;
    end;
end;

function TqTurnoverF22_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_KBK.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF22_1808Form , 'OB_F22_1808');

end.
