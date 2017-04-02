unit qTurnoverF13_1808frm;

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
  TqTurnoverF13_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewSumma_pp: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewin_BezNal: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_pay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReuse_out: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZach_ExPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZach_money_lien: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewSpisano_money_zalog: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataDOC_SUMMA: TFloatField;
    dsetDataKBK: TStringField;
    dsetDataIN_WAY: TStringField;
    dsetDataIN_BEZNAL: TFloatField;
    dsetDataZACH_EXPAY: TFloatField;
    dsetDataZACH_MONEY_LIEN: TFloatField;
    dsetDataOUT_NACH_TYPE: TStringField;
    dsetDataOUT_PAY: TFloatField;
    dsetDataSPISANO_MONEY_ZALOG: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataREUSE_OUT: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetLevel2: TcxGridLevel;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogINN: TStringField;
    dsetItogNAME: TStringField;
    dsetItogTYPE_PERSON: TStringField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItogDOC_DATE: TDateTimeField;
    dsetItogDOC_SUMMA: TFloatField;
    dsetItogKBK: TStringField;
    dsetItogIN_WAY: TStringField;
    dsetItogIN_BEZNAL: TFloatField;
    dsetItogZACH_EXPAY: TFloatField;
    dsetItogZACH_MONEY_LIEN: TFloatField;
    dsetItogOUT_NACH_TYPE: TStringField;
    dsetItogOUT_PAY: TFloatField;
    dsetItogSPISANO_MONEY_ZALOG: TFloatField;
    dsetItogRETURN: TFloatField;
    dsetItogREUSE_OUT: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
    dsetItogSubject: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField10: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    dsItogSubject: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNAME: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewDOC_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_BEZNAL: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_WAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_NACH_TYPE: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_PAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewRETURN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewREUSE_OUT: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewSPISANO_MONEY_ZALOG: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewZACH_EXPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewZACH_MONEY_LIEN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_PAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_BEZNAL: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewREUSE_OUT: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewSPISANO_MONEY_ZALOG: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewZACH_EXPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewZACH_MONEY_LIEN: TcxGridDBColumn;
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
    fAccountID : integer; // 06.00.00
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

function TqTurnoverF13_1808Form.GetAccountCode : string;
begin
  Result := '06.00.00'
end;

function TqTurnoverF13_1808Form.GetAppendixNo : string;
begin
  Result := '15';
end;

function TqTurnoverF13_1808Form.GetFormNo : string;
begin
  Result := '13';
end;

function TqTurnoverF13_1808Form.GetXLSName : string;
begin
  Result := 'OB_F13_1808.xls';
end;

procedure TqTurnoverF13_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF13_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF13_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewItem_no.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewInn.Index ] = null)
     and (AViewInfo.GridRecord.Values[ grdTurnoverSheetDBBandedTableViewName.Index ] = null)
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

procedure TqTurnoverF13_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF13_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF13_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF13_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF13_1808Form.GetXLSDetailName: string;
begin
  if VarToStr(dsetItog.GetVariable('SUMMARN')) = 'Y' then
    Result := 'OB_Detail_by_TO.xls'
  else
    Result := 'OB_Detail_by_Subject.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF13_1808Form , 'OB_F13_1808');

end.
