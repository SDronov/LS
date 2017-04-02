unit AdviceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxCalendar,
  cxMaskEdit, cxMemo, cxTextEdit, cxPC, cxControls, DocRManagementFrm,
  QueryList, cxCurrencyEdit, ObjectFrm, OracleData, cxCheckBox;

type
  TAdviceForm = class(TDocRManagementForm)
    dsDataCUSTOMS_ID: TFloatField;
    dsDataCUSTOM_NAME: TStringField;
    sqlGetTableName: TsqlOp;
    bsiDecision: TdxBarSubItem;
    actDecisionReturn: TAction;
    actDecisionReuse: TAction;
    btnDecisionReturn: TdxBarButton;
    btnDecisionReuse: TdxBarButton;
    dsDataSUMMA: TFloatField;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    sqlCreateDecisionReuse: TsqlOp;
    sqlLinkWithAdvice: TsqlOp;
    actDecisionDebt: TAction;
    btnDecisionDebt: TdxBarButton;
    bsiDecisionReuse: TdxBarSubItem;
    sqlCreateDecisionDebt: TsqlOp;
    edtLockSum: TcxDBCurrencyEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtAvailSum: TcxDBCurrencyEdit;
    lcGeneralItem2: TdxLayoutItem;
    tabDecisions: TcxTabSheet;
    lcgRestSums: TdxLayoutGroup;
    edtRestSum: TcxDBCurrencyEdit;
    lcGeneralItem3: TdxLayoutItem;
    sqlExistUnSignedDec: TsqlOp;
    sqlGetMaxAmount: TsqlOp;
    sqlGetExistsNoConfirmDoc: TsqlOp;
    sqlGetCurrency: TsqlOp;
    actActivate: TAction;
    sqlActivate: TsqlOp;
    barBtnActivate: TdxBarButton;
    bsiDecisionReturn: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    actDecisionReturnTS: TAction;
    dsDataSUMMA_TS_N: TFloatField;
    dsDataSUMMA_TS_Y: TFloatField;
    bsiDecisionReusePays: TdxBarSubItem;
    btnDecisionReuseTS: TdxBarButton;
    actDecisionReuseTS: TAction;
    actDecisionDebtTS: TAction;
    bsiDecisionReuseDebts: TdxBarSubItem;
    btnDecisionDebtTS: TdxBarButton;
    dsDataRESTSUM: TFloatField;
    dsDataLOCKSUM: TFloatField;
    dsDataAVAILSUM: TFloatField;
    lcgTSSums: TdxLayoutGroup;
    lcgTSSumsRest: TdxLayoutGroup;
    edtTSSumma: TcxDBCurrencyEdit;
    lciTSSumma: TdxLayoutItem;
    edtTSSummaRest: TcxDBCurrencyEdit;
    lciTSSummaRest: TdxLayoutItem;
    edtTSSummaLocked: TcxDBCurrencyEdit;
    lciTSSummaLocked: TdxLayoutItem;
    edtTSSummaAvailable: TcxDBCurrencyEdit;
    lciTSSummaAvailable: TdxLayoutItem;
    lcgCommonSums: TdxLayoutGroup;
    lcgSums: TdxLayoutGroup;
    dsDataTS_SUMMA: TFloatField;
    dsDataTS_RESTSUM: TFloatField;
    dsDataTS_LOCKSUM: TFloatField;
    dsDataTS_AVAILSUM: TFloatField;
    sqlGetDecReserveSumma: TsqlOp;
    dsDataSUMMA_DEBT: TCurrencyField;
    dsDebtSum: TfdcQuery;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabPaymentOrderShow(Sender: TObject);
    procedure tabDeclShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDecisionReturnUpdate(Sender: TObject);
    procedure actDecisionReturnExecute(Sender: TObject);
    procedure actDecisionReuseExecute(Sender: TObject);
    procedure actDecisionDebtExecute(Sender: TObject);
    procedure tabDecisionsShow(Sender: TObject);
    procedure actActivateUpdate(Sender: TObject);
    procedure actActivateExecute(Sender: TObject);
    procedure actDecisionReturnTSExecute(Sender: TObject);
    procedure actDecisionReturnTSUpdate(Sender: TObject);
    procedure actDecisionReuseTSExecute(Sender: TObject);
    procedure actDecisionReuseTSUpdate(Sender: TObject);
    procedure actDecisionReuseUpdate(Sender: TObject);
    procedure actDecisionDebtTSUpdate(Sender: TObject);
    procedure actDecisionDebtUpdate(Sender: TObject);
  private
    fAdviceID : Double;
    fDecisionID : Double;
    fDecisionForm : TObjectForm;
    FDecisionTabForm : TForm;
    procedure RaiseIfExistsUnSignedDecision;
  public
  protected
    function GetTemplateReportName : String; override;
    function GetDecisionReturnTypeName : string; virtual;
    function GetDecisionReuseTypeName : string; virtual;
    function GetDecisionID : Double;
    function GetDecisionForm : TObjectForm;
  end;

