unit qTurnoverF23_1808frm;

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
  TqTurnoverF23_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse_in: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewnoticekindpay_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewnoticekindpay_avans_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewcnoticekindpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse_out_totam: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse_out_tortu: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewcnoticekindpay_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewconfirmkindpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewItogo_budget: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewReuse_in: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewcnoticekindpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewReuse_out_totam: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewReuse_out_tortu: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewcnoticekindpay_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewconfirmkindpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewItogo_budget: TcxGridDBBandedColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataKBK: TStringField;
    dsetDataRETURN: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetLevel2: TcxGridLevel;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogKBK: TStringField;
    dsetItogRETURN: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
    dsetItogSubject: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    StringField8: TStringField;
    FloatField8: TFloatField;
    FloatField10: TFloatField;
    dsItogSubject: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableD2ViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewReuse_in: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewReuse_out_totam: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewReuse_out_tortu: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewconfirmkindpay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy_t: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewItogo_budget: TcxGridDBBandedColumn;
    dsetDataCUSTOMNAME: TStringField;
    dsetDataPOSTUPILO: TFloatField;
    dsetDataREUSE_IN: TFloatField;
    dsetDataNOTICEKINDPAY_AVANS: TFloatField;
    dsetDataNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetDataCNOTICEKINDPAY: TFloatField;
    dsetDataCNOTICEKINDPAY_T: TFloatField;
    dsetDataCONFIRMKINDPAY: TFloatField;
    dsetDataITOGO_BUDGET: TFloatField;
    dsetDataREUSE_OUT_TORTU: TFloatField;
    dsetDataREUSE_OUT_TOTAM: TFloatField;
    dsetItogCUSTOMNAME: TStringField;
    dsetItogPOSTUPILO: TFloatField;
    dsetItogREUSE_IN: TFloatField;
    dsetItogNOTICEKINDPAY_AVANS: TFloatField;
    dsetItogNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetItogNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetItogNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetItogCNOTICEKINDPAY: TFloatField;
    dsetItogCNOTICEKINDPAY_T: TFloatField;
    dsetItogCONFIRMKINDPAY: TFloatField;
    dsetItogITOGO_BUDGET: TFloatField;
    dsetItogREUSE_OUT_TORTU: TFloatField;
    dsetItogREUSE_OUT_TOTAM: TFloatField;
    dsetItogSubjectCUSTOMNAME: TStringField;
    dsetItogSubjectPOSTUPILO: TFloatField;
    dsetItogSubjectREUSE_IN: TFloatField;
    dsetItogSubjectNOTICEKINDPAY_AVANS: TFloatField;
    dsetItogSubjectNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetItogSubjectNOTICEKINDPAY_CELEVOY: TFloatField;
    dsetItogSubjectNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetItogSubjectCNOTICEKINDPAY: TFloatField;
    dsetItogSubjectCNOTICEKINDPAY_T: TFloatField;
    dsetItogSubjectCONFIRMKINDPAY: TFloatField;
    dsetItogSubjectITOGO_BUDGET: TFloatField;
    dsetItogSubjectREUSE_OUT_TORTU: TFloatField;
    dsetItogSubjectREUSE_OUT_TOTAM: TFloatField;
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
    fAccountID : integer; // Р06.20.00
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

function TqTurnoverF23_1808Form.GetAccountCode : string;
begin
  Result := 'Р06.20.00'
end;

function TqTurnoverF23_1808Form.GetAppendixNo : string;
begin
  Result := '0';
end;

function TqTurnoverF23_1808Form.GetFormNo : string;
begin
  Result := '23';
end;

function TqTurnoverF23_1808Form.GetXLSName : string;
begin
  Result := 'OB_F23_1808.xls';
end;

procedure TqTurnoverF23_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF23_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF23_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewItem_no.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewCustomName.Index ] = null)
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

procedure TqTurnoverF23_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF23_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF23_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF23_1808Form.dsetDataAfterQuery(
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
  if (dsetItogSubject.Active) then
    begin
      dsetItogSubject.Refresh;
    end
  else
    begin
      dsetItogSubject.Open;
    end;
end;

function TqTurnoverF23_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_TO.xls'
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF23_1808Form , 'OB_F23_1808');

end.
