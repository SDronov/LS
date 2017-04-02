unit DecisionDebtsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCurrencyEdit,
  cxCalendar, cxMaskEdit, cxMemo, cxTextEdit, cxPC, cxControls,
  QueryList, DecisionFrm, OracleData, cxCheckBox, fdcWord, fdcObjectCore;

type
  TReportType = (rtAdvice, rtDecision);

  TDecisionDebtsForm = class(TDecisionForm)
    dsDataSUMMA: TFloatField;
    dsDataDEBT_TYPE_ID: TFloatField;
    dsDataDEBT_TYPE: TStringField;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    dsReport: TfdcQuery;
    dsReportCUSTOMSNAME: TStringField;
    dsReportDECISIONTYPE: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataSUM_RUB: TFloatField;
    cmbxCurrency: TfdcObjectLookupEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtSumRub: TcxDBCurrencyEdit;
    lcGeneralItem3: TdxLayoutItem;
    PrintPopupMenu: TdxBarPopupMenu;
    btnPrintAdvice: TdxBarButton;
    btnPrintDecision: TdxBarButton;
    btnPrintDoc: TdxBarSubItem;
    actPrintAdvice: TAction;
    actPrintDecision: TAction;
    dsDataDECL_OKPO: TStringField;
    tabNoticePays: TcxTabSheet;
    dsNoticeList: TfdcQuery;
    dsNoticePT: TfdcQuery;
    dsNoticePTDOC_NUMBER: TStringField;
    dsNoticePTDOC_DATE: TDateTimeField;
    dsNoticePTPAY_TYPE_CODE: TStringField;
    dsNoticePTSUMMA: TFloatField;
    dsDetail: TfdcQuery;
    dsDetailPP: TFloatField;
    dsDetailPO_TYPE: TStringField;
    dsDetailPO_NUM: TStringField;
    dsDetailPO_DATE: TDateTimeField;
    dsDetailPO_SUM: TFloatField;
    dsDetailREUSE_SUM: TFloatField;
    procedure actPrintUpdate(Sender: TObject);
    procedure edtNotiiceNumberBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tabNoticePaysShow(Sender: TObject);
    procedure dsNoticeListBeforeOpen(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
  private
    fCurentReport       : TReportType;
    fNoticesForm        : TForm;
  protected
    function GetDecisionTypeForReport: string; virtual; abstract;
    function GetTemplateReportName : String; override;
    function GetPaymentOrdersFormType : string; override;
    procedure FillReportParams(AWord: TWordClass); override;

    property NoticesForm  : TForm read fNoticesForm write fNoticesForm;
    property CurentReport : TReportType read fCurentReport;
  public
  end;


implementation

uses
  fdcCustomObjectFrm
 ,fdcCustomDBDataFrm
 ,DocumentFrm
 ,MainDm
 ,fdcCustomCardFrm
 ,DecisionDebtsNoticeGridFrm
 ,ObjectFrm
 ,MoneyStrings
 ,fdcCustomDataFrm
 ,fdcMessages;

{$R *.dfm}

procedure TDecisionDebtsForm.actPrintUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not Self.IsNew and
                                ( (Sender = actPrintDecision) or
                                  // печать уведомления разрешить только после подписи решения
                                  (dsStateSYSNAME.Value = 'State.DecisionDebts.Signed')
                                 );
  btnPrintDoc.Enabled := actPrintAdvice.Enabled or
                         actPrintDecision.Enabled;
end;

procedure TDecisionDebtsForm.actPrintExecute(Sender: TObject);
begin
  //fCurentReport := TReportType((Sender as TAction).Tag);
  if Sender = actPrintAdvice then
    fCurentReport := rtAdvice
  else
    fCurentReport := rtDecision;
  inherited;
end;

procedure TDecisionDebtsForm.FillReportParams(AWord: TWordClass);
begin
  if     ( fCurentReport = rtDecision )
     and ( dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) ) then
    begin
      AWord.ReplaceText( '@SUMMA_S', MoneyToString( dsDataSUMMA.Value, True, False ) );
    end;

  inherited;

  if     ( fCurentReport = rtDecision )
     and ( dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) ) then
    begin
      if    dsDataDEBTS_SUMMA.IsNull
         or ( dsDataDEBTS_SUMMA.Value = 0 ) then
        AWord.ReplaceText( '@DEBTS_SUMMA', '-' );

      if dsNoticeList.Active then
        dsNoticeList.Close;
      dsNoticeList.Open;
      AWord.GetArrayFromDataSet( dsNoticeList, 'NAME',  'NOTICE_LIST',  ', ' );
      dsNoticeList.Close;

      if dsNoticePT.Active then
        dsNoticePT.Close;
      dsNoticePT.Open;
      AWord.GetArrayFromDataSet( dsNoticePT, 'DOC_NUMBER',    'N_DOC_NUMBER',     '^p' );
      AWord.GetArrayFromDataSet( dsNoticePT, 'DOC_DATE',      'N_DOC_DATE',       '^p' );
      AWord.GetArrayFromDataSet( dsNoticePT, 'PAY_TYPE_CODE', 'N_PAY_TYPE_CODE',  '^p' );
      AWord.GetArrayFromDataSet( dsNoticePT, 'SUMMA',         'N_SUMMA',          '^p' );
      dsNoticePT.Close;

      if not dsDetail.Active then
        dsDetail.Open;
      AWord.GetArrayFromDataSet( dsDetail, 'PP',        'D_PP',        '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'PO_TYPE',   'D_PO_TYPE',   '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'PO_NUM',    'D_PO_NUM',    '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'PO_DATE',   'D_PO_DATE',   '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'PO_SUM',    'D_PO_SUM',    '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'REUSE_SUM', 'D_REUSE_SUM', '^p' );
    end
  else
    begin
      dsReport.ParamByName('DecisionType').AsString := GetDecisionTypeForReport;
      dsReport.Open;
      AWord.ReplaceRecFromQuery(dsReport);
      dsReport.Close;

      AWord.ReplaceText('@MANAGER_UDS', edtSignByChiefUDS.Text);
      AWord.ReplaceText('@MANAGER',     edtSignByChief.Text);
      AWord.ReplaceText('@EXECUTOR',    edtSignBy.Text);
    end;
end;

function TDecisionDebtsForm.GetTemplateReportName: String;
begin
  if fCurentReport = rtAdvice then
    Result := 'УВЕДОМЛЕНИЕ_О_ЗАЧЕТЕ_В_СЧЕТ_ПОГАШЕНИЯ_ЗАДОЛЖЕННОСТИ.doc'
  else
    if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
      Result := inherited GetTemplateReportName
    else
      Result := 'РЕШЕНИЕ_О_ЗАЧЕТЕ_ДС_В_СЧЕТ_ПОГАШЕНИЯ_ЗАДОЛЖЕННОСТИ.doc';
end;

procedure TDecisionDebtsForm.edtNotiiceNumberBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  Try
    dsData['NOTICE_NUMBER;NOTICE_DATE'] := AObject.FieldValues['DOC_NUMBER;DOC_DATE'];
  except
  end;
end;

procedure TDecisionDebtsForm.FormShow(Sender: TObject);
begin
  inherited;
  //dsDataNOTICEPAY_ID.ReadOnly := not Self.IsNew;
  dsDataSUBJECT_ID.ReadOnly := not Self.IsNew;
end;

procedure TDecisionDebtsForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if not Self.IsNew and
     not DataSet.IsEmpty and
     Assigned( DataSet.FindField('SIGNED_BY') ) and
     DataSet.FieldByName('SIGNED_BY').IsNull then
    begin
      DataSet.Edit;
      DataSet.FieldByName('SIGNED_BY').AsString := MainData.GetCurrentUserName;
      Modify(nil);
    end;
end;

procedure TDecisionDebtsForm.FormCreate(Sender: TObject);
begin
  inherited;

  fNoticesForm       := nil;
end;

procedure TDecisionDebtsForm.tabNoticePaysShow(Sender: TObject);
begin
  if not Assigned(fNoticesForm) then
    begin
      Params.ParamByName( 'DEC_ID' ).Value := dsData.FieldByName( 'ID' ).Value;
      fNoticesForm := ShowForm('TDecisionDebtsNoticeGridForm', Params, tabNoticePays);
      TObjectForm(fNoticesForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(fNoticesForm));
    end;
end;

function TDecisionDebtsForm.GetPaymentOrdersFormType: string;
begin
  Result := 'TDecisionDebtsPOGridForm';
end;

procedure TDecisionDebtsForm.dsNoticeListBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TfdcQuery do
    begin
      ParamByName( 'dec_id' ).AsFloat := dsData.FieldByName( 'id' ).AsFloat;
      if dsState.FieldByName( 'SysName' ).AsString = 'State.DecisionDebts.Created' then
        ParamByName( 'mode_view' ).AsInteger := 1
      else
        ParamByName( 'mode_view' ).AsInteger := 0;
    end;
end;

procedure TDecisionDebtsForm.actSaveExecute(Sender: TObject);
  var l_need_save: Boolean;
begin
  l_need_save := true;
  if (dsStateSYSNAME.AsString = 'State.DecisionDebts.Signed')
     and
     (trim(edtSignDate.Text) = '') then
    begin
      l_need_save := (fdcMessages.MessageDlg('Запрос подтверждения:','Информация об оплате задолженности была отправлена в АПС "Задолженность"!'+#13#10+'Вы уверены, что хотите продолжить?','Информация об оплате задолженности была отправлена в АПС "Задолженность"!'+#13#10+'Вы уверены, что хотите продолжить?',mtConfirmation,[mbYes,mbNo],0) = mrYes);
    end;
  //-- сохранение при необходимости
  if (l_need_save) then
    begin
      inherited;
    end;
end;

initialization
  RegisterClass(TDecisionDebtsForm);

end.
