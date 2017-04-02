unit DecisionReserveWizardFrm;

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
  TDecisionReserveWizardForm = class(TBaseWizardForm)
    grdNoticeDBTableView: TcxGridDBTableView;
    grdNoticeLevel: TcxGridLevel;
    grdNotice: TcxGrid;
    dxLayoutControl2Item1: TdxLayoutItem;
    dsNotice: TfdcQuery;
    dsNoticeID: TFloatField;
    dsNoticeNAME: TStringField;
    dsNoticeSHORTNAME: TStringField;
    dsNoticeOBJECT_TYPE_ID: TFloatField;
    dsNoticeSTATE_ID: TFloatField;
    dsNoticeACCESSLEVEL: TFloatField;
    dsNoticeSYSNAME: TStringField;
    dsNoticeDESCRIPT: TStringField;
    dsNoticeOWNER_OBJECT_ID: TFloatField;
    dsNoticeTYPENAME: TStringField;
    dsNoticeTYPESYSNAME: TStringField;
    dsNoticeOBJECTKINDLIST: TStringField;
    dsNoticeDOC_DATE: TDateTimeField;
    dsNoticeDOC_NUMBER: TStringField;
    dsNoticeIS_ACTIVE: TStringField;
    dsNoticeACTIVATION_DATE: TDateTimeField;
    dsNoticeCUSTOMS_ID: TFloatField;
    dsNoticeSUBJECT_ID: TFloatField;
    dsNoticeDEBTS_REASON_ID: TFloatField;
    dsNoticeDEBTS_REASON_CODE: TStringField;
    dsNoticeASD_DOC_NUMBER: TStringField;
    dsNoticeASD_ID: TFloatField;
    dsNoticeASD_PASSPORT_ID: TFloatField;
    dsNoticeDUTY_SUMMA: TFloatField;
    dsNoticeEXCISE: TFloatField;
    dsNoticeNDS: TFloatField;
    dsNoticeCUSTOMS_FEES: TFloatField;
    dsNoticePERCENT: TFloatField;
    dsNoticeSUMMA: TFloatField;
    dsNoticeSUMMA_PAYED: TFloatField;
    dsNoticePAYMENT_DATE: TDateTimeField;
    dsNoticePENALTY_SDATE: TDateTimeField;
    dsNoticePENALTY_EDATE: TDateTimeField;
    dsNoticePENALTY_SUMMA: TFloatField;
    dsNoticePENALTY_SUMMA_PAYED: TFloatField;
    dsNoticeEXECUTION_DATE: TDateTimeField;
    dsNoticeDECL_NAME: TStringField;
    dsNoticeDECL_INN: TStringField;
    dsNoticeDECL_KPP: TStringField;
    dsNoticeDECL_OKPO: TStringField;
    dsNoticeDECL_ADDRESS: TStringField;
    dsNoticeCUSTOM_NAME: TStringField;
    dsNoticeCUSTOM_CODE: TStringField;
    dsNoticeEXT_SOURCE: TStringField;
    dsNoticeEXT_TYPESYSNAME: TStringField;
    dsNoticeEXT_ID: TFloatField;
    dsNoticeIS_TS: TStringField;
    srcNotice: TDataSource;
    grdNoticeDBTableViewID: TcxGridDBColumn;
    grdNoticeDBTableViewDOC_DATE: TcxGridDBColumn;
    grdNoticeDBTableViewDOC_NUMBER: TcxGridDBColumn;
    grdNoticeDBTableViewIS_ACTIVE: TcxGridDBColumn;
    grdNoticeDBTableViewACTIVATION_DATE: TcxGridDBColumn;
    grdNoticeDBTableViewSUBJECT_ID: TcxGridDBColumn;
    grdNoticeDBTableViewSUMMA: TcxGridDBColumn;
    grdNoticeDBTableViewSUMMA_PAYED: TcxGridDBColumn;
    grdNoticeDBTableViewEXECUTION_DATE: TcxGridDBColumn;
    grdNoticeDBTableViewDECL_NAME: TcxGridDBColumn;
    grdNoticeDBTableViewDECL_INN: TcxGridDBColumn;
    grdNoticeDBTableViewDECL_KPP: TcxGridDBColumn;
    tabCharges: TcxTabSheet;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    dsCharges: TfdcQuery;
    dsChargesID: TFloatField;
    dsChargesDECL_ID: TFloatField;
    dsChargesPAY_TYPE_ID: TFloatField;
    dsChargesSUMMA: TFloatField;
    dsChargesCURRENCY_ID: TFloatField;
    dsChargesCHANGE_REASON_ID: TFloatField;
    dsChargesCHANGE_DESC: TStringField;
    dsChargesCHANGE_DATE: TDateTimeField;
    dsChargesKBKCODE_ID: TFloatField;
    dsChargesCHARGE_MONTH: TDateTimeField;
    dsChargesIS_TS: TStringField;
    dsChargesNOTICEPAY_ID: TFloatField;
    dsChargesNOTICEPAY_IS_ACTIVE: TStringField;
    dsChargesREF_ID: TFloatField;
    dsChargesNOTICEPAY_IS_TS: TStringField;
    dsChargesRESERVED_PAY: TFloatField;
    dsChargesPAYED: TFloatField;
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
    dsChargesPAY_TYPE_CODE: TStringField;
    dsChargesCURRENCY_CODE: TStringField;
    dsChargesKBKCODE: TStringField;
    grdChargesDBTableViewPAY_TYPE_CODE: TcxGridDBColumn;
    grdChargesDBTableViewCURRENCY_CODE: TcxGridDBColumn;
    grdChargesDBTableViewKBKCODE: TcxGridDBColumn;
    dsChargesSUMMA_TO_PAY: TFloatField;
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
    dsReserveNOTICE_ID: TFloatField;
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
    dsNoticeDOC_CHARGE_NAME: TStringField;
    grdNoticeDBTableViewASD_DOC_NUMBER: TcxGridDBColumn;
    grdNoticeDBTableViewDOC_CHARGE_NAME: TcxGridDBColumn;

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
    fDecisionID   : Double;
    fSubjectID    : Double;
    fIsTS         : string;
    fdec_doc_date : string; // äàòà ğåøåíèÿ â ôîğìàòå DD.MM.YYYY
    procedure SaveReserve;
  public
    { Public declarations }
  end;

