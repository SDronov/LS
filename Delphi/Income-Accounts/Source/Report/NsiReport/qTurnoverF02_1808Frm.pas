unit qTurnoverF02_1808Frm;

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
  TqTurnoverF02_1808Form = class(TCustomTurnoverSheetForm)
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
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetItog: TOracleDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewBEZNAL: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINPATH: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewREUSE_Y: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewITOGO_IN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_AVANS: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_CELEVOY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewCNOTICEKINDPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewCONFIRMKINDPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewREUSE: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewITOGO_OUT: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn;
    dsetDataKBK: TStringField;
    dsetDataNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetDataNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetDataCNOTICEKINDPAY_T: TFloatField;
    dsetItogKBK: TStringField;
    dsetItogNOTICEKINDPAY_AVANS_T: TFloatField;
    dsetItogNOTICEKINDPAY_CELEVOY_T: TFloatField;
    dsetItogCNOTICEKINDPAY_T: TFloatField;
    grdTurnoverSheetDBBandedTableViewNOTICEKINDPAY_AVANS_T: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNOTICEKINDPAY_CELEVOY_T: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCNOTICEKINDPAY_T: TcxGridDBBandedColumn;
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
    fAccountID : integer; // 01.01.00
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

function TqTurnoverF02_1808Form.GetAccountCode : string;
begin
  Result := '01.01.00'
end;

function TqTurnoverF02_1808Form.GetAppendixNo : string;
begin
  Result := '4';
end;

function TqTurnoverF02_1808Form.GetFormNo : string;
begin
  Result := '2';
end;

function TqTurnoverF02_1808Form.GetXLSName : string;
begin
  Result := 'OB_F02_1808.xls';
end;

procedure TqTurnoverF02_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF02_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF02_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF02_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF02_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF02_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF02_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF02_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_KBK.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF02_1808Form , 'OB_F02_1808');

end.
