unit DecOffsetObligationReserveWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxImage,
  ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, FDCCustomDataset, fdcQuery, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCalendar, cxCurrencyEdit, cxCheckBox,
  QueryList, dxmdaset, cxDBEdit, cxTextEdit, OracleData,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TDecOffsetObligationReserveWizardForm = class(TBaseWizardForm)
    grdNoticeDBTableView: TcxGridDBTableView;
    grdDeclTpoLevel: TcxGridLevel;
    grdNotice: TcxGrid;
    dxLayoutControl2Item1: TdxLayoutItem;
    dsDeclTpo: TfdcQuery;
    srcDeclTpo: TDataSource;
    grdNoticeDBTableViewID: TcxGridDBColumn;
    grdNoticeDBTableViewDOC_DATE: TcxGridDBColumn;
    grdNoticeDBTableViewDOC_NUMBER: TcxGridDBColumn;
    grdNoticeDBTableViewIS_ACTIVE: TcxGridDBColumn;
    grdNoticeDBTableViewACTIVATION_DATE: TcxGridDBColumn;
    grdNoticeDBTableViewSUBJECT_ID: TcxGridDBColumn;
    grdNoticeDBTableViewSUMMA: TcxGridDBColumn;
    grdNoticeDBTableViewSUMMA_PAYED: TcxGridDBColumn;
    grdNoticeDBTableViewDECL_NAME: TcxGridDBColumn;
    grdNoticeDBTableViewDECL_INN: TcxGridDBColumn;
    grdNoticeDBTableViewDECL_KPP: TcxGridDBColumn;
    tabCharges: TcxTabSheet;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    dsCharges: TfdcQuery;
    srcCharges: TDataSource;
    dxLayoutControl3Item1: TdxLayoutItem;
    cxLabel3: TcxLabel;
    dxLayoutControl3Item2: TdxLayoutItem;
    cxLabel4: TcxLabel;
    dxLayoutControl3Item3: TdxLayoutItem;
    grdCharges: TcxGrid;
    grdChargesDBTableView: TcxGridDBTableView;
    grdChargesLevel: TcxGridLevel;
    grdChargesDBTableViewID: TcxGridDBColumn;
    grdChargesDBTableViewDECL_ID: TcxGridDBColumn;
    grdChargesDBTableViewPAY_TYPE_ID: TcxGridDBColumn;
    grdChargesDBTableViewSUMMA: TcxGridDBColumn;
    grdChargesDBTableViewCURRENCY_ID: TcxGridDBColumn;
    grdChargesDBTableViewKBKCODE_ID: TcxGridDBColumn;
    grdChargesDBTableViewCHARGE_MONTH: TcxGridDBColumn;
    grdChargesDBTableViewIS_TS: TcxGridDBColumn;
    grdChargesDBTableViewRESERVED_PAY: TcxGridDBColumn;
    grdChargesDBTableViewPAYED: TcxGridDBColumn;
    grdChargesDBTableViewPAY_TYPE_CODE: TcxGridDBColumn;
    grdChargesDBTableViewCURRENCY_CODE: TcxGridDBColumn;
    grdChargesDBTableViewKBKCODE: TcxGridDBColumn;
    grdChargesDBTableViewSUMMA_TO_PAY: TcxGridDBColumn;
    QueryList1: TQueryList;
    qryGetDecisionAttrs: TsqlOp;
    tabReserv: TcxTabSheet;
    dxLayoutControl4Group_Root: TdxLayoutGroup;
    dxLayoutControl4: TdxLayoutControl;
    dxLayoutControl4Item1: TdxLayoutItem;
    cxLabel5: TcxLabel;
    edtReservPayTypeCode: TcxDBTextEdit;
    dxLayoutControl4Item2: TdxLayoutItem;
    edtReservMaxSumm: TcxDBCurrencyEdit;
    dxLayoutControl4Item3: TdxLayoutItem;
    lcgReserveMain: TdxLayoutGroup;
    lcgReserveMainButtons: TdxLayoutGroup;
    grdReserveDBTableView: TcxGridDBTableView;
    grdReserveLevel: TcxGridLevel;
    grdReserve: TcxGrid;
    dxLayoutControl4Item4: TdxLayoutItem;
    dsReserveParams: TdxMemData;
    srcReserveParams: TDataSource;
    dsReserveParamsPAY_TYPE_CODE: TStringField;
    dsReserveParamsSUMMA_TO_PAY: TFloatField;
    dsReserve: TdxMemData;
    dsReserveDECL_ID: TFloatField;
    dsReservePAYMENT_ID: TFloatField;
    dsReservePAY_TYPE_ID: TFloatField;
    dsReserveCHARGE_CURR_ID: TFloatField;
    dsReserveCHARGE_SUMMA: TFloatField;
    dsReserveCHARGE_ID: TFloatField;
    dsReserveKBKCODE_ID: TFloatField;
    dsReserveKBKCODE1_ID: TFloatField;
    dsReserveSUMMA: TFloatField;
    dsReserveDECISION_ID: TFloatField;
    srcReserve: TDataSource;
    dsReservePO_NAME: TStringField;
    grdReserveDBTableViewSUMMA: TcxGridDBColumn;
    grdReserveDBTableViewPO_NAME: TcxGridDBColumn;
    btnReservePOAdd: TcxButton;
    dxLayoutControl4Item5: TdxLayoutItem;
    btnReservePOModify: TcxButton;
    dxLayoutControl4Item6: TdxLayoutItem;
    btnReservePORemove: TcxButton;
    dxLayoutControl4Item7: TdxLayoutItem;
    actReservePOAdd: TAction;
    actReservePOModify: TAction;
    actReservePORemove: TAction;
    dsPayments: TOracleDataSet;
    dsPaymentsNAME: TStringField;
    dsPaymentsKBKCODE_ID: TFloatField;
    dsPaymentsSUMMA: TFloatField;
    qryAddReserve: TsqlOp;
    lcgDecision: TdxLayoutGroup;
    edtDecidionSum: TcxCurrencyEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtDecisionRest: TcxCurrencyEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    dsPaymentsKBKCODE: TStringField;
    dsPaymentsID: TStringField;
    dsPaymentsID_PO: TFloatField;
    dsReserveKBKCODE1: TStringField;
    grdReserveDBTableViewKBKCODE1: TcxGridDBColumn;
    dsDeclTpoNAME: TStringField;
    dsDeclTpoSHORTNAME: TStringField;
    dsDeclTpoOBJECT_TYPE_ID: TFloatField;
    dsDeclTpoSTATE_ID: TFloatField;
    dsDeclTpoACCESSLEVEL: TFloatField;
    dsDeclTpoSYSNAME: TStringField;
    dsDeclTpoDESCRIPT: TStringField;
    dsDeclTpoOWNER_OBJECT_ID: TFloatField;
    dsDeclTpoTYPENAME: TStringField;
    dsDeclTpoTYPESYSNAME: TStringField;
    dsDeclTpoOBJECTKINDLIST: TStringField;
    dsDeclTpoID: TFloatField;
    dsDeclTpoSUBJECT_ID: TFloatField;
    dsDeclTpoCURRENCY_ID: TFloatField;
    dsDeclTpoCUSTOM_MODE_ID: TFloatField;
    dsDeclTpoCUSTOMS_CODE: TStringField;
    dsDeclTpoREG_DATE: TDateTimeField;
    dsDeclTpoDECL_NO: TStringField;
    dsDeclTpoMODIFY_DATE: TDateTimeField;
    dsDeclTpoDOC_DATE: TDateTimeField;
    dsDeclTpoDOC_NUMBER: TStringField;
    dsDeclTpoIS_ACTIVE: TStringField;
    dsDeclTpoACTIVATION_DATE: TDateTimeField;
    dsDeclTpoDECL_TYPESYSNAME: TStringField;
    dsDeclTpoDECL_NAME: TStringField;
    dsDeclTpoDECL_INN: TStringField;
    dsDeclTpoDECL_KPP: TStringField;
    dsDeclTpoCURR_NAME: TStringField;
    dsDeclTpoCURR_CODE: TStringField;
    dsDeclTpoCUSTOM_MODE_CODE: TStringField;
    dsDeclTpoCUSTOM_MODE_NAME: TStringField;
    dsDeclTpoDECISION_CODE: TStringField;
    dsDeclTpoAGGREMENT_ID: TFloatField;
    dsDeclTpoEXT_SOURCE: TStringField;
    dsDeclTpoEXT_TYPESYSNAME: TStringField;
    dsDeclTpoEXT_ID: TFloatField;
    dsChargesID: TFloatField;
    dsChargesNAME: TStringField;
    dsChargesSHORTNAME: TStringField;
    dsChargesOBJECT_TYPE_ID: TFloatField;
    dsChargesSTATE_ID: TFloatField;
    dsChargesACCESSLEVEL: TFloatField;
    dsChargesSYSNAME: TStringField;
    dsChargesDESCRIPT: TStringField;
    dsChargesOWNER_OBJECT_ID: TFloatField;
    dsChargesTYPENAME: TStringField;
    dsChargesTYPESYSNAME: TStringField;
    dsChargesOBJECTKINDLIST: TStringField;
    dsChargesDOC_DATE: TDateTimeField;
    dsChargesDOC_NUMBER: TStringField;
    dsChargesIS_ACTIVE: TStringField;
    dsChargesACTIVATION_DATE: TDateTimeField;
    dsChargesPAY_TYPE_ID: TFloatField;
    dsChargesSUMMA: TFloatField;
    dsChargesCURRENCY_ID: TFloatField;
    dsChargesDECL_ID: TFloatField;
    dsChargesPAYMENT_CODE: TStringField;
    dsChargesPAYMENT_NAME: TStringField;
    dsChargesKBKCODE_CODE: TStringField;
    dsChargesKBKCODE_ID: TFloatField;
    dsChargesCURR_CODE: TStringField;
    dsChargesCURR_NAME: TStringField;
    dsChargesDECL_NO: TStringField;
    dsChargesCHARGE_MONTH: TDateTimeField;
    dsChargesCHARGE_REST: TFloatField;
    dsChargesIS_TS: TStringField;
    dsChargesPERSONAL_ACCOUNT_ID: TFloatField;
    dsChargesSUMMA_TO_PAY: TFloatField;
    dsChargesPAY_TYPE_CODE: TStringField;
    dsChargesCURRENCY_CODE: TStringField;
    dsChargesKBKCODE: TStringField;
    dsDeclTpoSUMMA: TFloatField;
    dsDeclTpoSUMMA_PAYED: TFloatField;

    procedure tabGeneralNextUpdate(Sender: TObject);
    procedure tabGeneralNextExecute(Sender: TObject);

    procedure tabChargesNextUpdate(Sender: TObject);
    procedure tabChargesNextExecute(Sender: TObject);

    procedure tabReservNextUpdate(Sender: TObject);
    procedure tabReservNextExecute(Sender: TObject);
    procedure tabReservFinishUpdate(Sender: TObject);
    procedure tabReservFinishExecute(Sender: TObject);

    procedure dsReserveAfterInsert(DataSet: TDataSet);
    procedure actReservePOModifyUpdate(Sender: TObject);
    procedure actReservePORemoveUpdate(Sender: TObject);
    procedure actReservePOAddExecute(Sender: TObject);
    procedure actReservePOModifyExecute(Sender: TObject);
    procedure actReservePORemoveExecute(Sender: TObject);
    procedure actReservePOAddUpdate(Sender: TObject);
  private
    { Private declarations }
    fDecisionID : Double;
    fSubjectID  : Double;
    fIsTS       : string;
    procedure SaveReserve;
  public
    { Public declarations }
  end;

