{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 16457 $
  $Author: adavletyarov $
  $Date: 2013-04-01 17:29:55 +0400 (РџРЅ, 01 Р°РїСЂ 2013) $
}
unit CustomDeclFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, cxDBLookupComboBox,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, fdcObjectLookupEdit,
  QueryList, cxCurrencyEdit, cxGraphics, CDeclBaseFrm, fdcObjectCore,
  dxBarExtItems,cxGridTableView, Oracle, OracleData;

resourcestring
  SOTMHint    = 'Подтвердите завершение контроля отделом таможенных платежей';
  SOTMMessage = 'Подтвердите завершение контроля';

type
  TCustomDeclForm = class(TCustomDeclBaseForm)
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataMODIFY_DATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataG011: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataG12: TFloatField;
    dsDataG221: TStringField;
    dsDataG444A: TStringField;
    dsDataG444B: TDateTimeField;
    dsDataG447A: TStringField;
    dsDataG447B: TDateTimeField;
    dsDataK115: TStringField;
    dsDataG40: TStringField;
    dsDataDECL_TYPESYSNAME: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    edtDeclName: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    dsDataCURRENCY_ID: TFloatField;
    lcGeneralGroup4: TdxLayoutGroup;
    lcGeneralGroup5: TdxLayoutGroup;
    edtFIO: TcxDBTextEdit;
    lcGeneralItem9: TdxLayoutItem;
    lcGeneralItem10: TdxLayoutItem;
    lcGeneralItem11: TdxLayoutItem;
    cmbxG011: TfdcObjectLookupEdit;
    lcGeneralItem8: TdxLayoutItem;
    dsDataCUSTOM_MODE_ID: TFloatField;
    dsDataCUSTOM_MODE_CODE: TStringField;
    dsDataCUSTOM_MODE_NAME: TStringField;
    cmbxCustomMode: TfdcObjectLookupEdit;
    lcGeneralItem13: TdxLayoutItem;
    lcGeneralGroup6: TdxLayoutGroup;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    edtCustomsCode: TcxDBMaskEdit;
    lcGeneralItem12: TdxLayoutItem;
    edtRegDate: TcxDBDateEdit;
    lcGeneralItem14: TdxLayoutItem;
    edtDeclNo: TcxDBMaskEdit;
    lcGeneralItem15: TdxLayoutItem;
    lcGeneralGroup8: TdxLayoutGroup;
    lcGeneralItem16: TdxLayoutItem;
    edtDeclINN: TcxDBMaskEdit;
    lcGeneralItem1: TdxLayoutItem;
    DeclKPP: TcxDBMaskEdit;
    QueryList1: TQueryList;
    sqlCheckINN: TsqlOp;
    edtGD1: TcxDBDateEdit;
    lcGeneralItem7: TdxLayoutItem;
    dsDataGD1: TDateTimeField;
    dxBarButton1: TdxBarButton;
    lcGeneralGroup7: TdxLayoutGroup;
    tabRepayment: TcxTabSheet;
    dsDataAS_BIG_PAYER: TFloatField;
    dsDataG0131: TFloatField;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    lcGeneralItem17: TdxLayoutItem;
    edtGTDName: TcxDBMaskEdit;
    lcGeneralItem18: TdxLayoutItem;
    actAddOldPayment: TAction;
    btnOTM: TdxBarButton;
    actOTM: TAction;
    cmbxDecision: TfdcObjectLookupEdit;
    lcGeneralItem19: TdxLayoutItem;
    tabOPRP: TcxTabSheet;
    tabCharge: TcxTabSheet;
    tabPaymentDoc: TcxTabSheet;
    tabIsch: TcxTabSheet;
    tabControlDoc: TcxTabSheet;
    pcControlDoc: TcxPageControl;
    barBtnKNP: TdxBarButton;
    sqlSetKNP: TsqlOp;
    actKNP: TAction;
    sqlRemoveKNP: TsqlOp;
    dsDataHAS_DED: TIntegerField;
    dsDataDECISION_CODE: TStringField;
    actPrint1: TAction;
    actPrint2: TAction;
    dxBarButton3: TdxBarButton;
    PrintPM: TdxBarPopupMenu;
    dxBarButton4: TdxBarButton;
    edtPredDecl: TcxDBTextEdit;
    lciTempGTDNo: TdxLayoutItem;
    dsDataPRED_DECL: TStringField;
    lcGeneralGroup10: TdxLayoutGroup;
    tabCorrect: TcxTabSheet;
    actCorrectSubject: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    btnCorrectSubject: TdxBarButton;
    actCorrectCCharge: TAction;
    dxBarButton5: TdxBarButton;
    dsDeduction: TOracleDataSet;
    sqlCheckExistsAdviceOrNotice: TsqlOp;
    dsDataAGGREMENT_ID: TFloatField;
    tabKTS: TcxTabSheet;
    pcKTS: TcxPageControl;
    tabKTSTov: TcxTabSheet;
    tabKTSPlt: TcxTabSheet;
    lcGeneralGroupBrocker: TdxLayoutGroup;
    editDeclBrINN: TcxDBMaskEdit;
    editDeclBrKpp: TcxDBMaskEdit;
    lcGeneralItemBrINN: TdxLayoutItem;
    lcGeneralItemBrKPP: TdxLayoutItem;
    editDeclBrSvNum: TcxDBTextEdit;
    editDeclBrSvDate: TcxDBDateEdit;
    lcGeneralItemBrSvNum: TdxLayoutItem;
    lcGeneralItemBrSvDate: TdxLayoutItem;
    lcGeneralItemBrDgNum: TdxLayoutItem;
    lcGeneralItemBrDgDate: TdxLayoutItem;
    editDeclBrDgNum: TcxDBTextEdit;
    editDeclBrDgDate: TcxDBDateEdit;
    lcGeneralGroup9: TdxLayoutGroup;
    lcGeneralGroup11: TdxLayoutGroup;
    lcGeneralGroup12: TdxLayoutGroup;
    lcGeneralGroup14: TdxLayoutGroup;
    dsDataBROKER_INN: TStringField;
    dsDataBROKER_KPP: TStringField;
    dsDataBROKER_SV_NUM: TStringField;
    dsDataBROKER_SV_DATE: TDateTimeField;
    dsDataBROKER_DG_NUM: TStringField;
    dsDataBROKER_DG_DATE: TDateTimeField;
    dsDataBROKER_NAME: TStringField;
    lcGeneralItemBrName: TdxLayoutItem;
    editDeclBrName: TfdcObjectLinkEdit;
    dsDataBROKER_ID: TFloatField;
    tabNoticeAdvice: TcxTabSheet;
    tabDeclTime: TcxTabSheet;
    tabDeclFull: TcxTabSheet;
    sqlSetBroker: TsqlOp;
    edtDecisionDate: TcxDBDateEdit;
    lcGeneralItem20: TdxLayoutItem;
    dsDataDECISION_DATE: TDateTimeField;
    procedure actNewExecute(Sender: TObject);
    procedure edtDeclINNPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDBMaskEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actPrintUpdate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure edtDeclNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure tabRepaymentShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataNAMEValidate(Sender: TField);
    procedure edtGTDNamePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tabObligationShow(Sender: TObject);
    procedure actAddOldPaymentExecute(Sender: TObject);
    procedure actOTMUpdate(Sender: TObject);
    procedure actOTMExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabOPRPShow(Sender: TObject);
    procedure tabChargeShow(Sender: TObject);
    procedure tabIschShow(Sender: TObject);
    procedure tabPaymentDocShow(Sender: TObject);
    procedure tabControlDocShow(Sender: TObject);
    procedure actKNPExecute(Sender: TObject);
    procedure actKNPUpdate(Sender: TObject);
    procedure actPrint2Execute(Sender: TObject);
    procedure actPrint1Execute(Sender: TObject);
    procedure tabCorrectShow(Sender: TObject);
    procedure actCorrectSubjectExecute(Sender: TObject);
    procedure actCorrectCChargeExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCorrectCChargeUpdate(Sender: TObject);
    procedure tabKTSTovShow(Sender: TObject);
    procedure tabKTSPltShow(Sender: TObject);
    procedure tabKTSShow(Sender: TObject);
    procedure tabNoticeAdviceShow(Sender: TObject);
    procedure tabDeclTimeShow(Sender: TObject);
    procedure tabDeclFullShow(Sender: TObject);
    procedure editDeclBrNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure cmbxDecisionEditing(Sender: TObject; var CanEdit: Boolean);
  private
    FOldDate: TDateTime;
    procedure OnSearchFinished(
      AGridTableView: TcxGridTableView; AIndex, ACount: integer;
      var ADescr: string; var ABreak: boolean);
  protected
    FRepaymentForm        : TForm;
    FControlPaymentForm   : TForm;
    FControlIschForm      : TForm;
    FControlChargeForm    : TForm;
    FControlRepaymentForm : TForm;
    FCorrectionGridForm   : TForm;
    FControlKTSTovForm    : TForm;
    FControlKTSPltForm    : TForm;
    FNoticeAdviceForm     : TForm;
    FDeclFullGridForm     : TForm;
    FDeclTimeGridForm     : TForm;
  public
  end;