implementation

{$R *.dfm}

uses
  StrUtils
 ,Math
 ,fdcObjectServices
 ,MainDm
 ,fdcCustomDBDataFrm
 ,DecisionPaybackFrm
 ,fdcCustomCardFrm
 ,DecisionPaymentFrm
 ,fdcCustomObjectFrm
 ,SelectDecGridFrm
 ,DocReuseAmountDlgFrm
 ,fdcCustomDataFrm
 , SelectAdviceReserveForDecFrm;


{ TRManAdviceForm }

function TAdviceForm.GetTemplateReportName: String;
begin
  Result := 'УВЕДОМЛЕНИЕ_УЧАСТНИКУ_ВЭД.doc';
end;

procedure TAdviceForm.dsDataAfterOpen(DataSet: TDataSet);
var
  TN : String;
  i  : Integer;
begin
  inherited;

  // замена вызова fdc_advice_add на вызов функции создания потомка
  if ClassName = 'TAdviceForm' then begin
    TN := sqlGetTableName.Exec('SYSNAME', dsDataTYPESYSNAME.Value);
    for i := 0 to dsInsert.SQL.Count - 1 do
      dsInsert.SQL[i] := StringReplace(dsInsert.SQL[i], 'fdc_advice_add', TN + '_ADD', [rfIgnoreCase]);
  end;
end;

procedure TAdviceForm.tabPaymentOrderShow(Sender: TObject);
begin
  if not Assigned(FPaymentOrderGridForm) then begin
    FPaymentOrderGridForm := ShowForm('TAdvicePaymentOrderGridForm', Params, tabPaymentOrder);
    TObjectForm(FPaymentOrderGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FPaymentOrderGridForm));
  end;
end;

procedure TAdviceForm.tabDeclShow(Sender: TObject);
begin
  if not Assigned(FCDeclGridForm) then begin
    FCDeclGridForm := ShowForm('TAdviceCDeclGridForm', Params, tabDecl);
    TObjectForm(FCDeclGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FCDeclGridForm));
  end;
end;

procedure TAdviceForm.FormCreate(Sender: TObject);
begin
  inherited;
  tabService.TabVisible := False;
end;

procedure TAdviceForm.actDecisionReturnUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and not dsData.FieldByName( 'subject_id' ).IsNull
                             and ((dsData.FieldByName( 'IS_ACTIVE' ).asString = 'Y') or (dsDataTYPESYSNAME.AsString = 'AdviceBack'))
                             and (dsData.FieldByName( 'summa_ts_n' ).AsFloat > 0)
                             and (   not dsState.Active
                                  or (   not dsState.IsEmpty
                                      and (dsState.FieldByName( 'SysName' ).AsString <> 'Advice.Decision') ) );
end;

procedure TAdviceForm.actDecisionReturnTSUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and not dsData.FieldByName( 'subject_id' ).IsNull
                             and ((dsData.FieldByName( 'IS_ACTIVE' ).asString = 'Y') or (dsDataTYPESYSNAME.AsString = 'AdviceBack'))
//                             and (Min( dsData.FieldByName( 'ts_RestSum' ).AsFloat, dsData.FieldByName( 'summa_ts_y' ).AsFloat ) > 0)
                             and (( dsData.FieldByName( 'ts_RestSum' ).AsFloat - dsData.FieldByName( 'ts_LockSum' ).AsFloat ) > 0)
                             and (   not dsState.Active
                                  or (   not dsState.IsEmpty
                                      and (dsState.FieldByName( 'SysName' ).AsString <> 'Advice.Decision') ) );

