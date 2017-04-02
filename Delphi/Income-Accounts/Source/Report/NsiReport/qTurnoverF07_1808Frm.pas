unit qTurnoverF07_1808frm;

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
  TqTurnoverF07_1808Form = class(TCustomTurnoverSheetForm)
    grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNumber_doc: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNach: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPaid: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPp_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPp_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewPp_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticePay_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticePay_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableViewNoticePay_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetLevel1: TcxGridLevel;
    dsetItog: TOracleDataSet;
    dsItog: TDataSource;
    grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewNumber_doc: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewDOC_DATE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewNach: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPaid: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewZadolg: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPp_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPp_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewPp_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewNoticePay_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewNoticePay_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableDViewNoticePay_summa: TcxGridDBBandedColumn;
    dsetDataID: TStringField;
    dsetDataPARENTID: TStringField;
    dsetDataITEM_NO: TStringField;
    dsetDataIN_SUMMA: TFloatField;
    dsetDataINN: TStringField;
    dsetDataOUT_SUMMA: TFloatField;
    grdTurnoverSheetLevel2: TcxGridLevel;
    dsetItogID: TStringField;
    dsetItogPARENTID: TStringField;
    dsetItogITEM_NO: TStringField;
    dsetItogIN_SUMMA: TFloatField;
    dsetItogINN: TStringField;
    dsetItogNAME: TStringField;
    dsetItogTYPE_PERSON: TStringField;
    dsetItogOUT_SUMMA: TFloatField;
    dsetItogSubject: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField10: TFloatField;
    dsItogSubject: TDataSource;
    grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView;
    grdTurnoverSheetDBBandedTableD2ViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewNumber_doc: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewNach: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewPaid: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewZadolg: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewPp_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewPp_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewPp_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewNoticePay_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewNoticePay_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD2ViewNoticePay_summa: TcxGridDBBandedColumn;
    dsetItogNACH_TYPE: TStringField;
    dsetItogDOC_NUMBER: TStringField;
    dsetItogDOC_DATE: TDateTimeField;
    dsetItogNACH: TFloatField;
    dsetItogPAID: TFloatField;
    dsetItogZADOLG: TFloatField;
    dsetItogPP_NUMBER: TStringField;
    dsetItogPP_DATE: TDateTimeField;
    dsetItogPP_SUMMA: TFloatField;
    dsetItogNPAY_NUMBER: TStringField;
    dsetItogNPAY_DATE: TDateTimeField;
    dsetItogNPAY_SUMMA: TFloatField;
    dsetDataNAME: TStringField;
    dsetDataTYPE_PERSON: TStringField;
    dsetDataNACH_TYPE: TStringField;
    dsetDataDOC_NUMBER: TStringField;
    dsetDataDOC_DATE: TDateTimeField;
    dsetDataNACH: TFloatField;
    dsetDataPAID: TFloatField;
    dsetDataZADOLG: TFloatField;
    dsetDataPP_NUMBER: TStringField;
    dsetDataPP_DATE: TDateTimeField;
    dsetDataPP_SUMMA: TFloatField;
    dsetDataNPAY_NUMBER: TStringField;
    dsetDataNPAY_DATE: TDateTimeField;
    dsetDataNPAY_SUMMA: TFloatField;
    dsetItogSubjectNACH_TYPE: TStringField;
    dsetItogSubjectDOC_NUMBER: TStringField;
    dsetItogSubjectDOC_DATE: TDateTimeField;
    dsetItogSubjectNACH: TFloatField;
    dsetItogSubjectPAID: TFloatField;
    dsetItogSubjectZADOLG: TFloatField;
    dsetItogSubjectPP_NUMBER: TStringField;
    dsetItogSubjectPP_DATE: TDateTimeField;
    dsetItogSubjectPP_SUMMA: TFloatField;
    dsetItogSubjectNPAY_NUMBER: TStringField;
    dsetItogSubjectNPAY_DATE: TDateTimeField;
    dsetItogSubjectNPAY_SUMMA: TFloatField;
    dsetItogSubjectDoc: TOracleDataSet;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField2: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField3: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField15: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField7: TFloatField;
    StringField16: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField8: TFloatField;
    dsItogSubjectDoc: TDataSource;
    grdTurnoverSheetDBBandedTableD3View: TcxGridDBTableView;
    grdTurnoverSheetLevel3: TcxGridLevel;
    grdTurnoverSheetDBBandedTableD3ViewItem_no: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewIn_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewINN: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewName: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewTypePerson: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewNumber_doc: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewDOC_DATE: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewOut_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewNach: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewPaid: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewZadolg: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewPp_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewPp_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewPp_summa: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewNoticePay_number: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewNoticePay_date: TcxGridDBBandedColumn;
    grdTurnoverSheetDBBandedTableD3ViewNoticePay_summa: TcxGridDBBandedColumn;
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
    fAccountID : integer; // 02.01.00
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

function TqTurnoverF07_1808Form.GetAccountCode : string;
begin
  Result := '02.01.00'
end;

function TqTurnoverF07_1808Form.GetAppendixNo : string;
begin
  Result := '9';
end;

function TqTurnoverF07_1808Form.GetFormNo : string;
begin
  Result := '7';
end;

function TqTurnoverF07_1808Form.GetXLSName : string;
begin
  Result := 'OB_F07_1808.xls';
end;

procedure TqTurnoverF07_1808Form.FormCreate(Sender: TObject);
begin
  inherited;
  fAccountID := GetAccountID( GetAccountCode );
  pvisible_detail := true;
end;

procedure TqTurnoverF07_1808Form.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;

  Sender.SetVariable('account_id', fAccountID);
  Sender.SetVariable('account_code', GetAccountCode);
end;

procedure TqTurnoverF07_1808Form.grdTurnoverSheetDBBandedTableViewCustomDrawCell(
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

procedure TqTurnoverF07_1808Form.grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
  inherited;
  grdTurnoverSheetDBBandedTableView.OptionsView.Footer:= TcxDBDataFilterCriteria(Sender).IsFiltering;
end;

procedure TqTurnoverF07_1808Form.dsetDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsetItog.Close;
end;

procedure TqTurnoverF07_1808Form.dsetItogBeforeQuery(
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

procedure TqTurnoverF07_1808Form.dsetDataAfterQuery(
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
  if (dsetItogSubjectDoc.Active) then
    begin
      dsetItogSubjectDoc.Refresh;
    end
  else
    begin
      dsetItogSubjectDoc.Open;
    end;
end;

function TqTurnoverF07_1808Form.GetXLSDetailName: string;
begin
  if VarToStr(dsetItog.GetVariable('SUMMARN')) = 'Y' then
    Result := 'OB_Detail_by_TO.xls'
  else
    Result := 'OB_Detail_by_Subject.xls';
end;

initialization
  RegisterTurnoverSheetClass ( TqTurnoverF07_1808Form , 'OB_F07_1808');

end.
