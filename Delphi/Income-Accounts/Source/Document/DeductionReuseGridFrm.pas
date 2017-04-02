unit DeductionReuseGridFrm;

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
  dxStatusBar, cxCurrencyEdit, cxCalendar, Oracle;

type
  TDeductionReuseGridForm = class(TObjectGridForm)
    dsDataSUMMA: TFloatField;
    dsDataPAYMENT_DOC_NUMBER: TStringField;
    dsDataPAYMENT_DOC_DATE: TDateTimeField;
    dsDataPAYMENT_TYPENAME: TStringField;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_DOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_DOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_TYPENAME: TcxGridDBBandedColumn;
    qryAdd: TOracleQuery;
    qryDel: TOracleQuery;
    qryUpd: TOracleQuery;
    qryGetAvailableAmount: TOracleQuery;
    dsDataPAYMENT_ID: TFloatField;
    dsDataKBKCODE_ID: TFloatField;
    dsDataKBK_CODE: TStringField;
    dsDataKBK_NAME: TStringField;
    grdDataDBBandedTableViewKBK_NAME: TcxGridDBBandedColumn;
    actOpenPaymentOrder: TAction;
    barBtnOpenPaymentOrder: TdxBarButton;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actOpenPaymentOrderUpdate(Sender: TObject);
    procedure actOpenPaymentOrderExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fIsReadOnly : Boolean;
  public
    { Public declarations }
  end;

var
  DeductionReuseGridForm: TDeductionReuseGridForm;

implementation

{$R *.dfm}

uses
  AddReuseDeductionWizardFrm
 ,fdcCustomDataFrm
 ,MainDM
 ,fdcCustomDBDataFrm
 ,DocReuseAmountDlgFrm
 , fdcCustomObjectGridFrm;

procedure TDeductionReuseGridForm.actAddExecute(Sender: TObject);
  var
    lv_AddWizard : TAddReuseDeductionWizardForm;
begin
  lv_AddWizard := TAddReuseDeductionWizardForm.Create( Self );
  try
    lv_AddWizard.ReuseID := Params.ParamByName( 'ID' ).AsInteger;
    if lv_AddWizard.ShowModal = mrOk then
      with qryAdd do
        begin
          SetVariable( 'doc_id',     Params.ParamByName( 'ID' ).AsInteger );
          SetVariable( 'payment_id', lv_AddWizard.PaymentID               );
          SetVariable( 'amount',     lv_AddWizard.Amount                  );
          SetVariable( 'kbk_code_id',lv_AddWizard.KbkCodeID               );

          Execute;

          Session.Commit;

          dsData.Close;
          dsData.Open;

          //dsData.Locate( 'ID', GetVariable( 'res' ), [loPartialKey] );
        end;
  finally
    lv_AddWizard.Free;
  end;

end;

procedure TDeductionReuseGridForm.actDeleteExecute(Sender: TObject);
begin
  if MessageDlg('Удалить перезачёт суммы по документу [' + dsData.FieldByName( 'payment_typename' ).AsString +
                ' №' + dsData.FieldByName( 'payment_doc_number' ).AsString +
                ' от ' + FormatDateTime( 'DD.MM.YYYY', dsData.FieldByName( 'payment_doc_date' ).AsDateTime ) +
                ']?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with qryDel do
        begin
          SetVariable( 'doc_id', Params.ParamByName( 'ID' ).AsInteger );
          SetVariable( 'id',     dsData.FieldByName( 'ID' ).AsInteger );

          Execute;

          Session.Commit;
        end;

      dsData.Close;
      dsData.Open;
    end;
end;

procedure TDeductionReuseGridForm.actOpenExecute(Sender: TObject);
  var
    frmDocAmount : TDocReuseAmountDlgForm;
begin
  frmDocAmount := TDocReuseAmountDlgForm.Create( Self );
  try
    qryGetAvailableAmount.SetVariable( 'payment_id', dsData.FieldByName( 'PAYMENT_ID' ).AsFloat );
    qryGetAvailableAmount.SetVariable( 'kbkcode_id', dsData.FieldByName( 'KBKCODE_ID' ).AsFloat );
    qryGetAvailableAmount.Execute;

    frmDocAmount.dsetParams.FieldByName( 'AMOUNT' ).AsFloat := dsData.FieldByName( 'SUMMA' ).AsFloat;
    frmDocAmount.ceReuseAmount.Properties.MaxValue          := qryGetAvailableAmount.GetVariable( 'res' ) + dsData.FieldByName( 'SUMMA' ).AsFloat;
    if frmDocAmount.ShowModal = mrOk then
      begin
        with qryUpd do
          begin
            SetVariable( 'doc_id', Params.ParamByName( 'ID' ).AsInteger );
            SetVariable( 'id',     dsData.FieldByName( 'ID' ).AsInteger );
            SetVariable( 'amount', frmDocAmount.ceReuseAmount.Value     );

            Execute;

            Session.Commit;
          end;

        dsData.Close;
        dsData.Open;
      end;
  finally
    frmDocAmount.Free;
  end;
end;

procedure TDeductionReuseGridForm.actOpenUpdate(Sender: TObject);
begin
  inherited actOpenUpdate(Sender);
  (Sender as TAction).Enabled := (Sender as TAction).Enabled
                             and not fIsReadOnly;
end;

procedure TDeductionReuseGridForm.actAddUpdate(Sender: TObject);
begin
  inherited actAddUpdate(Sender);
  (Sender as TAction).Enabled := (Sender as TAction).Enabled
                             and not fIsReadOnly;
end;

procedure TDeductionReuseGridForm.actDeleteUpdate(Sender: TObject);
begin
  inherited actDeleteUpdate(Sender);
  (Sender as TAction).Enabled := (Sender as TAction).Enabled
                             and not fIsReadOnly;
end;

procedure TDeductionReuseGridForm.actOpenPaymentOrderUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty;
end;

procedure TDeductionReuseGridForm.actOpenPaymentOrderExecute(
  Sender: TObject);
begin
  ObjectServices.OpenObject( dsDataPAYMENT_ID.AsFloat, nil );
end;

procedure TDeductionReuseGridForm.dsDataAfterOpen(DataSet: TDataSet);
  var
     ParamReadOnly : TfdcParam;
begin
  inherited;

  ParamReadOnly := Params.FindParam('DeductionsReadOnly');
  fIsReadOnly := Assigned(ParamReadOnly)
             and ParamReadOnly.AsBoolean;
end;

initialization
  RegisterClass( TDeductionReuseGridForm );

end.