var
  CustomDeclForm: TCustomDeclForm;

implementation

uses MainDm, DictDm, fdcCustomObjectFrm, fdcCustomDataFrm, CheckUtils,
  fdcCustomCardFrm, AddLChargeFrm, DateUtils, uDOAPrintDoc, fdcMessages,
  fdcUtils, Math, fdcCustomGridFrm, JvDSADialogs, ObjectGridFrm, CorrectionGTDSubjectFrm, CorrectionGTDCChargeFrm,
  fdcCustomDBDataFrm;

{$R *.dfm}

procedure TCustomDeclForm.actNewExecute(Sender: TObject);
begin
  ObjectServices.CreateObject(EditObject.TypeSysName, False, Params);
end;

procedure TCustomDeclForm.edtDeclINNPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S: string;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
      CheckINN(S);
    sqlCheckINN.Exec('INN_;KPP', [S, dsDataDECL_KPP.Value]);
  except
    on E: Exception do
    begin
      Error := True;
      ErrorText := E.Message;
    end;
  end;
end;

procedure TCustomDeclForm.cxDBMaskEdit1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S: string;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
      CheckKPP(S);
    sqlCheckINN.Exec('INN_;KPP', [dsDataDECL_INN.Value, S]);
  except
    on E: Exception do
    begin
      Error := True;
      ErrorText := E.Message;
    end;
  end;
