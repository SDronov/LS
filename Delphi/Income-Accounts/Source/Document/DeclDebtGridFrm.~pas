unit DeclDebtGridFrm;

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
  Menus, cxCheckBox, cxCalc, cxCurrencyEdit;

type
  TDeclDebtGridForm = class(TObjectGridForm)
    dsDataCURRENCY_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataDECL_NO: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJ_NAME: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataCUR_CODE: TStringField;
    dsDataPAY_TYPE_CODE: TStringField;
    grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn;
    dsDataDECL_ID: TFloatField;
    dsDataAGG_SUMMA: TFloatField;
    dsDataKEY_P: TFloatField;
    actMakePayment: TAction;
    dxBarButton1: TdxBarButton;
    QueryList1: TQueryList;
    dsRegDate: TfdcQuery;
    dsRegDateREG_DATE: TDateTimeField;
    sqlAddCharge: TsqlOp;
    sqlPreparePayments: TsqlOp;
    dsDataREST_SUMMA: TFloatField;
    dsDataDATE_FROM: TDateTimeField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBKCODE_CODE: TStringField;
    grdDataDBBandedTableViewKBKCODE_CODE: TcxGridDBBandedColumn;
    dsDataPAY_MONTH: TDateTimeField;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBKCODE_ID: TcxGridDBBandedColumn;
    dsDataAVAILABLE_FOR_PAY: TFloatField;
    grdDataDBBandedTableViewAVAILABLE_FOR_PAY: TcxGridDBBandedColumn;
    dsDataRESERVED_PAY: TFloatField;
    grdDataDBBandedTableViewRESERVED_PAY: TcxGridDBBandedColumn;
    dsDataNOTICE_IS_ACTIVE: TStringField;
    grdDataDBBandedTableViewNOTICE_IS_ACTIVE: TcxGridDBBandedColumn;
    dsDataNOTICE_ID: TFloatField;
    dsDataNOTICE_NUMBER: TStringField;
    grdDataDBBandedTableViewNOTICE_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNOTICE_DATE: TcxGridDBBandedColumn;
    dsDataNOTICE_DATE: TDateTimeField;
    procedure dsDataFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure grdDataDBBandedTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure grdDataDBBandedTableViewSelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure actMakePaymentExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actMakePaymentUpdate(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    FSelCurrency: double;
    FSelSumma   : Currency;
    FSelKBKId   : integer;
    FSelKBKCode : string;
    FDataSet    : TDataSet;

    FPenaltyFeeBeginDate, FPenaltyFeeEndDate: TDateTime;
    FAllFromSameDeclaration: Boolean;
    FInitPenaltyFeeBeginDate: TDateTime;
    FPreviousDeclId: Double;

    procedure DoPayDebt(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure FindDeclRegDate(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RefreshSumma;
  protected
    procedure HandleRefresh; override;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DeclDebtGridForm: TDeclDebtGridForm;

implementation

uses MainDm, fdcCustomGridFrm, SelectPOWizardFrm, Math,
  fdcCustomObjectGridFrm, fdcCustomDataFrm, PenaltyFeeFrm;

{$R *.dfm}

procedure TDeclDebtGridForm.dsDataFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  //  Accept := Accept and (dsDataKEY_P.Value = 0);
end;

procedure TDeclDebtGridForm.grdDataDBBandedTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  if grdDataDBBandedTableView.Controller.SelectedRowCount >= 1 then
  begin
    AAllow := ( ARecord.Values[grdDataDBBandedTableViewCURRENCY_ID.Index] = FSelCurrency )
          and ( ARecord.Values[grdDataDBBandedTableViewKBKCODE_CODE.Index] = FSelKBKCode )
          and ( ARecord.Values[ grdDataDBBandedTableViewNOTICE_IS_ACTIVE.Index ] = 'Y' );
  end
  else
    if ARecord.Values[ grdDataDBBandedTableViewNOTICE_IS_ACTIVE.Index ] = 'Y' then
      begin
        FSelCurrency := ARecord.Values[grdDataDBBandedTableViewCURRENCY_ID.Index];
        FSelKBKId    := ARecord.Values[grdDataDBBandedTableViewKBKCODE_ID.Index];
        FSelKBKCode  := ARecord.Values[grdDataDBBandedTableViewKBKCODE_CODE.Index];
      end
    else
      AAllow := False;
end;

procedure TDeclDebtGridForm.grdDataDBBandedTableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  RefreshSumma;
end;

procedure TDeclDebtGridForm.actMakePaymentExecute(Sender: TObject);
begin
  inherited;

  // Запрещаем выбирать несколько строк
  // Оплата будет производиться по одной строке
  {RefreshSumma;

  if FSelSumma = 0 then
  begin}
    FSelSumma    := dsDataAVAILABLE_FOR_PAY.AsCurrency;
    FSelCurrency := dsDataCURRENCY_ID.AsCurrency;
    FSelKBKId    := dsDataKBKCODE_ID.AsInteger;
  {end;}

  if FSelSumma = 0 then
    begin
      ShowMessage('По данному виду сумма заблокирована по решению о зачёте в счёт погашения задолженности!');
      Exit;
    end;

  try
    sqlPreparePayments.Exec;
    IterateRecords(DoPayDebt, True, True);
    if ShowPaymentWizard(FSelSumma, FSelCurrency, False, 0, dsDataSUBJECT_ID.AsInteger, True, FSelKBKId, 1, dsDataDECL_ID.AsString, 1) then
    begin
      QueryList1.Session.Commit;
      RefreshData;
      RefreshWaiters;
      FSelSumma := 0;
    end
    else
      QueryList1.Session.Rollback;
  except
    QueryList1.Session.Rollback;
    raise;
  end;

end;

procedure TDeclDebtGridForm.DoPayDebt(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
var
  PaySumma: Currency;
  FldSumma: TField;
begin
  sqlAddCharge.Exec('paytype', 'PayDebt');
end;

procedure TDeclDebtGridForm.actOpenExecute(Sender: TObject);
begin
  ObjectServices.OpenObject(dsDataDECL_ID.Value, Params);
end;

procedure TDeclDebtGridForm.FindDeclRegDate(AGridTableView: TcxGridTableView;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
begin
  if (FAllFromSameDeclaration) then begin
    if ((FPreviousDeclId <> -1) and (dsDataDECL_ID.AsFloat <> FPreviousDeclId)) then begin
      FAllFromSameDeclaration := False;
    end else begin
      dsRegDate.Close;
      dsRegDate.Open;
      FInitPenaltyFeeBeginDate := dsRegDateREG_DATE.AsDateTime;
      dsRegDate.Close;
    end;

    FPreviousDeclId := dsDataDECL_ID.AsFloat;
  end;
end;

procedure TDeclDebtGridForm.RefreshSumma;
var
  S: string;
  I: Integer;
begin
  inherited;
  FSelSumma := 0.0;

  for I := 0 to grdDataDBBandedTableView.Controller.SelectedRowCount - 1 do
  begin
    FSelSumma := FSelSumma
      +
        grdDataDBBandedTableView.Controller.SelectedRows[I].Values[grdDataDBBandedTableViewSUMMA.Index];
  end;
  if FSelSumma > 0 then
    S := Format('Сумма = %s', [FormatFloat(',0.00', FSelSumma)]);
  ShowProgress(S);
end;

procedure TDeclDebtGridForm.HandleRefresh;
begin
  inherited;
  RefreshSumma;
end;

procedure TDeclDebtGridForm.actMakePaymentUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible
                             and ( ActiveGridTableView.Controller.SelectedRecordCount > 0 )
                             and ( dsData.FieldByName( 'AVAILABLE_FOR_PAY' ).AsFloat  > 0 )
                             and ( dsData.FieldByName( 'NOTICE_IS_ACTIVE' ).AsString  = 'Y' );
end;

procedure TDeclDebtGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;

  if ARecord.Values[ grdDataDBBandedTableViewNOTICE_IS_ACTIVE.Index ] = 'N' then
    AStyle := MainData.stlDocInactive;
end;

initialization
  RegisterClass(TDeclDebtGridForm);

end.

