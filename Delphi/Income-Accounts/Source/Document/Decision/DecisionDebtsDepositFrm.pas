unit DecisionDebtsDepositFrm;

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
  TDecisionDebtsDepositForm = class(TDecisionDebtsForm)
    dsPaymentOrderList: TfdcQuery;
    dsPaymentOrderListNAME: TStringField;
    dsDeclList: TfdcQuery;
    dsDeclListNAME: TStringField;
    dsReportARTICLE_LIST: TStringField;
    dsReportCASH_ASSETS_NAME: TStringField;
    dsDetailTR_NUM: TStringField;
    dsDetailTR_SUM: TFloatField;
    dsDataIS_EXTERNAL: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    lcGeneralItem1: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
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
  DecisionDebtsDepositForm: TDecisionDebtsDepositForm;

implementation

{$R *.dfm}

{ TDecisionDebtsDepositForm }

function TDecisionDebtsDepositForm.GetDecisionTypeForReport: String;
begin
  Result := 'денежного залога';
end;

procedure TDecisionDebtsDepositForm.FillReportParams(AWord: TWordClass);
begin
  inherited;

  if     ( CurentReport = rtDecision )
     and ( dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) ) then
    begin
      if not dsDetail.Active then
        dsDetail.Open;
      AWord.GetArrayFromDataSet( dsDetail, 'TR_NUM',    'D_TR_NUM',    '^p' );
      AWord.GetArrayFromDataSet( dsDetail, 'TR_SUM',    'D_TR_SUM',    '^p' );
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


function TDecisionDebtsDepositForm.GetDocObligationsFormType: string;
begin
  Result := 'TDecisionDebtsDepositCDeclGridForm';
end;

procedure TDecisionDebtsDepositForm.FormShow(Sender: TObject);
begin
  inherited;
  lciSignByChief.Visible := dsData.FieldByName('IS_EXTERNAL').AsString <> 'Y';
  lciSignByChiefUDF.Visible := dsData.FieldByName('IS_EXTERNAL').AsString <> 'Y';
end;

initialization
  RegisterClass(TDecisionDebtsDepositForm);

end.
