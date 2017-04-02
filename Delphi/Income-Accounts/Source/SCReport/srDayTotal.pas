unit srDayTotal;

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
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit;

type
  TsrDayTotalGridForm = class(TsrReportGridForm)
    cxTabControl1: TcxTabControl;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    dxMemData1: TdxMemData;

    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CUR_CODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PAY_TYPE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMMA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1REST_SUMMA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView2ITEM_DATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2DECL_ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2DECL_NO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2CUR_CODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2SUMMA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2REST_SUMMA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView3NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3TYPENAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3DOC_SUMMA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3CURR_CODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3S643: TcxGridDBBandedColumn;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource2: TDataSource;
    cxGrid1DBBandedTableView3INN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column10: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Post: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1: TcxGridDBBandedTableView;
    grdDataDBBandedTableView2: TcxGridDBBandedTableView;
    grdDataDBBandedTableView2Column1: TcxGridDBBandedColumn;
    grdDataDBBandedTableView2Column2: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1Column1: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1Column2: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1Column3: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1Column4: TcxGridDBBandedColumn;
    DataSource1: TDataSource;
    OracleDataSet4: TOracleDataSet;
    dxMemData2: TdxMemData;
    DataSource5: TDataSource;
    cxGrid1DBBandedTableView1TYPENAME: TcxGridDBBandedColumn;
    actCollapse: TAction;
    actExpand: TAction;
    btnExpand: TdxBarButton;
    btnCollapse: TdxBarButton;
    OracleDataSet5: TOracleDataSet;
    srcOra5: TDataSource;
    grdDataDBBandedTableView3: TcxGridDBBandedTableView;
    OracleDataSet5SUMMA: TFloatField;
    OracleDataSet5CURR_CODE: TStringField;
    OracleDataSet5NAME: TStringField;
    OracleDataSet5PAYMENT_TYPE: TStringField;
    grdDataDBBandedTableView3RecId: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3PAYMENT_TYPE: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableView3CURR_CODE: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    OracleDataSet5ID: TFloatField;
    grdDataDBBandedTableView3Column1: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure cxTabControl1Change(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actAutoFilterExecute(Sender: TObject);
    procedure dxMemData1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure actOpenUpdate(Sender: TObject);
    procedure actCollapseExecute(Sender: TObject);
    procedure actExpandExecute(Sender: TObject);
    procedure cxTabControl1DrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  srDayTotalGridForm: TsrDayTotalGridForm;

implementation

uses MainDm, IniFiles, fdcCustomDBDataFrm, ObjServices, fdcUtils;

{$R *.dfm}

procedure TsrDayTotalGridForm.FormShow(Sender: TObject);
begin
//  inherited;
  try
   actRefresh.Execute;
  finally
    dsData.Active := OracleDataSet1.Active;
  end;
  GetObjectServices.NavigateForm(TfdcNavigableFormAdapter.Create(Self), False);
end;

procedure TsrDayTotalGridForm.cxTabControl1Change(Sender: TObject);
begin
  inherited;
  case cxTabControl1.TabIndex of
   0: begin
        dxMemData1.Filtered := False;
        grdDataLevel.GridView := cxGrid1DBBandedTableView1;
        cxGrid1DBBandedTableView1.Controller.ClearGrouping;
        cxGrid1DBBandedTableView1Post.Visible := False;
        cxGrid1DBBandedTableView1NAME.Visible := True;
        cxGrid1DBBandedTableView1PAY_TYPE.GroupBy(0);
      end;
   1: begin
        dxMemData1.Filtered := True;
        grdDataLevel.GridView := cxGrid1DBBandedTableView1;
        cxGrid1DBBandedTableView1.Controller.ClearGrouping;
        cxGrid1DBBandedTableView1Post.Visible := False;
        cxGrid1DBBandedTableView1NAME.Visible := True;
        cxGrid1DBBandedTableView1PAY_TYPE.GroupBy(0);
      end;
   2: begin
        dxMemData1.Filtered := False;
        grdDataLevel.GridView := cxGrid1DBBandedTableView1;
        cxGrid1DBBandedTableView1.Controller.ClearGrouping;
        cxGrid1DBBandedTableView1Post.Visible := False;
        cxGrid1DBBandedTableView1PAY_TYPE.Visible := True;
        cxGrid1DBBandedTableView1NAME.GroupBy(0);
      end;
   3: begin
        dxMemData1.Filtered := False;
        grdDataLevel.GridView := cxGrid1DBBandedTableView1;
        cxGrid1DBBandedTableView1.Controller.ClearGrouping;
        cxGrid1DBBandedTableView1PAY_TYPE.Visible := True;
        cxGrid1DBBandedTableView1Post.GroupBy(0);
        cxGrid1DBBandedTableView1NAME.GroupBy(1);
        cxGrid1DBBandedTableView1.DataController.Groups.FullCollapse;
      end;
   4: begin
        grdDataLevel.GridView := cxGrid1DBBandedTableView3;
        OracleDataSet3.Filter := 'SUMMA > 0';
        OracleDataSet3.Filtered := True;
      end;
   5: begin
        grdDataLevel.GridView := cxGrid1DBBandedTableView3;
        OracleDataSet3.Filter := 'SUMMA = 0';
        OracleDataSet3.Filtered := True;
      end;
   6: begin
        grdDataLevel.GridView := cxGrid1DBBandedTableView2;
      end;
   7: begin
        grdDataLevel.GridView := grdDataDBBandedTableView1;
      end;
   8: begin
        OracleDataSet5.Filtered := False;
        grdDataLevel.GridView := grdDataDBBandedTableView3;
      end;
  end;
end;

procedure TsrDayTotalGridForm.dsDataAfterOpen(DataSet: TDataSet);
  procedure ReOpenDataSets(DataSets: array of TOracleDataSet);
  var
    I: Integer;
  begin
    for I := 0 to High(DataSets) do
    begin
      DataSets[I].SetVariable('dat1', edtFrom.Date);
      DataSets[I].SetVariable('dat2', edtTo.Date);
      if DataSets[I].Active then DataSets[I].Refresh
        else DataSets[I].Open;
    end;
  end;
begin
  inherited;
  fdcUtils.DisplayBusyCursor;
  ReOpenDataSets([OracleDataSet1,OracleDataSet2,OracleDataSet3,OracleDataSet4, OracleDataSet5]);
  BuildDataSet(OracleDataSet1, dxMemData1, 'ID;NAME;TYPENAME;PAY_TYPE;CUSTOMS_CODE', 'CUR_CODE', 'S;P;E;PC;EC;MS');
  BuildDataSet(OracleDataSet4, dxMemData2, 'DOC_DATE', 'CUR_CODE', 'S');
  cxGrid1DBBandedTableView1.DataController.Groups.FullCollapse;
end;

procedure TsrDayTotalGridForm.actAutoFilterExecute(Sender: TObject);
begin
  inherited;
  cxGrid1DBBandedTableView1.OptionsView.GroupByBox :=
     cxGrid1DBBandedTableView1.OptionsCustomize.ColumnFiltering;
end;

procedure TsrDayTotalGridForm.dxMemData1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := DataSet.FieldByName('TYPENAME').AsString <> 'ва';
end;

procedure TsrDayTotalGridForm.actOpenUpdate(Sender: TObject);
begin
  inherited;
  if cxTabControl1.TabIndex=7 then
    TAction(Sender).Enabled := False
    else
    TAction(Sender).Enabled := True;
end;

procedure TsrDayTotalGridForm.actCollapseExecute(Sender: TObject);
begin
  inherited;
  grdDataLevel.GridView.DataController.Groups.FullCollapse;
end;

procedure TsrDayTotalGridForm.actExpandExecute(Sender: TObject);
begin
  inherited;
  grdDataLevel.GridView.DataController.Groups.FullExpand;
end;

procedure TsrDayTotalGridForm.cxTabControl1DrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
  inherited;
  if (AControl as TcxTabControl).TabIndex = ATab.Index then
    Font.Style := [fsBold];
end;

initialization
   RegisterClass(TsrDayTotalGridForm);

end.