end;


procedure TAdviceForm.actDecisionReturnExecute(Sender: TObject);
var
    lv_DecisionForm : TForm;
begin
  SelectDecGridForm := TSelectDecGridForm.Create(self);
  SelectDecGridForm.SearchTypeSysName := GetDecisionReturnTypeName;
  SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
  SelectDecGridForm.dsSubject.SetVariable('pIsTS','N');
  SelectDecGridForm.dsSubject.Open;
  SelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := SelectDecGridForm.dsSubjectPAYER_ID.AsFloat;
  SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'N';
  SelectDecGridForm.SearchMode        := True;
  SelectDecGridForm.SearchMultiple    := True;
  SelectDecGridForm.actOpen.Visible   := False;
  SelectDecGridForm.actAdd.Visible    := False;
  SelectDecGridForm.actDelete.Visible := False;

  If SelectDecGridForm.ShowModal = mrOk Then
    If SelectDecGridForm.dsDataID.AsInteger = -1 Then
      begin
        RaiseIfExistsUnSignedDecision;
        sqlGetExistsNoConfirmDoc.Exec('pId',[self.dsData.FieldByName( 'id' ).AsFloat]);

        if SelectAdviceReserveForDec( self.dsData.FieldByName( 'id' ).AsFloat, 'N' ) then
        begin
          lv_DecisionForm := GetObjectServices.CreateObject( GetDecisionReturnTypeName, False, nil );
          with lv_DecisionForm as TDecisionPaybackForm do
            begin
              RegisterWaiter( Self );
              dsData.FieldByName( 'subject_id' ).AsFloat := Self.dsData.FieldByName( 'subject_id' ).AsFloat;
              dsData.FieldByName( 'DECL_NAME' ).AsString := Self.dsData.FieldByName( 'DECL_NAME' ).AsString;
              dsData.FieldByName( 'DECL_INN' ).AsString  := Self.dsData.FieldByName( 'DECL_INN' ).AsString;
              dsData.FieldByName( 'DECL_KPP' ).AsString  := Self.dsData.FieldByName( 'DECL_KPP' ).AsString;

              dsData.FieldByName( 'DOC_DATE' ).AsDateTime        := trunc( date );
              dsData.FieldByName( 'APP_DATE' ).AsDateTime        := trunc(date);
              dsData.FieldByName( 'APP_DATE_INCOME' ).AsDateTime := trunc(date);
              dsData.FieldByName( 'SUMMA' ).AsFloat      :=
                  Self.sqlGetDecReserveSumma.Exec('Result',[0.0]);  //Self.dsData.FieldByName( 'summa_ts_n' ).AsFloat;

              dsData.FieldByName( 'CURRENCY_ID' ).AsFloat := Self.sqlGetCurrency.Exec;
              dsData.FieldByName( 'destsub_id' ).AsFloat := Self.dsData.FieldByName( 'subject_id' ).AsFloat;
              dsData.FieldByName( 'DECL_NAME_DEST' ).AsString := Self.dsData.FieldByName( 'DECL_NAME' ).AsString;
              dsData.FieldByName( 'DECL_INN_DEST' ).AsString  := Self.dsData.FieldByName( 'DECL_INN' ).AsString;
              dsData.FieldByName( 'DECL_KPP_DEST' ).AsString  := Self.dsData.FieldByName( 'DECL_KPP' ).AsString;

              dsData.FieldByName( 'IS_TS' ).AsString  := 'N';

              // запись
              dsData.FieldByName( 'reason_id' ).Required := False;
              ChecksEnable := False;
              SaveData;
              ChecksEnable := True;
              dsData.FieldByName( 'reason_id' ).Required := True;

              fAdviceID := Self.dsData.FieldByName( 'ID' ).AsFloat;
              fDecisionID := ID;
              sqlLinkWithAdvice.Exec( 'pid;pDecisionID', [fAdviceID,fDecisionID] );
            end;
        end;
        RefreshData;
      end
    else
      begin
        if SelectAdviceReserveForDec( self.dsData.FieldByName( 'id' ).AsFloat, 'N' ) then
        begin
          lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( SelectDecGridForm.dsDataID.AsInteger, nil ));

          fAdviceID := Self.dsData.FieldByName( 'ID' ).AsFloat;
          fDecisionID := SelectDecGridForm.dsDataID.AsInteger;
          sqlLinkWithAdvice.Exec( 'pid;pDecisionID', [fAdviceID,fDecisionID] );
{
          sqlLinkWithAdvice.Exec( 'pDecisionID', [SelectDecGridForm.dsDataID.AsInteger] );
}
          (lv_DecisionForm as TDecisionPaybackForm).RegisterWaiter( Self );
          (lv_DecisionForm as TDecisionPaybackForm).RefreshData;
        end;

        RefreshData;
      end;
