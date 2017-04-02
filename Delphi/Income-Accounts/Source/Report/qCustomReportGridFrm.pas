unit qCustomReportGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDataFrm, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, DB,
  OracleData, dxBarExtDBItems, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridDBTableView, cxGrid, dxStatusBar, ExtCtrls, JvExControls, JvLabel,
  cxMaskEdit, cxButtonEdit, JvButton, JvTransparentButton, JvSpeedButton,
  StdCtrls, Buttons, xlcClasses, xlEngine, xlReport, dxBarExtItems, cxLabel,
  cxNavigator, cxDBNavigator;

type
  // Раздел «Отчёты» обрабатывает только наследников TfdcCustomDataForm
  TqCustomReportGridForm = class(TfdcCustomDataForm)
    dxStatusBar1: TdxStatusBar;
    grdData: TcxGrid;
    grdDataDBTableView: TcxGridDBTableView;
    grdDataDBBandedTableView: TcxGridDBBandedTableView;
    grdDataLevel: TcxGridLevel;
    dsetData: TOracleDataSet;
    dsData: TDataSource;
    actExcel: TAction;
    excelExport: TxlReport;
    bButExcel: TdxBarButton;
    bButRefresh: TdxBarButton;
    actRefresh: TAction;
    cxDBNavigator1: TcxDBNavigator;
    dxStatusBar1Container3: TdxStatusBarContainerControl;
    procedure FormCreate(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actExcelUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsetDataAfterScroll(DataSet: TDataSet);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure dsetDataBeforeOpen(DataSet: TDataSet);
    procedure dsetDataAfterOpen(DataSet: TDataSet);
    procedure JvThread1Execute(Sender: TObject; Params: Pointer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData;    
  end;

var
  myTime: TDateTime;

implementation

uses fdcCustomFrm;

{$R *.dfm}


procedure TqCustomReportGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  cxDBNavigator1.Parent := dxStatusBar1Container3;
  cxDBNavigator1.Align := alClient;
  grdDataDBBandedTableView.RestoreFromRegistry(
    FormLayoutRegistryKey + '\grdDataDBTableView', True, False, [], 'layout');
end;

procedure TqCustomReportGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  grdDataDBBandedTableView.StoreToRegistry(
    FormLayoutRegistryKey + '\grdDataDBTableView', True, [], 'layout');  
end;

procedure TqCustomReportGridForm.RefreshData;
begin
  try
    if dsetData.Active then
      dsetData.Refresh
     else
      dsetData.Open;
  except
    on E: Exception do
      MessageDlg('Ошибка выполнения запроса:' + #13#10 + E.Message, mtError, [mbOk], 0);      
  end;
  grdData.SetFocus;
end;


procedure TqCustomReportGridForm.actExcelExecute(Sender: TObject);
var
  ReportFile: string;
begin
  inherited;
  ReportFile := ExtractFilePath(Application.ExeName) + 'Report\' + 
    StringReplace(StringReplace(Name, 'GridForm', '', [rfIgnoreCase]), 'q', '', [rfIgnoreCase]) + '.xls';
  
  if not FileExists(ReportFile) then
  begin
    MessageDlg('Отсутствует файл макета печатной формы:' + #13#10 + ReportFile, mtError, [mbOk], 0);
    Exit;
  end;  
  excelExport.XLSTemplate := ReportFile;
  excelExport.ParamByName['ReportDate'].Value := Date();
  try
    excelExport.Report(True);
  except
    on E: Exception do
      MessageDlg('Ошибка формирования печатной формы отчёта:' + #13#10 + E.Message, mtError, [mbOk], 0);
  end;
end;

procedure TqCustomReportGridForm.actExcelUpdate(Sender: TObject);
begin
  actExcel.Enabled := dsetData.Active and (dsetData.RecordCount > 0);
end;

procedure TqCustomReportGridForm.dsetDataAfterScroll(DataSet: TDataSet);
begin
  if dsetData.RecordCount > 0 then
    dxStatusBar1.Panels[0].Text := IntToStr(dsetData.RecNo) + ' / ' + IntToStr(dsetData.RecordCount)
  else
    dxStatusBar1.Panels[0].Text := '';
end;

procedure TqCustomReportGridForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TqCustomReportGridForm.FormShow(Sender: TObject);
begin
  inherited;
  BarManager.CanCustomize := false;
  BarManager.Bars[0].AllowQuickCustomizing := False;  
end;

procedure TqCustomReportGridForm.actRefreshUpdate(Sender: TObject);
begin
  inherited;
  actRefresh.Enabled := dsetData.SQL.Count > 0;
end;

procedure TqCustomReportGridForm.dsetDataBeforeOpen(DataSet: TDataSet);
begin
  myTime := Time();
end;

procedure TqCustomReportGridForm.dsetDataAfterOpen(DataSet: TDataSet);
begin
  dxStatusBar1.Panels[1].Text := TimeToStr(Time() - myTime);
end;

procedure TqCustomReportGridForm.JvThread1Execute(Sender: TObject;
  Params: Pointer);
begin
  try
    if dsetData.Active then
      dsetData.Refresh
     else
      dsetData.Open;
  except
    on E: Exception do
      MessageDlg('Ошибка выполнения запроса:' + #13#10 + E.Message, mtError, [mbOk], 0);      
  end;
end;

initialization
  RegisterClass (TqCustomReportGridForm);

end.

