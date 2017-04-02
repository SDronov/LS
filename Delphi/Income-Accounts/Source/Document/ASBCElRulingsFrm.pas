unit ASBCElRulingsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CDeclBaseFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, Mask, DBCtrls, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, QueryList, cxGraphics, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, fdcObjectCore,
  cxCalendar, cxLabel, cxGridTableView, cxCheckBox, cxCurrencyEdit,
  OracleData;

type
  TASBCElRulingsForm = class(TCustomDeclBaseForm)
    dsDataNUM_MPO: TStringField;
    dsDataREGIM: TStringField;
    dsDataMETH_MOVE: TStringField;
    dsDataSUM_RUB: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    edtPayer: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    actAnnul: TAction;
    QueryList1: TQueryList;
    sqlSetAnnul: TsqlOp;
    dxBarButton1: TdxBarButton;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCUSTOM_MODE_ID: TFloatField;
    actPayOff: TAction;
    dxBarButton2: TdxBarButton;
    sqlHasCharge: TsqlOp;
    sqlHasPayment: TsqlOp;
    sqlSubjHasDebt: TsqlOp;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup5: TdxLayoutGroup;
    lcGeneralGroup2: TdxLayoutGroup;
    cxLabel1: TcxLabel;
    lcGeneralItem7: TdxLayoutItem;
    cxDBComboBox2: TcxDBComboBox;
    lcGeneralItem4: TdxLayoutItem;
    sqlSetPayOff: TsqlOp;
    actPayIncome: TAction;
    dxBarButton3: TdxBarButton;
    dsDataERRPAY_COUNT: TIntegerField;
    dsDataPAYTIME_FINISHED: TIntegerField;
    actKNP: TAction;
    dxBarButton4: TdxBarButton;
    sqlSetKNP: TsqlOp;
    sqlRemoveKNP: TsqlOp;
    dsDataAS_BIG_PAYER: TIntegerField;
    dsDataHAS_DED: TIntegerField;
    dsDataDECISION_CODE: TStringField;
    dsDataCARRIER_ID: TFloatField;
    dsDataCARRIER_NAME: TStringField;
    dsDataCARRIER_INN: TStringField;
    dsDataCARRIER_KPP: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    lcgActivation: TdxLayoutGroup;
    chBIsActive: TcxDBCheckBox;
    lciIsActive: TdxLayoutItem;
    edtActivationDate: TcxDBDateEdit;
    lciActivationDate: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    lcGeneralGroup6: TdxLayoutGroup;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lcGeneralItem12: TdxLayoutItem;
    tabCorrection: TcxTabSheet;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dsDataOVERRIDEDDOCID: TFloatField;
    edtOverridedTPO: TfdcObjectLinkEdit;
    lcOverrideTPOItem: TdxLayoutItem;
    dsDataANNUL_DECLNO: TStringField;
    dsDeduction: TOracleDataSet;
    dsDataAGGREMENT_ID: TFloatField;
    sqlTPOHasNoticePay: TsqlOp;
    dsDataEXPIRYDATE: TDateTimeField;
    dsDataVALDOC_NUMB: TStringField;
    dsDataSJURPERSON: TStringField;
    dsDataSPERSON_NAME: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataSPASSPORT: TStringField;
    dsDataSKBK: TStringField;
    dsDataNDECL_SUM: TFloatField;
    dsDataSPAYMENT: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    lcGeneralItem9: TdxLayoutItem;
    cxDBMaskEdit3: TcxDBMaskEdit;
    lcGeneralItem14: TdxLayoutItem;
    cxDBMaskEdit4: TcxDBMaskEdit;
    lcGeneralItem15: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem10: TdxLayoutItem;
    dsDataVALDOC_DATE: TDateTimeField;
    dsDataRULING_TYPE: TIntegerField;
    dsDataINVESTIGATORPOST: TStringField;
    dsDataINVESTIGATORNAME: TStringField;
    dsDataDOCNUMB: TStringField;
    dsDataDOCDATE: TDateTimeField;
    cxDBDateEdit3: TcxDBDateEdit;
    lcGeneralItem19: TdxLayoutItem;
    lcGeneralGroupINN: TdxLayoutGroup;
    edtEXP: TcxDBDateEdit;
    lciEXP: TdxLayoutItem;
    lcGeneralGroup7: TdxLayoutGroup;
    edtvaldocnumb: TcxDBTextEdit;
    lcivaldocnumb: TdxLayoutItem;
    edtvaldocdate: TcxDBDateEdit;
    lcivaldocdate: TdxLayoutItem;
    lcgvaldoc: TdxLayoutGroup;
    edtstatusforall: TcxDBTextEdit;
    lcistatusforall: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    dsDataSSTATUS: TStringField;
    edtUIN: TcxDBTextEdit;
    lciUIN: TdxLayoutItem;
    lcGeneralGroup9: TdxLayoutGroup;
    dsDataUIN: TStringField;
    edtNUIN: TcxDBTextEdit;
    lciNUIN: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure actAnnulExecute(Sender: TObject);
    procedure actAnnulUpdate(Sender: TObject);
    procedure actPayOffExecute(Sender: TObject);
    procedure actPayOffUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure tabObligationShow(Sender: TObject);
    procedure cxDBMaskEdit2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tabErrorsShow(Sender: TObject);
    procedure actPayIncomeExecute(Sender: TObject);
    procedure actPayIncomeUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actKNPExecute(Sender: TObject);
    procedure actKNPUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBCurrencyEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tabCorrectionShow(Sender: TObject);
    procedure actCorrectSubjectExecute(Sender: TObject);
    procedure actCorrectCChargeExecute(Sender: TObject);
    procedure edtOverridedTPOBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure tabServiceShow(Sender: TObject);
  private
    FHasCharge          : boolean;
    FHasPayment         : boolean;
    FAnnulPrompt        : string;
    FPayIncome          : boolean;
    FCorrectionGridForm : TForm;

    procedure Annul;
    procedure PayOff;
    procedure RefreshHasChargePayment;
    procedure AddChargeExecute(Sender: TObject);
    procedure OnSearchFinished(
      AGridTableView: TcxGridTableView; AIndex, ACount: integer;
      var ADescr: string; var ABreak: boolean);
  public
  end;