end;

function TAdviceForm.GetDecisionForm: TObjectForm;
begin
  Result := fDecisionForm;
end;

function TAdviceForm.GetDecisionReturnTypeName: string;
begin
  {добавлено AdvicePayTPO}
  if (dsData.FieldByName( 'TypeSysName' ).AsString = 'AdvicePay')
    or (dsData.FieldByName( 'TypeSysName' ).AsString = 'AdvicePayTPO') then
    Result := 'DecPaybackPay'
  else if dsData.FieldByName( 'TypeSysName' ).AsString = 'AdviceLevy' then
    Result := 'DecPaybackLevy'
  else if dsData.FieldByName( 'TypeSysName' ).AsString = 'AdviceBack' then
    Result := 'DecisionPaybackOutback'
  else
    Result := '';
end;

function TAdviceForm.GetDecisionID: Double;
begin
  Result := fDecisionID;
end;

function TAdviceForm.GetDecisionReuseTypeName: string;
begin
  if dsData.FieldByName( 'TypeSysName' ).AsString = 'AdvicePayPeriodic' then
    Result := 'DecisionPaymentPeriodic'
  else
    Result := 'DecisionPayment'
   ;
end;

procedure TAdviceForm.actDecisionReuseExecute(Sender: TObject);
var
    lv_DecisionForm : TForm;
    lv_DecisionID : Double;
begin
  SelectDecGridForm := TSelectDecGridForm.Create(self);
  SelectDecGridForm.SearchTypeSysName := GetDecisionReuseTypeName;
  SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
  SelectDecGridForm.dsSubject.SetVariable('pIsTS','N');
  SelectDecGridForm.dsSubject.Open;
  SelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := SelectDecGridForm.dsSubjectPAYER_ID.AsFloat;
  SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'N';
  SelectDecGridForm.SearchMode        := True;
  SelectDecGridForm.SearchMultiple    := True;
  SelectDecGridForm.actOpen.Visible   := False;
  SelectDecGridForm.actAdd.Visible    := False;
  SelectDecGridForm.actDelete.Visible := False;

  If SelectDecGridForm.ShowModal = mrOk Then
    If SelectDecGridForm.dsDataID.AsInteger = -1 Then
      begin
        RaiseIfExistsUnSignedDecision;
        lv_DecisionID := sqlCreateDecisionReuse.Exec( 'pAdviceID;pIsTS', [dsData.FieldByName( 'id' ).AsFloat,'N'] );
        lv_DecisionForm := GetObjectServices.OpenObject( lv_DecisionID, nil );
        (lv_DecisionForm as TDecisionPaymentForm).RegisterWaiter( Self );
        RefreshData;
      end
    else
      begin
        lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( SelectDecGridForm.dsDataID.AsInteger, nil ));
        lv_DecisionID   :=  sqlCreateDecisionReuse.Exec( 'pAdviceID;pDecId', [dsData.FieldByName( 'id' ).AsFloat,SelectDecGridForm.dsDataID.AsInteger] );
        (lv_DecisionForm as TDecisionPaymentForm).RegisterWaiter( Self );
        (lv_DecisionForm as TDecisionPaymentForm).RefreshData;
        RefreshData;
      end;
end;

procedure TAdviceForm.actDecisionDebtExecute(Sender: TObject);
  var
    vDecisionID  : Double;
    frmDocAmount : TDocReuseAmountDlgForm;
    lv_MaxSum    : Currency;
    lv_IsTS      : string;

    lv_DecDebtsForm : TForm;
