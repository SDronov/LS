unit DecisionPayBackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionFrm, cxGraphics, OracleData, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCheckBox, cxDBEdit, cxCurrencyEdit, fdcObjectLookupEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, fdcObjectCore, fdcWord, QueryList, cxLabel,
  cxDBLabel;

type
  TDecisionPayBackForm = class(TDecisionForm)
    tabPaymentOrderPayback: TcxTabSheet;
    dsDataBANK_DATE: TDateTimeField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDESTSUB_ID: TFloatField;
    dsDataACCOUNT: TStringField;
    dsDataBANK_ID: TFloatField;
    dsDataBANK_NAME: TStringField;
    dsDataBANK_BIC: TStringField;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataDECL_NAME_DEST: TStringField;
    dsDataDECL_INN_DEST: TStringField;
    dsDataDECL_KPP_DEST: TStringField;
    dsDataDECL_OKPO_DEST: TStringField;
    dsDataDECL_ADDRESS_DEST: TStringField;
    dsDataDECL_BANK_DEST: TStringField;
    dsDataDECL_ADR_BANK_DEST: TStringField;
    dsDataDECL_NAME_BANK_DEST: TStringField;
    dsDataBIC: TStringField;
    dsDataCORR_ACCOUNT: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE: TStringField;
    dsDataPERSONAL_ACCOUNT: TStringField;
    dsDataDATE_LAST_DOC: TDateTimeField;
    dsDataCUSTOMSFULLNAME: TStringField;
    dsDataEXCISE_PAY: TStringField;
    dsDataDECISION_COURT: TStringField;
    dsDataDATE_COURT: TDateTimeField;
    dsDataCOURT_ACT_ATTRS: TStringField;
    dsDataCUSTOMS_DEC_ATTRS: TStringField;
    dsDataREASON_CODE: TStringField;
    edtDateLastDoc: TcxDBDateEdit;
    lciDateLastDoc: TdxLayoutItem;
    lcgCourtActAttrs: TdxLayoutGroup;
    edtExcisePay: TcxDBCheckBox;
    lciExicePay: TdxLayoutItem;
    edtDecisionCourt: TcxDBCheckBox;
    lciDecisionCourt: TdxLayoutItem;
    edtDateCourt: TcxDBDateEdit;
    lciDateCourt: TdxLayoutItem;
    lciCourtActAttrs: TdxLayoutItem;
    edtCourtActAttrs: TcxDBTextEdit;
    edtCustomsDecAttrs: TcxDBTextEdit;
    lciCustomsDecAttrs: TdxLayoutItem;
    lcgReasonAticle: TdxLayoutGroup;
    lciReasonPayback: TdxLayoutItem;
    edtReasonAticle: TcxTextEdit;
    lciReasonAticle: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    lcgDestSubject: TdxLayoutGroup;
    edtDestSubINN: TcxDBTextEdit;
    lciDestSubINN: TdxLayoutItem;
    edtDestSubKPP: TcxDBTextEdit;
    lciDestSubKPP: TdxLayoutItem;
    lcgDestSubINN_KPP: TdxLayoutGroup;
    edtDestSubj: TfdcObjectLinkEdit;
    lciDestSubj: TdxLayoutItem;
    edtDestSubName: TcxDBTextEdit;
    lciDestSubName: TdxLayoutItem;
    edtDestSubAddr: TcxDBTextEdit;
    lciDestSubAddr: TdxLayoutItem;
    edtAccount: TcxDBMaskEdit;
    lciAccount: TdxLayoutItem;
    edtBank: TfdcObjectLinkEdit;
    lciBank: TdxLayoutItem;
    edtBIC: TcxDBTextEdit;
    lciBIC: TdxLayoutItem;
    edtCorrAccount: TcxDBTextEdit;
    lciCorrAccount: TdxLayoutItem;
    lcgBankAttrs: TdxLayoutGroup;
    edtBankAddr: TcxDBTextEdit;
    lciBankAddr: TdxLayoutItem;
    actCancel: TAction;
    odsAddCancelDecPayback: TOracleDataSet;
    barBtnCancel: TdxBarButton;
    edtCurrency: TfdcObjectLookupEdit;
    lciCurrency: TdxLayoutItem;
    qryDetail: TfdcQuery;
    dsArticleList: TfdcQuery;
    dsArticleListNAME: TStringField;
    qryDetailPP: TFloatField;
    qryDetailPO_TYPE: TStringField;
    qryDetailPO_NUM: TStringField;
    qryDetailPO_DATE: TDateTimeField;
    qryDetailPO_SUM: TFloatField;
    qryDetailRET_SUM: TFloatField;
    dsDeclList: TfdcQuery;
    dsDeclListNAME: TStringField;
    dsPaymentOrderList: TfdcQuery;
    dsPaymentOrderListNAME: TStringField;
    tabAdvice: TcxTabSheet;
    dsDataKBK_CODE: TStringField;
    dsDataBOSSNAME: TStringField;
    dsDataKOPP: TStringField;
    dsDataCUSTOMSNAME: TStringField;
    dsDataADDRESS: TStringField;
    dsDataPASSPORT: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsKBK_CODE: TfdcQuery;
    dsDataBOSSRANK: TStringField;
    lcgReasonDoc: TdxLayoutGroup;
    cbDecision: TcxComboBox;
    lciDocBasement: TdxLayoutItem;
    cbBeforeAfter: TcxComboBox;
    lciBeforeAfter: TdxLayoutItem;
    dsDataSUMMA: TFloatField;
    dsDataRUB: TFloatField;
    cxDBLabel1: TcxDBLabel;
    lcGeneralItem1: TdxLayoutItem;
    dsChecks: TfdcQuery;
    tabChecks: TcxTabSheet;
    dsChecksSendAll: TfdcQuery;
    procedure tabPaymentOrderPaybackShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabDocObligationsShow(Sender: TObject);
    procedure tabPaymentOrdersShow(Sender: TObject);
    procedure dsStateAfterOpen(DataSet: TDataSet);
    procedure edtDecisionCourtPropertiesChange(Sender: TObject);
    procedure cmbxReasonPropertiesCloseUp(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure edtDestSubjBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure edtBankBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure tabAdviceShow(Sender: TObject);
    procedure cbDecisionPropertiesChange(Sender: TObject);
    procedure dsDataAfterScroll(DataSet: TDataSet);
    procedure tabChecksShow(Sender: TObject);
  private
    { Private declarations }
    fChecksEnable : Boolean;
    FChecksForm : TForm;
    procedure FillParamsToSend;
    function getDecisionChar: char;
  protected
    fPaymentOrderPayBackGridForm : TForm;
    fAdviceForm                  : TForm;
    function GetPaymentOrdersFormType : string; override;
    function GetDocObligationsFormType : string; override;
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
    property ChecksEnable : Boolean read fChecksEnable write fChecksEnable;
  end;

var
  DecisionPayBackForm: TDecisionPayBackForm;

implementation

uses
  StrUtils
 ,fdcMessages
 ,MainDm
 ,DictDM
 ,FormUtils
 ,MoneyStrings
 ,fdcObjectServices
 ,fdcCustomDataFrm
 ,ObjectFrm
 ,fdcCustomObjectGridFrm
 ,fdcCustomDBDataFrm
 ,fdcCustomObjectFrm
 ,fdcCustomCardFrm
 ,DeclarantChecksGridFrm;

const
    lv_Mult : array [1..23] of Byte = ( 7,1,3,7,1,3,7,1,3,7,1,3,7,1,3,7,1,3,7,1,3,7,1 );
    lv_innArr10 : array [1..10] of Byte = (2,4,10,3,5,9,4,6,8,0);
    lv_innArr11 : array [1..11] of Byte = (7,2,4,10,3,5,9,4,6,8,0);
    lv_innArr12 : array [1..12] of Byte = (3,7,2,4,10,3,5,9,4,6,8,0);

{$R *.dfm}

procedure TDecisionPayBackForm.tabPaymentOrderPaybackShow(Sender: TObject);
begin
  if not Assigned( fPaymentOrderPaybackGridForm ) then
    begin
      FillParamsToSend;
      
      fPaymentOrderPaybackGridForm := ShowForm( 'TPayment_Order_PaybackGridForm', Params, tabPaymentOrderPayback );
      TObjectForm(fPaymentOrderPaybackGridForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(fPaymentOrderPaybackGridForm));
  end;
  (fPaymentOrderPaybackGridForm as TfdcCustomObjectGridForm).RefreshData;
end;

procedure TDecisionPayBackForm.FormCreate(Sender: TObject);
begin
  inherited;
  fPaymentOrderPayBackGridForm := nil;
  fAdviceForm := nil;
  fChecksEnable := True;

  lciDecisionCourt.Visible:= false;
  lciDecisionCourt.Enabled:= false;

  lcgReasonDoc.Visible:= true;
  lcgReasonDoc.Enabled:= true;

  cbDecision.visible:= true;
  cbDecision.enabled:= true;

  if (ClassName='TDecPaybackPayForm') or (ClassName='TDecPaybackPeriodicForm') or (ClassName='TDecPaybackLevyForm') then begin
    lciBeforeAfter.Visible:= true;
    lciBeforeAfter.Enabled:= true;

    cbBeforeAfter.visible:= true;
    cbBeforeAfter.enabled:= false;
  end;
end;

function TDecisionPayBackForm.GetDocObligationsFormType: string;
begin
  Result := 'TRManCDeclGridForm';
end;

function TDecisionPayBackForm.GetPaymentOrdersFormType: string;
begin
  Result := 'TPaybackPaymentOrderGridForm';
end;

procedure TDecisionPayBackForm.tabDocObligationsShow(Sender: TObject);
begin
  FillParamsToSend;

  inherited;

  with fDocObligationsForm as TfdcCustomObjectGridForm do
    begin
      actAdd.Visible    := False;
      actDelete.Visible := False;
    end;
end;

procedure TDecisionPayBackForm.tabPaymentOrdersShow(Sender: TObject);
begin
  FillParamsToSend;

  inherited;

  with fPaymentOrdersForm as TfdcCustomObjectGridForm do
    begin
      actAdd.Visible    := False;
      actDelete.Visible := False;
    end;
end;

procedure TDecisionPayBackForm.dsStateAfterOpen(DataSet: TDataSet);

  procedure UpdateGroupItems(AGroup: TdxLayoutGroup);
    var
      I : Integer;
  begin
    for I := 0 to AGroup.Count - 1 do
      if AGroup.Items[I] is TdxLayoutGroup then
        UpdateGroupItems(TdxLayoutGroup(AGroup.Items[I]))
      else
        if     AGroup.Items[I].Visible
           and ( AGroup.Items[I] <> lciSignBy )
           and ( AGroup.Items[I] <> lciSignDate )
           and ( AGroup.Items[I] <> lciSignByChief )
           and ( AGroup.Items[I] <> lciSignByChiefUDF ) then
          ( AGroup.Items[I] as TdxLayoutItem).Tag := 33;
  end;

  var
     vReadOnly : boolean;
begin
  vReadOnly := (dsStateSYSNAME.Value <> 'DecisionPaybackCreated');
  Params.ParamByName('PaymentsReadOnly').AsBoolean := vReadOnly;
  if Assigned(fPaymentOrdersForm) then
    (fPaymentOrdersForm as TfdcCustomDataForm).ParamByName('PaymentsReadOnly').AsBoolean := vReadOnly;

  if vReadOnly then
    begin
      UpdateGroupItems( lcGeneral.Items );
      UpdateLayoutControl( False, lcGeneral );
    end;
end;

procedure TDecisionPayBackForm.edtDecisionCourtPropertiesChange( Sender: TObject);
begin
{  lciCourtActAttrs.Enabled := edtDecisionCourt.EditValue = 'Y';
  lciDateCourt.Enabled     := edtDecisionCourt.EditValue = 'Y';
  lciSudReason.Enabled     := edtDecisionCourt.EditValue = 'Y'; }

{  if edtDecisionCourt.EditValue = 'N' then
    begin
      dsData.FieldByName( 'sud_reason_id' ).Value   := null;
      dsData.FieldByName( 'court_act_attrs' ).Value := null;
      dsData.FieldByName( 'date_court' ).Value      := null;
    end;
  Modify(Sender); }
end;

procedure TDecisionPayBackForm.cmbxReasonPropertiesCloseUp(Sender: TObject);
var fs: TFormatSettings;
begin
  GetLocaleFormatSettings( 0, fs );
  fs.DateSeparator   := '.';
  fs.ShortDateFormat := 'dd.mm.yyyy';
  fs.LongDateFormat  := 'dd.mm.yyyy';
  if not dsData.IsEmpty then
    if     ( dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.01.2011', fs ) )
       and ( dsData.FieldByName( 'TypeSysName' ).AsString = 'DecPaybackTimeOut' ) then
      edtReasonAticle.EditValue := '147'
    else
      edtReasonAticle.EditValue := dsAssetsReason.Lookup( 'ID', cmbxReason.EditValue, 'CODE3' );
end;


procedure TDecisionPayBackForm.edtDestSubjBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  if AObject = nil then
    begin
      dsDataDECL_INN_DEST.Clear;
      dsDataDECL_KPP_DEST.Clear;
      dsDataDECL_ADDRESS_DEST.Clear;
    end
  else
    begin
      dsData['DECL_INN_DEST'] := AObject.FieldValues['INN'];
      dsData['DECL_KPP_DEST'] := AObject.FieldValues['KPP'];
      dsData['DECL_ADDRESS_DEST'] := AObject.FieldValues['ADDRESS'];
    end;

  Modify(nil);
end;

procedure TDecisionPayBackForm.dsDataBeforePost(DataSet: TDataSet);
  var
    lv_Account : string;
    lv_Sum     : Integer;
    i          : Integer;
    lv_INN     : string;
    sError     : string;
    lv_Sum1    : Integer;
    lv_Sum2    : Integer;
    sVerifyResult :string;
    bVerifyResultEmpty: boolean;
begin
  // Проверить заполнение полей
  if fChecksEnable then
    begin
     // if (ClassName='TDecPaybackPayForm')or(ClassName='TDecPaybackAdvanceForm')or(ClassName='TDecPaybackTimeOutForm') then begin

        if (cbDecision.Enabled)and(cbDecision.ItemIndex = -1)
         and ( MessageDlg( 'Не заполнено поле "Документ-основание"!'
                          ,'Невозможно сохранить решение'
                          ,'Необходимо указать Документ-основание!'
                          ,mtConfirmation
                          ,[mbOk]
                          ,0 ) <> mrYes ) then begin
                            cbDecision.SetFocus;
                            abort;
                          end;

        if ( cbBeforeAfter.enabled) and (cbBeforeAfter.ItemIndex = -1)
         and ( MessageDlg( 'Не заполнено поле "По решениям, принятым" в блоке "Документ-основание"!'
                          ,'Невозможно сохранить решение'
                          ,'Необходимо уточнение для документа-основания'
                          ,mtConfirmation
                          ,[mbOk]
                          ,0 ) <> mrYes ) then begin
                             cbBeforeAfter.SetFocus;
                             abort;
                          end;

        if ( not(dsDataDECISION_COURT.Value[1] in ['H', 'N']) )and (dsDataSUD_REASON_ID.isNull)
         and ( MessageDlg( 'Не заполнено поле "Причина" в блоке "Основание"!'
                          ,'Невозможно сохранить решение'
                          ,'Необходимо заполнить поле "Причина!" '
                          ,mtConfirmation
                          ,[mbOk]
                          ,0 ) <> mrYes ) then begin
                             edtSudReason.SetFocus;
                             abort;
                          end;

      if     dsData.FieldByName( 'bank_id' ).IsNull
         and ( MessageDlg( 'Не заполнено поле "Банк"!'
                          ,'Сохранить решение?'
                          ,'Для осуществления возврата денежных средств участнику ВЭД, необходимо указать банк получателя платежа'
                          ,mtConfirmation
                          ,[mbYes, mbNo]
                          ,0 ) <> mrYes ) then
        Abort;

      if     dsData.FieldByName( 'Account' ).IsNull
         and ( MessageDlg( 'Не заполнено поле "Банковский счёт"!'
                          ,'Сохранить решение?'
                          ,'При возврате денежных средств участнику ВЭД - резиденту необходимо указать расчётный счёт участника ВЭД'
                          ,mtConfirmation
                          ,[mbYes, mbNo]
                          ,0 ) <> mrYes ) then
        Abort;

      if     not dsData.FieldByName( 'Account' ).IsNull
         and ( Length( dsData.FieldByName( 'Account' ).AsString ) < 20 )
         and ( MessageDlg( 'Поле "Банковский счёт" содержит меньше 20 знаков!'
                          ,'Сохранить решение?'
                          ,'Необходимо проверить правильность заполнения счёта получателя'
                          ,mtConfirmation
                          ,[mbYes, mbNo]
                          ,0 ) <> mrYes ) then
        Abort;

      // Проверка контрольной суммы счёта
      if     not dsData.FieldByName( 'Account' ).IsNull
         and not dsData.FieldByName( 'BIC' ).IsNull then
        begin
          lv_Account := RightStr( dsData.FieldByName( 'BIC' ).AsString, 3 ) + dsData.FieldByName( 'Account' ).AsString;
          lv_Sum := 0;
          for i := Low( lv_Mult ) to High( lv_Mult ) do
            lv_Sum := lv_Sum + lv_Mult[i] * StrToInt( lv_Account[i] );
          lv_Sum := lv_Sum mod 10;
          if    ( lv_Sum <> 0 )
            and ( MessageDlg( 'Ошибка контрольной суммы поля "Банковский счёт"!'
                             ,'Сохранить решение?'
                             ,'Контрольная сумма поля "Банковский счёт не совпадает с расчётной'
                             ,mtConfirmation
                             ,[mbYes, mbNo]
                             ,0 ) <> mrYes ) then
            Abort;
        end;
    end;

    // Проверка ИНН

    if not dsData.FieldByName('DECL_INN').IsNull then

    begin
       lv_INN := dsData.FieldByName('DECL_INN').AsString;
       if length(lv_INN) = 10 then
        begin
          lv_Sum1 := 0;
          for i := Low( lv_innArr10 ) to High( lv_innArr10 ) do
            lv_Sum1 := lv_Sum1 + lv_innArr10[i] * StrToInt( lv_INN[i] );
          lv_Sum1 := lv_Sum1 mod 11;
          lv_Sum1 := lv_Sum1 mod 10;
          if lv_Sum1 <> StrToInt(lv_INN[10]) then
            sError := 'Контрольная сумма поля "ИНН" не совпадает с расчётной'
        end
       else
        if length(lv_INN) = 12 then
         begin
          lv_Sum := 0;
          lv_Sum1 := 0;
          for i := Low( lv_innArr11 ) to High( lv_innArr11 ) do
            lv_Sum := lv_Sum + lv_innArr11[i] * StrToInt( lv_INN[i] );
          lv_Sum1 := lv_Sum mod 11;
          lv_Sum1 := lv_Sum1 mod 10;
          lv_Sum := 0;
          for i := Low( lv_innArr12 ) to High( lv_innArr12 ) do
            lv_Sum := lv_Sum + lv_innArr12[i] * StrToInt( lv_INN[i] );
          lv_Sum2 := lv_Sum mod 11;
          lv_Sum2 := lv_Sum2 mod 10;
          if (lv_Sum1 <> StrToInt(lv_INN[11])) or (lv_Sum2 <> StrToInt(lv_INN[12])) then
             sError := 'Контрольная сумма поля "ИНН" не совпадает с расчётной'
         end
        else
         sError := 'Некорректная длина ИНН';
       end;
     
     if (length(sError)>0) and ( MessageDlg( 'Ошибка поля "ИНН"!'
                             ,'Сохранить решение?'
                             ,sError
                             ,mtConfirmation
                             ,[mbYes, mbNo]
                             ,0 ) <> mrYes ) then
       Abort;

  If DataSet.FieldByName( 'SIGNED_BY' ).IsNull then
    DataSet.FieldByName( 'SIGNED_BY' ).Value := MainData.GetCurrentUserName;
  if DataSet.FieldByName( 'CURRENCY_ID' ).IsNull then
    DataSet.FieldByName( 'CURRENCY_ID' ).AsFloat := DictData.GetCurrencyRUR;

  // Если подписываем решение - выведем диалог с проверками
  if not DataSet.FieldByName( 'SIGNED_BY' ).IsNull and
     not DataSet.FieldByName( 'SIGNED_BY_CHIEF' ).IsNull and
     not DataSet.FieldByName( 'SIGNED_BY_CHIEF_UDF' ).IsNull and
     not DataSet.FieldByName( 'SIGN_DATE' ).IsNull then
  begin
     dsChecks.ParamByName('nSubjectID').Value := DataSet.FieldByName('SUBJECT_ID').AsInteger;
     dsChecks.ParamByName('sAccount').Value := DataSet.FieldByName('ACCOUNT').AsString;
     dsChecks.ExecSQL;
     sVerifyResult :=dsChecks.paramByName('Result').AsString;
     bVerifyResultEmpty := (length(sVerifyResult)=0);
     if (MessageDlg(IfThen(bVerifyResultEmpty,
                    'По текущему решению не было создано ни одной проверки',
                    'По текущему решению существуют следующие проверки'
                     ),
                    sVerifyResult+IfThen(bVerifyResultEmpty,'',chr(10)+chr(10))+'Сохранить решение?',
                    sVerifyResult,
                    mtInformation,
                    [mbYes, mbNo],
                    0) <> mrYes) then
       Abort;
  end;
  inherited;
 {if (DataSet.FieldByName('ID').IsNull) or (DataSet.FieldByName('ID').AsInteger <= 0) then
   begin // Это добавление
    sVerifyResult := '';
    // список ошибок во входных параметрах проверок
    MainData.dsCheckVerifyParams.ParamByName('nSubjectID').Value := DataSet.FieldByName('SUBJECT_ID').AsInteger;
    MainData.dsCheckVerifyParams.ParamByName('nDocumentID').Value := DataSet.FieldByName('ID').AsInteger;
    MainData.dsCheckVerifyParams.ExecSQL;

    sVerifyResult := MainData.dsCheckVerifyParams.ParamByName('Result').AsString;
     // Банковский счет проверяем на клиенте, т.к. решения в базе еще нет
    if DataSet.FieldByName('ACCOUNT').IsNull then
     begin
      if length(sVerifyResult)=0 then sVerifyResult:= sVerifyResult + chr(10);
      sVerifyResult:= sVerifyResult + 'Не заполнено поле "Банковский счет"';
     end;
    if length(sVerifyResult)>0 then
     if (MessageDlg('Не все проверки участников ВЭД будут автоматически отправлены',
                    sVerifyResult+chr(10)+'Сохранить решение?',
                    sVerifyResult,
                    mtInformation,
                    [mbYes, mbNo],
                    0) <> mrYes) then
       Abort;
  end;
  }
end;

procedure TDecisionPayBackForm.edtBankBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  if AObject = nil then
    begin
      dsDataDECL_BANK_DEST.Clear;
      dsDataDECL_ADR_BANK_DEST.Clear;
      dsDataBIC.Clear;
      dsDataCORR_ACCOUNT.Clear;
    end
  else
   dsData['DECL_BANK_DEST;DECL_ADR_BANK_DEST;BIC;CORR_ACCOUNT'] := AObject.FieldValues['FULL_NAME;ADDRESS;BIC;CORR_ACCOUNT'];

  Modify(nil);
end;

function TDecisionPayBackForm.GetTemplateReportName: string;
var
  lv_KBK: string;
  lv_SalvageKBK :string;
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    Result := inherited GetTemplateReportName
  else
    Result := 'РЕШЕНИЕ_О_ВОЗВРАТЕ_ДС.doc';

  dsKBK_CODE.ParamByName('ID').AsInteger := dsData.FieldByName('ID').AsInteger;
  dsKBK_CODE.Open;
//  lv_kbk := dsData.FieldByName('KBK_CODE').AsString;
  lv_kbk := dsKBK_CODE.FieldByName('CODE').AsString;
  MainData.pkgCommon.PackageName := 'p_Params';
  lv_SalvageKBK := MainData.pkgCommon.GetStringVariable('cKbkSalvage');
//  if (Pos(lv_KBK, '15311208000016000120;15311208000011000120;15311208000013000120') > 0) then
  if (Pos(lv_KBK, lv_SalvageKBK) > 0) then
    Result := 'РЕШЕНИЕ ВИУтл.doc';
  dsKBK_CODE.Close;
end;


procedure TDecisionPayBackForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := TAction(Sender).Enabled
                         and (dsStateSYSNAME.AsString = 'DecisionPaybackCreated');
end;

procedure TDecisionPayBackForm.actCancelExecute(Sender: TObject);
  var
    CancelId       : integer;
begin
  odsAddCancelDecPayback.SetVariable('pId',dsData.FieldByName( 'ID' ).AsVariant);
  odsAddCancelDecPayback.ExecSQL;
  CancelId := odsAddCancelDecPayback.GetVariable('Id');
  if CancelId <> 0 then
    GetObjectServices.OpenObject( CancelId, nil );
end;

procedure TDecisionPayBackForm.actCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsStateSYSNAME.AsString = 'DecisionPaybackSigned';
end;

procedure TDecisionPayBackForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if DataSet.FieldByName( 'CURRENCY_ID' ).IsNull then
    DataSet.FieldByName( 'CURRENCY_ID' ).AsFloat := DictData.GetCurrencyRUR;

  DataSet.FieldByName( 'DECISION_COURT' ).AsString := 'N';
  DataSet.FieldByName( 'EXCISE_PAY' ).AsString     := 'N';



end;

procedure TDecisionPayBackForm.FillParamsToSend;
begin
  // ParamsHolder в унаследованных формах проставляет в SourceField ссылку на родительский объект
  // поэтому заполняем вручную (в DFM не проставить)
  Params.ParamByName( 'CURRENCY_ID' ).Value  := dsData.FieldByName( 'CURRENCY_ID' ).Value;
  Params.ParamByName( 'DEC_ID' ).Value       := dsData.FieldByName( 'ID' ).Value;
  Params.ParamByName( 'IS_UPDATABLE' ).Value := dsState.FieldByName( 'ISUPDATABLE' ).Value;
end;

procedure TDecisionPayBackForm.FillReportParams(AWord: TWordClass);
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    begin
      // принудительно в первую очередь, что бы не были заменены полями с более короткими названиями
      AWord.ReplaceText( '@DOC_NUMBER_FULL',   dsData.FieldByName( 'DOC_NUMBER_FULL' ).AsString );
      AWord.ReplaceText( '@APP_NUMBER_INCOME', dsData.FieldByName( 'APP_NUMBER_INCOME' ).AsString );
      AWord.ReplaceText( '@APP_DATE_INCOME',   dsData.FieldByName( 'APP_DATE_INCOME' ).AsString );
      AWord.ReplaceText( '@ARTICLE',           edtReasonAticle.Text );
      AWord.ReplaceText( '@SUMMA_S',           MoneyToString( dsDataSUMMA.Value, True, False ) );
      AWord.ReplaceText( '@SUD_REASON_NAME',   edtSudReason.Text );

      if    dsDataDEBTS_SUMMA.IsNull
         or ( dsDataDEBTS_SUMMA.Value = 0 ) then
        AWord.ReplaceText( '@DEBTS_SUMMA', '-' );

      if not qryDetail.Active then
        qryDetail.Open;
      AWord.GetArrayFromDataSet( qryDetail, 'PP',      'D_PP',      '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_TYPE', 'D_PO_TYPE', '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_NUM',  'D_PO_NUM',  '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_DATE', 'D_PO_DATE', '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_SUM',  'D_PO_SUM',  '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'RET_SUM', 'D_RET_SUM', '^p' );
      qryDetail.Close;
    end
  else
    begin
      AWord.ReplaceText( '@CASH_ASSETS_NAME',   cmbxReason.Text );
      dsArticleList.Open;
      AWord.GetArrayFromDataSet(dsArticleList, 'NAME', 'ARTICLE_LIST', '; ');
      dsArticleList.Close;
      dsPaymentOrderList.Open;
      AWord.GetArrayFromDataSet(dsPaymentOrderList, 'NAME', 'PO_LIST', '; ');
      dsPaymentOrderList.Close;
      dsDeclList.Open;
      AWord.GetArrayFromDataSet(dsDeclList, 'NAME', 'DECL_LIST', '; ');
      dsDeclList.Close;
    end;

  inherited;
end;

procedure TDecisionPayBackForm.tabAdviceShow(Sender: TObject);
begin
  if not Assigned(fAdviceForm) then
  begin
    fAdviceForm := ObjectServices.ShowForm('TAdviceByDecisionGridForm', Params, TWinControl(Sender));
    fAdviceForm.Realign;
    TObjectForm(fAdviceForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(fAdviceForm));
  end;

end;

procedure TDecisionPayBackForm.dsDataAfterScroll(DataSet: TDataSet);
var
 ch: char;
begin
 inherited;

 cbDecision.OnClick:= nil;
 cbBeforeAfter.OnClick:= nil;

 cbDecision.ItemIndex:= -1;
 cbBeforeAfter.itemIndex:= -1;

 if dsDataDECISION_COURT.IsNull then begin
   cbDecision.OnClick:= cbDecisionPropertiesChange;
   cbBeforeAfter.OnClick:= cbDecisionPropertiesChange;
   exit;
 end;

 ch:= dsDataDECISION_COURT.AsString[1];
 case ch of
  'A': begin cbDecision.ItemIndex:= 1; cbBeforeAfter.itemIndex := 0 end;
  'B': begin cbDecision.ItemIndex:= 1; cbBeforeAfter.itemIndex := 1 end;
  'C': begin cbDecision.ItemIndex:= 2; cbBeforeAfter.itemIndex := 0 end;
  'D': begin cbDecision.ItemIndex:= 2; cbBeforeAfter.itemIndex := 1 end;
  'E': cbDecision.ItemIndex:= 2;
  'F': cbDecision.ItemIndex:= 3;
  'G': cbDecision.ItemIndex:= 4;
  'H': cbDecision.ItemIndex:= 0;
  'Y': cbDecision.ItemIndex:= 1;
 end;

 cbDecisionPropertiesChange(nil);
 cbDecision.OnClick:= cbDecisionPropertiesChange;
 cbBeforeAfter.OnClick:= cbDecisionPropertiesChange;

end;

procedure TDecisionPayBackForm.dsDataAfterOpen(DataSet: TDataSet);
  var
    lv_Tag : Integer;
    lv_F   : Boolean;
begin
  inherited;
  if not DataSet.IsEmpty
     and not DataSet.FieldByName( 'reason_id' ).IsNull then
    edtReasonAticle.EditValue := dsAssetsReason.Lookup( 'ID', dsData.FieldByName( 'reason_id' ).AsFloat, 'CODE3' );

  lv_F := (not dsData.FieldByName( 'DECISION_COURT' ).IsNull)
      and ( dsData.FieldByName( 'DECISION_COURT' ).AsString[1] in ['Y','A','B','C','D']  );

 { 'Y'  // по решению суда
  'A'  // по решению суда, по решениям, принятым до выпуска
  'B'  // по решению суда, по решениям, принятым после выпуска
  'C'  //по исполнительному листу, по решениям, принятым до выпуска
  'D'  //по исполнительному листу, по решениям, принятым после выпуска}

  lciCourtActAttrs.Enabled    := lv_F;
  lciDateCourt.Enabled        := lv_F;
  lciCustomsDecAttrs.Enabled:= not lv_F;

  if not dsDataSUMMA.IsNull then
    begin
      lciSumma.Tag := 33;
      lv_Tag       := 11
    end
  else
    begin
      lciSumma.Tag := 11;
      lv_Tag       := 33;
    end;
  lciSignBy.Tag         := lv_Tag;
  lciSignDate.Tag       := lv_Tag;
  lciSignByChief.Tag    := lv_Tag;
  lciSignByChiefUDF.Tag := lv_Tag;

  if not dsDataSUBJECT_ID.IsNull then
    lv_Tag := 33
  else
    lv_Tag := 11;
  lciDeclName.Tag := lv_Tag;
  lciDeclINN.Tag  := lv_Tag;
  lciDeclKPP.Tag  := lv_Tag;

  if    IsNew
     or dsDataCURRENCY_ID.IsNull then
    lciCurrency.Tag := 11
  else
    lciCurrency.Tag := 33;

  if     not dsDataSIGN_DATE.IsNull
     and not dsDataSIGNED_BY.IsNull
     and not dsDataSIGNED_BY_CHIEF.IsNull
     and not dsDataSIGNED_BY_CHIEF_UDF.IsNull then
    lciReasonPayback.Tag := 33
  else
    lciReasonPayback.Tag := 11;

  UpdateLayoutControl(IsNew, lcGeneral);

  if    ( MainData.GetCustomsLevel = 2 )
     or ( dsData.FieldByName( 'EXT_SOURCE' ).AsString = MainData.GetCustomsCode ) Then
    actCancel.Visible := False;
    
  lciDocBasement.Caption:= CaptionAndAsterix( lciDocBasement.Caption, dsDataDECISION_COURT.Required );

  dsDataAfterScroll(DataSet);
end;


procedure TDecisionPayBackForm.cbDecisionPropertiesChange(Sender: TObject);
var
 s: string;
 b: boolean;
 ch: char;
 isCourt: boolean;

begin
 inherited;

 dsDataSUD_REASON_ID.Required := (cbDecision.ItemIndex > 0);
 lciSudReason.Caption:= CaptionAndAsterix( lciSudReason.Caption, dsDataSUD_REASON_ID.Required );

 lciSudReason.Enabled:= dsDataSUD_REASON_ID.Required;
 if( not lciSudReason.Enabled ) then
   dsData.FieldByName( edtSudReason.DataBinding.DataField ).Clear;

 s:= ClassName;
 lciDateCourt.Enabled:= false;
 lciCourtActAttrs.Enabled:= false;
 lciCustomsDecAttrs.Enabled:= false;

 isCourt:= cbDecision.ItemIndex in [1,2];

 if (cbDecision.itemIndex <= 0) then begin
   dsDataCUSTOMS_DEC_ATTRS.Clear;
   dsDataDATE_COURT.Clear;
   dsDataCOURT_ACT_ATTRS.Clear;
 end
 else
  if isCourt then begin
   lciDateCourt.Enabled:= true;
   lciCourtActAttrs.Enabled:= true;
   dsDataCUSTOMS_DEC_ATTRS.Clear;
  end
  else begin
   dsDataDATE_COURT.Clear;
   dsDataCOURT_ACT_ATTRS.Clear;
   lciCustomsDecAttrs.Enabled:= true;
  end;

  if lciBeforeAfter.Visible then begin
   cbBeforeAfter.Enabled := cbDecision.Enabled and isCourt;
   if ( not cbBeforeAfter.Enabled ) and ( cbBeforeAfter.itemIndex <> -1 ) then begin
    cbBeforeAfter.OnClick:= nil;
    cbBeforeAfter.itemIndex := -1;
    cbBeforeAfter.OnClick:=  cbDecisionPropertiesChange;
   end;
  end; {if lciBeforeAfter.Visible .. }

 ch:= getDecisionChar;
 if dsDataDECISION_COURT.Value <> ch then begin
   dsDataDECISION_COURT.Value:= ch;
   Modify(Sender);
 end;

end;

(*
 'Y'  // по решению суда
 'A'  // по решению суда, по решениям, принятым до выпуска
 'B'  // по решению суда, по решениям, принятым после выпуска
 'C'  //по исполнительному листу, по решениям, принятым до выпуска
 'D'  //по исполнительному листу, по решениям, принятым после выпуска
 'E'  //по исполнительному листу,
 'F' // в порядке проведения ведомственного контроля
 'G' // в связи с удовлетворением жалоб
 'H' // по заявлению участника
*)

function TDecisionPayBackForm.getDecisionChar: char;
begin
 result:= 'N';
 case cbDecision.ItemIndex of
  1: // по решению суда
    if cbBeforeAfter.Enabled {dsDataDOC_CODE.value = 'ВИз'} then begin
      case cbBeforeAfter.itemIndex of
        0: result:= 'A';  // по решениям, принятым до выпуска
        1: result:= 'B';  // по решениям, принятым после выпуска
      end;
    end
    else result:= 'Y';
  2: // по исполнительному листу
    if cbBeforeAfter.Enabled {dsDataDOC_CODE.value = 'ВИз'} then begin
      case cbBeforeAfter.itemIndex of
        0: result:= 'C';  // по решениям, принятым до выпуска
        1: result:= 'D';  // по решениям, принятым после выпуска
      end;
    end
    else result := 'E';

  3: result:= 'F'; // в порядке проведения ведомственного контроля
  4: result:= 'G'; // в связи с удовлетворением жалоб
  0: result:= 'H'; // по заявлению участника
 end;
end;

procedure TDecisionPayBackForm.tabChecksShow(Sender: TObject);
var
  lv_Params: TfdcParams;
begin
  inherited;
  if not Assigned(FChecksForm) then
  begin
    lv_Params := TfdcParams.Create(nil);
    try
      FChecksForm := ShowForm('TDeclarantChecksGridForm', lv_Params, tabChecks);

    finally
      lv_Params.Free;
    end;
  end;
  (FChecksForm as TDeclarantChecksGridForm).ParamsHolder.Params.ParamByName('SUBJECT_ID').Value :=  dsData.FieldValues['SUBJECT_ID'];
  //(FChecksForm as TDeclarantChecksGridForm).ParamsHolder.Params.ParamByName('DOCUMENT_ID').Value :=  dsData.FieldValues['ID'];
   (FChecksForm as TDeclarantChecksGridForm).ParamsHolder.Params.ParamByName('Account').Value := dsData.FieldValues['ACCOUNT'];
  (FChecksForm as TDeclarantChecksGridForm).actRefreshExecute(FChecksForm);
end;

initialization
  RegisterClass( TDecisionPayBackForm );
end.