implementation

{$R *.dfm}

uses
  MainDM,
  uDOAPrintDoc,
  NoteTRDlgFrm,
  ObjectGridFrm,
  CustomDeclErrorGridFrm,
  DeclCorrectFrm,
  ObjectFrm,
  fdcCustomGridFrm,
  CorrectionTpoSubjectFrm,
  CorrectionTpoCChargeFrm,
  DeclChargeGridFrm,
  fdcCustomObjectFrm,
  TPOAnnulAdviceDlgFrm;//, JvDSADialogs;


procedure TASBCElRulingsForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  tabPayment.TabVisible := (dsDataAS_BIG_PAYER.Value <> 1);
  if not dsDataOVERRIDEDDOCID.IsNull  or not dsData.FieldByName('state_id').IsNull then
    lcOverrideTPOItem.Tag := 33;

  inherited;
  dsDataSUBJECT_ID.ReadOnly := not isNew
    or not dsData.FieldByName('state_id').IsNull;
  dsDataOVERRIDEDDOCID.ReadOnly := not dsDataOVERRIDEDDOCID.IsNull
                                or not dsData.FieldByName('state_id').IsNull;
  dsData.ReadOnly:= not dsData.FieldByName('state_id').IsNull;
  dsDataCarrier_Id.ReadOnly := dsDataSubject_Id.ReadOnly;
  RefreshHasChargePayment;

  //КПП Юрика либо Паспорт физика
  lcGeneralItem15.Visible := (dsData.FieldByName('SJURPERSON').AsString = 'Y');//КПП
  lcGeneralItem10.Visible := not (dsData.FieldByName('SJURPERSON').AsString = 'Y');//Паспорт

end;


procedure TASBCElRulingsForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  exp_PrintTPO(ExtractFilePath(Application.ExeName) + 'gtdview\TPOViewerDOA.esr',
               dsDataName.AsString,
               MainData.Session,
               False);
end;


procedure TASBCElRulingsForm.actAnnulExecute(Sender: TObject);
begin
  inherited;
  FAnnulPrompt:= 'Аннулирование ТПО';
  Annul;
end;

procedure TASBCElRulingsForm.actAnnulUpdate(Sender: TObject);
begin
  inherited;
  if dsDataSTATE_ID.IsNull then
    TAction(Sender).Enabled := True
    else
    TAction(Sender).Enabled := False;
end;

procedure TASBCElRulingsForm.actPayOffExecute(Sender: TObject);
begin
  inherited;
  FAnnulPrompt:= 'Погашение ТПО';
  PayOff;
end;

procedure TASBCElRulingsForm.actPayOffUpdate(Sender: TObject);
begin
  inherited;
  if dsDataSTATE_ID.IsNull and (FHasPayment=True) then
    TAction(Sender).Enabled := True
    else
    TAction(Sender).Enabled := False;
end;