begin
  case (Sender as TAction).Tag of
    1 : lv_IsTS := 'N';
    2 : lv_IsTS := 'Y';
  else
    lv_IsTS := '';
  end;

  frmDocAmount := TDocReuseAmountDlgForm.Create( Self );
  Try
    dsDebtSum.ParamByName('pID').AsFloat := dsDataID.Value;
    dsDebtSum.ParamByName('pSubjId').AsFloat := dsDataSUBJECT_ID.Value;
    dsDebtSum.ParamByName('is_ts').AsString := lv_IsTS;
    dsDebtSum.ParamByName('pDebtFlag').AsInteger := 1;

    dsDebtSum.Open;
    lv_MaxSum := dsDebtSum.FieldByName('dbt_sum').AsCurrency;

//    lv_MaxSum := sqlGetMaxAmount.Exec( 'pID;pSubjId;is_ts;pDebtFlag', [dsDataID.Value, dsDataSUBJECT_ID.Value, lv_IsTS, 1]);

    if lv_MaxSum = 0 then
      raise Exception.Create('Участник ВЭД не имеет задолженности' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' ) + '!');

    frmDocAmount.MaxValue := lv_MaxSum;
    frmDocAmount.Amount   := frmDocAmount.MaxValue;
    frmDocAmount.Caption  := 'Введите сумму решения о зачёте' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' );
    if frmDocAmount.ShowModal = mrOk then
      begin
        vDecisionID := sqlCreateDecisionDebt.Exec( 'pAdviceID;pSumma;is_ts;pDebtFlag', [dsData.FieldByName( 'id' ).AsFloat, frmDocAmount.Amount, lv_IsTS, 1] );
        lv_DecDebtsForm := GetObjectServices.OpenObject( vDecisionID, nil );
        (lv_DecDebtsForm as TfdcCustomCardForm).RegisterWaiter( Self );
        RefreshData;
      end;
  finally
    dsDebtSum.Close;
    frmDocAmount.Free;
  end;
end;

procedure TAdviceForm.tabDecisionsShow(Sender: TObject);
begin
  inherited;
  if not Assigned( FDecisionTabForm ) then
    begin
      FDecisionTabForm := ObjectServices.ShowForm( 'TAdviceDecisionGridForm', Params, tabDecisions );
      (FDecisionTabForm as TfdcCustomDataForm).RegisterWaiter( Self );
    end;
end;

procedure TAdviceForm.RaiseIfExistsUnSignedDecision;
  var
    lv_Count : integer;
begin
  lv_Count := sqlExistUnSignedDec.Exec ( 'id', dsData.FieldByName( 'id' ).AsFloat  );
  if lv_Count > 0 then
    raise Exception.Create( 'По данному уведомлению есть неподписанные решения о зачете в счет погашения задолженности!');
end;

procedure TAdviceForm.actActivateUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := dsData.FieldByName( 'IS_ACTIVE' ).AsString = 'N';
end;

procedure TAdviceForm.actActivateExecute(Sender: TObject);
begin
  inherited;

  if MessageDlg( 'Провести документ?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    begin
      sqlActivate.Exec;

      RefreshData;
    end;
end;

procedure TAdviceForm.actDecisionReturnTSExecute(Sender: TObject);
var
    lv_DecisionForm : TForm;
begin
  SelectDecGridForm := TSelectDecGridForm.Create(self);
  SelectDecGridForm.SearchTypeSysName := GetDecisionReturnTypeName;
  SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
  SelectDecGridForm.dsSubject.SetVariable('pIsTS','Y');
  SelectDecGridForm.dsSubject.Open;
  SelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := SelectDecGridForm.dsSubjectPAYER_ID.AsFloat;
  SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'Y';
  SelectDecGridForm.SearchMode        := True;
  SelectDecGridForm.SearchMultiple    := True;
  SelectDecGridForm.actOpen.Visible   := False;
  SelectDecGridForm.actAdd.Visible    := False;
  SelectDecGridForm.actDelete.Visible := False;

  If SelectDecGridForm.ShowModal = mrOk Then
    If SelectDecGridForm.dsDataID.AsInteger = -1 Then
      begin
        RaiseIfExistsUnSignedDecision;
        sqlGetExistsNoConfirmDoc.Exec('pId',[self.dsData.FieldByName( 'id' ).AsFloat]);
        if SelectAdviceReserveForDec( self.dsData.FieldByName( 'id' ).AsFloat, 'Y' ) then
        begin
          lv_DecisionForm := GetObjectServices.CreateObject( GetDecisionReturnTypeName, False, nil );
          with lv_DecisionForm as TDecisionPaybackForm do
            begin
              RegisterWaiter( Self );

              dsData.FieldByName( 'subject_id' ).AsFloat := Self.dsData.FieldByName( 'subject_id' ).AsFloat;
              dsData.FieldByName( 'DECL_NAME' ).AsString := Self.dsData.FieldByName( 'DECL_NAME' ).AsString;
              dsData.FieldByName( 'DECL_INN' ).AsString  := Self.dsData.FieldByName( 'DECL_INN' ).AsString;
              dsData.FieldByName( 'DECL_KPP' ).AsString  := Self.dsData.FieldByName( 'DECL_KPP' ).AsString;
//              dsData.FieldByName( 'SUMMA' ).AsFloat      := Self.dsData.FieldByName( 'ts_RestSum' ).AsFloat - Self.dsData.FieldByName( 'ts_LockSum' ).AsFloat;
              dsData.FieldByName( 'SUMMA' ).AsFloat      :=
                 Self.sqlGetDecReserveSumma.Exec('Result',[0.0]); //Self.dsData.FieldByName( 'summa_ts_n' ).AsFloat;

              dsData.FieldByName( 'DOC_DATE' ).AsDateTime        := trunc(date);
              dsData.FieldByName( 'APP_DATE' ).AsDateTime        := trunc(date);
              dsData.FieldByName( 'APP_DATE_INCOME' ).AsDateTime := trunc(date);

              dsData.FieldByName( 'CURRENCY_ID' ).AsFloat := Self.sqlGetCurrency.Exec;
              dsData.FieldByName( 'destsub_id' ).AsFloat := Self.dsData.FieldByName( 'subject_id' ).AsFloat;
              dsData.FieldByName( 'DECL_NAME_DEST' ).AsString := Self.dsData.FieldByName( 'DECL_NAME' ).AsString;
              dsData.FieldByName( 'DECL_INN_DEST' ).AsString  := Self.dsData.FieldByName( 'DECL_INN' ).AsString;
              dsData.FieldByName( 'DECL_KPP_DEST' ).AsString  := Self.dsData.FieldByName( 'DECL_KPP' ).AsString;

              dsData.FieldByName( 'IS_TS' ).AsString  := 'Y';

              dsData.FieldByName( 'reason_id' ).Required := False;
              ChecksEnable := False;
              SaveData;
              ChecksEnable := True;
              dsData.FieldByName( 'reason_id' ).Required := True;

              lciDeclInn.Enabled   := False;
              lciDeclKPP.Enabled   := False;
              lciDeclarant.Enabled := False;
              lciSumma.Enabled     := False;

              fAdviceID   := Self.dsData.FieldByName( 'ID' ).AsFloat;
              fDecisionID := ID;
              sqlLinkWithAdvice.Exec( 'pid;pDecisionID', [fAdviceID,fDecisionID] );
            end;
        end;
        RefreshData;
      end
    else
      begin
        if SelectAdviceReserveForDec( self.dsData.FieldByName( 'id' ).AsFloat, 'Y' ) then
        begin
          lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( SelectDecGridForm.dsDataID.AsInteger, nil ));

          fAdviceID := Self.dsData.FieldByName( 'ID' ).AsFloat;
          fDecisionID := SelectDecGridForm.dsDataID.AsInteger;
          sqlLinkWithAdvice.Exec( 'pid;pDecisionID', [fAdviceID,fDecisionID] );
{
          sqlLinkWithAdvice.Exec( 'pDecisionID', [SelectDecGridForm.dsDataID.AsInteger] );
}
          (lv_DecisionForm as TDecisionPaybackForm).RegisterWaiter( Self );
          (lv_DecisionForm as TDecisionPaybackForm).RefreshData;
        end;
        RefreshData;
      end;

end;

procedure TAdviceForm.actDecisionReuseTSExecute(Sender: TObject);
var
    lv_DecisionForm : TForm;
    lv_DecisionID : Double;
begin
  SelectDecGridForm := TSelectDecGridForm.Create(self);
  SelectDecGridForm.SearchTypeSysName := GetDecisionReuseTypeName;
  SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
  SelectDecGridForm.dsSubject.SetVariable('pIsTS','Y');
  SelectDecGridForm.dsSubject.Open;
  SelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := SelectDecGridForm.dsSubjectPAYER_ID.AsFloat;
  SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'Y';
  SelectDecGridForm.SearchMode        := True;
  SelectDecGridForm.SearchMultiple    := True;
  SelectDecGridForm.actOpen.Visible   := False;
  SelectDecGridForm.actAdd.Visible    := False;
  SelectDecGridForm.actDelete.Visible := False;

  If SelectDecGridForm.ShowModal = mrOk Then
    If SelectDecGridForm.dsDataID.AsInteger = -1 Then
    begin
      RaiseIfExistsUnSignedDecision;
      lv_DecisionID := sqlCreateDecisionReuse.Exec( 'pAdviceID;pIsTS', [dsData.FieldByName( 'id' ).AsFloat,'Y'] );
      lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( lv_DecisionID, nil ));
      (lv_DecisionForm as TDecisionPaymentForm).RegisterWaiter( Self );
      RefreshData;
    end
    else
    begin
      lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( SelectDecGridForm.dsDataID.AsInteger, nil ));
      lv_DecisionID   :=  sqlCreateDecisionReuse.Exec( 'pAdviceID;pDecId', [dsData.FieldByName( 'id' ).AsFloat,SelectDecGridForm.dsDataID.AsInteger] );
      (lv_DecisionForm as TDecisionPaymentForm).RegisterWaiter( Self );
      (lv_DecisionForm as TDecisionPaymentForm).RefreshData;
  		RefreshData;
    end;end;

