unit TRFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CDeclBaseFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, Mask, DBCtrls, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, QueryList, cxGraphics, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, fdcObjectCore,
  cxCalendar, cxLabel, cxCheckBox, Oracle, cxCurrencyEdit, OracleData,
  cxDBLabel, Math, RpDefine, RpCon, RpConDS;

type
  TTRForm = class(TCustomDeclBaseForm)
    dsDataNUM_MPO: TStringField;
    dsDataREGIM: TStringField;
    dsDataMETH_MOVE: TStringField;
    dsDataORDER_TYPE: TStringField;
    dsDataSUM_RUB: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    edtDeclarant: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dxBarButton1: TdxBarButton;
    actAnnul: TAction;
    QueryList1: TQueryList;
    sqlSetAnnul: TsqlOp;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataCUSTOM_MODE_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    lcGeneralGroup1: TdxLayoutGroup;
    actPayOff: TAction;
    dxBarButton2: TdxBarButton;
    sqlHasCharge: TsqlOp;
    sqlHasPayment: TsqlOp;
    sqlSubjHasDebt: TsqlOp;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem9: TdxLayoutItem;
    cxDBComboBox1: TcxDBComboBox;
    lcGeneralItem8: TdxLayoutItem;
    cxDBComboBox2: TcxDBComboBox;
    lcGeneralItem3: TdxLayoutItem;
    cxDBComboBox3: TcxDBComboBox;
    lcGeneralItem10: TdxLayoutItem;
    sqlSetPayOff: TsqlOp;
    actPayIncome: TAction;
    dxBarButton3: TdxBarButton;
    dsDataERRPAY_COUNT: TIntegerField;
    dsDataPAYTIME_FINISHED: TIntegerField;
    cmbxDecision: TfdcObjectLookupEdit;
    lcGeneralItem6: TdxLayoutItem;
    dsDataDECISION_CODE: TStringField;
    edtCarrier: TfdcObjectLinkEdit;
    lciCarrierName: TdxLayoutItem;
    dsDataCARRIER_NAME: TStringField;
    dsDataCARRIER_INN: TStringField;
    dsDataCARRIER_KPP: TStringField;
    dsDataCARRIER_ID: TFloatField;
    lcgActivation: TdxLayoutGroup;
    chBIsActive: TcxDBCheckBox;
    lciIsActive: TdxLayoutItem;
    edtActivationDate: TcxDBDateEdit;
    lciActivationDate: TdxLayoutItem;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    actPayOffRet: TAction;
    actPayOffReuse: TAction;
    sqlCreateDecisionPayback: TsqlOp;
    barSubIPayOff: TdxBarSubItem;
    barBtnDecisionPayback: TdxBarButton;
    barBtnDecisionReuse: TdxBarButton;
    sqlCreateDecisionReuse: TsqlOp;
    sqlIsPayed: TsqlOp;
    lcGeneralGroup3: TdxLayoutGroup;
    lcGeneralGroup5: TdxLayoutGroup;
    lcGeneralGroup6: TdxLayoutGroup;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDEBT_COUNT: TFloatField;
    dsDataANN_DATE: TDateTimeField;
    dsDataPAYOFF_DATE: TDateTimeField;
    dsDataDATE_CREATED: TDateTimeField;
    dsDataSTATESYSNAME: TStringField;
    dsDataOPERATION_DATE: TDateTimeField;
    qryIsPayed: TOracleQuery;
    barSubReuse: TdxBarSubItem;
    actPayOffDebt: TAction;
    barBtnPaydebt: TdxBarButton;
    sqlCreateDecisionDebt: TsqlOp;
    lcGeneralGroup7: TdxLayoutGroup;
    lcgSumCommon: TdxLayoutGroup;
    ceRest: TcxDBCurrencyEdit;
    itemRest: TdxLayoutItem;
    ceLocked: TcxDBCurrencyEdit;
    itemLocked: TdxLayoutItem;
    ceAvailable: TcxDBCurrencyEdit;
    itemAvailable: TdxLayoutItem;
    tabDecisions: TcxTabSheet;
    dsDataAVAILRESTSUM: TFloatField;
    dsDataLOCKEDSUM: TFloatField;
    dsDataRESTSUM: TFloatField;
    sqlExistUnSignedDec: TsqlOp;
    sqlGetMaxAmount: TsqlOp;
    dsDataOVERRIDEDDOCID: TFloatField;
    edtOverridedTR: TfdcObjectLinkEdit;
    lcOverrideTRItem: TdxLayoutItem;
    dsDataANNUL_DECLNO: TStringField;
    dsDataDATE_EXEC: TDateTimeField;
    lcGeneralItem12: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    lcGeneralItem13: TdxLayoutItem;
    odsGetDecisionId: TOracleDataSet;
    barBtnPayback: TdxBarSubItem;
    actPayOffRetY: TAction;
    barBtnDecisionPaybackY: TdxBarButton;
    dsDataRESTSUM_N: TFloatField;
    dsDataRESTSUM_Y: TFloatField;
    barBtnReuse: TdxBarSubItem;
    bsiPayDebts: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    actPayOffReuseY: TAction;
    dsDataISDECREUSE: TStringField;
    dsDataISDECPAYBACK: TStringField;
    dsDataSUM_OST: TFloatField;
    actPayOffDebtTS: TAction;
    barBtnPaydebtTS: TdxBarButton;
    lcgSum: TdxLayoutGroup;
    lcgSumTS: TdxLayoutGroup;
    dsDataRESTSUM_TS: TFloatField;
    dsDataLOCKEDSUM_TS: TFloatField;
    edtSumTSRest: TcxDBCurrencyEdit;
    lciSumTSRest: TdxLayoutItem;
    edtSumTSLocked: TcxDBCurrencyEdit;
    lciSumTSLocked: TdxLayoutItem;
    edtSumTSAvailable: TcxDBCurrencyEdit;
    lciSumTSAvailable: TdxLayoutItem;
    edtDeclINN: TcxDBTextEdit;
    lciDeclINN: TdxLayoutItem;
    lcgDecl: TdxLayoutGroup;
    edtDeclKPP: TcxDBTextEdit;
    lciDeclKPP: TdxLayoutItem;
    edtCarrierINN: TcxDBTextEdit;
    lciCarrierINN: TdxLayoutItem;
    lcgCarrier: TdxLayoutGroup;
    edtCarrierKPP: TcxDBTextEdit;
    lciCarrierKPP: TdxLayoutItem;
    dxBarSubItem1: TdxBarSubItem;
    BarSubItemDecOffsetObligation: TdxBarSubItem;
    BarBtnDecOffsetObligation: TdxBarButton;
    BarBtnDecOffsetObligationTS: TdxBarButton;
    actDecOffsetObligation: TAction;
    sqlCreateDecOffsetObligation: TsqlOp;
    lcieditSignDuplicate: TdxLayoutItem;
    editSignDuplicate: TcxDBCheckBox;
    lcGeneralGroup2: TdxLayoutGroup;
    lcieditAnnulTR: TdxLayoutItem;
    editAnnulTR: TfdcObjectLinkEdit;
    lcieditDuplicateTr: TdxLayoutItem;
    editDuplicateTr: TfdcObjectLinkEdit;
    dsDataMODIFY_DATE: TDateTimeField;
    dsDataANNUL_REASON: TStringField;
    dsDataSIGN_DUPLICATE: TStringField;
    dsDataANNUL_TR_ID: TFloatField;
    dsDataANNUL_TR_DOC_NUMBER: TStringField;
    dsDataDUPLICATE_TR_ID: TFloatField;
    dsDataDUPLICATE_TR_DOC_NUMBER: TStringField;
    actDecDebtOffset: TAction;
    BarSubItemDecDebtOffset: TdxBarSubItem;
    actDecDebtOffsetTS: TAction;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    sqlCreateDecisionDebtOffset: TsqlOp;
    dsDataISACTDEDUCTION: TStringField;
    cxDBLabel1: TcxDBLabel;
    lcGeneralItem7: TdxLayoutItem;
    sqlUpdateStatus: TsqlOp;
    sqlGetAvailAmountForDeposit: TsqlOp;
    dsDebtSum: TOracleDataSet;
    sqlSetStatusTR: TsqlOp;
    dsetGetAvailSum: TOracleDataSet;
    cxDBComboBox4: TcxDBComboBox;
    lcGeneralItem11: TdxLayoutItem;
    dsDataSTRTYPE: TStringField;
    dsDataSSIGN_GENPROV: TStringField;
    dsDataSSIGN_CORR: TStringField;
    dsDataTRTYPE: TIntegerField;
    RvDataSetConnection1: TRvDataSetConnection;
    dsDataCOL2: TStringField;
    dsDataCOL3: TStringField;
    dsDataSGARANT: TStringField;
    dsDataSIGN_CORR_Y: TStringField;
    dsDataSIGN_CORR_N: TStringField;
    cxDBComboBox5: TcxDBComboBox;
    lciGenSign: TdxLayoutItem;
    cxDBComboBox6: TcxDBComboBox;
    lciCorrectedSign: TdxLayoutItem;
    dsDataSDECL_NAME_REP: TStringField;
    dsDataSCARRIER_NAME_REP: TStringField;
    procedure actAnnulUpdate(Sender: TObject);
    procedure actAnnulExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabObligationShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPayOffExecute(Sender: TObject);
    procedure actPayOffUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cxDBMaskEdit2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDBTextEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tabErrorsShow(Sender: TObject);
    procedure actPayIncomeExecute(Sender: TObject);
    procedure actPayIncomeUpdate(Sender: TObject);
    procedure actPayOffRetExecute(Sender: TObject);
    procedure actPayOffReuseExecute(Sender: TObject);
    procedure qryIsPayedBeforeQuery(Sender: TOracleQuery);
    procedure actPayOffDebtExecute(Sender: TObject);
    procedure tabDecisionsShow(Sender: TObject);
    procedure edtOverridedTRBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure actPayOffRetUpdate(Sender: TObject);
    procedure actPayOffRetYExecute(Sender: TObject);
    procedure actPayOffRetYUpdate(Sender: TObject);
    procedure actPayOffReuseYExecute(Sender: TObject);
    procedure actPayOffDebtTSUpdate(Sender: TObject);
    procedure actDecOffsetObligationExecute(Sender: TObject);
    procedure actDecDebtOffsetExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FHasCharge,FHasPayment: boolean;
    FAnnulPrompt: string;
    FPayIncome: boolean;
    FDecisionForm : TForm;
    fs : TFormatSettings;
    SubjectID : integer;
    procedure Annul;
    procedure PayOff;
    procedure RefreshHasChargePayment;
    procedure AddChargeExecute(Sender: TObject);
    procedure RaiseIfExistsUnSignedDecision;
  public
    function GetSubjectId: Double; override;
    function GetSubjectINN: String;override;
    function GetSubjectKPP: String;override;
    function GetSubjectName: String;override;
  end;

