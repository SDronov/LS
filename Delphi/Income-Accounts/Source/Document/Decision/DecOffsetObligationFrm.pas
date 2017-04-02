unit DecOffsetObligationFrm;

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
  TDecOffsetObligationForm = class(TDecisionForm)
    lcicmbxCurrency: TdxLayoutItem;
    cmbxCurrency: TfdcObjectLookupEdit;
    lciedtSumma: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    tabDeclTpoPay: TcxTabSheet;
    dsPayDetail: TfdcQuery;
    dsPayDetailDECL_ID: TFloatField;
    dsPayDetailDECL_DOC_NAME: TStringField;
    dsPayDetailDECL_DATE: TDateTimeField;
    dsPayDetailPAY_TYPE_CODE: TStringField;
    dsPayDetailPAYABLE_SUMMA: TFloatField;
    dsPayDetailPAY_SUMMA: TFloatField;
    QueryList: TQueryList;
    sqlOpGetPaySumm: TsqlOp;
    dsDetail: TfdcQuery;
    dsDetailD_PP: TFloatField;
    dsDetailD_PO_TYPE: TStringField;
    dsDetailD_PO_DOC_NUMBER: TStringField;
    dsDetailD_PO_DOC_DATE: TDateTimeField;
    dsDetailD_PO_DOC_SUMMA: TFloatField;
    dsDetailD_TR_NAME: TStringField;
    dsDetailD_TR_SUMM: TFloatField;
    dsDetailD_PAY_SUMMA: TFloatField;
    dsDataIS_EXTERNAL: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    lcGeneralItem1: TdxLayoutItem;
    procedure tabDeclTpoPayShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsPayDetailBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDeclTpoPayForm: TForm;
  protected
    function GetDocObligationsFormType : string; override;
    function GetPaymentOrdersFormType : string; override;

    function GetTemplateReportName : String; override;
    procedure FillReportParams(AWord: TWordClass); override;

  public
    { Public declarations }

    property DeclTpoPayForm: TForm read fDeclTpoPayForm write fDeclTpoPayForm;
  end;

var
  DecOffsetObligationForm: TDecOffsetObligationForm;

implementation

uses ObjectFrm, fdcCustomObjectFrm, DecOffsetObligationDeclTpoGridFrm, MoneyStrings,
  fdcCustomCardFrm;

{$R *.dfm}

function TDecOffsetObligationForm.GetDocObligationsFormType: string;
begin
  Result := 'TDecOffsetObligationTRGridForm';
end;

function TDecOffsetObligationForm.GetPaymentOrdersFormType: string;
begin
  Result := 'TDecOffsetObligationPOGridForm';
end;

procedure TDecOffsetObligationForm.tabDeclTpoPayShow(Sender: TObject);
begin
  if not Assigned(fDeclTpoPayForm) then
    begin
      fDeclTpoPayForm := ShowForm('TDecOffsetObligationDeclTpoGridForm', Params, tabDeclTpoPay);
      TObjectForm(fDeclTpoPayForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(fDeclTpoPayForm));
    end;
  //--
  TDecOffsetObligationDeclTpoGridForm(fDeclTpoPayForm).actAdd.Visible := (dsStateSYSNAME.AsString = 'State.DecOffsetObligation.Create');
  TDecOffsetObligationDeclTpoGridForm(fDeclTpoPayForm).actDelete.Visible := TDecOffsetObligationDeclTpoGridForm(fDeclTpoPayForm).actAdd.Visible;
  //--
end;

procedure TDecOffsetObligationForm.FormCreate(Sender: TObject);
begin
  inherited;
  fDeclTpoPayForm:= nil;
end;

procedure TDecOffsetObligationForm.FillReportParams(AWord: TWordClass);
begin
  inherited;
  //--
  if dsDataSUMMA.IsNull or (dsDataSUMMA.Value = 0) then
    begin
      AWord.ReplaceText('@SUMMS', '-');
      AWord.ReplaceText('@SUMMA', '-');
    end
  else
     begin
       AWord.ReplaceText('@SUMMS', MoneyToString(dsDataSUMMA.Value, True, False));
       AWord.ReplaceText('@SUMMA', edtSumma.text);
     end;
  //--
   if dsDataDEBTS_SUMMA.IsNull or ( dsDataDEBTS_SUMMA.Value = 0 ) then
     begin
       AWord.ReplaceText('@DEBTS_SUMMA', '-');
     end
   else
      begin
        AWord.ReplaceText('@DEBTS_SUMMA',edtDebtsSumma.text);
      end;
   //--
   dsDetail.ReQuery;
   AWord.GetArrayFromDataSet(dsDetail, 'D_PP', 'D_PP', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_PO_TYPE', 'D_PO_TYPE', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_PO_DOC_NUMBER', 'D_PO_DOC_NUMBER', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_PO_DOC_DATE', 'D_PO_DOC_DATE', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_PO_DOC_SUMMA', 'D_PO_DOC_SUMMA', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_TR_NAME', 'D_TR_NAME', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_TR_SUMM', 'D_TR_SUMM', '^p');
   AWord.GetArrayFromDataSet(dsDetail, 'D_PAY_SUMMA', 'D_PAY_SUMMA', '^p');
   dsDetail.Close;
   //--
   dsPayDetail.ReQuery;
   AWord.GetArrayFromDataSet(dsPayDetail, 'DECL_DOC_NAME', 'DECL_DOC_NAME', '^p');
   AWord.GetArrayFromDataSet(dsPayDetail, 'PAY_TYPE_CODE', 'PAY_TYPE_CODE', '^p');
   AWord.GetArrayFromDataSet(dsPayDetail, 'PAY_SUMMA', 'PAY_SUMMA', '^p');
   dsPayDetail.Close;
   //--
   sqlOpGetPaySumm.Exec('id', [dsDataID.AsFloat]);
   AWord.ReplaceText('@PAY_TOTAL_SUMMA', VarToStr(sqlOpGetPaySumm.ParamValues['result']));
   //--
   AWord.ReplaceText('@SIGNED_BY_CHIEF_UDF', edtSignByChiefUDS.Text);
   AWord.ReplaceText('@SIGNED_BY_CHIEF',     edtSignByChief.Text);
   AWord.ReplaceText('@SIGNED_BY', edtSignBy.Text);
end;

function TDecOffsetObligationForm.GetTemplateReportName: String;
begin
  Result := 'Ðåøåíèå_ÇÄçÎ.doc'
end;

procedure TDecOffsetObligationForm.dsPayDetailBeforeOpen(
  DataSet: TDataSet);
  var lv_params: TParam;
begin
  inherited;
  lv_params := TFdcQuery(DataSet).Params.FindParam('ID');
  if (lv_params <> nil) then
    begin
      lv_params.Value := ParamsHolder.Params.ParamByName('ID').Value;
    end;
end;

procedure TDecOffsetObligationForm.FormShow(Sender: TObject);
begin
  inherited;
  lciSignByChief.Visible := dsData.FieldByName('IS_EXTERNAL').AsString <> 'Y';
  lciSignByChiefUDF.Visible := dsData.FieldByName('IS_EXTERNAL').AsString <> 'Y';
end;

initialization
  RegisterClass(TDecOffsetObligationForm);

end.