procedure TASBCElRulingsForm.Annul;
var
 F:TNoteTRDlgForm;
begin
  if (sqlHasPayment.Exec('ID',[dsDataID.Value])=1) and (sqlTPOHasNoticePay.Exec('ID',[dsDataID.Value])=1) then
    MessageDlg('Участник ВЭД имеет задолженность!', mtInformation, [mbOK], 0)
  else
  begin
    F := TNoteTRDlgForm.Create(nil);
    F.Caption:= FAnnulPrompt;
    try
      if F.ShowModal = mrOK then
      begin
        sqlSetAnnul.Exec('ID;NOTE',[dsDataID.Value,F.cxMemo1.Text]);
        if OpenAdvicePayTPOList(dsDataID.Value) then
          MainData.Session.Commit
        else
          MainData.Session.Rollback;
        Self.RefreshData;
        RefreshWaiters;
      end;
    finally
      F.Free;
    end;
  end;
end;

procedure TASBCElRulingsForm.PayOff;
var
 F:TNoteTRDlgForm;
begin
  F := TNoteTRDlgForm.Create(nil);
  F.Caption:= FAnnulPrompt;
  try
   if F.ShowModal = mrOK then
   begin
    sqlSetPayOff.Exec('ID;NOTE',[dsDataID.Value,F.cxMemo1.Text]);
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

procedure TASBCElRulingsForm.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshHasChargePayment;
end;

procedure TASBCElRulingsForm.RefreshHasChargePayment;
begin
{  if sqlHasCharge.Exec('ID',[dsDataID.Value])=1 then
    FHasCharge:= True else FHasCharge:= False; }
  if sqlHasPayment.Exec('ID',[dsDataID.Value])=1 then
    FHasPayment:= True else FHasPayment:= False;
end;

procedure TASBCElRulingsForm.tabObligationShow(Sender: TObject);
var i:integer;
begin
  inherited;

  TObjectGridForm(FChargeForm).actOpen.Visible := False;
  TObjectGridForm(FChargeForm).actDelete.Visible := False;
  TDeclChargeGridForm(FChargeForm).actDeleteCharge.Visible := false;
  TObjectGridForm(FChargeForm).actAdd.Visible := False;
  TObjectGridForm(FChargeForm).btnAutoFilter.Visible := ivNever;

end;

procedure TASBCElRulingsForm.cxDBMaskEdit2PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if Error then
    ErrorText := 'Неверный код таможни. Правильный код таможни должен состоять из 8 цифр';
end;

procedure TASBCElRulingsForm.tabErrorsShow(Sender: TObject);
var
  DateStr: string;