implementation

uses
  MainDm,
  StrUtils,
  fdcObjectServices,
  DictDm,
  NoteTRDlgFrm,
  fdcCustomFrm,
  uDOAPrintDoc,
  ObjectGridFrm,
  CustomDeclErrorGridFrm,
  DeclCorrectFrm,
  ObjectFrm,
  DeclChargeGridFrm,
  DeclChargeTRGridFrm,
  fdcUtils,
  fdcCustomObjectFrm,
  fdcCustomDBDataFrm,
  DocReuseAmountDlgFrm,
  fdcCustomDataFrm,
  SelectDecGridFrm,
  DecisionPaybackFrm,
  DecisionPaymentFrm,
  DecisionPaybackDlgFrm, fdcCustomCardFrm;


{$R *.dfm}

function TTRForm.GetSubjectId: Double;
  var
    F: TField;
begin
  Result := 0;

  If  dsData.FieldByName( 'reg_date' ).AsDateTime >= strtodate('01.01.2011', fs) then
    F := dsData.FindField('CARRIER_ID')
  else
    F := dsData.FindField('SUBJECT_ID');
  if assigned(F) then
    Result := F.AsFloat;
end;

function TTRForm.GetSubjectINN: String;
begin
  If  (dsData.FieldByName( 'reg_date' ).AsDateTime >= strtodate('01.01.2011', fs))
  and (   (dsData.FieldByName('CARRIER_INN').AsString  <> '')
       or (dsData.FieldByName('CARRIER_KPP').AsString  <> '')
       or (dsData.FieldByName('CARRIER_NAME').AsString <> '')
       )
  then
    Result := dsData.FieldByName('CARRIER_INN').AsString
  else
    Result := dsData.FieldByName('DECL_INN').AsString
