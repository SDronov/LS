unit DecisionDebtsOverPayFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionDebtsFrm, cxGraphics, OracleData, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCheckBox, cxDBEdit, cxCurrencyEdit, fdcObjectLookupEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, fdcWord, ObjectFrm, fdcCustomObjectGridFrm,
  QueryList;

type
  TDecisionDebtsOverPayForm = class(TDecisionDebtsForm)
    dsDeclList: TfdcQuery;
    dsDeclListNAME: TStringField;
    dsPaymentOrderList: TfdcQuery;
    dsPaymentOrderListNAME: TStringField;
    dsReportARTICLE_LIST: TStringField;
    dsReportCASH_ASSETS_NAME: TStringField;
    dsReportDEBTS_NAME: TStringField;
    dsDetailOD_NUM: TStringField;
    dsDetailOD_PT: TStringField;
    dsDetailOD_COR: TFloatField;
    dsDetailPT: TfdcQuery;
    dsDetailPTPT_CODE: TStringField;
    dsDetailPTPT_SUMMA: TFloatField;
  private
  protected
    FCustomDeclGridForm : TForm;

    function GetDocObligationsFormType : string; override;
    function GetDecisionTypeForReport : String; override;
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
  end;

var
  DecisionDebtsOverPayForm: TDecisionDebtsOverPayForm;

implementation

{$R *.dfm}

uses
  MainDM;

{ TDecisionDebtsOverPayForm }

function TDecisionDebtsOverPayForm.GetDecisionTypeForReport: String;
begin
  Result := 'излишней уплаты (взыскания)';
end;

procedure TDecisionDebtsOverPayForm.FillReportParams(AWord: TWordClass);
begin
  inherited;

  if     ( CurentReport = rtDecision )
     and ( dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) ) then
    begin
      if not dsDetail.Active then
        dsDetail.Open;
      AWord.GetArrayFromDataSet( dsDetail, 'OD_NUM', 'D_OD_NUM',   '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'OD_PT',  'D_OD_PT',    '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'OD_COR', 'D_OD_COR',   '^p' );

      if dsDetailPT.Active then
        dsDetailPT.Close;
      dsDetailPT.Open;
      AWord.GetArrayFromDataSet( dsDetailPT, 'PT_CODE',   'PT_CODE',   '^p' );
      AWord.GetArrayFromDataSet( dsDetailPT, 'PT_SUMMA',  'PT_SUMMA',  '^p' );
      dsDetailPT.Close;
    end
  else
    begin
      dsPaymentOrderList.Open;
      AWord.GetArrayFromDataSet(dsPaymentOrderList, 'NAME', 'PO_LIST', '; ');
      dsPaymentOrderList.Close;
      dsDeclList.Open;
      AWord.GetArrayFromDataSet(dsDeclList, 'NAME', 'DECL_LIST', '; ');
      dsDeclList.Close;
    end;
end;


function TDecisionDebtsOverPayForm.GetDocObligationsFormType: string;
begin
  Result := 'TDecisionDebtsDepositCDeclGridForm';
end;

initialization
  RegisterClass(TDecisionDebtsOverPayForm);

end.