var
  DecisionReserveWizardForm: TDecisionReserveWizardForm;

function ShowDecisionReserveWizard (ADecisionID : Double) : boolean;

implementation

{$R *.dfm}

uses
  MainDM
 ,fdcCustomTabDlgFrm
 ,POAssignFrm
 ,Math;

function ShowDecisionReserveWizard (ADecisionID : Double) : boolean;
begin
  DecisionReserveWizardForm := TDecisionReserveWizardForm.Create( nil );
  try
    with DecisionReserveWizardForm do
      begin
        fDecisionID := ADecisionID;
        qryGetDecisionAttrs.ParamValues[ 'dec_summa' ] := 0.0;
        qryGetDecisionAttrs.ParamValues[ 'dec_rest' ]  := 0.0;
        qryGetDecisionAttrs.Exec( 'id', ADecisionID );
        fSubjectID                := qryGetDecisionAttrs.ParamValues[ 'subject_id' ];
        fIsTS                     := qryGetDecisionAttrs.ParamValues[ 'is_ts' ];
        lcgDecision.Caption       := qryGetDecisionAttrs.ParamValues[ 'dec_name' ];
        fdec_doc_date             := qryGetDecisionAttrs.ParamValues[ 'dec_doc_date' ];
        edtDecidionSum.EditValue  := qryGetDecisionAttrs.ParamValues[ 'dec_summa' ];
        edtDecisionRest.EditValue := qryGetDecisionAttrs.ParamValues[ 'dec_rest' ];

        dsNotice.ParamByName( 'subject_id' ).Value := fSubjectID;
        dsNotice.ParamByName( 'is_ts' ).Value      := fIsTS;

        dsCharges.ParamByName( 'is_ts' ).Value := fIsTS;

        dsNotice.Open;

        Result := ShowModal = mrOk;
      end;
  finally
    DecisionReserveWizardForm.Free;
  end;