end;

function TTRForm.GetSubjectKPP: String;
begin
  If  (dsData.FieldByName( 'reg_date' ).AsDateTime >= strtodate('01.01.2011', fs))
  and (   (dsData.FieldByName('CARRIER_INN').AsString  <> '')
       or (dsData.FieldByName('CARRIER_KPP').AsString  <> '')
       or (dsData.FieldByName('CARRIER_NAME').AsString <> '')
       )
  then
     Result := dsData.FieldByName('CARRIER_KPP').AsString
  else
     Result := dsData.FieldByName('DECL_KPP').AsString
end;

function TTRForm.GetSubjectName: String;
begin
  If  (dsData.FieldByName( 'reg_date' ).AsDateTime >= strtodate('01.01.2011', fs))
  and (   (dsData.FieldByName('CARRIER_INN').AsString  <> '')
       or (dsData.FieldByName('CARRIER_KPP').AsString  <> '')
       or (dsData.FieldByName('CARRIER_NAME').AsString <> '')
       )
  then
     Result := dsData.FieldByName('CARRIER_NAME').AsString
  else
     Result := dsData.FieldByName('DECL_NAME').AsString
end;

procedure TTRForm.actAnnulUpdate(Sender: TObject);
begin
  inherited;

  TAction(Sender).Enabled := not IsNew
                         and dsDataSTATE_ID.IsNull
                         and (dsDataISDECREUSE.Value = 'N')
                         and (dsDataISDECPAYBACK.Value = 'N')
                         and (dsDataISACTDEDUCTION.Value = 'N')
                         and not ((dsDataSUM_OST.Value > 0) and (dsDataSUM_OST.Value <> dsDataSUM_RUB.Value));
end;

procedure TTRForm.actAnnulExecute(Sender: TObject);
begin
  inherited;
  FAnnulPrompt:= 'Аннулирование таможенной расписки';
  Annul;
  actRefresh.Execute;
  tabErrors.TabVisible := dsDataERR_COUNT.Value > 0;
end;

procedure TTRForm.dsDataAfterOpen(DataSet: TDataSet);
var bOldTR:boolean;
begin
  if not dsDataOVERRIDEDDOCID.IsNull or not dsData.FieldByName('state_id').IsNull then
    lcOverrideTRItem.Tag := 33;
  inherited;

  dsDataSUBJECT_ID.ReadOnly := not dsDataSUBJECT_ID.IsNull
                               or not dsData.FieldByName('state_id').IsNull;
  dsDataCarrier_ID.ReadOnly := not dsDataCarrier_ID.IsNull
                               or not dsData.FieldByName('state_id').IsNull;
  dsDataOVERRIDEDDOCID.ReadOnly := not dsDataOVERRIDEDDOCID.IsNull
                                or not dsData.FieldByName('state_id').IsNull;
  dsData.ReadOnly:= not dsData.FieldByName('state_id').IsNull;
  RefreshHasChargePayment;

  actNew.Enabled := MainData.GetCustomsLevel = 0;
  actNew.Visible := MainData.GetCustomsLevel = 0;
  SubjectID := dsDataSUBJECT_ID.AsInteger;
  //--
  BarBtnDecOffsetObligation.Enabled   := (dsDataRESTSUM_N.Value > 0);
  BarBtnDecOffsetObligationTS.Enabled := (dsDataRESTSUM_Y.Value > 0);
  //--
  bOldTR := (dsData.FieldByName('TRTYPE').AsInteger=0);
  lcieditSignDuplicate.Visible := bOldTR;
  //lcOverrideTRItem.Visible := bOldTR;
  lcieditAnnulTR.Visible := bOldTR;
  lcieditDuplicateTr.Visible := bOldTR;
  lciCorrectedSign.Visible := NOT bOldTR;
  lciGenSign.Visible := NOT bOldTR;
end;

procedure TTRForm.tabObligationShow(Sender: TObject);
begin
 if not Assigned(FChargeForm) then
  begin
    FChargeForm := Self.ObjectServices.ShowForm('TDeclChargeTRGridForm', Params, TWinControl(Sender));
    TObjectForm(FChargeForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FChargeForm));
  end;

 if(dsDataSTATE_ID.IsNull) then
 begin
  TObjectGridForm(FChargeForm).actAdd.Visible := True;
  TObjectGridForm(FChargeForm).actDelete.Visible := True;
 end
 else
 begin
  TObjectGridForm(FChargeForm).actAdd.Visible := False;
  TObjectGridForm(FChargeForm).actDelete.Visible := False;
  end;

 if dsData['PAYTIME_FINISHED']=0 then
   TObjectGridForm(FChargeForm).actAdd.OnExecute:= AddChargeExecute
   else
   begin
  TObjectGridForm(FChargeForm).actAdd.Visible := False;
  TObjectGridForm(FChargeForm).actDelete.Visible := False;
  TObjectGridForm(FChargeForm).actOpen.Visible:= False;
  end;

  TDeclChargeGridForm(FChargeForm).AllowCorrectCharge := False;