end;

procedure TCustomDeclForm.actPrintUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := TAction(Sender).Visible and (not IsNew);
end;

//function ext_print_gtd(AApplicationHandle: THandle; ADOASession: TOracleSession; AScriptPath, AG071, AG072, AG073: PChar): integer; stdcall; external 'lgtdviewer.dll ' name 'ext_print_gtd';
//type TExt_print_gtd=procedure(AApplicationHandle: THandle; ADOASession: TOracleSession; AScriptPath, AG071, AG072, AG073: PChar);StdCall;

procedure TCustomDeclForm.actPrintExecute(Sender: TObject);
{
var
  FLibHandle: Cardinal;
  FExt_print_gtd: TExt_print_gtd;
  OracleError: EOracleError;
{}
begin
  inherited;
  exp_PrintGTD(ExtractFilePath(Application.ExeName) + 'gtdview\CBD2006DOA.esr',
    dsDataName.AsString,
    MainData.Session,
    False);

  {
    inherited;
    OracleError := nil;
    FLibHandle:=LoadLibrary('lgtdviewer.dll');
    try
      if FLibHandle=0 then
        raise Exception.Create('Невозможно загрузить lgtdviewer.dll!');
      @FExt_print_gtd:=GetProcAddress(FLibHandle,'ext_print_gtd');
      if @FExt_print_gtd=nil then RaiseLastWin32Error;
     try
      FExt_print_gtd(Application.Handle, dsData.Session,
     PChar(ExtractFilePath(Application.ExeName) + 'gtdview\GTDViewer.esr'),
     PChar(dsDataCUSTOMS_CODE.Value),
     PChar(FormatDateTime('dd.mm.yyyy', dsDataREG_DATE.Value)),
     PChar(dsDataDECL_NO.Value));
     except
      begin
       OracleError := EOracleError.CreateFmt('ORA-00942', []);
  //     OracleError.ErrorCode := 942;
      end;
     end;
    finally
      FreeLibrary(FLibHandle);
    end;
    if OracleError <> nil then raise OracleError;
  {}
end;

procedure TCustomDeclForm.edtDeclNameBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
  begin
    dsDataDECL_INN.Clear;
    dsDataDECL_KPP.Clear;
  end
  else
  begin
    dsData['DECL_INN'] := AObject.FieldValues['INN'];
    dsData['DECL_KPP'] := AObject.FieldValues['KPP'];
  end;
end;

procedure TCustomDeclForm.tabRepaymentShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FRepaymentForm) then
  begin
    FRepaymentForm := ObjectServices.ShowForm('TRepaymentGridForm', Params,
      TWinControl(Sender));
    TObjectForm(FRepaymentForm).RegisterWaiter(Self);
  end;
end;

procedure TCustomDeclForm.FormShow(Sender: TObject);
begin
  inherited;
  if dsDataAS_BIG_PAYER.Value = 1 then
  begin
    tabRepayment.TabVisible := False;
    tabPayment.TabVisible := False;
  end;
end;

procedure TCustomDeclForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if dsDataAS_BIG_PAYER.Value = 1 then
  begin
    tabRepayment.TabVisible := False;
    tabPayment.TabVisible := False;
  end;
  dsDataSUBJECT_ID.ReadOnly := not isNew;

  edtGD1.Visible := false;
  lcGeneralItem7.Visible := false;
end;

procedure TCustomDeclForm.dsDataNAMEValidate(Sender: TField);
var
  S: string;
  FS: TFormatSettings;
begin
  inherited;
  FS.TwoDigitYearCenturyWindow := TwoDigitYearCenturyWindow;
  FS.ShortDateFormat := 'dd.MM.yy';
  FS.DateSeparator := '.';

  S := Trim(dsDataName.Value);
  if S = '' then
  begin
    dsDataCUSTOMS_CODE.Clear;
    dsDataREG_DATE.Clear;
    dsDataDECL_NO.Clear;
  end
  else
  begin
    dsDataCUSTOMS_CODE.Value := Copy(S, 1, 8);
    dsDataREG_DATE.Value := StrToDate(Format('%s.%s.%s',
      [Copy(S, 10, 2), Copy(S, 12, 2), Copy(S, 14, 2)]), FS);
    dsDataDECL_NO.Value := Copy(S, 17, MaxInt);
  end;
end;

procedure TCustomDeclForm.edtGTDNamePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if Error then
    ErrorText :=
      'Неверный номер ДТ. Правильный номер ДТ должен состоять из 21 символа';
end;

procedure TCustomDeclForm.tabObligationShow(Sender: TObject);
begin
  if not Assigned(FChargeForm) then
  begin
    FChargeForm := Self.ObjectServices.ShowForm('TCDeclChargeGridForm', Params,
      TWinControl(Sender));
    TObjectForm(FChargeForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FChargeForm));
  end;

