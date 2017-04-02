unit qTurnoverF24_1808frm;

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
  TqTurnoverF24_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDoc_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDebit: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDoc_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocType: TcxGridDBBandedColumn;
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
    grdTurnoverSheetDBBandedTableDViewDocType: TcxGridDBBandedColumn;
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
    grdTurnoverSheetDBBandedTableD2ViewDocType: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewOut_summa: TcxGridDBBandedColumn;
    dsetDataCUSTOMNAME: TStringField;
    dsetDataPOSTUPILO: TFloatField;
    dsetItogCUSTOMNAME: TStringField;
    dsetItogPOSTUPILO: TFloatField;
    dsetItogSubjectCUSTOMNAME: TStringField;
    dsetItogSubjectPOSTUPILO: TFloatField;
    dsetDataDOCTYPE: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataDEBIT: TFloatField;
    dsetItogDOCTYPE: TStringField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItogDOC_DATE: TDateTimeField;
    dsetItogDEBIT: TFloatField;
    dsetItogSubjectDOCTYPE: TStringField;
    dsetItogSubjectDOC_NUMBER: TStringField;
    dsetItogSubjectDOC_DATE: TDateTimeField;
    dsetItogSubjectDEBIT: TFloatField;
    dsetItog_doctype: TOracleDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField7: TStringField;
    FloatField4: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField5: TFloatField;
    dsItog_Doctype: TDataSource;
    grdTurnoverSheetLevel3: TcxGridLevel;
    grdTurnoverSheetDBBandedTableD3View: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableD3ViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewCustomName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewPostupilo: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewDebit: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewDoc_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewDocType: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewOut_summa: TcxGridDBBandedColumn;
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
    fAccountID : integer; // Р09.10.00
    fAccountID_reuse : integer; // Р09.20.00
  protected
    function GetAccountCode : string; override;
    function GetAccountCode_reuse : string;
    function GetAppendixNo : string;  override;
    function GetFormNo : string;      override;
    function GetXLSName : string;     override;
    function GetXLSDetailName: string;override;
  public
  end;

implementation

uses cxGridDBDataDefinitions;

{$R *.dfm}

function TqTurnoverF24_1808Form.GetAccountCode : string;
begin
  Result := 'Р09.10.00'
end;

function TqTurnoverF24_1808Form.GetAccountCode_reuse : string;
begin
  Result := 'Р09.20.00'
end;

function TqTurnoverF24_1808Form.GetAppendixNo : string;
begin
  Result := '0';
end;

function TqTurnoverF24_1808Form.GetFormNo : string;
begin
  Result := '24';
end;

function TqTurnoverF24_1808Form.GetXLSName : string;
begin
  Result := 'OB_F24_1808.xls';
end;

procedure TqTurnoverF24_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  fAccountID_reuse := GetAccountID( GetAccountCode_reuse );
  pvisible_detail := true;
end;

procedure TqTurnoverF24_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
  Sender.SetVariable('account_id_reuse', fAccountID_reuse);
  Sender.SetVariable('account_code_reuse', GetAccountCode_reuse);
end;

procedure TqTurnoverF24_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF24_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF24_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF24_1808Form.dsetItogBeforeQuery(
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
  Sender.SetVariable('account_id_reuse', fAccountID_reuse);
  Sender.SetVariable('account_code_reuse', GetAccountCode_reuse);
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

procedure TqTurnoverF24_1808Form.dsetDataAfterQuery(
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
  if (dsetItog_Doctype.Active) then
    begin
      dsetItog_Doctype.Refresh;
    end
  else
    begin
      dsetItog_Doctype.Open;
    end;
end;

function TqTurnoverF24_1808Form.GetXLSDetailName: string;
begin
  Result := 'OB_Detail_by_TO.xls'
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF24_1808Form , 'OB_F24_1808');

end.
