unit PeriodicChargeGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxCalc, OracleData, Oracle, cxCurrencyEdit;

type
  TPeriodicChargeGridForm = class(TObjectGridForm)
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    dxBarButton1: TdxBarButton;
    actPeriodicPayment: TAction;
    dxBarButton2: TdxBarButton;
    actChangeMode: TAction;
    dsetOldPayTypes: TOracleDataSet;
    dsetNewPayType: TOracleDataSet;
    pkgCustomDecl: TOraclePackage;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    actStop: TAction;
    actProlong: TAction;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    dsDataMONTH: TDateTimeField;
    dsDataSUMMA: TFloatField;
    dsDataIS_PAYED: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSTATUS: TStringField;
    grdDataDBBandedTableViewMONTH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSTATUS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn;
    dxBarButton5: TdxBarButton;
    actCorrect: TAction;
    procedure actPeriodicPaymentUpdate(Sender: TObject);
    procedure actPeriodicPaymentExecute(Sender: TObject);
    procedure actChangeModeExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure dsetOldPayTypesBeforeQuery(Sender: TOracleDataSet);
    procedure dsetNewPayTypeBeforeQuery(Sender: TOracleDataSet);
    procedure actStopExecute(Sender: TObject);
    procedure actProlongExecute(Sender: TObject);
    procedure actCorrectExecute(Sender: TObject);
    procedure actStopUpdate(Sender: TObject);
    procedure actCorrectUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PeriodicChargeGridForm: TPeriodicChargeGridForm;

implementation

uses
  fdcCustomDBDataFrm
 ,PeriodicChargeSelectMonthFrm
 ,TempModeChangeGoodsSelectionFrm
 ,MainDm
 ,ObjectFrm
 ,GetNewPayTypeFrm, DeclTempAdmStopFrm, DeclTempAdmProlongFrm,
  DeclTempAdmCorrectFrm;

{$R *.dfm}

