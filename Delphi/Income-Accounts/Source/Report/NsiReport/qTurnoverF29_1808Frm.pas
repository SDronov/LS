unit qTurnoverF29_1808frm;

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
  TqTurnoverF29_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDoc_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDebit: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDoc_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDebit: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDoc_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDoc_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewOut_summa: TcxGridDBBandedColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetLevel2: TcxGridLevel;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
    dsetItogSubject: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField10: TFloatField;
    dsItogSubject: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableD2ViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewDebit: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewDoc_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewDoc_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewOut_summa: TcxGridDBBandedColumn;
    dsetDataCUSTOMNAME: TStringField;
    dsetDataPOSTUPILO: TFloatField;
    dsetItogCUSTOMNAME: TStringField;
    dsetItogPOSTUPILO: TFloatField;
    dsetItogSubjectCUSTOMNAME: TStringField;
    dsetItogSubjectPOSTUPILO: TFloatField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataDEBIT: TFloatField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItogDOC_DATE: TDateTimeField;
    dsetItogDEBIT: TFloatField;
    dsetItogSubjectDOC_NUMBER: TStringField;
    dsetItogSubjectDOC_DATE: TDateTimeField;
    dsetItogSubjectDEBIT: TFloatField;
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
    fAccountID : integer; // Ф09.00.00
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

function TqTurnoverF29_1808Form.GetAccountCode : string;
begin
  Result := 'Ф09.00.00'
end;

function TqTurnoverF29_1808Form.GetAppendixNo : string;
begin
  Result := '0';
end;

function TqTurnoverF29_1808Form.GetFormNo : string;
begin
  Result := '29';
end;

function TqTurnoverF29_1808Form.GetXLSName : string;
begin
  Result := 'OB_F29_1808.xls';
end;

procedure TqTurnoverF29_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF29_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF29_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF29_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF29_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF29_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF29_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF29_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_TO.xls'
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF29_1808Form , 'OB_F29_1808');

end.
