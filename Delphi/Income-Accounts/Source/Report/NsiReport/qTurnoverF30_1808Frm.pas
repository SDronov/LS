unit qTurnoverF30_1808Frm;

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
  TqTurnoverF30_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIN_SUMMA_ITOGO: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocType: TcxGridDBBandedColumn;
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
    grdTurnoverSheetDBBandedTableDViewDocType: TcxGridDBColumn;
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
    dsetItogDocType: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    dsItogDocType: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetLevel2: TcxGridLevel;
    grdTurnoverSheetDBBandedTableD2ViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewPostupilo: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2Viewdebit: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewDocType: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA_ITOGO: TcxGridDBColumn;
    dsetDataDOCTYPE: TStringField;
    dsetDataPOSTUPILO: TFloatField;
    dsetDataDEBIT: TFloatField;
    dsetItogDOCTYPE2: TStringField;
    dsetItogPOSTUPILO: TFloatField;
    dsetItogDEBIT: TFloatField;
    dsetItogDocTypeDOCTYPE: TStringField;
    dsetItogDocTypeKBK: TStringField;
    dsetItogDocTypePOSTUPILO: TFloatField;
    dsetItogDocTypeDEBIT: TFloatField;
    dsetItogDocTypeOUT_SUMMA_ITOGO: TFloatField;
    dsetItogDocTypeIN_SUMMA_ITOGO: TFloatField;
    grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBColumn;
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
    fAccountID : integer; // Ф12.10.00
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

function TqTurnoverF30_1808Form.GetAccountCode : string;
begin
  Result := 'Ф12.10.00'
end;

function TqTurnoverF30_1808Form.GetAppendixNo : string;
begin
  Result := '0';
end;

function TqTurnoverF30_1808Form.GetFormNo : string;
begin
  Result := '30';
end;

function TqTurnoverF30_1808Form.GetXLSName : string;
begin
  Result := 'OB_F30_1808.xls';
end;

procedure TqTurnoverF30_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF30_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF30_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF30_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF30_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF30_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF30_1808Form.dsetDataAfterQuery(
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
  if (dsetItogDocType.Active) then
    begin
      dsetItogDocType.Refresh;
    end
  else
    begin
      dsetItogDocType.Open;
    end;
end;

function TqTurnoverF30_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_KBK.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF30_1808Form , 'OB_F30_1808');

end.
