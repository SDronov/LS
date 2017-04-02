unit PaybackPaymentOrderGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RManPaymentOrderGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalc, cxCurrencyEdit, QueryList,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxLayoutControl, cxMemo, cxDropDownEdit, cxCalendar, cxTextEdit,
  StdCtrls, cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit,
  cxLabel, dxStatusBar, ObjectFrm, cxCheckBox, OracleData;

type
  TPaybackPaymentOrderGridForm = class(TRManPaymentOrderGridForm)
    QueryList1: TQueryList;
    sqlAddCharge: TsqlOp;
    sqlGetCurrency: TsqlOp;
    dsDataPAYMENT_SUMMA: TFloatField;
    grdDataDBBandedTableViewPAYMENT_SUMMA: TcxGridDBBandedColumn;
    sqlDelCharge: TsqlOp;
    sqlUpdSumma: TsqlOp;
    sqlLockSumPO: TsqlOp;
    sqlUnLockSumPO: TsqlOp;
    sqlStartPay: TsqlOp;
    odsGetSumBlock: TOracleDataSet;
    odsGetSumBlockSUMMA: TFloatField;
    sqlSetReserveSumma: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    FParentForm : TObjectForm;
    FCURRENCY_ID: Integer;
  public
  end;


implementation

uses fdcCustomDataFrm, SelectPOWizardFrm, fdcCustomObjectGridFrm,
  fdcCustomDBDataFrm, MainDm, fdcMessages, DecisionPaybackFrm,
  USelectPOWizartBlock;

{$R *.dfm}
{ TPaybackPaymentOrderGridForm }

procedure TPaybackPaymentOrderGridForm.actAddExecute(Sender: TObject);
begin
  if  FSelectPOWizartBlock = nil  then
      FSelectPOWizartBlock:=TFSelectPOWizartBlock.Create(Application.Owner);
  FSelectPOWizartBlock.pDocId  := Params.ParamValues['ID'];
  FSelectPOWizartBlock.pDocSum := odsGetSumBlock.FieldByName('summa').AsFloat;
  FSelectPOWizartBlock.pDocSub := Params.ParamValues['SUBJECT_ID'];
  FSelectPOWizartBlock.pDocCur := Params.ParamValues['CURRENCY_ID'];
  try
  IF  FSelectPOWizartBlock.ShowModal = mrOk then
    begin
      sqlSetReserveSumma.Exec('DECISION_ID', Params.ParamValues['ID']);
      MainData.Session.Commit;
      odsGetSumBlock.Refresh;
      RefreshData;
      RefreshWaiters;
    end else
      MainData.Session.Rollback;
  except
    MainData.Session.Rollback;
    raise;
  end;
end;

procedure TPaybackPaymentOrderGridForm.FormCreate(Sender: TObject);
begin
  inherited;
//  actDelete.Visible := False;
end;

procedure TPaybackPaymentOrderGridForm.actAddUpdate(Sender: TObject);
  var
    ParamReadOnly : TfdcParam;
begin
  ParamReadOnly           := Params.FindParam('PaymentsReadOnly');
  TAction(Sender).Enabled := TAction(Sender).Visible
//                         and ( odsGetSumBlock.FieldByName('summa').AsFloat > 0 )
                         and ( Params.ParamValues[ 'IS_UPDATABLE' ] <> 0 )
                         and (   not Assigned(ParamReadOnly)
                              or not ParamReadOnly.AsBoolean);
end;

procedure TPaybackPaymentOrderGridForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('”даление заблокированных средств с платежных документов',
                '«аблокированные средства на платежном документе будут разблокированы. ѕродолжить?') = mrYes then begin
    try
      sqlUnLockSumPO.Exec('pId;DECISION_ID', [dsData.FieldByName('ID').AsInteger,Params.ParamValues['ID']]);
      MainData.Session.Commit;
      odsGetSumBlock.Refresh;
      RefreshData;
      RefreshWaiters;
    except
      MainData.Session.Rollback;
      raise;
    end;
  end;
end;

procedure TPaybackPaymentOrderGridForm.actDeleteUpdate(Sender: TObject);
  var
    ParamReadOnly : TfdcParam;
begin
  ParamReadOnly           := Params.FindParam('PaymentsReadOnly');
  TAction(Sender).Enabled := TAction(Sender).Visible
                         and ( dsData.RecordCount > 0 )
                         and ( Params.ParamValues[ 'IS_UPDATABLE' ] <> 0 )
                         and (   not Assigned(ParamReadOnly)
                              or not ParamReadOnly.AsBoolean );
end;

procedure TPaybackPaymentOrderGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  odsGetSumBlock.SetVariable('Id',Params.ParamValues['ID']);
  odsGetSumBlock.Open;
end;

procedure TPaybackPaymentOrderGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
     dsData.ParamByName('NA').Value := null;
end;

initialization
  RegisterClass(TPaybackPaymentOrderGridForm);


end.