begin
//  inherited;
  if not Assigned(FErrorForm) then
  begin
     FErrorForm := ObjectServices.ShowForm('TCustomDeclErrorGridForm', Params, TWinControl(Sender));
     TObjectForm(FErrorForm).RegisterWaiter(Self);
  end;
  
  if FPayIncome=False then
    begin
    DateTimeToString(DateStr,'DD.MM.YYYY',dsData['reg_date']);
    with TCustomDeclErrorGridForm(FErrorForm).dsData do
      begin


      SQL.Add('  and (t.TypeSysName not in (''BadPayOrderError'',''BadPayOrderErrorTPO'',''BadPayOrderErrorTPONotFound'',''BadPayOrderErrorTPONotFound'')');
      SQL.Add('  or to_date('''+DateStr+''',''DD.MM.YYYY'')<p_dateutils.AddWorkDays(trunc(sysdate,''DD''),-5))');
      Requery;
      end;
    end;
end;

procedure TASBCElRulingsForm.actPayIncomeExecute(Sender: TObject);
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

  dsData.ReQuery;
  FPayIncome:= True;
end;

procedure TASBCElRulingsForm.actPayIncomeUpdate(Sender: TObject);
begin
  inherited;
  if (dsData['ERR_COUNT']=0) and (dsData['ERRPAY_COUNT']=1)
    and (FPayIncome=False) then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

procedure TASBCElRulingsForm.FormCreate(Sender: TObject);
begin
  inherited;
  FPayIncome:= False;
  FCorrectionGridForm := nil;
  tabGoods.TabVisible := false;
  tabCorrection.TabVisible := false;
end;

procedure TASBCElRulingsForm.AddChargeExecute(Sender: TObject);
begin
  if AddChargeTPO(dsData['ID'], dsData['SUBJECT_ID']) then
    begin
    TObjectGridForm(FChargeForm).RefreshData;
    TObjectGridForm(FChargeForm).RefreshWaiters;
    end;
end;

procedure TASBCElRulingsForm.actKNPExecute(Sender: TObject);
var
  F: TfdcCustomGridForm;
  FC: TFormClass;
  Param: TParam;
begin
  if TAction(Sender).Checked = False then
    begin
    FC := TFormClass(FindClass('TSelectBPLicBySubjectForm'));
    F := FC.Create(Self) as TfdcCustomGridForm;
    F.SearchMode := True;

    F.Params.Assign(Params);
    Param := F.Params.FindParam('subject_id');
    if Param <> nil then
      Param.Value:= dsDataSUBJECT_ID.Value;

    F.SearchMultiple := True;
    F.OnSearchFinished := OnSearchFinished;
    F.ShowModal;

    RefreshData;
    RefreshWaiters;

    F.Free;
    end
    else if MessageDlg('Отвязать распоряжение КНП?',mtConfirmation,[mbOk,mbCancel],0)=mrOk then
    begin
    sqlRemoveKNP.Exec('ID',[dsDataID.Value]);
    QueryList1.Session.Commit;

    RefreshData;
    RefreshWaiters;
    end;

end;

procedure TASBCElRulingsForm.actKNPUpdate(Sender: TObject);
  var
    IsAnnulState : boolean;
begin
  inherited;
  IsAnnulState := dsState.Active and
                  not dsState.IsEmpty and
                  (dsStateSYSNAME.Value = 'Annul');

  TAction(Sender).Enabled := not IsAnnulState and
                            (dsDataSUBJECT_ID.Value <> 0) and
                            FHasPayment = False;
  TAction(Sender).Checked := (dsDataAS_BIG_PAYER.Value = 1);

end;

procedure TASBCElRulingsForm.OnSearchFinished(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  LicId: double;
begin
  LicId := AGridTableView.Controller.FocusedRecord.Values[0];
  sqlSetKNP.Exec('ID;LIC_ID',[dsDataID.Value,LicId]);
  QueryList1.Session.Commit;
end;

procedure TASBCElRulingsForm.FormShow(Sender: TObject);
begin
  inherited;
  if dsDataAS_BIG_PAYER.Value = 1 then
    tabPayment.TabVisible := False;
 
end;

procedure TASBCElRulingsForm.cxDBCurrencyEdit1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if     not VarIsEmpty( DisplayValue )
     and ( Pos( '-', DisplayValue) > 0 ) then
    begin
      ErrorText := 'Поле "Сумма" может содержать только неотрицательное значение';
      Error     := True;
    end;
end;

procedure TASBCElRulingsForm.tabCorrectionShow(Sender: TObject);
begin
  if not Assigned(FCorrectionGridForm) then
  begin
    Params.ParamValues['pDocID'] := Self.dsDataID.Value;
    FCorrectionGridForm := ObjectServices.ShowForm('TCorrectionCDGridForm', Params, TWinControl(Sender));
    Self.RegisterWaiter(TObjectGridForm(FCorrectionGridForm));
  end;
end;

procedure TASBCElRulingsForm.actCorrectSubjectExecute(Sender: TObject);
begin
  dsDeduction.SetVariable('ID', dsDataId.Value);
  try
    dsDeduction.Open;
    if (dsDeduction.FieldByName('Cnt').Value > 0) then
      raise exception.Create('Нельзя изменить декларанта пока по ТПО есть оплата!');
  finally
    dsDeduction.Close;
  end;

  with ObjectServices.CreateObject( 'CorrectionTPOSubject', False, nil ) as TCorrectionTPOSubjectForm do
    begin
      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
    end;
  RefreshData;
end;

procedure TASBCElRulingsForm.actCorrectCChargeExecute(Sender: TObject);
begin
  dsDeduction.SetVariable('ID', dsDataId.Value);
  try
    dsDeduction.Open;
    if (dsDeduction.FieldByName('Cnt').Value = 0) then
      raise exception.Create('По ТПО нет списаний!');
  finally
    dsDeduction.Close;
  end;

  with ObjectServices.CreateObject( 'CorrectionTPOCCharge', False, nil ) as TCorrectionTPOCChargeForm do
    begin
      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
    end;
  RefreshData;
end;

procedure TASBCElRulingsForm.edtOverridedTPOBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if not dsData.ReadOnly then
    Try
      dsData['ANNUL_DECLNO'] := AObject.FieldValues['DECL_NO'];
    except
    end;
end;

procedure TASBCElRulingsForm.tabServiceShow(Sender: TObject);
begin
  inherited;
    pcService.Pages[0].Show;
end;

initialization
   RegisterClass(TASBCElRulingsForm);

end.