end;

procedure TCustomDeclForm.actAddOldPaymentExecute(Sender: TObject);
var
  F: TAddLChargeForm;
begin
  inherited;
  if IsNew or (dsDataREG_DATE.Value >= FOldDate) then
    raise
      Exception.Create('Добавление "старого списания" для этой ДТ невозможно');

  F := TAddLChargeForm.Create(nil);
  try
    F.dsData.Insert;
    F.dsDataDECL_ID.Value := dsDataID.Value;
    if F.ShowModal = mrOk then
      RefreshWaiters;
  finally
    F.Free;
  end;
end;

procedure TCustomDeclForm.actOTMUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not IsNew;
  btnOTM.Lowered := (Pos('decl.otm', dsDataOBJECTKINDLIST.Value) > 0);
end;

procedure TCustomDeclForm.actOTMExecute(Sender: TObject);
begin
  inherited;
  if not btnOTM.Lowered then
  begin
    if ConfirmDlg(SOTMMessage, SOTMHint) = mrYes then
    begin
      MainData.SetObjectKind(dsDataID.Value, 'decl.otm');
      RefreshData;
      btnOTM.Lowered := True;
    end;
  end;
end;

procedure TCustomDeclForm.FormCreate(Sender: TObject);
var i : integer;
begin
  inherited;
  FOldDate := MainData.GetSystemValue('MOVING_DATE', rvFloat, 0);
  FCorrectionGridForm := nil;
  for i:= 0 to btnStateTransit.ItemLinks.Count - 1 do
    if (btnStateTransit.ItemLinks[i].Item.Caption = 'Без состояния -> Оформляется') or
       (btnStateTransit.ItemLinks[i].Item.Caption = 'Без состояния -> Оформлена') or
       (btnStateTransit.ItemLinks[i].Item.Caption = 'Без состояния -> Выпущена') or
       (btnStateTransit.ItemLinks[i].Item.Caption = 'Оформляется -> Оформлена') or
       (btnStateTransit.ItemLinks[i].Item.Caption = 'Выпущена -> Отозвана')
       then
      begin
        btnStateTransit.ItemLinks[i].Item.Enabled := False;
        Break;
      end;
  FNoticeAdviceForm := nil;
  FDeclFullGridForm := nil;
  FDeclTimeGridForm := nil;