end;

{ TDecisionReserveWizardForm }

procedure TDecisionReserveWizardForm.tabChargesNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsCharges.Active
                         and not dsCharges.IsEmpty
                         and (grdChargesDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecisionReserveWizardForm.tabGeneralNextExecute(
  Sender: TObject);
begin
  dsCharges.ParamByName( 'notice_id' ).Value := dsNotice.FieldByName( 'id' ).Value;
  if dsCharges.Active then
    dsCharges.Close;
    
  dsCharges.Open;

  PageControl.ActivePage := tabCharges;
end;

procedure TDecisionReserveWizardForm.tabGeneralNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsNotice.Active
                         and not dsNotice.IsEmpty
                         and (grdNoticeDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecisionReserveWizardForm.dsReserveAfterInsert(
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
      FieldByName( 'notice_id' ).AsFloat      := dsNotice.FieldByName( 'id' ).AsFloat;
      FieldByName( 'decision_id' ).AsFloat    := fDecisionID;
    end;
end;

procedure TDecisionReserveWizardForm.tabChargesNextExecute(
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

procedure TDecisionReserveWizardForm.tabReservNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty;
end;

procedure TDecisionReserveWizardForm.tabReservFinishUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty;
end;

procedure TDecisionReserveWizardForm.actReservePOModifyUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty
                         and (grdReserveDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecisionReserveWizardForm.actReservePORemoveUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserve.Active
                         and not dsReserve.IsEmpty
                         and (grdReserveDBTableView.DataController.GetSelectedCount > 0);
end;

procedure TDecisionReserveWizardForm.actReservePOAddExecute(
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

  dsPayments.SetVariable( 'decision_id',  fDecisionID );
  dsPayments.SetVariable( 'po_list',      po_list     );
  dsPayments.SetVariable( 'is_ts',        fIsTS       );
  dsPayments.SetVariable( 'subjectid',    fSubjectID  );
  dsPayments.SetVariable( 'dec_doc_date', fdec_doc_date  );

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

procedure TDecisionReserveWizardForm.actReservePOModifyExecute(
  Sender: TObject);
  var
    fSelectFrm : TPOAssignForm;
    po_list    : string;
begin
  po_list := '''0''';

  dsPayments.SetVariable( 'decision_id',  fDecisionID );
  dsPayments.SetVariable( 'po_list',      po_list     );
  dsPayments.SetVariable( 'is_ts',        fIsTS       );
  dsPayments.SetVariable( 'subjectid',    fSubjectID  );
  dsPayments.SetVariable( 'dec_doc_date', fdec_doc_date  );

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

procedure TDecisionReserveWizardForm.actReservePORemoveExecute(
  Sender: TObject);
begin
  dsReserveParams.Edit;
  dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat + dsReserve.FieldByName( 'summa' ).AsFloat;
  dsReserveParams.Post;

  edtDecisionRest.EditValue := edtDecisionRest.EditValue + dsReserve.FieldByName( 'summa' ).AsFloat;

  dsReserve.Delete;
end;

procedure TDecisionReserveWizardForm.SaveReserve;
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

procedure TDecisionReserveWizardForm.tabReservFinishExecute(
  Sender: TObject);
begin
  SaveReserve;

  ModalResult := mrOk;
end;

procedure TDecisionReserveWizardForm.tabReservNextExecute(Sender: TObject);
begin
  SaveReserve;

  dsNotice.Refresh;

  PageControl.ActivePage := tabGeneral;
end;

procedure TDecisionReserveWizardForm.actReservePOAddUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled := dsReserveParams.FieldByName( 'summa_to_pay' ).AsFloat > 0;
end;

end.
