unit qTurnoverF14_1808frm;

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
  TqTurnoverF14_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIsMadeOut: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewRemovedFromAcc: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewForNextPay: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewForPay: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetLevel2: TcxGridLevel;
    dsetItogSubject: TOracleDataSet;
    dsItogSubject: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNAME: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewISMADEOUT: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewZADOLG: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewZADOLG: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewISMADEOUT: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewFORNEXTPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewFORNEXTPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewFORPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewFORPAY: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewRETURN: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataISMADEOUT: TFloatField;
    dsetDataZADOLG: TFloatField;
    dsetDataFORNEXTPAY: TFloatField;
    dsetDataFORPAY: TFloatField;
    dsetDataRETURN: TFloatField;
    dsetDataREMOVEDFROMACC: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogINN: TStringField;
    dsetItogNAME: TStringField;
    dsetItogTYPE_PERSON: TStringField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItogISMADEOUT: TFloatField;
    dsetItogZADOLG: TFloatField;
    dsetItogFORNEXTPAY: TFloatField;
    dsetItogFORPAY: TFloatField;
    dsetItogRETURN: TFloatField;
    dsetItogREMOVEDFROMACC: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
    dsetItogSubjectID: TStringField;
    dsetItogSubjectPARENTID: TStringField;
    dsetItogSubjectITEM_NO: TStringField;
    dsetItogSubjectIN_SUMMA: TFloatField;
    dsetItogSubjectINN: TStringField;
    dsetItogSubjectNAME: TStringField;
    dsetItogSubjectTYPE_PERSON: TStringField;
    dsetItogSubjectDOC_NUMBER: TStringField;
    dsetItogSubjectISMADEOUT: TFloatField;
    dsetItogSubjectZADOLG: TFloatField;
    dsetItogSubjectFORNEXTPAY: TFloatField;
    dsetItogSubjectFORPAY: TFloatField;
    dsetItogSubjectRETURN: TFloatField;
    dsetItogSubjectREMOVEDFROMACC: TFloatField;
    dsetItogSubjectOUT_SUMMA: TFloatField;
    grdTurnoverSheetDBBandedTableD2ViewREMOVEDFROMACC: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewREMOVEDFROMACC: TcxGridDBColumn;
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
    fAccountID : integer; // 07.00.00
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

function TqTurnoverF14_1808Form.GetAccountCode : string;
begin
  Result := '07.00.00'
end;

function TqTurnoverF14_1808Form.GetAppendixNo : string;
begin
  Result := '16';
end;

function TqTurnoverF14_1808Form.GetFormNo : string;
begin
  Result := '14';
end;

function TqTurnoverF14_1808Form.GetXLSName : string;
begin
  Result := 'OB_F14_1808.xls';
end;

procedure TqTurnoverF14_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF14_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF14_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF14_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF14_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF14_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF14_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF14_1808Form.GetXLSDetailName: string;
begin
  if VarToStr(dsetItog.GetVariable('SUMMARN')) = 'Y' then
    Result := 'OB_Detail_by_TO.xls'
  else
    Result := 'OB_Detail_by_Subject.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF14_1808Form , 'OB_F14_1808');

end.