end;

procedure TCustomDeclForm.tabPaymentDocShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FControlPaymentForm) then
  begin
    FControlPaymentForm := ObjectServices.ShowForm('TControlPaymentGridForm',
      Params, TWinControl(Sender));
    TObjectForm(FControlPaymentForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FControlPaymentForm));
  end;
end;

procedure TCustomDeclForm.tabOPRPShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FControlRepaymentForm) then
  begin
    FControlRepaymentForm :=
      Self.ObjectServices.ShowForm('TControlRepaymentGridForm', Params,
      TWinControl(Sender));
    TObjectForm(FControlRepaymentForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FControlRepaymentForm));
  end;
end;

procedure TCustomDeclForm.tabIschShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FControlIschForm) then
  begin
    FControlIschForm := ObjectServices.ShowForm('TControlIschGridForm', Params,
      TWinControl(Sender));
    TObjectForm(FControlIschForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FControlIschForm));
  end;
end;

procedure TCustomDeclForm.tabChargeShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FControlChargeForm) then
  begin
    FControlChargeForm := ObjectServices.ShowForm('TControlChargeGridForm',
      Params, TWinControl(Sender));
    TObjectForm(FControlChargeForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FControlChargeForm));
  end;
end;

procedure TCustomDeclForm.tabControlDocShow(Sender: TObject);
var
  ActivePage: TcxTabSheet;
begin
  inherited;
  { force to show active page }
  ActivePage := pcControlDoc.ActivePage;
  pcControlDoc.ActivePage := nil;
  pcControlDoc.ActivePage := ActivePage;
end;

