unit ActChangeOstKBKFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, fdcWord, xlcClasses, xlEngine, xlReport,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid;

type
  TActChangeOstKBKForm = class(TDocumentForm)
    lcgSign: TdxLayoutGroup;
    lciSignByChief: TdxLayoutItem;
    edtSignByChief: TcxDBLookupComboBox;
    lciSignBy: TdxLayoutItem;
    edtSignBy: TcxDBTextEdit;
    lciSignDate: TdxLayoutItem;
    edtSignDate: TcxDBDateEdit;
    odsGetBoss: TOracleDataSet;
    odsGetBossID: TFloatField;
    odsGetBossNAME: TStringField;
    dsGetBoss: TDataSource;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataPERSONAL_ACCOUNT_ID: TFloatField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    tabDocs: TcxTabSheet;
    lciCurrency: TdxLayoutItem;
    edtCurrency: TcxDBMaskEdit;
    lciSumma: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataCURRENCY: TStringField;
    dsReport: TfdcQuery;
    dsDetailPays: TfdcQuery;
    dsDetailPaysROWNUM: TFloatField;
    dsDetailPaysTYPENAME: TStringField;
    dsDetailPaysINN_P: TStringField;
    dsDetailPaysKPP_P: TStringField;
    dsDetailPaysNAME_P: TStringField;
    dsDetailPaysID: TFloatField;
    dsDetailPaysDOC_NUMBER: TStringField;
    dsDetailPaysDOC_DATE: TDateTimeField;
    dsDetailPaysSUMMA_ALL: TFloatField;
    dsDetailPaysKBK: TStringField;
    dsDetailPaysTO_KBKCODE: TStringField;
    dsDetailPaysSUMMA_DED: TFloatField;
    lcGeneralGroup2: TdxLayoutGroup;
    lciKBKList: TdxLayoutItem;
    grdKBKList: TcxGrid;
    grdKBKListDBTableView1: TcxGridDBTableView;
    grdKBKListLevel1: TcxGridLevel;
    dsKBKList: TfdcQuery;
    srcKBKList: TDataSource;
    dsKBKListID: TFloatField;
    dsKBKListDATE_BEGIN: TDateTimeField;
    dsKBKListDATE_END: TDateTimeField;
    dsKBKListFROM_KBKCODE: TStringField;
    dsKBKListTO_KBKCODE: TStringField;
    dsKBKListSUM_KBK: TFloatField;
    grdKBKListDBTableView1ID: TcxGridDBColumn;
    grdKBKListDBTableView1DATE_BEGIN: TcxGridDBColumn;
    grdKBKListDBTableView1DATE_END: TcxGridDBColumn;
    grdKBKListDBTableView1FROM_KBKCODE: TcxGridDBColumn;
    grdKBKListDBTableView1TO_KBKCODE: TcxGridDBColumn;
    grdKBKListDBTableView1SUM_KBK: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
  private
    fDocsForm : TForm;
  public
    function GetDocsFormClassName: string;
    procedure ShowExelReport;
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
  end;

implementation

uses fdcMessages, fdcCustomDataFrm, qReportUtil, fdcUtils;

{$R *.dfm}
function TActChangeOstKBKForm.GetDocsFormClassName: string;
begin
  Result := 'TActChangeOstKBKDocsGridForm';
end;

procedure TActChangeOstKBKForm.FormCreate(Sender: TObject);
begin
  inherited;
  fDocsForm := nil;
end;

procedure TActChangeOstKBKForm.tabDocsShow(Sender: TObject);
begin
  inherited;
  if not Assigned( fDocsForm ) then
    begin
      fDocsForm := ShowForm( GetDocsFormClassName, Params, tabDocs );
      with fDocsForm as TfdcCustomDataForm do
        RegisterWaiter( Self );
    end;
end;

procedure TActChangeOstKBKForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if  odsGetBoss.Active then
      odsGetBoss.Close;
  odsGetBoss.SetVariable('pName',dsData.FieldValues['SIGNED_BY_CHIEF']);
  odsGetBoss.Open;
  dsKBKList.Open;
end;

procedure TActChangeOstKBKForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  ShowExelReport;
end;

procedure TActChangeOstKBKForm.ShowExelReport;
  var
    xlAct : TxlReport;
    xlDS  : TxlDataSource;
begin
  xlAct := TxlReport.Create(Self);
  try
    // --- Ищем путь к шаблону отчета
    xlAct.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\act_change_ost_kbk_pril.xls';
  // --- Загружаем SQL
  LoadReportQueryEx(Self, xlAct.XLSTemplate);
  with xlAct.DataSources do
    begin
      xlDS := Add;
      xlDS.Alias := 'aHeader';
      xlDS.DataSet := dsData;

      xlDS := Add;
      xlDS.Alias := 'aPays';
      xlDS.Range := 'rngPays';
      xlDS.DataSet := dsDetailPays;
    end;

  dsDetailPays.Open;
   // --- generate report
  xlAct.Report(True);
  dsDetailPays.Close;
  finally
    xlAct.Free;
  end;
end;

function TActChangeOstKBKForm.GetTemplateReportName: string;
begin
  Result := 'Акт_переноса_по_КБК.doc';
end;

procedure TActChangeOstKBKForm.FillReportParams(AWord: TWordClass);
begin
  inherited;
  dsReport.Open;
  AWord.ReplaceRecFromQuery(dsReport);
  dsReport.Close;
end;

initialization
  RegisterClass(TActChangeOstKBKForm);

end.