function ShowDecOffsetObligationReserveWizard (ADecisionID : Double) : boolean;

implementation

{$R *.dfm}

uses
  MainDM
 ,fdcCustomTabDlgFrm
 ,POAssignFrm
 ,Math;

function ShowDecOffsetObligationReserveWizard (ADecisionID : Double) : boolean;
  var lv_DecOffsetObligationReserveWizardForm: TDecOffsetObligationReserveWizardForm;
begin
  lv_DecOffsetObligationReserveWizardForm := TDecOffsetObligationReserveWizardForm.Create( Application );
  try
    with lv_DecOffsetObligationReserveWizardForm do
      begin
        fDecisionID := ADecisionID;
        qryGetDecisionAttrs.ParamValues[ 'dec_summa' ] := 0.0;
        qryGetDecisionAttrs.ParamValues[ 'dec_rest' ]  := 0.0;
        qryGetDecisionAttrs.Exec( 'id', ADecisionID );
        fSubjectID                := qryGetDecisionAttrs.ParamValues[ 'subject_id' ];
        fIsTS                     := qryGetDecisionAttrs.ParamValues[ 'is_ts' ];
        lcgDecision.Caption       := qryGetDecisionAttrs.ParamValues[ 'dec_name' ];
        edtDecidionSum.EditValue  := qryGetDecisionAttrs.ParamValues[ 'dec_summa' ];
        edtDecisionRest.EditValue := qryGetDecisionAttrs.ParamValues[ 'dec_rest' ];

        dsDeclTpo.ParamByName( 'subject_id' ).Value := fSubjectID;
        dsDeclTpo.ParamByName( 'is_ts' ).Value      := fIsTS;

        dsCharges.ParamByName( 'is_ts' ).Value := fIsTS;

        dsDeclTpo.Open;
        Result := (ShowModal = mrOk);
      end;
  finally
    if Assigned(lv_DecOffsetObligationReserveWizardForm) then
      begin
        FreeAndNil(lv_DecOffsetObligationReserveWizardForm);
      end;  
  end;