procedure TCustomDeclForm.actKNPExecute(Sender: TObject);
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

      tabErrors.TabVisible := dsDataERR_COUNT.Value > 0;

      F.Free;
    end
  else if MessageDlg('Отвязать распоряжение КНП?',mtConfirmation,[mbOk,mbCancel],0)=mrOk then
    begin
      sqlRemoveKNP.Exec('ID',[dsDataID.Value]);
      QueryList1.Session.Commit;

      RefreshData;
      RefreshWaiters;

      tabErrors.TabVisible := dsDataERR_COUNT.Value > 0;
    end;
end;

procedure TCustomDeclForm.actKNPUpdate(Sender: TObject);
begin
  inherited;
  if dsDataSUBJECT_ID.Value=0 then
    TAction(Sender).Enabled:= False
    else
    TAction(Sender).Enabled:= True;

  if dsDataAS_BIG_PAYER.Value = 1 then
    TAction(Sender).Checked := True
  else
    TAction(Sender).Checked := False;

  barBtnKNP.Down := TAction(Sender).Checked;
end;

procedure TCustomDeclForm.OnSearchFinished(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  LicId: double;
begin
  LicId := AGridTableView.Controller.FocusedRecord.Values[0];
  sqlSetKNP.Exec('ID;LIC_ID',[dsDataID.Value,LicId]);
  QueryList1.Session.Commit;
end;

procedure TCustomDeclForm.actPrint2Execute(Sender: TObject);
begin
  inherited;
  exp_PrintGTD(ExtractFilePath(Application.ExeName) + 'gtdview\GTDR2007.esr',
    dsDataName.AsString,
    MainData.Session,
    False);
end;

procedure TCustomDeclForm.actPrint1Execute(Sender: TObject);
begin
  inherited;
  exp_PrintGTD(ExtractFilePath(Application.ExeName) + 'gtdview\GTDO2007.esr',
    dsDataName.AsString,
    MainData.Session,
    False);
end;

procedure TCustomDeclForm.tabCorrectShow(Sender: TObject);
begin
  if not Assigned(FCorrectionGridForm) then
  begin
    Params.ParamValues['pDocID'] := Self.dsDataID.Value;
    FCorrectionGridForm := ObjectServices.ShowForm('TCorrectionCDGridForm', Params, TWinControl(Sender));
    Self.RegisterWaiter(TObjectGridForm(FCorrectionGridForm));
  end;
end;

procedure TCustomDeclForm.actCorrectSubjectExecute(Sender: TObject);
begin
  dsDeduction.SetVariable('ID', dsDataId.Value);
  try
    dsDeduction.Open;
    if (dsDeduction.FieldByName('Cnt').Value > 0) then
      raise exception.Create('Нельзя изменить декларанта пока по ДТ есть оплата!');
  finally
    dsDeduction.Close;
  end;

  if sqlCheckExistsAdviceOrNotice.Exec = 1 then
    raise exception.Create('Нельзя изменить декларанта пока по ДТ есть уведомление об излишней уплате или тех. документ учета задолженности!');

  with ObjectServices.CreateObject( 'CorrectionGTDSubject', False, nil ) as TCorrectionGTDSubjectForm do
    begin
      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
    end;
  RefreshData;
end;

procedure TCustomDeclForm.actCorrectCChargeExecute(Sender: TObject);
begin
  dsDeduction.SetVariable('ID', dsDataId.Value);
  try
    dsDeduction.Open;
    if (dsDeduction.FieldByName('Cnt').Value = 0) then
      raise exception.Create('По ДТ нет списаний!');
  finally
    dsDeduction.Close;
  end;
  with ObjectServices.CreateObject( 'CorrectionGTDCCharge', False, nil ) as TCorrectionGTDCChargeForm do
    begin
      dsData.FieldByName( 'Doc_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
      dsData.FieldByName( 'DOC_SOURCE_NAME' ).AsString := Self.dsData.FieldByName( 'NAME' ).AsString;
    end;
  RefreshData;
end;

procedure TCustomDeclForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  // Для предотвращения изменения статусов изменненого и не сохранненого объекта
  btnStateTransit.Enabled := not dsData.ReadOnly and not actSave.Enabled;
end;

procedure TCustomDeclForm.actSaveExecute(Sender: TObject);
var
  st: string;
begin
  if  ((btnStateTransit.Caption = 'Оформлена')
   or (btnStateTransit.Caption = 'Выпущена'))
   and (dsDataDECISION_CODE.AsString = '81') or (dsDataDECISION_CODE.AsString = '82')  or (dsDataDECISION_CODE.AsString = '90')  or (dsDataDECISION_CODE.AsString = '99')
   then
     if ConfirmDlg('Перевести ДТ в статус "Отозвана"?','Будет сформировано уведомление об излишней уплате') <> mrYes then
       exit;

  inherited;
end;

procedure TCustomDeclForm.actCorrectCChargeUpdate(Sender: TObject);
begin
  inherited;
     actCorrectCCharge.Enabled := not (dsDataAS_BIG_PAYER.Value = 1);
end;

procedure TCustomDeclForm.tabKTSTovShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FControlKTSTovForm) then
  begin
    FControlKTSTovForm := ObjectServices.ShowForm('TControlKTSTovGridForm', Params,
      TWinControl(Sender));
    TObjectForm(FControlKTSTovForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FControlKTSTovForm));
  end;