end;

procedure TTRForm.FormCreate(Sender: TObject);
begin
  inherited;
  tabGoods.TabVisible := False;
  FPayIncome:= False;

  GetLocaleFormatSettings(GetThreadLocale, fs);
  fs.DateSeparator := '.';
end;

procedure TTRForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  if dsData.FieldByName('TRTYPE').AsInteger = 0 then
   exp_PrintTR(ExtractFilePath(Application.ExeName) + 'gtdview\TRViewerDOA.esr',
               dsDataName.AsString,
               MainData.session,
               False)
  else
   exp_PrintTRElectronic(ExtractFilePath(Application.ExeName) + 'gtdview\TRElViewerDOA.esr',
               dsDataName.AsString,
               MainData.session,
               False);



end;

procedure TTRForm.actPayOffExecute(Sender: TObject);
begin
  inherited;
  FAnnulPrompt:= 'Погашение таможенной расписки';
  PayOff;
end;

procedure TTRForm.actPayOffUpdate(Sender: TObject);
begin
  inherited;
  if dsDataSTATE_ID.IsNull and (FHasPayment=True) then
    TAction(Sender).Enabled := True
    else
    TAction(Sender).Enabled := False;
end;

procedure TTRForm.Annul;
var
 F:TNoteTRDlgForm;
begin
  F := TNoteTRDlgForm.Create(nil);
  F.Caption:= FAnnulPrompt;
  try
   if F.ShowModal = mrOK then
   begin
    sqlSetAnnul.Exec('ID;NOTE',[dsDataID.Value,F.cxMemo1.Text]);
    MainData.Session.Commit;
    Self.RefreshData;
    RefreshWaiters;

    if (sqlHasPayment.Exec('ID',[dsDataID.Value])=1) and (sqlSubjHasDebt.Exec=1) then
      MessageDlg('Участник ВЭД имеет задолженность!', mtInformation, [mbOK], 0);
   end;
  finally
   F.Free;
  end;
end;

procedure TTRForm.PayOff;
var
 F:TNoteTRDlgForm;
begin
  F := TNoteTRDlgForm.Create(nil);
  F.lciReserveSum.Visible := True;
  F.Caption:= FAnnulPrompt;
  try
   if F.ShowModal = mrOK then
   begin
    sqlSetPayOff.Exec('ID;NOTE;RESERVESUM',[dsDataID.Value,F.cxMemo1.Text, IfElse(F.chbxReserveSum.Checked, 1, 0)]);
    MainData.Session.Commit;
    Self.RefreshData;
    RefreshWaiters;

    if sqlSubjHasDebt.Exec=1 then
      MessageDlg('Участник ВЭД имеет задолженность!', mtInformation, [mbOK], 0);
   end;
  finally
   F.Free;
  end;
end;

procedure TTRForm.RefreshHasChargePayment;
begin
  if sqlHasCharge.Exec('ID',[dsDataID.Value])=1 then
    FHasCharge:= True else FHasCharge:= False;
  if sqlHasPayment.Exec('ID',[dsDataID.Value])=1 then
    FHasPayment:= True else FHasPayment:= False;

  qryIsPayed.Execute;
  barSubIPayOff.Enabled := ( qryIsPayed.GetVariable( 'result' ) = 0 )
                       and dsData.FieldByName( 'state_id' ).IsNull;

  // Патокин В. по требованию ФТС                       
  barSubIPayOff.Enabled := dsData.FieldByName('AVAILRESTSUM').AsFloat > 0;
  BarSubItemDecOffsetObligation.Enabled := ( qryIsPayed.GetVariable( 'result' ) = 0 )
                       and dsData.FieldByName( 'state_id' ).IsNull;
                         
end;

procedure TTRForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshHasChargePayment;
  sqlSetStatusTR.Exec('idTr',[dsDataID.Value]);    
end;

procedure TTRForm.cxDBMaskEdit2PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if Error then
    ErrorText := 'Неверный код таможни. Правильный код таможни должен состоять из 8 цифр';
end;

procedure TTRForm.cxDBTextEdit1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if DisplayValue>=0 then
    else
    begin
    ErrorText:= 'Поле "Сумма" может содержать только неотрицательное значение';
    Error:= True;
    end;
end;

procedure TTRForm.tabErrorsShow(Sender: TObject);
var
  DateStr: string;