procedure TPeriodicChargeGridForm.actPeriodicPaymentUpdate(
  Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (dsData.RecordCount > 0);
end;

procedure TPeriodicChargeGridForm.actPeriodicPaymentExecute(
  Sender: TObject);
  var
    lv_fCancel       : Boolean;
    lv_frmGetPayType : TGetNewPayTypeForm;
begin
  inherited;

  {dsetOldPayTypes.Open;
  if not dsetOldPayTypes.IsEmpty then
    begin
      MessageDlg( 'ВНИМАНИЕ!'#$D#$A +
                  'В периодических начислениях указан вид платежа, начисления по которому прекращены!'#$D#$A +
                  'Будет произведена автоматическая замена видов платежей по КБК!'#$D#$A +
                  'Для видов платежа, по которым не возможна автоматическая замена, укажите новые виды платежа!'
                 ,mtInformation
                 ,[mbOk]
                 ,0
        );
      with dsetOldPayTypes do
        begin
          lv_fCancel := False;
          First;
          while not Eof
            and not lv_fCancel do
            begin
              if dsetNewPayType.Active then
                dsetNewPayType.Refresh
              else
                dsetNewPayType.Open;

              if dsetNewPayType.RecordCount = 0 then
                begin
                  Session.Rollback;
                  dsetNewPayType.CloseAll;
                  CloseAll;
                  raise Exception.CreateFmt( 'Не найдены новые виды платежа для вида платежа с кодом [%s]!', [ FieldByName( 'payment_code' ).AsString ] );
                end;

              if dsetNewPayType.RecordCount = 1 then
                pkgCustomDecl.CallProcedure(
                    'ModifyPeriodicCharge'
                   ,[ FieldByName( 'id' ).AsFloat
                     ,dsetNewPayType.FieldByName( 'id' ).AsFloat
                     ,FieldByName( 'month_summa' ).AsFloat
                     ,FieldByName( 'currency_id' ).AsFloat
                     ,dsetNewPayType.FieldByName( 'kbk_id' ).AsFloat ]
                  )
              else
                begin
                  lv_frmGetPayType := TGetNewPayTypeForm.Create( Self );
                  try
                    with lv_frmGetPayType do
                      begin
                        edtOldPayType.Text := FieldByName( 'payment_code' ).AsString;
                        edtKBK.Text        := FieldByName( 'kbk_code' ).AsString;
                        dsList.DataSet     := dsetNewPayType;
                        dsetPayType.FieldByName( 'pay_type_id' ).AsFloat := dsetNewPayType.FieldByName( 'id' ).AsFloat;

                        lv_fCancel := ShowModal <> mrOk;

                        if not lv_fCancel then
                          begin
                            dsetPayType.CheckBrowseMode;
                            dsetNewPayType.Locate( 'id', dsetPayType.FieldByName( 'pay_type_id' ).AsFloat, [] );
                            pkgCustomDecl.CallProcedure(
                                'ModifyPeriodicCharge'
                               ,[ FieldByName( 'id' ).AsFloat
                                 ,dsetNewPayType.FieldByName( 'id' ).AsFloat
                                 ,FieldByName( 'month_summa' ).AsFloat
                                 ,FieldByName( 'currency_id' ).AsFloat
                                 ,dsetNewPayType.FieldByName( 'kbk_id' ).AsFloat ]
                              );
                          end;
                      end;
                  finally
                    lv_frmGetPayType.Free;
                  end;
                end;

              Next;
            end;
          if dsetNewPayType.Active then
            dsetNewPayType.CloseAll;

          if lv_fCancel then
            begin
              Session.Rollback;
              CloseAll;
              MessageDlg( 'Нельзя оплатить месячные начисления без изменения вида платежа на действующие!'
                         ,mtWarning
                         ,[mbOk]
                         ,0
                );
              Exit;
            end
          else
            Session.Commit;
        end;
    end;
  dsetOldPayTypes.CloseAll;}

  if PayPeriodic(Params.ParamByName('DECL_ID').AsFloat) then
  begin
    RefreshData;
    RefreshWaiters;
    (Owner as TObjectForm).RefreshData;  // обновить число оплаченных месяцев
    (Owner as TObjectForm).RefreshWaiters;
  end;
end;

procedure TPeriodicChargeGridForm.actChangeModeExecute(Sender: TObject);
begin
  inherited;
  if PayModeChange(Params.ParamByName('DECL_ID').AsFloat) then
  begin
    RefreshData;
    RefreshWaiters;
  end;
end;

procedure TPeriodicChargeGridForm.actAddUpdate(Sender: TObject);
begin
  if {not dsDataNEXT_PAY_MONTH.IsNull or} (Owner = nil) or
    TObjectForm(Owner).Modified
    or (TObjectForm(Owner).dsData.FieldByName('PAYED_MONTHS').IsNull) then
    TAction(Sender).Enabled := False
  else
    inherited;
end;

procedure TPeriodicChargeGridForm.actDeleteUpdate(Sender: TObject);
begin
  if {not dsDataNEXT_PAY_MONTH.IsNull or} (Owner = nil) or
    TObjectForm(Owner).Modified
    or (TObjectForm(Owner).dsData.FieldByName('PAYED_MONTHS').IsNull) then
    TAction(Sender).Enabled := False
  else
    inherited;
end;

procedure TPeriodicChargeGridForm.actOpenUpdate(Sender: TObject);
begin
{  if not dsDataNEXT_PAY_MONTH.IsNull then
    TAction(Sender).Enabled := False
  else  }
    inherited;
end;

procedure TPeriodicChargeGridForm.dsetOldPayTypesBeforeQuery(
  Sender: TOracleDataSet);
begin
  Sender.SetVariable( 'decl_id', dsData.Params.ParamValues[ 'decl_id' ] );
end;

procedure TPeriodicChargeGridForm.dsetNewPayTypeBeforeQuery(
  Sender: TOracleDataSet);
begin
  Sender.SetVariable( 'kbk', dsetOldPayTypes.FieldByName( 'kbk_code' ).AsString );
end;

procedure TPeriodicChargeGridForm.actStopExecute(Sender: TObject);
begin
  inherited;
  if StopTempAdm(Params.ParamByName('DECL_ID').AsFloat) then
  begin
    RefreshData;
    RefreshWaiters;
  end;

end;

procedure TPeriodicChargeGridForm.actProlongExecute(Sender: TObject);
begin
  inherited;
  if ProlongTempAdm(Params.ParamByName('DECL_ID').AsFloat) then
  begin
    params.ParamByName('Tax_Exemption').AsInteger := 0;
    RefreshData;
    RefreshWaiters;
  end;
end;

procedure TPeriodicChargeGridForm.actCorrectExecute(Sender: TObject);
begin
  inherited;
  if CorrectTempAdm(Params.ParamByName('DECL_ID').AsFloat) then
  begin
    RefreshData;
    RefreshWaiters;
  end;
end;

procedure TPeriodicChargeGridForm.actStopUpdate(Sender: TObject);
begin
  inherited;
     actStop.Enabled := (params.ParamByName('Tax_Exemption').AsInteger = 0);
end;

procedure TPeriodicChargeGridForm.actCorrectUpdate(Sender: TObject);
begin
  inherited;
     actCorrect.Enabled := (params.ParamByName('Tax_Exemption').AsInteger = 0);
end;

initialization
  RegisterClass(TPeriodicChargeGridForm);
end.

