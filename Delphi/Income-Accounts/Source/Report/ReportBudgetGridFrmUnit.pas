unit ReportBudgetGridFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ReportGridFrmUnit, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCheckBox, cxDropDownEdit, cxCalendar, cxCurrencyEdit, MainDm;

type
  TReportBudgetGridForm = class(TReportGridForm)
    lciCurrency: TdxLayoutItem;
    edtCurrency: TcxTextEdit;
    lciSumMin: TdxLayoutItem;
    edtSumMin: TcxCurrencyEdit;
    lciSumMax: TdxLayoutItem;
    edtSumMax: TcxCurrencyEdit;
    lciItogoSumma: TdxLayoutItem;
    labItogoSumma: TLabel;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataREP_NUMBER: TStringField;
    dsDataREP_DATE: TDateTimeField;
    dsDataIS_TS: TStringField;
    dsDataREPORT_TYPE_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataITOG_SUMMA: TFloatField;
    dsDataCURR_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataREPTYPE_NAME: TStringField;
    dsDataREPTYPE_SYSNAME: TStringField;
    dsDataREPTYPE_TEMPLATE_NAME: TStringField;
    grdDataDBBandedTableViewREP_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREP_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREPTYPE_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewITOG_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dxBarComboShow: TCustomdxBarCombo;
    dxBarComboShowData: TdxBarCombo;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure dxBarComboShowDataChange(Sender: TObject);
  private
    { Private declarations }
    fBuxReport : TBuxReport;
  public
    { Public declarations }
    property BuxReport:TBuxReport read fBuxReport;
  end;

var
  ReportBudgetGridForm: TReportBudgetGridForm;

implementation

uses qCustomBuxReportFrm, fdcCustomDataFrm, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TReportBudgetGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('SUM_MIN', edtSumMin.EditingValue);
  SetSearchParam('SUM_MAX', edtSumMax.EditingValue);
  SetSearchParam('CURRCODE', edtCurrency.EditingValue);
  dsData.ParamByName('show').AsInteger := dxBarComboShowData.ItemIndex;
end;

procedure TReportBudgetGridForm.actAddExecute(Sender: TObject);
begin
  TqCustomBuxReportForm.ShowReport( dsData.Session, BuxReport, nil );
  dsData.ReQuery;
end;

procedure TReportBudgetGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  fBuxReport := TBuxReport.Create;
end;

procedure TReportBudgetGridForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fBuxReport);
end;

procedure TReportBudgetGridForm.FormActivate(Sender: TObject);
begin
  inherited;
  MainData.load_BuxReport(fBuxReport, ParamByName('REPORT_TYPE_ID').Value);
end;

procedure TReportBudgetGridForm.actOpenExecute(Sender: TObject);
begin
  TqCustomBuxReportForm.ShowReport( dsData.Session, BuxReport, dsData.Fields );
end;

procedure TReportBudgetGridForm.dxBarComboShowDataChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

initialization
  RegisterClass(TReportBudgetGridForm);
end.
