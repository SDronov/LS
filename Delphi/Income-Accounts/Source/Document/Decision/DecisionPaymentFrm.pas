unit DecisionPaymentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionFrm, cxGraphics, OracleData, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCurrencyEdit, cxDBEdit, cxCheckBox, fdcObjectLookupEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, fdcWord, QueryList, fdcMessages;

type
  TDecisionPaymentForm = class(TDecisionForm)
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsDataEXCISE_PAY: TStringField;
    dsDataDECISION_COURT: TStringField;
    dsDataDATE_COURT: TDateTimeField;
    dsDataCOURT_ACT_ATTRS: TStringField;
    dsDataCUSTOMS_DEC_ATTRS: TStringField;
    qryPOList: TfdcQuery;
    qryDeclList: TfdcQuery;
    dsArticleList: TfdcQuery;
    dsArticleListCODE2: TStringField;
    dsASSETS: TfdcQuery;
    dsASSETSASSETSNAME: TStringField;
    lcgCourt: TdxLayoutGroup;
    edtDecisionCourt: TcxDBCheckBox;
    lciDecisionCourt: TdxLayoutItem;
    edtExcisePay: TcxDBCheckBox;
    lciExcisePay: TdxLayoutItem;
    edtCourtActAttrs: TcxDBTextEdit;
    lciCourtActAttrs: TdxLayoutItem;
    edtCustomsDecAttrs: TcxDBTextEdit;
    lciCustomsDecAttrs: TdxLayoutItem;
    lcgReasonAticle: TdxLayoutGroup;
    lciReasonPayment: TdxLayoutItem;
    edtReasonAticle: TcxTextEdit;
    lciReasonAticle: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    qryPT_SUMS: TfdcQuery;
    qryPT_SUMSCODE: TStringField;
    qryPT_SUMSSUMMA: TFloatField;
    qryDetail: TfdcQuery;
    qryDetailPP: TFloatField;
    qryDetailPO_TYPE: TStringField;
    qryDetailPO_NUM: TStringField;
    qryDetailPO_DATE: TDateTimeField;
    qryDetailPO_SUM: TFloatField;
    qryDetailOD_NUM: TStringField;
    qryDetailOD_PT: TStringField;
    qryDetailOD_COR: TFloatField;
    qryDetailREUSE_SUM: TFloatField;
    dsDataKBKCODE: TStringField;
    dsDataCUSTOMSNAME: TStringField;
    dsDataBOSSNAME: TStringField;
    dsDataRUB: TIntegerField;
    dsDataKOPP: TStringField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataADDRESS: TStringField;
    dsDataPASSPORT: TStringField;
    dsDataBOSSRANK: TStringField;
    dsBasements: TOracleDataSet;
    srcBasements: TDataSource;
    cbBeforeAfter: TcxComboBox;
    lcBeforeAfter: TdxLayoutItem;
    dsBasementsDOC_CODE: TStringField;
    dsBasementsCODE_NAME: TStringField;
    cbDocBasement: TcxComboBox;
    lcGeneralItem1: TdxLayoutItem;
    dsDataSUMMA: TFloatField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure cmbxReasonPropertiesCloseUp(Sender: TObject);
    procedure tabPaymentOrdersShow(Sender: TObject);
    procedure tabDocObligationsShow(Sender: TObject);
    procedure edtBasementsPropertiesChange(Sender: TObject);
    procedure edtBasementsClick(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure cbBeforeAfterClick(Sender: TObject);
    procedure dsDataAfterScroll(DataSet: TDataSet);
  private
    function getDocBasement_Char: char;
    { Private declarations }
  protected
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
    function GetPaymentOrdersFormType : string; override;
    function GetDocObligationsFormType : string; override;
  public
    { Public declarations }
  end;

var
  DecisionPaymentForm: TDecisionPaymentForm;

implementation

uses
  FormUtils
 ,fdcCustomCardFrm
 ,fdcCustomDBDataFrm
 ,fdcCustomObjectGridFrm
 ,DictDM
 ,MainDm
 ,MoneyStrings;

{$R *.dfm}

procedure TDecisionPaymentForm.FillReportParams(AWord: TWordClass);
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    begin
      // принудительно в первую очередь, что бы не были заменены полями с более короткими названиями
      AWord.ReplaceText( '@DOC_NUMBER_FULL', dsData.FieldByName( 'DOC_NUMBER_FULL' ).AsString );
      AWord.ReplaceText( '@APP_DATE_INCOME', dsData.FieldByName( 'APP_DATE_INCOME' ).AsString );
      AWord.ReplaceText( '@ARTICLE',         edtReasonAticle.Text );
      AWord.ReplaceText( '@SUMMA_S',         MoneyToString( dsDataSUMMA.Value, True, False ) );

      if    dsDataDEBTS_SUMMA.IsNull
         or ( dsDataDEBTS_SUMMA.Value = 0 ) then
        AWord.ReplaceText( '@DEBTS_SUMMA', '-' );

      if not qryPT_SUMS.Active then
        qryPT_SUMS.Open;
      AWord.GetArrayFromDataSet( qryPT_SUMS, 'CODE',  'PT_CODE',  '^p' );
      AWord.GetArrayFromDataSet( qryPT_SUMS, 'SUMMA', 'PT_SUMMA', '^p' );
      qryPT_SUMS.Close;

      if not qryDetail.Active then
        qryDetail.Open;
      AWord.GetArrayFromDataSet( qryDetail, 'PP',        'D_PP',        '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_TYPE',   'D_PO_TYPE',   '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_NUM',    'D_PO_NUM',    '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_DATE',   'D_PO_DATE',   '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'PO_SUM',    'D_PO_SUM',    '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'OD_NUM',    'D_OD_NUM',    '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'OD_PT',     'D_OD_PT',     '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'OD_COR',    'D_OD_COR',    '^p' );
      AWord.GetArrayFromDataSet( qryDetail, 'REUSE_SUM', 'D_REUSE_SUM', '^p' );
      qryDetail.Close;
    end
  else
    begin
      if not qryPOList.Active then
        qryPOList.Open;
      AWord.GetArrayFromDataSet( qryPOList, 'PO_NAME', 'PO_LIST', '; ' );
      qryPOList.Close;

      if not qryDeclList.Active then
        qryDeclList.Open;
      AWord.GetArrayFromDataSet( qryDeclList, 'DECL_NAME', 'DECL_LIST', '; ' );
      qryDeclList.Close;

      if not dsArticleList.Active then
        dsArticleList.Open;
      AWord.GetArrayFromDataSet(dsArticleList, 'CODE2', 'ARTICLE_LIST', '; ');
      dsArticleList.Close;

      dsASSETS.Open;
      AWord.GetArrayFromDataSet(dsASSETS, 'ASSETSNAME', 'CASH_ASSETS_NAME', ' ');
      dsASSETS.Close;
    end;

  inherited;
end;

function TDecisionPaymentForm.GetDocObligationsFormType: string;
begin
  Result := 'TDecisionPaymentCDeclGridForm';
end;

function TDecisionPaymentForm.GetPaymentOrdersFormType: string;
begin
  Result := 'TDecisionPaymentPOGridForm';
end;

procedure TDecisionPaymentForm.cmbxReasonPropertiesCloseUp( Sender: TObject );
begin
 edtReasonAticle.EditValue :=
    dsAssetsReason.Lookup( 'ID', cmbxReason.EditValue, 'CODE3' );
end;

procedure TDecisionPaymentForm.tabPaymentOrdersShow(Sender: TObject);
begin
  inherited;

  with fPaymentOrdersForm as TfdcCustomObjectGridForm do
    begin
      actAdd.Visible    := False;
      actDelete.Visible := False;
    end;
end;

procedure TDecisionPaymentForm.tabDocObligationsShow(Sender: TObject);
begin
  inherited;

  with fDocObligationsForm as TfdcCustomObjectGridForm do
    begin
      actAdd.Visible    := False;
      actDelete.Visible := False;
    end;
end;

function TDecisionPaymentForm.GetTemplateReportName: string;
var
  lv_KBK: string;
  lv_SalvageKBK :string;
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    Result := inherited GetTemplateReportName
  else
    Result := 'РЕШЕНИЕ_О_ЗАЧЕТЕ_ДС_В_СЧЕТ_ТАМОЖЕННЫХ_ПЛАТЕЖЕЙ.doc';

  lv_kbk := dsData.FieldByName('KBKCODE').AsString;
  MainData.pkgCommon.PackageName := 'p_Params';
  lv_SalvageKBK := MainData.pkgCommon.GetStringVariable('cKbkSalvage');
  //if Pos(lv_KBK, '15311208000016000120;15311208000011000120;15311208000013000120') > 0 then

  if (Pos(lv_KBK, lv_SalvageKBK) > 0) then
    Result := 'РЕШЕНИЕ ЗИУтл.doc';
end;


procedure TDecisionPaymentForm.dsDataAfterOpen(DataSet: TDataSet);
begin
 inherited;
 { TODO : !!!!!!! }
 if (not dsBasements.Active) then
   dsBasements.Open;

(*  if not DataSet.IsEmpty then
    lciDocBasement.Enabled := DataSet.FieldByName( 'decision_court' ).AsString = 'Y';

  if (not DataSet.IsEmpty)
      and (dsDataDECISION_COURT <> 'N') then
   edtBasements.editValue:= dsBasements.Lookup( 'doc_code', dsDataDECISION_COURT.AsString, 'code_name' );
*)

  if (not DataSet.IsEmpty) and (not DataSet.FieldByName( 'reason_id' ).IsNull) then
    edtReasonAticle.EditValue := dsAssetsReason.Lookup( 'ID', dsData.FieldByName( 'reason_id' ).AsString, 'CODE3' );

 if ( dsDataIs_Active.asString = 'Y' ) then begin
   edtSudReason.enabled:= false;
   edtCourtActAttrs.enabled:= false;
   edtCustomsDecAttrs.enabled:= false;
   edtExcisePay.enabled:= false;

   cbDocBasement.Enabled := false;
   cbBeforeAfter.Enabled := false;
 end;

 if (not dsData.IsEmpty) and dsDataREASON_ID.Required and (dsDataIs_Active.asString <> 'Y')
 then begin
   lciReasonPayment.Enabled:= true;
   cmbxReason.Enabled:= true;
 end;

end;

procedure TDecisionPaymentForm.edtBasementsPropertiesChange(  Sender: TObject);
var isCourt: boolean;
begin
 {новый пункт 5 - отрабатываем так же, как 0}
 dsDataSUD_REASON_ID.Required := (cbDocBasement.ItemIndex in [1, 2, 3, 4 ]); { > 0}
 lciSudReason.Caption:= CaptionAndAsterix( lciSudReason.Caption, dsDataSUD_REASON_ID.Required );

 lciSudReason.Enabled:= dsDataSUD_REASON_ID.Required;
 if( not lciSudReason.Enabled ) then
   dsData.FieldByName( edtSudReason.DataBinding.DataField ).Clear;

 isCourt:= cbDocBasement.ItemIndex in [1, 2];

 lciCourtActAttrs.Enabled := isCourt;
 lciCustomsDecAttrs.Enabled:= not isCourt;

 if isCourt then begin
   dsDataCUSTOMS_DEC_ATTRS.Clear;
   cbBeforeAfter.Enabled:= true;
 end
 else begin
  cbBeforeAfter.Enabled:= false;
  cbBeforeAfter.ItemIndex := -1;
  dsDataCOURT_ACT_ATTRS.Clear;
 end;

//  if( cbDocBasement.ItemIndex = 0 )then begin
 if( cbDocBasement.ItemIndex in [0, 5] )then begin
   lciCustomsDecAttrs.Enabled:= false;
   dsDataCUSTOMS_DEC_ATTRS.Clear;
 end;

 dsDataDECISION_COURT.Value:= getDocBasement_Char;

 Modify(Sender);
end;

procedure TDecisionPaymentForm.cbBeforeAfterClick(Sender: TObject);
begin
 inherited;
 edtBasementsPropertiesChange( nil );
end;

function TDecisionPaymentForm.getDocBasement_Char: char;
begin
 result:= 'N';
 case cbDocBasement.ItemIndex of
  1: // по решению суда
    if cbBeforeAfter.Enabled then begin
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
  5: result:= 'I'; // аналогично 0
 end;
end;


procedure TDecisionPaymentForm.dsDataAfterScroll(DataSet: TDataSet);
var ch: char;
begin
 inherited;

 if dsDataDECISION_COURT.IsNull then begin
   cbDocBasement.OnClick:= edtBasementsPropertiesChange;
   cbBeforeAfter.OnClick:= edtBasementsPropertiesChange;
   exit;
 end;

 ch:= dsDataDECISION_COURT.AsString[1];
 case ch of
  'A': begin cbDocBasement.ItemIndex:= 1; cbBeforeAfter.itemIndex := 0 end;
  'B': begin cbDocBasement.ItemIndex:= 1; cbBeforeAfter.itemIndex := 1 end;
  'C': begin cbDocBasement.ItemIndex:= 2; cbBeforeAfter.itemIndex := 0 end;
  'D': begin cbDocBasement.ItemIndex:= 2; cbBeforeAfter.itemIndex := 1 end;
  'E': cbDocBasement.ItemIndex:= 2;
  'F': cbDocBasement.ItemIndex:= 3;
  'G': cbDocBasement.ItemIndex:= 4;
  'H': cbDocBasement.ItemIndex:= 0;
  'I': cbDocBasement.ItemIndex:= 5;
  'Y': cbDocBasement.ItemIndex:= 1;
 end;

 edtBasementsPropertiesChange(nil);
 cbDocBasement.OnClick:= edtBasementsPropertiesChange;
 cbBeforeAfter.OnClick:= edtBasementsPropertiesChange;
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


procedure TDecisionPaymentForm.edtBasementsClick(Sender: TObject);
begin
  inherited;
 edtBasementsPropertiesChange(sender);
end;

procedure TDecisionPaymentForm.dsDataBeforePost(DataSet: TDataSet);
begin
 inherited;

 if cbBeforeAfter.Enabled and(cbBeforeAfter.ItemIndex < 0) and
    ( mrYes <> fdcMessages.MessageDlg( 'Не заполнено поле "по решениям, принятым" в блоке "Документ-основание"',
                                 'Невозможно сохранить решение! ',
                                 'Необходимо заполнить поле "по решениям, принятым" в блоке "Документ-основание"',
                                 mtConfirmation, [mbOk], 0) )
  then begin
    cbBeforeAfter.SetFocus;
    abort;
  end;

  if  cbDocBasement.Enabled and ( dsDataDECISION_COURT.isNull or ('N' = dsDataDECISION_COURT.AsString) ) and
     ( mrYes <> fdcMessages.MessageDlg( 'Поле "Документ-основание" не заполнено!',
                          'Невозможно сохранить решение! ',
                          'Необходимо указать Документ-основание',
                          mtConfirmation, [mbOk] ,0 )  )
  then begin
    cbDocBasement.SetFocus;
    abort;
  end;
end;

(*select doc_code, code_name, ord from
(
 select 'H' as doc_code, 'по заявлению участника' as code_name, 0 as ord from dual
  union
 select 'Y' as doc_code, 'по решению суда' as code_name, 1 as ord from dual
  union
 select 'E' as doc_code, 'по исполнительному листу' as code_name, 2 as ord from dual
  union
 select 'F' as doc_code, 'в порядке проведения ведомственного контроля' as code_name, 3 as ord from dual
  union
 select 'G' as doc_code, 'в связи с удовлетворением жалоб' as code_name, 4 as ord from dual
)
order by ord *)

initialization
  RegisterClass( TDecisionPaymentForm );


end.





