unit srDayTotalNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxPC, dxmdaset, OracleData, dxBarExtItems, fdcObjectServices,
    srReport, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit,
  dxBarExtDBItems, Oracle;

type
  TsrDayTotalNewGridForm = class(TsrReportGridForm)
    cxTabControl1: TcxTabControl;
    dsetPaymentsReal: TOracleDataSet;
    dsetDebts: TOracleDataSet;
    dxMemData1: TdxMemData;
    dsDebts: TDataSource;
    dsBudget: TDataSource;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    dsetBudget: TOracleDataSet;
    dxMemData2: TdxMemData;
    dsPaymentsReal: TDataSource;
    actCollapse: TAction;
    actExpand: TAction;
    btnExpand: TdxBarButton;
    btnCollapse: TdxBarButton;
    dsetZachteno: TOracleDataSet;
    dsZachteno: TDataSource;
    dsetZachtenoSUMMA: TFloatField;
    dsetZachtenoCURR_CODE: TStringField;
    dsetZachtenoNAME: TStringField;
    dsetZachtenoPAYMENT_TYPE: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dsetZachtenoID: TFloatField;
    dsetPaymentsNonReal: TOracleDataSet;
    dsPaymentsNonReal: TDataSource;
    lkpDocType: TdxBarLookupCombo;
    mdDocType: TdxMemData;
    srDocType: TDataSource;
    dsDocType: TOracleDataSet;
    mdDocTypename: TStringField;
    dsDocTypename: TStringField;
    mdDocTypeid: TFloatField;
    dsDocTypeid: TFloatField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataTYPENAME: TStringField;
    dsDataNAME: TStringField;
    dsDataSUM_CHARGE: TFloatField;
    dsDataSUM_CONFIRM: TFloatField;
    dsDataSUM_NO_CONFIRM: TFloatField;
    dsDataSUMMA_DEPT: TFloatField;
    dsDataSUM_CHARGE_PERIOD: TFloatField;
    dsDataSUM_CONFIRM_PERIOD: TFloatField;
    dsDataSUM_NO_CONFIRM_PERIOD: TFloatField;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_CHARGE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_CONFIRM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_NO_CONFIRM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA_DEPT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_CHARGE_PERIOD: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_CONFIRM_PERIOD: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUM_NO_CONFIRM_PERIOD: TcxGridDBBandedColumn;
    grdDataDBTableViewPAYMENT_CODE: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME: TcxGridDBColumn;
    grdDataDBTableViewNAME: TcxGridDBColumn;
    grdDataDBTableViewSUM_CHARGE: TcxGridDBColumn;
    grdDataDBTableViewSUM_CONFIRM: TcxGridDBColumn;
    grdDataDBTableViewSUM_NO_CONFIRM: TcxGridDBColumn;
    grdDataDBTableViewSUMMA_DEPT: TcxGridDBColumn;
    grdDataDBTableViewSUM_CHARGE_PERIOD: TcxGridDBColumn;
    grdDataDBTableViewSUM_CONFIRM_PERIOD: TcxGridDBColumn;
    grdDataDBTableViewSUM_NO_CONFIRM_PERIOD: TcxGridDBColumn;
    dsDataSUMMA_DEPT_PERIOD: TFloatField;
    grdDataDBBandedTableViewSUMMA_DEPT_PERIOD: TcxGridDBBandedColumn;
    dsDataCUSTOMS_CODE: TStringField;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1: TcxGridDBBandedTableView;
    dsDataID: TFloatField;
    dsetPaymentsRealID: TFloatField;
    dsetPaymentsRealNAME: TStringField;
    dsetPaymentsRealPAYER_TEXT_ID: TStringField;
    dsetPaymentsRealTYPENAME: TStringField;
    dsetPaymentsRealCURR_CODE: TStringField;
    dsetPaymentsRealDOC_SUMMA: TFloatField;
    dsetPaymentsRealSUMMA: TFloatField;
    grdDataDBBandedTableView1NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1PAYER_TEXT_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1TYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1CURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1DOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1SUMMA: TcxGridDBBandedColumn;
    dsetPaymentsNonRealID: TFloatField;
    dsetPaymentsNonRealNAME: TStringField;
    dsetPaymentsNonRealPAYER_TEXT_ID: TStringField;
    dsetPaymentsNonRealTYPENAME: TStringField;
    dsetPaymentsNonRealCURR_CODE: TStringField;
    dsetPaymentsNonRealDOC_SUMMA: TFloatField;
    dsetPaymentsNonRealSUMMA: TFloatField;
    grdDataDBBandedTableView2: TcxGridDBBandedTableView;
    grdDataDBBandedTableView2SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableView2CURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView2NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView2PAYMENT_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView2ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3: TcxGridDBBandedTableView;
    dsetDebtsITEM_DATE: TDateTimeField;
    dsetDebtsDECL_ID: TFloatField;
    dsetDebtsDECL_NO: TStringField;
    dsetDebtsCUR_CODE: TStringField;
    dsetDebtsSUMMA: TFloatField;
    dsetDebtsREST_SUMMA: TFloatField;
    dsetDebtsID: TFloatField;
    dsetDebtsNAME: TStringField;
    grdDataDBBandedTableView3NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3ITEM_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3DECL_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3DECL_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3CUR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3REST_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3ID: TcxGridDBBandedColumn;
    dsetBudgetREESTR_ID: TFloatField;
    dsetBudgetTYPENAME: TStringField;
    dsetBudgetDOC_NUMBER: TStringField;
    dsetBudgetDOC_DATE: TDateTimeField;
    dsetBudgetDATE_SEND: TDateTimeField;
    dsetBudgetDATE_LOAD: TDateTimeField;
    dsetBudgetUVED_ID: TFloatField;
    dsetBudgetKBK_CODE_S: TStringField;
    dsetBudgetKBK_CODE_T: TStringField;
    dsetBudgetSUMMA: TFloatField;
    grdDataDBBandedTableView4: TcxGridDBBandedTableView;
    grdDataDBBandedTableView4REESTR_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4TYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4DOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4UVED_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4KBK_CODE_S: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4KBK_CODE_T: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4DATE_SEND: TcxGridDBBandedColumn;
    grdDataDBBandedTableView4DATE_LOAD: TcxGridDBBandedColumn;
    dsetZachtenoTYPENAME: TStringField;
    grdDataDBBandedTableView2TYPENAME: TcxGridDBBandedColumn;
    dsetSendBudget: TOracleDataSet;
    dsSendBudget: TDataSource;
    grdDataDBBandedTableView5: TcxGridDBBandedTableView;
    dsetSendBudgetCUSTOMS_CODE: TStringField;
    dsetSendBudgetA: TFloatField;
    dsetSendBudgetPAYMENT_CODE: TStringField;
    dsetSendBudgetB: TFloatField;
    dsetSendBudgetDOC_TYPE: TStringField;
    dsetSendBudgetC: TFloatField;
    dsetSendBudgetDOC_NAME: TStringField;
    dsetSendBudgetD: TFloatField;
    dsetSendBudgetPERECHISLENO: TFloatField;
    grdDataDBBandedTableView5CUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView5PAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView5DOC_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView5DOC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView5PERECHISLENO: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure cxTabControl1Change(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actAutoFilterExecute(Sender: TObject);
    procedure dxMemData1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure actOpenUpdate(Sender: TObject);
    procedure actCollapseExecute(Sender: TObject);
    procedure actExpandExecute(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsDataFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cxTabControl1DrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure dsetPaymentsRealBeforeQuery(Sender: TOracleDataSet);
    procedure actRefreshExecute(Sender: TObject);
    procedure dsetZachtenoBeforeQuery(Sender: TOracleDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport(AForm: TForm): Boolean;

var
  srDayTotalNewGridForm: TsrDayTotalNewGridForm;

implementation

uses MainDm, IniFiles, fdcCustomDBDataFrm, ObjServices, fdcUtils;

{$R *.dfm}


procedure SetSession(AForm: TForm; ASession: TOraclesession);
var
  i: integer;
begin
  for i:=0 to AForm.ComponentCount-1 do
  begin

    { TfdcQuery }
    if (AForm.Components[i] is TfdcQuery) and
       (not Assigned((AForm.Components[i] as TfdcQuery).Session)) then
      (AForm.Components[i] as TfdcQuery).Session := ASession;

    { TOracleDataset }
    if (AForm.Components[i] is TOracleDataset) and
       (not Assigned((AForm.Components[i] as TOracleDataset).Session)) then
      (AForm.Components[i] as TOracleDataset).Session := ASession;

    { TOracleQuery }
    if (AForm.Components[i] is TOracleQuery) and
       (not Assigned((AForm.Components[i] as TOracleQuery).Session)) then
      (AForm.Components[i] as TOracleQuery).Session := ASession;

  end;
end;

function  ExecReport(AForm: TForm): Boolean;
var
  F: TsrDayTotalNewGridForm;
begin
  F := TsrDayTotalNewGridForm.Create(AForm);
  try
    SetSession(F, MainData.Session);
    Result := True;
    f.Show;
  except
    F.Free;
    result := false;
  end;
end;

procedure TsrDayTotalNewGridForm.FormShow(Sender: TObject);
begin
  GetObjectServices.NavigateForm(TfdcNavigableFormAdapter.Create(Self), False);
end;

procedure TsrDayTotalNewGridForm.cxTabControl1Change(Sender: TObject);
begin
  inherited;
  case cxTabControl1.TabIndex of
   0: begin
        if    not dsData.Active
           or (dsData.Params.ParamByName( 'bdate' ).AsDate <> edtFrom.Date)
           or (dsData.Params.ParamByName( 'edate' ).AsDate <> edtTo.Date  ) then
          actRefresh.Execute;

        dsData.Filtered := False;
        grdDataLevel.GridView := grdDataDBBandedTableView;
        grdDataDBBandedTableView.Controller.ClearGrouping;
        grdDataDBBandedTableViewNAME.Visible := True;
        grdDataDBBandedTableViewCUSTOMS_CODE.Visible := False;
        grdDataDBBandedTableViewPAYMENT_CODE.GroupBy(0);
        grdDataDBBandedTableViewNAME.GroupBy(1);
      end;
   1: begin
        if    not dsData.Active
           or (dsData.Params.ParamByName( 'bdate' ).AsDate <> edtFrom.Date)
           or (dsData.Params.ParamByName( 'edate' ).AsDate <> edtTo.Date  ) then
          actRefresh.Execute;

        dsData.Filtered := True;
        grdDataLevel.GridView := grdDataDBBandedTableView;
        grdDataDBBandedTableView.Controller.ClearGrouping;
        grdDataDBBandedTableViewNAME.Visible := True;
        grdDataDBBandedTableViewCUSTOMS_CODE.Visible := False;
        grdDataDBBandedTableViewPAYMENT_CODE.GroupBy(0);
        grdDataDBBandedTableViewNAME.GroupBy(1);
      end;
   2: begin
        if    not dsData.Active
           or (dsData.Params.ParamByName( 'bdate' ).AsDate <> edtFrom.Date)
           or (dsData.Params.ParamByName( 'edate' ).AsDate <> edtTo.Date  ) then
          actRefresh.Execute;

        dsData.Filtered := False;
        grdDataLevel.GridView := grdDataDBBandedTableView;
        grdDataDBBandedTableView.Controller.ClearGrouping;
        grdDataDBBandedTableViewPAYMENT_CODE.Visible := True;
        grdDataDBBandedTableViewCUSTOMS_CODE.Visible := False;
        grdDataDBBandedTableViewTYPENAME.GroupBy(0);
        grdDataDBBandedTableViewNAME.GroupBy(1);
      end;
   3: begin
        if    not dsData.Active
           or (dsData.Params.ParamByName( 'bdate' ).AsDate <> edtFrom.Date)
           or (dsData.Params.ParamByName( 'edate' ).AsDate <> edtTo.Date  ) then
          actRefresh.Execute;

        dsData.Filtered := False;
        grdDataLevel.GridView := grdDataDBBandedTableView;
        grdDataDBBandedTableView.Controller.ClearGrouping;
        grdDataDBBandedTableViewPAYMENT_CODE.Visible := True;
        grdDataDBBandedTableViewCUSTOMS_CODE.Visible := True;
        grdDataDBBandedTableViewCUSTOMS_CODE.GroupBy(0);
        grdDataDBBandedTableViewNAME.GroupBy(1);
        grdDataDBBandedTableView.DataController.Groups.FullCollapse;
      end;
   4: begin
        grdDataLevel.GridView := grdDataDBBandedTableView1;
        grdDataDBBandedTableView1.DataController.DataSource := dsPaymentsReal;
        if    not dsetPaymentsReal.Active
           or (VarToDateTime( dsetPaymentsReal.GetVariable( 'bdate' ) ) <> edtFrom.Date)
           or (VarToDateTime( dsetPaymentsReal.GetVariable( 'edate' ) ) <> edtTo.Date  ) then
          actRefresh.Execute;
      end;
   5: begin
        grdDataLevel.GridView := grdDataDBBandedTableView1;
        grdDataDBBandedTableView1.DataController.DataSource := dsPaymentsNonReal;
        if    not dsetPaymentsNonReal.Active
           or (VarToDateTime( dsetPaymentsNonReal.GetVariable( 'bdate' ) ) <> edtFrom.Date)
           or (VarToDateTime( dsetPaymentsNonReal.GetVariable( 'edate' ) ) <> edtTo.Date  ) then
          actRefresh.Execute;
      end;
   6: begin
        grdDataLevel.GridView := grdDataDBBandedTableView3;
        if    not dsetDebts.Active
           or (VarToDateTime( dsetDebts.GetVariable( 'bdate' ) ) <> edtFrom.Date)
           or (VarToDateTime( dsetDebts.GetVariable( 'edate' ) ) <> edtTo.Date  ) then
          actRefresh.Execute;
      end;
   7: begin
        grdDataLevel.GridView := grdDataDBBandedTableView4;
        if    not dsetBudget.Active
           or (VarToDateTime( dsetBudget.GetVariable( 'bdate' ) ) <> edtFrom.Date)
           or (VarToDateTime( dsetBudget.GetVariable( 'edate' ) ) <> edtTo.Date  ) then
          actRefresh.Execute;
      end;
   8: begin
        grdDataLevel.GridView := grdDataDBBandedTableView2;
        if    not dsetZachteno.Active
           or (VarToDateTime( dsetZachteno.GetVariable( 'bdate' ) ) <> edtFrom.Date)
           or (VarToDateTime( dsetZachteno.GetVariable( 'edate' ) ) <> edtTo.Date  ) then
          actRefresh.Execute;
      end;
   9: begin
        grdDataLevel.GridView := grdDataDBBandedTableView5;
        if    not dsetZachteno.Active
           or (VarToDateTime( dsetSendBudget.GetVariable( 'bdate' ) ) <> edtFrom.Date)
           or (VarToDateTime( dsetSendBudget.GetVariable( 'edate' ) ) <> edtTo.Date  ) then
          actRefresh.Execute;
      end;
  end;
end;

procedure TsrDayTotalNewGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  grdDataDBBandedTableView.DataController.Groups.FullCollapse;
end;

procedure TsrDayTotalNewGridForm.actAutoFilterExecute(Sender: TObject);
begin
  inherited;
  grdDataDBBandedTableView.OptionsView.GroupByBox :=
     grdDataDBBandedTableView.OptionsCustomize.ColumnFiltering;
end;

procedure TsrDayTotalNewGridForm.dxMemData1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := DataSet.FieldByName('TYPENAME').AsString <> 'ТР';
end;

procedure TsrDayTotalNewGridForm.actOpenUpdate(Sender: TObject);
begin
  inherited;
  if cxTabControl1.TabIndex=7 then
    TAction(Sender).Enabled := False
    else
    TAction(Sender).Enabled := True;
end;

procedure TsrDayTotalNewGridForm.actCollapseExecute(Sender: TObject);
begin
  inherited;
  grdDataLevel.GridView.DataController.Groups.FullCollapse;
end;

procedure TsrDayTotalNewGridForm.actExpandExecute(Sender: TObject);
begin
  inherited;
  grdDataLevel.GridView.DataController.Groups.FullExpand;
end;

procedure TsrDayTotalNewGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet as TFdcQuery do
    begin
      Params.ParamByName( 'bdate' ).AsDate := edtFrom.Date;
      Params.ParamByName( 'edate' ).AsDate := edtTo.Date;
      Params.ParamByName( 'objecttypeid' ).AsFloat := lkpDocType.KeyValue;
    end;
end;

procedure TsrDayTotalNewGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  edtFrom.Date := Now;
  edtTo.Date   := Now;

  dsDocType.Open;
  mdDocType.Open;
  mdDocType.LoadFromDataSet(dsDocType);
  dsDocType.Close;

  lkpDocType.KeyValue:= 0;

  actRefresh.Execute;
end;

procedure TsrDayTotalNewGridForm.dsDataFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := DataSet.FieldByName('TYPENAME').AsString <> 'ТР';
end;

procedure TsrDayTotalNewGridForm.cxTabControl1DrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
  inherited;

  if (AControl as TcxTabControl).TabIndex = ATab.Index then
    Font.Style := [fsBold];
end;

procedure TsrDayTotalNewGridForm.dsetPaymentsRealBeforeQuery(
  Sender: TOracleDataSet);
begin
  Sender.SetVariable( 'bdate', trunc(edtFrom.Date) );
  Sender.SetVariable( 'edate', trunc(edtTo.Date)+0.99999 );
end;

procedure TsrDayTotalNewGridForm.actRefreshExecute(Sender: TObject);
begin
  ShowProgress('Чтение данных...');
  try
    case cxTabControl1.TabIndex of
      0,
      1,
      2,
      3 : begin
            dsData.Close;
            dsData.Open;
          end;
      4 : if dsetPaymentsReal.Active then
            dsetPaymentsReal.Refresh
          else
            dsetPaymentsReal.Open;
      5 : if dsetPaymentsNonReal.Active then
            dsetPaymentsNonReal.Refresh
          else
            dsetPaymentsNonReal.Open;
      6 : if dsetDebts.Active then
            dsetDebts.Refresh
          else
            dsetDebts.Open;
      7 : if dsetBudget.Active then
            dsetBudget.Refresh
          else
            dsetBudget.Open;
      8 : if dsetZachteno.Active then
            dsetZachteno.Refresh
          else
            dsetZachteno.Open;  
      9 : if dsetSendBudget.Active then
            dsetSendBudget.Refresh
          else
            dsetSendBudget.Open;  
    end;
  finally
    HideProgress;
  end;
end;

procedure TsrDayTotalNewGridForm.dsetZachtenoBeforeQuery(
  Sender: TOracleDataSet);
begin
  Sender.SetVariable( 'bdate', edtFrom.Date );
  Sender.SetVariable( 'edate', edtTo.Date   );
  Sender.SetVariable('objecttypeid', lkpDocType.KeyValue);
end;

initialization
   RegisterClass(TsrDayTotalNewGridForm);

end.
