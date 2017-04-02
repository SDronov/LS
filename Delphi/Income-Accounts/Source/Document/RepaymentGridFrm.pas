unit RepaymentGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, QueryList,
  Menus, SubjIntf;

type
  TRepaymentGridForm = class(TObjectGridForm, ISubjectHolder)
    dsDataDECL_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataGTD_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataRATE: TFloatField;
    dsDataPERCENTAGE: TFloatField;
    dsDataREPAYMENT_PERIOD: TDateTimeField;
    dsDataIS_REPAYMENT_OR_DELAY: TIntegerField;
    dsDataIS_REPAYMENT_OR_DELAY_NAME: TStringField;
    dsDataDEP_TYPE_ID: TFloatField;
    dsDataDEP_TYPE_NAME: TStringField;
    grdDataDBBandedTableViewDECL_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewGTD_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewRATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPERCENTAGE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREPAYMENT_PERIOD: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_REPAYMENT_OR_DELAY: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_REPAYMENT_OR_DELAY_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEP_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDEP_TYPE_NAME: TcxGridDBBandedColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    actMakePayment: TAction;
    QueryList1: TQueryList;
    sqlPreparePayments: TsqlOp;
    sqlAddCharge: TsqlOp;
    dsDataREST_SUMMA: TFloatField;
    grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn;
    sqlFromDate: TsqlOp;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    procedure actMakePaymentExecute(Sender: TObject);
    procedure dsDataFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure actOpenExecute(Sender: TObject);
    procedure actMakePaymentUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetSubjectINN: String;
    function GetSubjectId: Double;
    function GetSubjectKPP: String;
    function GetSubjectName: String;
    { Public declarations }
  end;

var
  RepaymentGridForm: TRepaymentGridForm;

implementation

uses SelectPOWizardFrm, MainDm, Oracle, fdcCustomObjectGridFrm,
  RepaymentSummDlgFrm;

{$R *.dfm}

procedure TRepaymentGridForm.actMakePaymentExecute(Sender: TObject);
var
  FSelCurrency: double;
  FSelSumma: Currency;
  FSelDate:TDateTime;
  F: TRepaymentSummDlgForm;
begin
  inherited;

  sqlFromDate.ParamValues['FROMDATE'] := Date;
  sqlFromDate.Exec('DECLID;REPAYID',[dsDataDECL_ID.Value,dsDataID.Value]);

  F := TRepaymentSummDlgForm.Create(nil);
  F.RepaySumm := dsDataREST_SUMMA.Value;
  F.DeclId := dsDataDECL_ID.Value;
  F.RepayId := dsDataID.Value;
  F.cxDateEdit1.Date := Date;
  F.FromDate := sqlFromDate.ParamValues['FROMDATE'];
  try
    if(F.ShowModal = mrOk) then
    begin
     FSelDate := F.cxDateEdit1.Date;
     FSelSumma := F.cxDBCurrencyEdit1.Value;
    end
    else
     exit;
  finally
   F.Free;
  end;

  //FSelSumma := dsDataSUMMA.AsCurrency;
  FSelCurrency := dsDataCURRENCY_ID.AsCurrency;

  QueryList1.Session.SetTransaction(tmReadCommitted);
  try
    sqlPreparePayments.Exec;

    sqlAddCharge.Exec('DECLID;PAYTYPEID;CURRENCYID;TOTALSUMMA;TODATE;REPAYID',[dsDataDECL_ID.Value,dsDataPAY_TYPE_ID.Value,dsDataCURRENCY_ID.Value,FSelSumma,FSelDate,dsDataID.Value]);

    if ShowPaymentWizard(FSelSumma, FSelCurrency, False, FSelDate, dsDataSUBJECT_ID.AsInteger,True,0,1,dsDataDECL_ID.AsString) then
    begin
      QueryList1.Session.Commit;
      try
        RefreshData;
      except
      end;
      RefreshWaiters;
    end
    else
      QueryList1.Session.Rollback;
  except
    QueryList1.Session.Rollback;
    raise;
  end;

end;

procedure TRepaymentGridForm.dsDataFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := dsDataREST_SUMMA.Value > 0;
end;

procedure TRepaymentGridForm.actOpenExecute(Sender: TObject);
begin
  //  inherited;
  ObjectServices.OpenObject(dsDataDECL_ID.Value, Params);
end;

procedure TRepaymentGridForm.actMakePaymentUpdate(Sender: TObject);
begin
  inherited;
  if(dsData.RecordCount = 0) then
   actMakePayment.Enabled := False
  else
   actMakePayment.Enabled := True;
end;

function TRepaymentGridForm.GetSubjectId: Double;
begin
  Result := dsDataSUBJECT_ID.Value;
end;

function TRepaymentGridForm.GetSubjectINN: String;
begin
  Result := dsDataDECL_INN.Value;
end;

function TRepaymentGridForm.GetSubjectKPP: String;
begin
  Result := dsDataDECL_KPP.Value;
end;

function TRepaymentGridForm.GetSubjectName: String;
begin
  Result := dsDataDECL_NAME.Value;
end;

initialization
  RegisterClass(TRepaymentGridForm);

end.

