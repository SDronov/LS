unit DocReuseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionFrm, cxGraphics, OracleData, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCheckBox, cxDBEdit, cxCurrencyEdit, fdcObjectLookupEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, fdcWord, QueryList;

type
  TDocReuseForm = class(TDecisionForm)
    dsDataCURRENCY_ID: TFloatField;
    dsDataCUSTOMS_NEW_ID: TFloatField;
    dsDataCUSTOMS_CODE_OLD: TStringField;
    dsDataCUSTOMS_CODE_NEW: TStringField;
    dsDataSIGNED_BY_CHIEF_OTP: TStringField;
    dsDataREASON: TStringField;
    dsDataAMOUNT: TFloatField;
    dsDataDECISION_ATTR: TStringField;
    edtReuseReason: TcxDBComboBox;
    lciReuseReason: TdxLayoutItem;
    edtCustonsDecisionAttrs: TcxDBTextEdit;
    lciReuseDecisionAttrs: TdxLayoutItem;
    lcgReuseCustomsOld: TdxLayoutGroup;
    lcgReuseCustomsNew: TdxLayoutGroup;
    edtReuseCustomsCodeOld: TcxDBTextEdit;
    lciReuseCustomsCodeOld: TdxLayoutItem;
    edtReuseCustomsNameOld: TcxDBTextEdit;
    lciReuseCustomsNameOld: TdxLayoutItem;
    dsDataCURRENCY_CODE: TStringField;
    dsDataCURRENCY_NAME: TStringField;
    dsDataCUSTOMS_NAME_OLD: TStringField;
    dsDataCUSTOMS_NAME_NEW: TStringField;
    dsetCustoms: TOracleDataSet;
    dsetCustomsID: TFloatField;
    dsetCustomsCUSTOMS_CODE_8: TStringField;
    dsetCustomsNAME: TStringField;
    dsetCustomsAVAILABLE: TFloatField;
    dsCustoms: TDataSource;
    edtReuseCustomsCodeNew: TcxDBLookupComboBox;
    lciReuseCustomsCodeNew: TdxLayoutItem;
    edtReuseCustomsNameNew: TcxDBTextEdit;
    lciReuseCustomsNameNew: TdxLayoutItem;
    dsetCurrency: TOracleDataSet;
    dsetCurrencyID: TFloatField;
    dsetCurrencyCODE: TStringField;
    dsetCurrencyNAME: TStringField;
    dsetCurrencyACODE: TStringField;
    dsetCurrencyIS_USABLE: TStringField;
    dsCurrency: TDataSource;
    lcgReuseCurrency: TdxLayoutGroup;
    edtReuseCurrencyCode: TcxDBLookupComboBox;
    lciReuseCurrencyCode: TdxLayoutItem;
    edtReuseCurrencyName: TcxDBTextEdit;
    lciReuseCurrencyName: TdxLayoutItem;
    edtReuseSumma: TcxDBCurrencyEdit;
    lciReuseSumma: TdxLayoutItem;
    dsetCustomsDT_END: TDateField;
    dsReport: TfdcQuery;
    dsReportDOC_DATE: TDateTimeField;
    dsReportDOC_NUMBER: TStringField;
    dsReportSRC_CUST_CODE: TStringField;
    dsReportDST_CUST_CODE: TStringField;
    dsReportDST_CUST_NAME: TStringField;
    dsReportDECL_NAME: TStringField;
    dsReportDECL_OKPO: TStringField;
    dsReportDECL_INN: TStringField;
    dsReportDECL_KPP: TStringField;
    dsReportDECL_ADDRESS: TStringField;
    dsReportSUMMA: TFloatField;
    dsReportCURRENCY: TStringField;
    dsReportCASH_ASSETS_NAME: TStringField;
    dsReportSIGN_DATE: TDateTimeField;
    dsReportSIGN3: TStringField;
    dsReportSIGN1: TStringField;
    dsReportSIGN2: TStringField;
    dsReportREASON: TStringField;
    dsReportSRC_CUST_NAME: TStringField;
    dsPaymentOrderList: TfdcQuery;
    dsPaymentOrderListNAME: TStringField;
    dsDeclList: TfdcQuery;
    dsDeclListNAME: TStringField;
    qryDetail: TfdcQuery;
    qryDetailPP: TFloatField;
    qryDetailPO_TYPE: TStringField;
    qryDetailPO_NUM: TStringField;
    qryDetailPO_DATE: TDateTimeField;
    qryDetailPO_SUM: TFloatField;
    qryDetailRET_SUM: TFloatField;
    procedure cxDBLookupComboBox1PropertiesInitPopup(Sender: TObject);
    procedure cxDBLookupComboBox1PropertiesCloseUp(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure edtReuseCurrencyCodePropertiesInitPopup(Sender: TObject);
    procedure edtReuseCurrencyCodePropertiesCloseUp(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure dsStateAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    function GetPaymentOrdersFormType : string; override;
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
  end;

var
  DocReuseForm: TDocReuseForm;

implementation

uses
  MainDM
 ,MoneyStrings
 ,fdcCustomDBDataFrm
 ,fdcCustomObjectFrm
 ,fdcCustomCardFrm;

{$R *.dfm}

procedure TDocReuseForm.cxDBLookupComboBox1PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;

  dsetCustoms.Filtered := True;
end;

procedure TDocReuseForm.cxDBLookupComboBox1PropertiesCloseUp(
  Sender: TObject);
begin
  inherited;

  dsetCustoms.Filtered := False;
end;

procedure TDocReuseForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  if not dsetCustoms.Active then
    dsetCustoms.Open;

  if not dsetCurrency.Active then
    dsetCurrency.Open;
  
  inherited;
end;

procedure TDocReuseForm.edtReuseCurrencyCodePropertiesInitPopup(
  Sender: TObject);
begin
  dsetCurrency.Filtered := True;
end;

procedure TDocReuseForm.edtReuseCurrencyCodePropertiesCloseUp(
  Sender: TObject);
begin
  dsetCurrency.Filtered := False;

  dsData['CURRENCY_CODE;CURRENCY_NAME'] := dsetCurrency.Lookup( 'id', edtReuseCurrencyCode.EditValue, 'CODE;NAME' );
end;

procedure TDocReuseForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  dsData['CURRENCY_ID;CURRENCY_CODE;CURRENCY_NAME'] := dsetCurrency.Lookup( 'CODE', '643', 'ID;CODE;NAME' );
  dsData['CUSTOMS_CODE_OLD']                        := MainData.GetCustomsCode;
  dsData.FieldByName( 'doc_code' ).AsString := 'ТАв';
end;

function TDocReuseForm.GetPaymentOrdersFormType: string;
begin
  Result := 'TDeductionReuseGridForm';
end;

function TDocReuseForm.GetTemplateReportName: string;
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    Result := inherited GetTemplateReportName
  else
    Result := 'РЕШЕНИЕ_О_ПЕРЕЗАЧЕТЕ_ДС.doc';
end;

procedure TDocReuseForm.FillReportParams(AWord: TWordClass);
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    begin
      AWord.ReplaceText( '@SUMMA_S', MoneyToString( dsDataAMOUNT.Value, True, False ) );

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
      dsReport.Open;
      AWord.ReplaceRecFromQuery(dsReport);
      dsReport.Close;
      dsPaymentOrderList.Open;
      AWord.GetArrayFromDataSet(dsPaymentOrderList, 'NAME', 'PAYMENT_LIST', '^p');
      dsPaymentOrderList.Close;
      dsDeclList.Open;
      AWord.GetArrayFromDataSet(dsDeclList, 'NAME', 'DECL_LIST', '; ');
      dsDeclList.Close;
    end;

  inherited;
end;

procedure TDocReuseForm.dsStateAfterOpen(DataSet: TDataSet);
  var
    vReadOnly : boolean;
begin
  inherited;

  vReadOnly := (AnsiUpperCase(dsStateSYSNAME.Value) <> 'STATE.REUSE.CREATED');
  Params.ParamByName('DeductionsReadOnly').AsBoolean := vReadOnly;
  if Assigned( fPaymentOrdersForm ) then
    (fPaymentOrdersForm as TfdcCustomDBDataForm).ParamByName('DeductionsReadOnly').AsBoolean := vReadOnly;
end;

procedure TDocReuseForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  //на уровне РТУ и ФТС разрешить менять статусы только "чужим" документам
  if    (    ( MainData.GetCustomsLevel = 1 )
         and ( Copy( DataSet.FieldByName( 'CUSTOMS_CODE_NEW' ).AsString, 1, 3 )
             = Copy( DataSet.FieldByName( 'CUSTOMS_CODE_OLD' ).AsString, 1, 3 ) )
         and ( DataSet.FieldByName( 'CUSTOMS_CODE_OLD' ).AsString <> MainData.GetCustomsCode ) )
     or (    ( MainData.GetCustomsLevel = 0 )
         and ( DataSet.FieldByName( 'EXT_SOURCE' ).AsString <> MainData.GetSoftCustomsCode ) ) then
    dsTransit.Params.ParamValues['pVal'] := 1
  else
    dsTransit.Params.ParamValues['pVal'] := 0;

  if dsTransit.Active then
    dsTransit.Close;

  inherited;

  if Self.IsNew then
    begin
      actNew.Visible  := ( dsData.FieldByName( 'CUSTOMS_CODE_OLD' ).AsString = MainData.GetCustomsCode );
      actSave.Visible := ( dsData.FieldByName( 'CUSTOMS_CODE_OLD' ).AsString = MainData.GetCustomsCode );
    end;

  if    IsNew
     or ( dsData.FieldByName( 'CUSTOMS_CODE_OLD' ).AsString = MainData.GetCustomsCode ) then
    begin
      dsetCustoms.Filter := 'CUSTOMS_CODE_8 <> ' + QuotedStr(MainData.GetCustomsCode);
      dsetCustoms.Filtered := True;
    end;
end;

initialization

  RegisterClass( TDocReuseForm );

end.
