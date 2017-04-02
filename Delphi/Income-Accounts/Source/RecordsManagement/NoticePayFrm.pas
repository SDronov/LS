unit NoticePayFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxMemo, cxTextEdit, cxPC, cxControls, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit,
  DocRManagementFrm, QueryList, fdcWord, cxCheckBox, OracleData, StrUtils;

type
  TNoticePayForm = class(TDocRManagementForm)
    dsDataDEBTS_REASON_ID: TFloatField;
    dsDataDUTY_SUMMA: TFloatField;
    dsDataEXCISE: TFloatField;
    dsDataNDS: TFloatField;
    dsDataCUSTOMS_FEES: TFloatField;
    dsDataPERCENT: TFloatField;
    dsDataPAYMENT_DATE: TDateTimeField;
    dsDataPENALTY_SDATE: TDateTimeField;
    dsDataPENALTY_EDATE: TDateTimeField;
    dsDataEXECUTION_DATE: TDateTimeField;
    cmbxDebtsReason: TfdcObjectLookupEdit;
    lciDebtsReason: TdxLayoutItem;
    edtDutySumma: TcxDBCurrencyEdit;
    lciDutySumma: TdxLayoutItem;
    edtExcise: TcxDBCurrencyEdit;
    lciExcise: TdxLayoutItem;
    edtPenaltySumma: TcxDBCurrencyEdit;
    lciPenaltySumma: TdxLayoutItem;
    edtPercent: TcxDBCurrencyEdit;
    lciPercent: TdxLayoutItem;
    edtCustomsFees: TcxDBCurrencyEdit;
    lciCustomsFees: TdxLayoutItem;
    edtNds: TcxDBCurrencyEdit;
    lciNds: TdxLayoutItem;
    edtExecutionDate: TcxDBDateEdit;
    edtPenaltyEDate: TcxDBDateEdit;
    lciPenaltyEDate: TdxLayoutItem;
    edtPenaltySDate: TcxDBDateEdit;
    lciPenaltySDate: TdxLayoutItem;
    edtPaymentDate: TcxDBDateEdit;
    lciPaymentDate: TdxLayoutItem;
    dsDataPENALTY_SUMMA: TFloatField;
    lcgPenalty: TdxLayoutGroup;
    lcgDebts: TdxLayoutGroup;
    lcgDebts2: TdxLayoutGroup;
    lcgDebts3: TdxLayoutGroup;
    lcgDebts1: TdxLayoutGroup;
    lcgPenaltyDate: TdxLayoutGroup;
    dsDataDEBTS_REASON_NAME: TStringField;
    dsDataSUMMA: TFloatField;
    dsDataCUSTOMS_ID: TFloatField;
    dsDataCUSTOM_NAME: TStringField;
    lciExecutionDate: TdxLayoutItem;
    dsKBKList: TOracleDataSet;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    sqlActivate: TsqlOp;
    actActivate: TAction;
    barBtnActivate: TdxBarButton;
    dsDataASD_DOC_NUMBER: TStringField;
    edtRegDocNumber: TcxDBTextEdit;
    lciRegDocNumber: TdxLayoutItem;
    tabMeasures: TcxTabSheet;
    sqlCheckChargeNoActive: TsqlOp;
    procedure tabDeclShow(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure dsDataAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure edtDeclarantPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actActivateUpdate(Sender: TObject);
    procedure actActivateExecute(Sender: TObject);
    procedure tabMeasuresShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    FMeasuresGridForm        : TForm;
  protected
    function GetTemplateReportName: string; override;
    procedure AddParamsToReport(Word: TWordClass); override;
  public
  end;

implementation

uses
  MoneyStrings
 ,ObjectFrm
 ,MainDM
 ,FormUtils;

{$R *.dfm}

{ TRManNoticePayForm }

procedure TNoticePayForm.AddParamsToReport(Word: TWordClass);
begin
  dsReport.Open;
  Word.ReplaceRecFromQuery(dsReport);
  dsReport.Close;

  Word.ReplaceText('@SUM_IN_WORDS', MoneyToString(dsDataSUMMA.Value, False, False));
  Word.ReplaceText('@EMPL_NAME',    MainData.GetCurrentUserName);

  // Подставить КБК
  if dsKBKList.Active then
    dsKBKList.CloseAll;
  dsKBKList.SetVariable( 'id', dsData.FieldByName( 'id' ).AsFloat );
  // Пошлина
  dsKBKList.SetVariable( 'pay_type_list', '''20'', ''21'', ''23'', ''24'', ''25'', ''26'', ''27'', ''28'', ''29'',''99'',' +
                                          '''200'',''220'',''240'',''280'',''290'',''210'',''270'',''230'',''260'',''250'','+
                                          '''2010'',''2020'',''2040'',''2050'',''2060'',''2030'',''2070'',''2080'',''2090'','+
                                          '''3020'',''3010'',''3030'',''3040'',''3050''' );
  dsKBKList.Open;
  Word.ReplaceText( '@KBK_DUTY', StringReplace( dsKBKList.FieldByName( 'kbk_list' ).AsString, ',', #$A#$D, [rfReplaceAll] ) );
  dsKBKList.CloseAll;
  // Акциз
  dsKBKList.SetVariable( 'pay_type_list', '''03'',''01'',''02'',''80'',''84'',''88'',''04'',''86'',''82'',''06'',''05'',''85'',''87'',''89'',''83'',''81'',''07'',''08'',''09'',' +
                                          '''810'',''820'',''830'',''840'',''850'',''860'',''870'',''880'',''890'',''010'',''020'',''030'',''040'',''844'','+
                                          '''4010'',''4020'',''4030'',''4040'',''4050'',''4060'',''4070'',''4080'',''4090'',''4100'',''4110'',''4120'',''4130''');
  dsKBKList.Open;
  Word.ReplaceText( '@KBK_EXCISE', StringReplace( dsKBKList.FieldByName( 'kbk_list' ).AsString, ',', #$A#$D, [rfReplaceAll] ) );
  dsKBKList.CloseAll;
  // НДС
  dsKBKList.SetVariable( 'pay_type_list', '''30'',''35'',''34'',''33'',''32'',''30'',''62'',''300'',''5010''' );
  dsKBKList.Open;
  Word.ReplaceText( '@KBK_NDS', StringReplace( dsKBKList.FieldByName( 'kbk_list' ).AsString, ',', #$A#$D, [rfReplaceAll] ) );
  dsKBKList.CloseAll;
  // Таможенные сборы
  dsKBKList.SetVariable( 'pay_type_list', '''100'',''500'',''510'',''10'',''51'',''1010'',''1020'',''1030''' );
  dsKBKList.Open;
  Word.ReplaceText( '@KBK_CUSTOMS_FEES', StringReplace( dsKBKList.FieldByName( 'kbk_list' ).AsString, ',', #$A#$D, [rfReplaceAll] ) );
  dsKBKList.CloseAll;
  //--
  Word.ReplaceText( '@EXEC_DATE_DUTY', StringReplace( ifthen((dsDataDUTY_SUMMA.AsFloat > 0),dsDataEXECUTION_DATE.AsString,''), ',', #$A#$D, [rfReplaceAll] ) );
  Word.ReplaceText( '@EXEC_DATE_EXCISE', StringReplace( ifthen((dsDataEXCISE.AsFloat > 0),dsDataEXECUTION_DATE.AsString,''), ',', #$A#$D, [rfReplaceAll] ) );
  Word.ReplaceText( '@EXEC_DATE_NDS', StringReplace( ifthen((dsDataNDS.AsFloat > 0),dsDataEXECUTION_DATE.AsString,''), ',', #$A#$D, [rfReplaceAll] ) );
  Word.ReplaceText( '@EXEC_DATE_CUSTOMS', StringReplace( ifthen((dsDataCUSTOMS_FEES.AsFloat > 0),dsDataEXECUTION_DATE.AsString,''), ',', #$A#$D, [rfReplaceAll] ) );
  //--
  Word.ReplaceText( '@DATA_FROM', StringReplace( ifthen(dsDataPENALTY_SDATE.IsNull,'____ 20__',dsDataPENALTY_SDATE.AsString), ',', #$A#$D, [rfReplaceAll] ) );
  Word.ReplaceText( '@DATA_TO', StringReplace( ifthen(dsDataPENALTY_EDATE.IsNull,'____ 20__',dsDataPENALTY_EDATE.AsString), ',', #$A#$D, [rfReplaceAll] ) );
end;

function TNoticePayForm.GetTemplateReportName: string;
begin
  Result := 'ТРЕБОВАНИЕ_ОБ_УПЛАТЕ.doc';
end;

procedure TNoticePayForm.tabDeclShow(Sender: TObject);
begin
  if not Assigned(FCDeclGridForm) then begin
    FCDeclGridForm := ShowForm('TAdviceCDeclGridForm', Params, tabDecl);
    TObjectForm(FCDeclGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FCDeclGridForm));
  end;
end;

procedure TNoticePayForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  lciDeclarant.Enabled := True;
  lciDeclInn.Enabled   := True;
  lciDeclKPP.Enabled   := True;
end;

procedure TNoticePayForm.dsDataAfterPost(DataSet: TDataSet);
begin
  inherited;

  lciDeclarant.Enabled := False;
  lciDeclInn.Enabled   := False;
  lciDeclKPP.Enabled   := False;
end;

procedure TNoticePayForm.FormShow(Sender: TObject);
begin
  inherited;
  tabService.TabVisible := False;
end;

procedure TNoticePayForm.edtDeclarantPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Abort;
end;

procedure TNoticePayForm.actActivateUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Enabled := ( dsData.FieldByName( 'IS_ACTIVE' ).AsString = 'N' )
                             and ( sqlCheckChargeNoActive.ParamValues['result'] = 0 );
end;

procedure TNoticePayForm.actActivateExecute(Sender: TObject);
begin
  inherited;

  if MessageDlg( 'Провести документ?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    begin
      sqlActivate.Exec;

      RefreshData;
    end;
end;

procedure TNoticePayForm.tabMeasuresShow(Sender: TObject);
begin
  if not Assigned(FMeasuresGridForm) then begin
    FMeasuresGridForm := ShowForm('TMeasuresByNoticeGridForm', Params, tabMeasures);
    TObjectForm(FMeasuresGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FMeasuresGridForm));
  end;
end;

procedure TNoticePayForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  sqlCheckChargeNoActive.Exec;
end;

initialization
  RegisterClass(TNoticePayForm);

end.

