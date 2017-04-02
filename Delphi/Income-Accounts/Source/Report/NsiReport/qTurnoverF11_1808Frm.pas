unit qTurnoverF11_1808Frm;

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
  TqTurnoverF11_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInst_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRest_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_uv_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcl_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZab_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPay_other_acc: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewExcl_117: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_uv_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINST_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewRest_itogo: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_UV_AVANS: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_UV_CELEVOY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_CONFIRM: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewEXCL_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA_ITOGO: TFloatField;
    dsetDataINST_ITOGO: TFloatField;
    dsetDataINCLUDE_UV_AVANS: TFloatField;
    dsetDataINCLUDE_UV_CELEVOY: TFloatField;
    dsetDataINCLUDE_CONFIRM: TFloatField;
    dsetDataINCLUDE_ITOGO: TFloatField;
    dsetDataEXCL_ITOGO: TFloatField;
    dsetDataPAY_OTHER_ACC: TFloatField;
    dsetDataEXCL_117: TFloatField;
    dsetDataOUT_SUMMA_ITOGO: TFloatField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogKBK: TStringField;
    dsetItogIN_SUMMA_ITOGO: TFloatField;
    dsetItogINST_ITOGO: TFloatField;
    dsetItogINCLUDE_UV_AVANS: TFloatField;
    dsetItogINCLUDE_UV_CELEVOY: TFloatField;
    dsetItogINCLUDE_CONFIRM: TFloatField;
    dsetItogINCLUDE_ITOGO: TFloatField;
    dsetItogEXCL_ITOGO: TFloatField;
    dsetItogPAY_OTHER_ACC: TFloatField;
    dsetItogEXCL_117: TFloatField;
    dsetItogOUT_SUMMA_ITOGO: TFloatField;
    grdTurnoverSheetDBBandedTableDViewZab_itogo: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewEXCL_117: TcxGridDBColumn;
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
    fAccountID : integer; // 11.00.00
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

function TqTurnoverF11_1808Form.GetAccountCode : string;
begin
  Result := '11.00.00'
end;

function TqTurnoverF11_1808Form.GetAppendixNo : string;
begin
  Result := '13';
end;

function TqTurnoverF11_1808Form.GetFormNo : string;
begin
  Result := '11';
end;

function TqTurnoverF11_1808Form.GetXLSName : string;
begin
  Result := 'OB_F11_1808.xls';
end;

procedure TqTurnoverF11_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF11_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF11_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF11_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF11_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF11_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF11_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF11_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_KBK.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF11_1808Form , 'OB_F11_1808');

end.
