unit qTurnoverF10_1808frm;

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
  TqTurnoverF10_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNachisleno: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIsPaid: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewISREMOVED: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewISPAID_OTHER_ACC: TcxGridDBBandedColumn;
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
    grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewITEM_NO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewNACHISLENO: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewISPAID: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewISPAID: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewNACHISLENO: TcxGridDBColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataNACHISLENO: TFloatField;
    dsetDataISPAID: TFloatField;
    dsetDataOUT_SUMMA: TFloatField;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogINN: TStringField;
    dsetItogNAME: TStringField;
    dsetItogTYPE_PERSON: TStringField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItogDOC_DATE: TDateTimeField;
    dsetItogNACHISLENO: TFloatField;
    dsetItogISPAID: TFloatField;
    dsetItogOUT_SUMMA: TFloatField;
    dsetItogSubjectID: TStringField;
    dsetItogSubjectPARENTID: TStringField;
    dsetItogSubjectITEM_NO: TStringField;
    dsetItogSubjectIN_SUMMA: TFloatField;
    dsetItogSubjectINN: TStringField;
    dsetItogSubjectNAME: TStringField;
    dsetItogSubjectTYPE_PERSON: TStringField;
    dsetItogSubjectDOC_NUMBER: TStringField;
    dsetItogSubjectDOC_DATE: TDateTimeField;
    dsetItogSubjectISPAID: TFloatField;
    dsetItogSubjectNACHISLENO: TFloatField;
    dsetItogSubjectOUT_SUMMA: TFloatField;
    dsetItogSubjectISREMOVED: TFloatField;
    dsetItogSubjectISPAID_OTHER_ACC: TFloatField;
    dsetItogISREMOVED: TFloatField;
    dsetItogISPAID_OTHER_ACC: TFloatField;
    dsetDataISREMOVED: TFloatField;
    dsetDataISPAID_OTHER_ACC: TFloatField;
    grdTurnoverSheetDBBandedTableDViewISREMOVED: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewISREMOVED: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableDViewISPAID_OTHER_ACC: TcxGridDBColumn;
    grdTurnoverSheetDBBandedTableD2ViewISPAID_OTHER_ACC: TcxGridDBColumn;
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
    fAccountID : integer; // 04.00.00
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

function TqTurnoverF10_1808Form.GetAccountCode : string;
begin
  Result := '04.00.00'
end;

function TqTurnoverF10_1808Form.GetAppendixNo : string;
begin
  Result := '12';
end;

function TqTurnoverF10_1808Form.GetFormNo : string;
begin
  Result := '10';
end;

function TqTurnoverF10_1808Form.GetXLSName : string;
begin
  Result := 'OB_F10_1808.xls';
end;

procedure TqTurnoverF10_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF10_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF10_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF10_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF10_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF10_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF10_1808Form.dsetDataAfterQuery(
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

function TqTurnoverF10_1808Form.GetXLSDetailName: string;
begin
  if VarToStr(dsetItog.GetVariable('SUMMARN')) = 'Y' then
    Result := 'OB_Detail_by_TO.xls'
  else
    Result := 'OB_Detail_by_Subject.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF10_1808Form , 'OB_F10_1808');

end.