end;

procedure TCustomDeclForm.tabKTSPltShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FControlKTSPltForm) then
  begin
    FControlKTSPltForm := ObjectServices.ShowForm('TControlKTSPltGridForm', Params,
      TWinControl(Sender));
    TObjectForm(FControlKTSPltForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FControlKTSPltForm));
  end;
end;

procedure TCustomDeclForm.tabKTSShow(Sender: TObject);
var
  ActivePage: TcxTabSheet;
begin
  inherited;
  ActivePage := pcKTS.ActivePage;
  pcKTS.ActivePage := nil;
  pcKTS.ActivePage := ActivePage;
end;

procedure TCustomDeclForm.tabNoticeAdviceShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FNoticeAdviceForm) then
  begin
    FNoticeAdviceForm := ObjectServices.ShowForm('TDeclNoticeAdviceGridForm', Params, TWinControl(Sender));
    FNoticeAdviceForm.Realign;
    TObjectForm(FNoticeAdviceForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FNoticeAdviceForm));
  end;
end;

procedure TCustomDeclForm.tabDeclTimeShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FDeclTimeGridForm) then
  begin
    FDeclTimeGridForm := ObjectServices.ShowForm('TCustomDeclBDTByFullGridForm', Params, TWinControl(Sender));
    FDeclTimeGridForm.Realign;
    TObjectForm(FDeclTimeGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FDeclTimeGridForm));
  end;
end;

procedure TCustomDeclForm.tabDeclFullShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FDeclFullGridForm) then
  begin
    FDeclFullGridForm := ObjectServices.ShowForm('TCustomDeclFullByBDTGridForm', Params, TWinControl(Sender));
    FDeclFullGridForm.Realign;
    TObjectForm(FDeclFullGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FDeclFullGridForm));
  end;
end;

procedure TCustomDeclForm.editDeclBrNameBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  try
    if AObject = nil then
      begin
        sqlSetBroker.Exec('DeclId;BrokerId',[dsDataID.AsFloat,NULL]);
      end
    else
      begin
        sqlSetBroker.Exec('DeclId;BrokerId',[dsDataID.AsFloat,AObject.ID]);
      end;
  except
    on e:Exception do
      begin
        Accept := false;
        fdcMessages.MessageDlg('Информационное сообщение:','Установка представителя декларанта невозможна!','Установка представителя декларанта невозможна: '+e.message,mtWarning,[mbOk],0);
      end;
  end;
  actRefresh.Execute;
end;

procedure TCustomDeclForm.cmbxDecisionEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  inherited;
  dsData.FieldByName('DECISION_DATE').AsDateTime := DateOf(now);
end;

initialization
  RegisterClass(TCustomDeclForm);

end.

