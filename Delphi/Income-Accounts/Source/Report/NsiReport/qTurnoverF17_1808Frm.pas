unit qTurnoverF17_1808Frm;

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
  TqTurnoverF17_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIN_SUMMA_ITOGO: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTYPE_PERSON: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewdebit: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewdebit: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewInn: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA_ITOGO: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataKBK: TStringField;
    dsetDataIN_SUMMA_ITOGO: TFloatField;
    dsetDataOUT_SUMMA_ITOGO: TFloatField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogKBK: TStringField;
    dsetItogIN_SUMMA_ITOGO: TFloatField;
    dsetItogOUT_SUMMA_ITOGO: TFloatField;
    dsetItog_kbk: TOracleDataSet;
    dsetItog_kbkID: TStringField;
    dsetItog_kbkPARENTID: TStringField;
    dsetItog_kbkITM_NO: TStringField;
    dsItog_kbk: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetLevel2: TcxGridLevel;
    grdTurnoverSheetDBBandedTableD2ViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewPostupilo: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2Viewdebit: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA_ITOGO: TcxGridDBColumn;
    dsetDataPOSTUPILO: TFloatField;
    dsetDataDEBIT: TFloatField;
    dsetItogPOSTUPILO: TFloatField;
    dsetItogDEBIT: TFloatField;
    dsetItog_kbkKBK: TStringField;
    dsetItog_kbkPOSTUPILO: TFloatField;
    dsetItog_kbkDEBIT: TFloatField;
    dsetItog_kbkOUT_SUMMA_ITOGO: TFloatField;
    dsetItog_kbkIN_SUMMA_ITOGO: TFloatField;
    grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewName: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableViewdoc_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDoc_number: TcxGridDBColumn;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetItogINN: TStringField;
    dsetItogNAME: TStringField;
    dsetItogTYPE_PERSON: TStringField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItog_kbkINN: TStringField;
    dsetItog_kbkNAME: TStringField;
    dsetItog_kbkTYPE_PERSON: TStringField;
    dsetItog_kbkDOC_NUMBER: TStringField;
    grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn;
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
    fAccountID : integer; // 12.01.00
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

function TqTurnoverF17_1808Form.GetAccountCode : string;
begin
  Result := '12.01.00'
end;

function TqTurnoverF17_1808Form.GetAppendixNo : string;
begin
  Result := '19';
end;

function TqTurnoverF17_1808Form.GetFormNo : string;
begin
  Result := '17';
end;

function TqTurnoverF17_1808Form.GetXLSName : string;
begin
  Result := 'OB_F17_1808.xls';
end;

procedure TqTurnoverF17_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF17_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF17_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF17_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF17_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF17_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF17_1808Form.dsetDataAfterQuery(
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
  if (dsetItog_kbk.Active) then
    begin
      dsetItog_kbk.Refresh;
    end
  else
    begin
      dsetItog_kbk.Open;
    end;
end;

function TqTurnoverF17_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_KBK.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF17_1808Form , 'OB_F17_1808');

end.
