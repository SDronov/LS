unit qTurnoverF08_1808Frm;

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
  TqTurnoverF08_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_tpo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_others: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_u_avans: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_u_celevoy: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNACH_GTD: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNACH_TPO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNACH_OTHERS: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNACH_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_U_AVANS: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_U_CELEVOY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_CONFIRM: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewZadolg: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINCLUDE_ITOGO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataKBK: TStringField;
    dsetDataNACH_GTD: TFloatField;
    dsetDataNACH_TPO: TFloatField;
    dsetDataNACH_OTHERS: TFloatField;
    dsetDataNACH_ITOGO: TFloatField;
    dsetDataINCLUDE_U_AVANS: TFloatField;
    dsetDataINCLUDE_U_CELEVOY: TFloatField;
    dsetDataINCLUDE_CONFIRM: TFloatField;
    dsetDataINCLUDE_ITOGO: TFloatField;
    dsetDataZADOLG: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogKBK: TStringField;
    dsetItogNACH_GTD: TFloatField;
    dsetItogNACH_TPO: TFloatField;
    dsetItogNACH_OTHERS: TFloatField;
    dsetItogNACH_ITOGO: TFloatField;
    dsetItogINCLUDE_U_AVANS: TFloatField;
    dsetItogINCLUDE_U_CELEVOY: TFloatField;
    dsetItogINCLUDE_CONFIRM: TFloatField;
    dsetItogINCLUDE_ITOGO: TFloatField;
    dsetItogZADOLG: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
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
    fAccountID : integer; // 10.01.00
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

function TqTurnoverF08_1808Form.GetAccountCode : string;
begin
  Result := '10.01.00'
end;

function TqTurnoverF08_1808Form.GetAppendixNo : string;
begin
  Result := '10';
end;

function TqTurnoverF08_1808Form.GetFormNo : string;
begin
  Result := '8';
end;

function TqTurnoverF08_1808Form.GetXLSName : string;
begin
  Result := 'OB_F08_1808.xls';
end;

procedure TqTurnoverF08_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF08_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF08_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF08_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF08_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF08_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF08_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF08_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_KBK.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF08_1808Form , 'OB_F08_1808');

end.
