unit qTurnoverF09_1808Frm;

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
  TqTurnoverF09_1808Form = class(TCustomTurnoverSheetForm)
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
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewIn_summa_itogo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDocNumbe: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDocDate: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDocSumma: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewINST: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewRest: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewRESET: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewExcl: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewZab: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDView117: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA_ITOGO: TcxGridDBBandedColumn;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
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
    dsetDataEXCLUDE: TFloatField;
    dsetDataEXCLUDE_117: TFloatField;
    dsetDataOUT_SUMMA_ITOGO: TFloatField;
    dsetItogINN: TStringField;
    dsetItogNAME: TStringField;
    dsetItogTYPE_PERSON: TStringField;
    dsetItogPENY_ZADOLG: TStringField;
    dsetItogIN_SUMMA_ITOGO: TFloatField;
    dsetItogDOCNUMBER: TStringField;
    dsetItogDOCDATE: TDateTimeField;
    dsetItogDOCSUMMA: TFloatField;
    dsetItogINST: TFloatField;
    dsetItogRESET: TFloatField;
    dsetItogEXCLUDE: TFloatField;
    dsetItogEXCLUDE_117: TFloatField;
    dsetItogOUT_SUMMA_ITOGO: TFloatField;
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
    fAccountID : integer; // 03.00.00
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

function TqTurnoverF09_1808Form.GetAccountCode : string;
begin
  Result := '03.00.00'
end;

function TqTurnoverF09_1808Form.GetAppendixNo : string;
begin
  Result := '11';
end;

function TqTurnoverF09_1808Form.GetFormNo : string;
begin
  Result := '9';
end;

function TqTurnoverF09_1808Form.GetXLSName : string;
begin
  Result := 'OB_F09_1808.xls';
end;

procedure TqTurnoverF09_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF09_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF09_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF09_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF09_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF09_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF09_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF09_1808Form.GetXLSDetailName: string;
begin
  if VarToStr(dsetItog.GetVariable('SUMMARN')) = 'Y' then
    Result := 'OB_Detail_by_TO.xls'
  else
    Result := 'OB_Detail_by_Subject.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF09_1808Form , 'OB_F09_1808');

end.