begin
  if not Assigned(FErrorForm) then
    begin
      FErrorForm := ObjectServices.ShowForm('TTPOErrorGridForm', Params, TWinControl(Sender));
      TObjectForm(FErrorForm).RegisterWaiter(Self);

      if FPayIncome=False then
        begin
          DateTimeToString(DateStr,'DD.MM.YYYY',dsData['reg_date']);
          with TCustomDeclErrorGridForm(FErrorForm).dsData do
            begin
              SQL.Add('  and (t.TypeSysName not in (''BadPayOrderError'',''BadPayOrderErrorTPO'',''BadPayOrderErrorTPONotFound'',''BadPayOrderErrorTPONotFound'')');
              SQL.Add('  or to_date('''+DateStr+''',''DD.MM.YYYY'')<p_dateutils.AddWorkDays(trunc(sysdate,''DD''),-3))');
              Requery;
            end;
        end;
    end;

  with TCustomDeclErrorGridForm(FErrorForm) do
    begin
      if Self.dsData['PAYTIME_FINISHED']=1 then
        actPay.Visible:= False;
      actDebt.Visible:= False;
    end;
end;

procedure TTRForm.actPayIncomeExecute(Sender: TObject);
begin
  inherited;

  if Assigned(FErrorForm) then
    with TCustomDeclErrorGridForm(FErrorForm).dsData do
      begin
      SQL.Delete(SQL.Count-1);
      SQL.Delete(SQL.Count-1);
      Requery;
      end
    else
    tabErrors.TabVisible := True;

  dsData.Requery;
  FPayIncome:= True;
end;

procedure TTRForm.actPayIncomeUpdate(Sender: TObject);
begin
  inherited;
  if (dsData['ERR_COUNT']=0) and (dsData['ERRPAY_COUNT']=1)
    and (FPayIncome=False)
    and (dsDataSUM_OST.Value > 0) then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TTRForm.AddChargeExecute(Sender: TObject);
begin
  if AddChargeTPO(dsData['ID'], SubjectID) then
    begin
    TObjectGridForm(FChargeForm).RefreshData;
    TObjectGridForm(FChargeForm).RefreshWaiters;
    end;
end;


procedure TTRForm.actPayOffRetExecute(Sender: TObject);
var
  lv_DecisionForm : TForm;
  lv_DecisionID : Double;
  lv_DecPaybackDlg: TDecisionPaybackDlgForm;
  lv_SelectDecGridForm: TSelectDecGridForm;
begin
  lv_SelectDecGridForm:= nil;
  try
  lv_SelectDecGridForm := TSelectDecGridForm.Create(self);
  lv_SelectDecGridForm.SearchTypeSysName := 'DecPaybackDeposit';
  lv_SelectDecGridForm.dsSubject.SetVariable( 'pDeclId', dsData.FieldByName( 'id' ).Value );
  lv_SelectDecGridForm.dsSubject.SetVariable('pIsTS','N');
  lv_SelectDecGridForm.dsSubject.Open;

  lv_SelectDecGridForm.dsData.ParamByName('pSubjectId').Value := lv_SelectDecGridForm.dsSubject.FieldValues['payer_id'];
  lv_SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'N';

  lv_SelectDecGridForm.SearchMode        := True;
  lv_SelectDecGridForm.SearchMultiple    := True;
  lv_SelectDecGridForm.actOpen.Visible   := False;
  lv_SelectDecGridForm.actAdd.Visible    := False;
  lv_SelectDecGridForm.actDelete.Visible := False;

  if lv_SelectDecGridForm.ShowModal = mrOk then begin
    if lv_SelectDecGridForm.dsDataID.AsInteger = -1 then begin
      lv_DecPaybackDlg:= nil;
      try
       dsetGetAvailSum.Close;
       dsetGetAvailSum.SetVariable('pDepositId', dsDataID.Value);
       dsetGetAvailSum.Open;

       dsDebtSum.SetVariable('DECL_INN', dsDataDECL_INN.AsString);
       dsDebtSum.SetVariable('DECL_KPP', dsDataDECL_KPP.AsString);
       dsDebtSum.Open;

       lv_DecPaybackDlg := TDecisionPaybackDlgForm.Create(self);
       with lv_DecPaybackDlg  do begin
         DecisionBaseSum := dsetGetAvailSum.FieldByName('AvailSum').AsCurrency;
         DecisionSum := DecisionBaseSum;
         PaySum := dsDebtSum.FieldByName('PAY_SUMMA').AsCurrency;
         ProcSum := dsDebtSum.FieldByName('PROC_SUMMA').AsCurrency;
         PenySum := dsDebtSum.FieldByName('PENY_SUMMA').AsCurrency;
       end;

       if (lv_DecPaybackDlg.ShowModal = mrOk) then begin
        lv_DecisionID := sqlCreateDecisionPayback.Exec( 'id;is_ts;payer_id; debt_sum; DebtPaySumma; DebtPenySumma; DebtProcSumma',
          [ dsData.FieldByName( 'id' ).Value, 'N', lv_SelectDecGridForm.dsSubjectPAYER_ID.Value,
            lv_DecPaybackDlg.DebtSum, lv_DecPaybackDlg.PaySum, lv_DecPaybackDlg.PenySum, lv_DecPaybackDlg.ProcSum ]);
        ObjectServices.OpenObject( lv_DecisionID, nil );
        RefreshData;
       end
       else begin
       //
       end;
      finally
        dsetGetAvailSum.Close;
        dsDebtSum.Close;
      end;
    end
    else begin
      lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( lv_SelectDecGridForm.dsDataID.Value, nil ));
      lv_DecisionID   :=  sqlCreateDecisionPayback.Exec( 'id;DecId', [dsData.FieldByName( 'id' ).Value,lv_SelectDecGridForm.dsDataID.Value] );
      (lv_DecisionForm as TDecisionPaybackForm).RefreshData;
  		RefreshData;
    end;
  end
  else begin
    //
  end;
  finally
    if assigned(lv_SelectDecGridForm) then freeAndNil(lv_SelectDecGridForm);
    if assigned(lv_DecPaybackDlg) then freeAndNil(lv_DecPaybackDlg);
  end;
end;


procedure TTRForm.qryIsPayedBeforeQuery(Sender: TOracleQuery);
begin
  Sender.SetVariable( 'ID', dsData.FieldByName( 'ID' ).AsFloat );
end;

procedure TTRForm.actPayOffReuseExecute(Sender: TObject);
var
 lv_DecisionForm : TForm;
 lv_DecisionID : Double;
 lv_SelectDecGridForm: TSelectDecGridForm;
 lv_DecPaybackDlg: TDecisionPaybackDlgForm;
begin
  lv_SelectDecGridForm:= nil;
  try
  lv_SelectDecGridForm := TSelectDecGridForm.Create(self);
  lv_SelectDecGridForm.SearchTypeSysName := 'DecisionPaymentDeposit';
  lv_SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).Value);
  lv_SelectDecGridForm.dsSubject.SetVariable('pIsTS','N');
  lv_SelectDecGridForm.dsSubject.Open;
  lv_SelectDecGridForm.dsData.ParamByName('pSubjectId').Value  := lv_SelectDecGridForm.dsSubject.FieldValues['payer_id'];
  lv_SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'N';
  lv_SelectDecGridForm.SearchMode        := True;
  lv_SelectDecGridForm.SearchMultiple    := True;
  lv_SelectDecGridForm.actOpen.Visible   := False;
  lv_SelectDecGridForm.actAdd.Visible    := False;
  lv_SelectDecGridForm.actDelete.Visible := False;

  if lv_SelectDecGridForm.ShowModal = mrOk then
    if lv_SelectDecGridForm.dsDataID.AsInteger = -1 then begin
      lv_DecPaybackDlg := nil;
      try
       dsetGetAvailSum.Close;
       dsetGetAvailSum.SetVariable('pDepositId', dsDataID.AsFloat);
       dsetGetAvailSum.open;
       // Получение сумм ТДУЗ
       dsDebtSum.SetVariable('DECL_INN', dsDataDECL_INN.AsString);
       dsDebtSum.SetVariable('DECL_KPP', dsDataDECL_KPP.AsString);
       dsDebtSum.Open;

       lv_DecPaybackDlg:= TDecisionPaybackDlgForm.Create(self);
       with lv_DecPaybackDlg do begin
         DecisionBaseSum:= dsetGetAvailSum.FieldByName('AvailSum').AsCurrency;
         DecisionSum:= DecisionBaseSum;
         PaySum:=      dsDebtSum.FieldByName('PAY_SUMMA').AsCurrency;
         ProcSum:=     dsDebtSum.FieldByName('PROC_SUMMA').AsCurrency;
         PenySum:=     dsDebtSum.FieldByName('PENY_SUMMA').AsCurrency;
       end;

       if ( lv_DecPaybackDlg.ShowModal = mrOk ) then begin
        lv_DecisionID := sqlCreateDecisionReuse.Exec ( 'id; is_ts; payer_id; debt_sum; DebtPaySumma; DebtPenySumma; DebtProcSumma',
          [dsData.FieldByName( 'id' ).Value,'N',lv_SelectDecGridForm.dsSubjectPAYER_ID.Value,
            lv_DecPaybackDlg.DebtSum, lv_DecPaybackDlg.PaySum, lv_DecPaybackDlg.PenySum, lv_DecPaybackDlg.ProcSum]);
        ObjectServices.OpenObject( lv_DecisionID, nil );
        RefreshData;
       end;

      finally
       dsetGetAvailSum.Close;
       dsDebtSum.Close;
      end;
    end
    else begin
      lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( lv_SelectDecGridForm.dsDataID.Value, nil ));
      lv_DecisionID   :=  sqlCreateDecisionReuse.Exec( 'id;dec_id', [dsData.FieldByName( 'id' ).Value,lv_SelectDecGridForm.dsDataID.Value] );
      (lv_DecisionForm as TDecisionPaymentForm).RefreshData;
  		RefreshData;
    end;
  finally
   if assigned(lv_SelectDecGridForm) then freeAndNil(lv_SelectDecGridForm);
   if assigned(lv_DecPaybackDlg) then freeAndNil(lv_DecPaybackDlg);
  end;
end;

procedure TTRForm.actPayOffDebtExecute(Sender: TObject);
  var
    frmDocAmount : TDocReuseAmountDlgForm;

    lv_DecisionID : Double;
    lv_MaxSum     : Currency;
    lv_IsTS       : string;
begin
  case (Sender as TAction).Tag of
    1 : lv_IsTS := 'N';
    2 : lv_IsTS := 'Y';
  else
    lv_IsTS := '';
  end;

  frmDocAmount := TDocReuseAmountDlgForm.Create( Self );
  Try
    Try
      sqlGetMaxAmount['TR_Amount'] := 0.0;
      sqlGetMaxAmount['RESULT']    := 0.0;
      sqlGetMaxAmount.Exec( 'pID;pSubjId;is_ts', [dsDataID.Value, dsDataSUBJECT_ID.Value, lv_IsTS] );
      lv_MaxSum := sqlGetMaxAmount['RESULT'];
    except
      on E:Exception do
      raise Exception.CreateFmt('Ошибка при получении суммы зачета!'#$D#$A'[%s]', [E.Message]);
    end;

    if lv_MaxSum = 0 then
    begin
      if sqlGetMaxAmount['TR_Amount'] = 0.0 then
        raise Exception.Create('Сумма остатка ' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' ) + ' в таможенной расписке равна 0!')
      else
        raise Exception.Create('Участник ВЭД не имеет задолженности' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' ) + '!');
    end;

    frmDocAmount.MaxValue := lv_MaxSum;
    frmDocAmount.Amount   := frmDocAmount.MaxValue;
    frmDocAmount.Caption  := 'Введите сумму решения о зачёте' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' );
    if frmDocAmount.ShowModal = mrOk then
      begin
        sqlCreateDecisionDebt['result'] := 0.0;
        lv_DecisionID := sqlCreateDecisionDebt.Exec ( 'id;pSumma;is_ts', [dsData.FieldByName( 'id' ).AsFloat, frmDocAmount.Amount, lv_IsTS] );
        ObjectServices.OpenObject( lv_DecisionID, nil );
        actRefresh.Execute;
      end;
  finally
    frmDocAmount.Free;
  end;
end;



procedure TTRForm.tabDecisionsShow(Sender: TObject);
begin
  inherited;
  if not Assigned( FDecisionForm ) then
    FDecisionForm := ObjectServices.ShowForm( 'TTRDecisionGridForm', Params, tabDecisions )
end;

procedure TTRForm.RaiseIfExistsUnSignedDecision;
  var
    lv_Count : integer;
begin
// Патокин В.В. 14.07.2015
// Убрано из-за наличия остатка на ТР при учёте задолженности в решениях
//  lv_Count := sqlExistUnSignedDec.Exec ( 'id', dsData.FieldByName( 'id' ).AsFloat  );
//  if lv_Count > 0 then
//    raise Exception.Create( 'По данной ТР есть неподписанные решения!');
end;

procedure TTRForm.edtOverridedTRBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if not dsData.ReadOnly then
    Try
      dsData['ANNUL_DECLNO'] := AObject.FieldValues['DECL_NO'];
    except
    end;
end;

procedure TTRForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if not DictData.dsCurrency.Active then
    DictData.dsCurrency.Open;


  if IsNew then
    begin
      dsData.FieldByName( 'currency_id' ).AsFloat   := DictData.dsCurrency.Lookup( 'CODE', '643', 'ID' );
      dsData.FieldByName( 'CUSTOMS_CODE' ).AsString := MainData.GetCustomsCode;
    end;
end;

procedure TTRForm.actPayOffRetUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsNew and (dsDataRESTSUM_N.Value > 0);
end;

procedure TTRForm.actPayOffRetYExecute(Sender: TObject);
var
 lv_DecisionForm : TForm;
 lv_DecisionID : Double;
 lv_SelectDecGridForm: TSelectDecGridForm;
begin
  lv_SelectDecGridForm:= nil;
  try
  lv_SelectDecGridForm := TSelectDecGridForm.Create(self);
  lv_SelectDecGridForm.SearchTypeSysName := 'DecPaybackDeposit';
  lv_SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
  lv_SelectDecGridForm.dsSubject.SetVariable('pIsTS','Y');
  lv_SelectDecGridForm.dsSubject.Open;
  lv_SelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := lv_SelectDecGridForm.dsSubject.FieldValues['payer_id'];
  lv_SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'Y';
  lv_SelectDecGridForm.SearchMode        := True;
  lv_SelectDecGridForm.SearchMultiple    := True;
  lv_SelectDecGridForm.actOpen.Visible   := False;
  lv_SelectDecGridForm.actAdd.Visible    := False;
  lv_SelectDecGridForm.actDelete.Visible := False;

  if lv_SelectDecGridForm.ShowModal = mrOk then
    if lv_SelectDecGridForm.dsDataID.AsInteger = -1 then begin
      RaiseIfExistsUnSignedDecision;
      lv_DecisionID := sqlCreateDecisionPayback.Exec( 'id;is_ts;payer_id', [dsData.FieldByName( 'id' ).AsFloat,'Y',lv_SelectDecGridForm.dsSubjectPAYER_ID.asFloat] );
      ObjectServices.OpenObject( lv_DecisionID, nil );
      {actRefresh.Execute;}
      RefreshData;
    end
    else begin
      lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( lv_SelectDecGridForm.dsDataID.AsInteger, nil ));
      lv_DecisionID   :=  sqlCreateDecisionPayback.Exec( 'id;DecId', [dsData.FieldByName( 'id' ).AsFloat,lv_SelectDecGridForm.dsDataID.AsInteger] );
      (lv_DecisionForm as TDecisionPaybackForm).RefreshData;
  		RefreshData;
    end;
 finally
   if assigned( lv_SelectDecGridForm )then
     freeAndNil(lv_SelectDecGridForm);
 end;
end;

procedure TTRForm.actPayOffRetYUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsNew and (dsDataRESTSUM_Y.Value > 0);
end;

procedure TTRForm.actPayOffReuseYExecute(Sender: TObject);
var
 lv_DecisionForm : TForm;
 lv_DecisionID : Double;
 lv_SelectDecGridForm: TSelectDecGridForm;
begin
  lv_SelectDecGridForm:= nil;
  try
  lv_SelectDecGridForm:= TSelectDecGridForm.Create(self);
  lv_SelectDecGridForm.SearchTypeSysName := 'DecisionPaymentDeposit';
  lv_SelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
  lv_SelectDecGridForm.dsSubject.SetVariable('pIsTS','Y');
  lv_SelectDecGridForm.dsSubject.Open;
  lv_SelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := lv_SelectDecGridForm.dsSubject.FieldValues['payer_id'];
  lv_SelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'Y';
  lv_SelectDecGridForm.SearchMode        := True;
  lv_SelectDecGridForm.SearchMultiple    := True;
  lv_SelectDecGridForm.actOpen.Visible   := False;
  lv_SelectDecGridForm.actAdd.Visible    := False;
  lv_SelectDecGridForm.actDelete.Visible := False;

  if lv_SelectDecGridForm.ShowModal = mrOk then
    if lv_SelectDecGridForm.dsDataID.AsInteger = -1 then begin
      RaiseIfExistsUnSignedDecision;
      lv_DecisionID := sqlCreateDecisionReuse.Exec ( 'id;is_ts;payer_id', [dsData.FieldByName( 'id' ).AsFloat,'Y',lv_SelectDecGridForm.dsSubjectPAYER_ID.asFloat]  );
      ObjectServices.OpenObject( lv_DecisionID, nil );
      RefreshData;
    end
    else begin
      lv_DecisionForm :=  TObjectForm(GetObjectServices.OpenObject( lv_SelectDecGridForm.dsDataID.AsInteger, nil ));
      lv_DecisionID   :=  sqlCreateDecisionReuse.Exec( 'id;dec_id', [dsData.FieldByName( 'id' ).AsFloat,lv_SelectDecGridForm.dsDataID.AsInteger] );
      (lv_DecisionForm as TDecisionPaymentForm).RefreshData;
  		RefreshData;
    end;
 finally
  if assigned(lv_SelectDecGridForm) then freeAndNil(lv_SelectDecGridForm);
 end;
end;

procedure TTRForm.actPayOffDebtTSUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsNew and ( (dsDataRESTSUM_Y.Value > 0) or (dsDataRESTSUM_N.Value > 0) );
end;

procedure TTRForm.actDecOffsetObligationExecute(Sender: TObject);
  var
    frmDocAmount : TDocReuseAmountDlgForm;
    frmSelectDecGridForm: TSelectDecGridForm;
    lv_DecisionID : Double;
    lv_MaxSum     : Currency;
    lv_IsTS       : string;
begin
 case (Sender as TdxBarButton).Tag of
    0 : lv_IsTS := 'N';
    1 : lv_IsTS := 'Y';
  else
    lv_IsTS := '';
  end;

  frmDocAmount := TDocReuseAmountDlgForm.Create( Self );
  Try
    frmDocAmount.MaxValue := IfThen((lv_IsTS = 'Y'),dsDataRESTSUM_Y.Value,dsDataRESTSUM_N.Value);
    frmDocAmount.Amount   := frmDocAmount.MaxValue;
    frmDocAmount.Caption  := 'Введите сумму решения о зачёте' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' );
    if frmDocAmount.ShowModal = mrOk then
      begin
        //--
        frmSelectDecGridForm := TSelectDecGridForm.Create(self);
        try
          frmSelectDecGridForm.SearchTypeSysName := 'DecOffsetObligation';
          frmSelectDecGridForm.dsSubject.SetVariable('pDeclId',dsData.FieldByName( 'id' ).AsFloat);
          frmSelectDecGridForm.dsSubject.SetVariable('pIsTS','N');
          frmSelectDecGridForm.dsSubject.Open;
          frmSelectDecGridForm.dsData.ParamByName('pSubjectId').AsFloat  := dsDataSUBJECT_ID.AsFloat;
          frmSelectDecGridForm.dsData.ParamByName('pIsTS').AsString      := 'N';
          frmSelectDecGridForm.SearchMode        := True;
          frmSelectDecGridForm.SearchMultiple    := True;
          frmSelectDecGridForm.actOpen.Visible   := False;
          frmSelectDecGridForm.actAdd.Visible    := False;
          frmSelectDecGridForm.actDelete.Visible := False;
          frmSelectDecGridForm.Panel1.Hide;
          If (frmSelectDecGridForm.ShowModal = mrOk) Then
            begin
              If frmSelectDecGridForm.dsDataID.AsFloat = -1 Then
                begin
                  lv_DecisionID := sqlCreateDecOffsetObligation.Exec ( 'depositid;subjectid;currencyid;summa;decisionid;is_ts', [dsData.FieldByName( 'id' ).AsFloat,dsDataSUBJECT_ID.AsFloat,dsDataCURRENCY_ID.AsFloat,frmDocAmount.Amount,NULL,lv_IsTS]  );
                end
              else
                begin
                  lv_DecisionID := sqlCreateDecOffsetObligation.Exec ( 'depositid;subjectid;currencyid;summa;decisionid;is_ts', [dsData.FieldByName( 'id' ).AsFloat,dsDataSUBJECT_ID.AsFloat,dsDataCURRENCY_ID.AsFloat,frmDocAmount.Amount,frmSelectDecGridForm.dsDataID.AsFloat,lv_IsTS]  );
                end;
              if (lv_DecisionID <> NULL) then
                begin
                  ObjectServices.OpenObject( lv_DecisionID, nil );
                end;
              RefreshData;
            end;
          finally
            FreeAndNil(frmSelectDecGridForm);
          end;
        //--
      end;
  finally
    FreeAndNil(frmDocAmount);
  end;
end;

procedure TTRForm.actDecDebtOffsetExecute(Sender: TObject);
  var
    frmDocAmount : TDocReuseAmountDlgForm;

    lv_DecisionID : Double;
    lv_MaxSum     : Currency;
    lv_IsTS       : string;
begin
  case (Sender as TAction).Tag of
    1 : lv_IsTS := 'N';
    2 : lv_IsTS := 'Y';
  else
    lv_IsTS := '';
  end;

  frmDocAmount := TDocReuseAmountDlgForm.Create( Self );
  try
    try
      sqlGetMaxAmount['TR_Amount'] := 0.0;
      sqlGetMaxAmount['RESULT'] := 0.0;
      sqlGetMaxAmount.Exec( 'pID;pSubjId;is_ts', [dsDataID.Value, dsDataSUBJECT_ID.Value, lv_IsTS] );
      lv_MaxSum := sqlGetMaxAmount['RESULT'];
    except
      on E:Exception do
      raise Exception.CreateFmt('Ошибка при получении суммы зачета!'#$D#$A'[%s]', [E.Message]);
    end;

    if lv_MaxSum = 0 then
      raise Exception.Create('Участник ВЭД не имеет задолженности' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' ) + '!');

    frmDocAmount.MaxValue := lv_MaxSum;
    frmDocAmount.Amount   := frmDocAmount.MaxValue;
    frmDocAmount.Caption  := 'Введите сумму решения о зачёте' + IfThen( lv_IsTS = 'Y', ' по ввозной пошлине ТС' );
    if frmDocAmount.ShowModal = mrOk then
      begin
        sqlCreateDecisionDebtOffset['result'] := 0;
        lv_DecisionID := sqlCreateDecisionDebtOffset.Exec ( 'id;pSumma;is_ts', [dsData.FieldByName( 'id' ).AsFloat, frmDocAmount.Amount, lv_IsTS] );
        ObjectServices.OpenObject( lv_DecisionID, nil );
        actRefresh.Execute;
      end;
  finally
    frmDocAmount.Free;
  end;
end;


procedure TTRForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  sqlSetStatusTR.Exec('idTr',[dsDataID.Value]);
end;

initialization
   RegisterClass(TTRForm);
end.