end;

{ TDecOffsetObligationReserveWizardForm }

procedure TDecOffsetObligationReserveWizardForm.tabChargesNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsCharges.Active
                         and not dsCharges.IsEmpty
                         and (grdChargesDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecOffsetObligationReserveWizardForm.tabGeneralNextExecute(
  Sender: TObject);
begin
  dsCharges.ParamByName( 'decl_id' ).Value := dsDeclTpo.FieldByName( 'id' ).Value;
  if dsCharges.Active then
    dsCharges.Close;
    
  dsCharges.Open;

  PageControl.ActivePage := tabCharges;
end;

procedure TDecOffsetObligationReserveWizardForm.tabGeneralNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsDeclTpo.Active
                         and not dsDeclTpo.IsEmpty
                         and (grdNoticeDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecOffsetObligationReserveWizardForm.dsReserveAfterInsert(
  DataSet: TDataSet);
begin
  with DataSet do
    begin
      FieldByName( 'decl_id' ).AsFloat        := dsCharges.FieldByName( 'decl_id' ).AsFloat;
      FieldByName( 'pay_type_id' ).AsFloat    := dsCharges.FieldByName( 'pay_type_id' ).AsFloat;
      FieldByName( 'charge_curr_id' ).AsFloat := dsCharges.FieldByName( 'currency_id' ).AsFloat;
      FieldByName( 'charge_summa' ).AsFloat   := dsCharges.FieldByName( 'summa' ).AsFloat;
      FieldByName( 'charge_id' ).AsFloat      := dsCharges.FieldByName( 'id' ).AsFloat;
      FieldByName( 'kbkcode_id' ).AsFloat     := dsCharges.FieldByName( 'kbkcode_id' ).AsFloat;
      FieldByName( 'decision_id' ).AsFloat    := fDecisionID;
    end;
end;

procedure TDecOffsetObligationReserveWizardForm.tabChargesNextExecute(
  Sender: TObject);
begin
  if dsReserveParams.Active then
    dsReserveParams.Close;
  if dsReserve.Active then
    dsReserve.Close;

  with dsReserveParams do
    begin
      Open;
      Append;

      FieldByName( 'pay_type_code' ).AsString := dsCharges.FieldByName( 'pay_type_code' ).AsString;
      If  (dsCharges.FieldByName( 'summa_to_pay' ).AsFloat - edtDecisionRest.EditValue) > 0
      Then
        FieldByName( 'summa_to_pay' ).AsFloat   :=  edtDecisionRest.EditValue
      else
        FieldByName( 'summa_to_pay' ).AsFloat   :=  dsCharges.FieldByName( 'summa_to_pay' ).AsFloat;
    end;

  dsReserve.Open;

  PageControl.ActivePage := tabReserv;
end;

procedure TDecOffsetObligationReserveWizardForm.tabReservNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty;
end;

procedure TDecOffsetObligationReserveWizardForm.tabReservFinishUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty;
end;

procedure TDecOffsetObligationReserveWizardForm.actReservePOModifyUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty
                         and (grdReserveDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecOffsetObligationReserveWizardForm.actReservePORemoveUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty
                         and (grdReserveDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecOffsetObligationReserveWizardForm.actReservePOAddExecute(
  Sender: TObject);
  var
    fSelectFrm : TPOAssignForm;
    bm         : Pointer;
    po_list    : string;
begin
  po_list := '''0''';
  dsReserve.DisableControls;
  try
    with dsReserve do
      begin
        bm := GetBookmark;

        First;
        while not Eof do
          begin
            po_list := po_list + ',''' + FieldByName( 'payment_id' ).AsString + '&' + FieldByName( 'kbkcode1_id' ).AsString + '''';

            Next;
          end;
      end;
  finally
    dsReserve.GotoBookmark( bm );
    dsReserve.EnableControls;
  end;

  dsPayments.SetVariable( 'decision_id', fDecisionID );
  dsPayments.SetVariable( 'po_list',     po_list     );
  dsPayments.SetVariable( 'is_ts',       fIsTS       );

  try
    dsPayments.Open;
    if dsPayments.IsEmpty then
      if dsReserve.IsEmpty then
        raise Exception.Create( 'Îøèáêà ğåçåğâèğîâàíèÿ ñğåäñòâ!'#$D#$A +
                                'Íå íàéäåíû ïëàò¸æíûå äîêóìåíòû!' )
      else
        begin
          MessageDlg( 'Äğóãèõ ïëàò¸æíûõ äîêóìåíòîâ íåò!'#$D#$A'Ğåäàêòèğóéòå óæå âûáğàííûå!', mtWarning, [mbOk], 0 );
          dsPayments.Close;
          Exit;
        end;

    fSelectFrm := TPOAssignForm.Create( Self );
    try
      with fSelectFrm do
        begin
          dxLayoutControl1Item4.Caption := 'Îñòàëîñü çà÷åñòü';
          dxLayoutControl1Item3.Caption := 'Ñóììà çà÷¸òà';
          dxLayoutControl1Item2.Visible := False;

          srcData.DataSet := dsPayments;
          edtLimit.Value  := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat;

          if ShowModal = mrOk then
            with dsReserve do
              begin
                dsPayments.Locate( 'id', cmbxPO.EditValue, [] );

                Append;
                FieldByName( 'payment_id' ).AsFloat  := dsPayments.FieldByName( 'id_po' ).AsFloat;
                FieldByName( 'summa' ).AsFloat       := edtSumma.Value;
                FieldByName( 'kbkcode1_id' ).AsFloat := dsPayments.FieldByName( 'kbkcode_id' ).AsFloat;
                FieldByName( 'po_name' ).AsString    := dsPayments.FieldByName( 'name' ).AsString;
                FieldByName( 'kbkcode1' ).AsString   := dsPayments.FieldByName( 'kbkcode' ).AsString;
                Post;

                dsReserveParams.Edit;
                dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat - edtSumma.Value;
                dsReserveParams.Post;

                edtDecisionRest.EditValue := edtDecisionRest.EditValue - edtSumma.Value;
              end;
        end;
    finally
      fSelectFrm.Free;
    end;
  finally
    if dsPayments.Active then
      dsPayments.Close;
  end;
end;

procedure TDecOffsetObligationReserveWizardForm.actReservePOModifyExecute(
  Sender: TObject);
  var
    fSelectFrm : TPOAssignForm;
    po_list    : string;
begin
  po_list := '''0''';

  dsPayments.SetVariable( 'decision_id', fDecisionID );
  dsPayments.SetVariable( 'po_list',     po_list     );
  dsPayments.SetVariable( 'is_ts',       fIsTS       );

  try
    dsPayments.Open;

    fSelectFrm := TPOAssignForm.Create( Self );
    try
      with fSelectFrm do
        begin
          srcData.DataSet := dsPayments;
          edtLimit.Value  := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat + dsReserve.FieldByName( 'summa' ).AsFloat;

          cmbxPO.EditValue := dsReserve.FieldByName( 'payment_id' ).AsString + '&' + dsReserve.FieldByName( 'kbkcode1_id' ).AsString;
          edtSumma.Value   := dsReserve.FieldByName( 'summa' ).AsFloat;

          dxLayoutControl1Item5.Enabled := False;
          dxLayoutControl1Item4.Caption := 'Îñòàëîñü çà÷åñòü';
          dxLayoutControl1Item3.Caption := 'Ñóììà çà÷¸òà';
          dxLayoutControl1Item2.Visible := False;

          if ShowModal = mrOk then
            with dsReserve do
              begin
                edtDecisionRest.EditValue := edtDecisionRest.EditValue + dsReserve.FieldByName( 'summa' ).AsFloat - edtSumma.Value;

                dsReserveParams.Edit;
                dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat + dsReserve.FieldByName( 'summa' ).AsFloat - edtSumma.Value;
                dsReserveParams.Post;

                Edit;
                FieldByName( 'summa' ).AsFloat       := edtSumma.Value;
                Post;

              end;
        end;
    finally
      fSelectFrm.Free;
    end;
  finally
    if dsPayments.Active then
      dsPayments.Close;
  end;
end;

procedure TDecOffsetObligationReserveWizardForm.actReservePORemoveExecute(
  Sender: TObject);
begin
  dsReserveParams.Edit;
  dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat + dsReserve.FieldByName( 'summa' ).AsFloat;
  dsReserveParams.Post;

  edtDecisionRest.EditValue := edtDecisionRest.EditValue + dsReserve.FieldByName( 'summa' ).AsFloat;

  dsReserve.Delete;
end;

procedure TDecOffsetObligationReserveWizardForm.SaveReserve;
  var
    bm : Pointer;
begin
  if    not dsReserve.Active
     or dsReserve.IsEmpty then
    Exit;

  dsReserve.DisableControls;
  try
    with dsReserve do
      begin
        bm := GetBookmark;

        First;
        while not Eof do
          begin
            qryAddReserve.Exec;

            Next;
          end;
      end;

    QueryList1.Session.Commit;
  finally
    dsReserve.GotoBookmark( bm );
    dsReserve.EnableControls;
  end;
end;

procedure TDecOffsetObligationReserveWizardForm.tabReservFinishExecute(
  Sender: TObject);
begin
  SaveReserve;

  ModalResult := mrOk;
end;

procedure TDecOffsetObligationReserveWizardForm.tabReservNextExecute(Sender: TObject);
begin
  SaveReserve;

  dsDeclTpo.Refresh;

  PageControl.ActivePage := tabGeneral;
end;

procedure TDecOffsetObligationReserveWizardForm.actReservePOAddUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat > 0;
end;

end.