procedure TAdviceForm.actDecisionReuseTSUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and not dsData.FieldByName( 'subject_id' ).IsNull
                             and (dsData.FieldByName( 'IS_ACTIVE' ).asString = 'Y')
//                             and (Min( dsData.FieldByName( 'ts_RestSum' ).AsFloat, dsData.FieldByName( 'summa_ts_y' ).AsFloat ) > 0)
                             and (( dsData.FieldByName( 'ts_RestSum' ).AsFloat - dsData.FieldByName( 'ts_LockSum' ).AsFloat ) > 0)
                             and (   not dsState.Active
                                  or (   not dsState.IsEmpty
                                      and (dsState.FieldByName( 'SysName' ).AsString <> 'Advice.Decision') ) );
end;

procedure TAdviceForm.actDecisionReuseUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and not dsData.FieldByName( 'subject_id' ).IsNull
                             and (dsData.FieldByName( 'IS_ACTIVE' ).asString = 'Y')
                             and (dsData.FieldByName( 'summa_ts_n' ).AsFloat > 0)
                             and (   not dsState.Active
                                  or (   not dsState.IsEmpty
                                      and (dsState.FieldByName( 'SysName' ).AsString <> 'Advice.Decision') ) );
end;

procedure TAdviceForm.actDecisionDebtTSUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and not dsData.FieldByName( 'subject_id' ).IsNull
                             and (dsData.FieldByName( 'IS_ACTIVE' ).asString = 'Y')
                             and (dsData.FieldByName( 'summa_ts_y' ).AsFloat > 0)
                             and (   not dsState.Active
                                  or (   not dsState.IsEmpty
                                      and (dsState.FieldByName( 'SysName' ).AsString <> 'Advice.Decision') ) );
end;

procedure TAdviceForm.actDecisionDebtUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and not dsData.FieldByName( 'subject_id' ).IsNull
                             and ((dsData.FieldByName( 'IS_ACTIVE' ).asString = 'Y') or (dsDataTYPESYSNAME.AsString = 'AdviceBack'))
                             and (dsData.FieldByName( 'summa_debt' ).IsNull or (dsData.FieldByName( 'summa_debt' ).AsFloat > 0))
                             and (   not dsState.Active
                                  or (   not dsState.IsEmpty
                                      and (dsState.FieldByName( 'SysName' ).AsString <> 'Advice.Decision') ) );
end;

initialization
  RegisterClass(TAdviceForm);

end.
