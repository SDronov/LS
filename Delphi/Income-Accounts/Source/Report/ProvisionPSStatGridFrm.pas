unit ProvisionPSStatGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDBDataFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, ExtCtrls, TeeProcs, TeEngine, Chart,
  DbChart, Series, ComCtrls, cxPC, cxControls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxBarExtItems, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  OracleData, fdcUtils;

type
  TProvisionPSStatGridForm = class(TfdcCustomDBDataForm)
    pcMain: TcxPageControl;
    tabChart: TcxTabSheet;
    tabGrid: TcxTabSheet;
    grdData: TcxGrid;
    grdDataDBTableView: TcxGridDBTableView;
    grdDataDBTableViewID: TcxGridDBColumn;
    grdDataDBTableViewTYPESYSNAME: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME: TcxGridDBColumn;
    grdDataDBTableViewNAME: TcxGridDBColumn;
    grdDataDBTableViewDESCRIPT: TcxGridDBColumn;
    grdDataDBBandedTableView: TcxGridDBBandedTableView;
    grdDataLevel: TcxGridLevel;
    grdDataDBBandedTableViewPS_NAME: TcxGridDBBandedColumn;
    siDateFrom: TdxBarStatic;
    dxBarContainerItem1: TdxBarContainerItem;
    sicDateFrom: TdxBarControlContainerItem;
    siDateTo: TdxBarStatic;
    sicDateTo: TdxBarControlContainerItem;
    editDateFrom: TcxDateEdit;
    editDateTo: TcxDateEdit;
    ChartMain: TChart;
    srcStat: TDataSource;
    dsDataPS_SYSNAME: TStringField;
    dsDataPS_NAME: TStringField;
    dsDataPROVISION_SUMM: TFloatField;
    dsDataPROVISION_UPDATE: TDateTimeField;
    dsDataCHECK_SUMM: TFloatField;
    dsDataCHECK_UPDATE: TDateTimeField;
    dsDataPS_SHORTNAME: TStringField;
    dsDataPS_INN: TStringField;
    dsDataPS_KPP: TStringField;
    dsDataPS_OGRN: TStringField;
    grdDataLevel1: TcxGridLevel;
    grdDataDBBandedTableView1: TcxGridDBBandedTableView;
    grdDataDBBandedTableView1PS_SYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1DIFF_DAY: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1DIFF: TcxGridDBBandedColumn;
    grdDataDBBandedTableView1PROVISION_SUMM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPS_SYSNAME: TcxGridDBBandedColumn;
    dsDataCOLOR: TFloatField;
    SaveDialogMain: TSaveDialog;
    actPrint: TAction;
    dxBarButton1: TdxBarButton;
    dsStat: TfdcQuery;
    dsStatDIFF_DAY: TDateTimeField;
    dsStatPS_SYSNAME: TStringField;
    dsStatDIFF: TFloatField;
    dsStatPROVISION_SUMM: TFloatField;
    dsStatCHECK_SUMM: TFloatField;
    grdDataDBBandedTableView1CHECK_SUMM: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeClose(DataSet: TDataSet);
    procedure dsStatBeforeOpen(DataSet: TDataSet);
    procedure dsStatAfterOpen(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure grdDataDBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    procedure RefreshChart;
  public
    { Public declarations }
  end;

var
  ProvisionPSStatGridForm: TProvisionPSStatGridForm;

implementation

{$R *.dfm}

procedure TProvisionPSStatGridForm.RefreshChart;
  var l_tmp_Series: TLineSeries;
      l_string_list, l_string_list_name: TStringList;
      l_i: Integer;
begin
  l_string_list := TStringList.Create;
  l_string_list_name := TStringList.Create;
  try
    //--
    dsData.First;
    while not(dsData.Eof) do
      begin
        l_string_list.Add(dsDataPS_SYSNAME.AsString);
        l_string_list_name.Add(dsDataPS_NAME.AsString);
        dsData.Next;
      end;
    dsData.First;
    //--
    ChartMain.SeriesList.Clear;
    for l_i := 0 to (l_string_list.Count - 1) do
      begin
        l_tmp_Series := nil;
        l_tmp_Series := TLineSeries.Create(Application);
        l_tmp_Series.ParentChart := ChartMain;
        l_tmp_Series.Title := l_string_list_name.Strings[l_i];
        l_tmp_Series.LineHeight := 3;

        //--
        with ChartMain.Series[ChartMain.SeriesCount - 1] do
          begin
            XValues.DateTime := true;
            Marks.Visible := true;
            //--
            dsStat.First;
            while not(dsStat.eof) do
              begin
                if (dsStatPS_SYSNAME.AsString = l_string_list.Strings[l_i]) then
                  begin
                    AddXY(dsStatDIFF_DAY.Value,dsStatDIFF.Value,'',dsDataCOLOR.AsInteger);
                  end;
                dsStat.Next;
              end;
          end;
      end;
  finally
    FreeAndNil(l_string_list);
    FreeAndNil(l_string_list_name);
  end;
end;

procedure TProvisionPSStatGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  editDateTo.EditValue := now;
  editDateFrom.EditValue := editDateTo.EditValue - 10;
  ChartMain.BottomAxis.Increment := DateTimeStep[ dtOneDay ] ;
end;

procedure TProvisionPSStatGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsStat.Open;
end;

procedure TProvisionPSStatGridForm.dsDataBeforeClose(DataSet: TDataSet);
begin
  inherited;
  dsStat.Close;
end;

procedure TProvisionPSStatGridForm.actPrintExecute(Sender: TObject);
begin
  if (SaveDialogMain.Execute) then
    begin
      ChartMain.SaveToBitmapFile(SaveDialogMain.FileName);
    end;
end;

procedure TProvisionPSStatGridForm.dsStatBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfdcQuery(DataSet).ParamByName('datefrom').Value := editDateFrom.EditValue;
  TfdcQuery(DataSet).ParamByName('dateto').Value := editDateTo.EditValue;
end;

procedure TProvisionPSStatGridForm.dsStatAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  RefreshChart;
end;

procedure TProvisionPSStatGridForm.grdDataDBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[ grdDataDBBandedTableView1DIFF.Index ] > 0) then
    begin
      ACanvas.Canvas.Brush.Style := bsSolid;
       ACanvas.Canvas.Brush.Color := IfElse(AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused,12686820, 12686815);
       ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    end;
end;

initialization
  RegisterClass(TProvisionPSStatGridForm);

end.
