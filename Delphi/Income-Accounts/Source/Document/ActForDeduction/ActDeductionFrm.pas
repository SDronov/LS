unit ActDeductionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit, cxGraphics,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, OracleData,
  cxCurrencyEdit, fdcWord, xlcClasses, xlEngine, xlReport;

type
  TActDeductionForm = class(TDocumentForm)
    dsDataSUBJECT_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSUMMA: TFloatField;
    lcgDeclarant: TdxLayoutGroup;
    edtDeclINN: TcxDBMaskEdit;
    lciDeclINN: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lciDeclKPP: TdxLayoutItem;
    edtDeclName: TcxDBMaskEdit;
    lciDeclName: TdxLayoutItem;
    edtPersonDoc: TcxDBMaskEdit;
    lciPersonDoc: TdxLayoutItem;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataPERSONDOC: TStringField;
    dsDataCURRENCY: TStringField;
    edtCurrency: TcxDBMaskEdit;
    lciCurrency: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    lcgSign: TdxLayoutGroup;
    edtSignBy: TcxDBTextEdit;
    lciSignBy: TdxLayoutItem;
    edtSignDate: TcxDBDateEdit;
    lciSignDate: TdxLayoutItem;
    lciSignByChief: TdxLayoutItem;
    edtSignByChief: TcxDBLookupComboBox;
    tabDocs: TcxTabSheet;
    tabDeduction: TcxTabSheet;
    odsGetBoss: TOracleDataSet;
    odsGetBossID: TFloatField;
    odsGetBossNAME: TStringField;
    dsGetBoss: TDataSource;
    adtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    dsReport: TfdcQuery;
    dsDetailPays: TfdcQuery;
    dsDetailOverPays: TfdcQuery;
    dsDetailDeposit: TfdcQuery;
    procedure dsStateAfterOpen(DataSet: TDataSet);
    procedure dsStateAfterRefresh(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
    procedure tabDeductionShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure dsDetailPaysBeforeOpen(DataSet: TDataSet);
    procedure dsDetailOverPaysBeforeOpen(DataSet: TDataSet);
    procedure dsDetailDepositBeforeOpen(DataSet: TDataSet);
  private
    fDocsForm : TForm;
    fDedForm : TForm;
  protected
    procedure ShowExelReport;
    procedure SetTabDeductionVisible; //virtual;
    function GetDeductionFormClassName : string; virtual;
    function GetDocsFormClassName : string; virtual;
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
  end;

implementation

uses fdcCustomObjectFrm, fdcMessages, fdcCustomDataFrm,
     qReportUtil, fdcUtils, fdcCustomDBDataFrm;

{$R *.dfm}

function TActDeductionForm.GetDeductionFormClassName: string;
begin
  Result := 'TActDeductionDedsGridForm';
end;

function TActDeductionForm.GetDocsFormClassName: string;
begin
  Result := '';
end;

procedure TActDeductionForm.SetTabDeductionVisible;
begin
  tabDeduction.TabVisible := dsState.Active and
                             not dsState.IsEmpty and
                             not (dsStateSYSNAME.Value = 'State.ActDeduction.Created');
end;

procedure TActDeductionForm.dsStateAfterOpen(DataSet: TDataSet);
begin
  inherited;
  SetTabDeductionVisible;
end;

procedure TActDeductionForm.dsStateAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  SetTabDeductionVisible;
end;

procedure TActDeductionForm.FormCreate(Sender: TObject);
begin
  inherited;
  fDocsForm := nil;
  fDedForm  := nil;            
end;

procedure TActDeductionForm.tabDocsShow(Sender: TObject);
begin
  inherited;
  if not Assigned( fDocsForm ) then
    begin
      fDocsForm := ShowForm( GetDocsFormClassName, Params, tabDocs );
      with fDocsForm as TfdcCustomDataForm do
        RegisterWaiter( Self );
    end;
end;

procedure TActDeductionForm.tabDeductionShow(Sender: TObject);
begin
  inherited;
  if not Assigned( fDedForm ) then
    fDedForm := ShowForm( GetDeductionFormClassName, Params, tabDeduction );
end;

procedure TActDeductionForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if  odsGetBoss.Active then
      odsGetBoss.Close;
  odsGetBoss.SetVariable('pName',dsData.FieldValues['SIGNED_BY_CHIEF']);
  odsGetBoss.Open;
end;

function TActDeductionForm.GetTemplateReportName: string;
begin
  Result := 'Акт_списания_ДС.doc';
end;

procedure TActDeductionForm.FillReportParams(AWord: TWordClass);
begin
  inherited;
  dsReport.Open;
  AWord.ReplaceRecFromQuery(dsReport);
  dsReport.Close;
end;

procedure TActDeductionForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  ShowExelReport;
end;

procedure TActDeductionForm.ShowExelReport;
  var
    xlAct : TxlReport;
    xlDS  : TxlDataSource;
begin
  xlAct := TxlReport.Create(Self);
  Try
  // --- Ищем путь к шаблону отчета
  xlAct.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\Приложение_к_акту_списания.xls';
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

      xlDS := Add;
      xlDS.Alias := 'aOverPays';
      xlDS.Range := 'rngOverPays';
      xlDS.DataSet := dsDetailOverPays;

      xlDS := Add;
      xlDS.Alias := 'aDeposit';
      xlDS.Range := 'rngDeposit';
      xlDS.DataSet := dsDetailDeposit;
    end;

  dsDetailPays.Open;
  dsDetailOverPays.Open;
  dsDetailDeposit.Open;
   // --- generate report
  xlAct.Report(True);
  dsDetailPays.Close;
  dsDetailOverPays.Close;
  dsDetailDeposit.Close;
  finally
    xlAct.Free;
  end;
end;

procedure TActDeductionForm.dsDetailPaysBeforeOpen(DataSet: TDataSet);
begin
  dsDetailPays.ParamByName('ACT_ID').AsInteger := -1;
end;

procedure TActDeductionForm.dsDetailOverPaysBeforeOpen(DataSet: TDataSet);
begin
  dsDetailOverPays.ParamByName('ACT_ID').AsInteger := -1;
  dsDetailOverPays.ParamByName('FLAG').AsInteger := -1;
end;

procedure TActDeductionForm.dsDetailDepositBeforeOpen(DataSet: TDataSet);
begin
  dsDetailDeposit.ParamByName('ACT_ID').AsInteger := -1;
end;

initialization
  RegisterClass(TActDeductionForm);
end.
