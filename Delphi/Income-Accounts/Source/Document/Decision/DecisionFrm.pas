unit DecisionFrm;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Types, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxButtonEdit, fdcObjectLinkEdit,
  cxCurrencyEdit, OracleData, fdcObjectCore, fdcWord, SubjIntf, QueryList;

type
    TDecisionForm = class(TDocumentForm, ISubjectHolder, IDocumentHolder)
    dsDataREASON_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataAPP_NUMBER: TStringField;
    dsDataAPP_DATE: TDateTimeField;
    dsDataAPP_DATE_INCOME: TDateTimeField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGNED_BY_CHIEF_UDF: TStringField;
    lcgDeclarant: TdxLayoutGroup;
    edtDeclINN: TcxDBMaskEdit;
    lciDeclINN: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lciDeclKPP: TdxLayoutItem;
    edtDeclName: TfdcObjectLinkEdit;
    lciDeclName: TdxLayoutItem;
    lcgDeclarantINNKPP: TdxLayoutGroup;
    lcgApp: TdxLayoutGroup;
    edtAppDate: TcxDBDateEdit;
    lciAppDate: TdxLayoutItem;
    edtAppDateIncome: TcxDBDateEdit;
    lciAppDateIncome: TdxLayoutItem;
    edtAppNumber: TcxDBTextEdit;
    lciAppNumber: TdxLayoutItem;
    lcgAppDate: TdxLayoutGroup;
    lcgSign: TdxLayoutGroup;
    edtSignBy: TcxDBTextEdit;
    lciSignBy: TdxLayoutItem;
    edtSignDate: TcxDBDateEdit;
    lciSignDate: TdxLayoutItem;
    odsGetBoss: TOracleDataSet;
    odsGetBossID: TFloatField;
    odsGetBossNAME: TStringField;
    dsGetBoss: TDataSource;
    lciSignByChief: TdxLayoutItem;
    edtSignByChief: TcxDBLookupComboBox;
    lciSignByChiefUDF: TdxLayoutItem;
    edtSignByChiefUDS: TcxDBLookupComboBox;
    lciReason: TdxLayoutItem;
    cmbxReason: TfdcObjectLookupEdit;
    dsDataREASON_NAME: TStringField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataPERSONAL_ACCOUNT_ID: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataDOC_CODE: TStringField;
    dsDataDOC_OSN_CODE: TStringField;
    dsDataSUD_REASON_ID: TFloatField;
    dsDataDEBTS_SUMMA: TFloatField;
    dsDataDOC_NUMBER_FULL: TStringField;
    edtDocNumberFull: TcxDBTextEdit;
    lciDOC_NUMBER_FULL: TdxLayoutItem;
    edtCustomsCode: TcxDBTextEdit;
    lciDecisionCustomsCode: TdxLayoutItem;
    edtDocCode: TcxDBTextEdit;
    lciDecisionDocCode: TdxLayoutItem;
    edtDocOsnCode: TcxDBComboBox;
    lciDecisionDocOsnCode: TdxLayoutItem;
    dsDataAPP_NUMBER_INCOME: TStringField;
    edtAppNumberIncome: TcxDBTextEdit;
    lciAppNumberIncome: TdxLayoutItem;
    lcgAppNumber: TdxLayoutGroup;
    lcgReason: TdxLayoutGroup;
    edtSudReason: TcxDBLookupComboBox;
    lciSudReason: TdxLayoutItem;
    edtDebtsSumma: TcxDBCurrencyEdit;
    lciDebtsSumma: TdxLayoutItem;
    tabPaymentOrders: TcxTabSheet;
    tabDocObligations: TcxTabSheet;
    srcAssetsReason: TDataSource;
    dsAssetsReason: TOracleDataSet;
    qryGetNameTO: TfdcQuery;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    lcgDepts: TdxLayoutGroup;
    lciDeptsPay: TdxLayoutItem;
    edtDebtsPaySumma: TcxDBCurrencyEdit;
    lciDeptsProc: TdxLayoutItem;
    edtDebtsProcSumma: TcxDBCurrencyEdit;
    lcgGroupDeptsSumma: TdxLayoutGroup;
    lciDeptsPeny: TdxLayoutItem;
    edtDebtsPenySumma: TcxDBCurrencyEdit;
    dsDataDEBT_PAY_SUMMA: TFloatField;
    dsDataDEBT_PENY_SUMMA: TFloatField;
    dsDataDEBT_PROC_SUMMA: TFloatField;
    btGetDebts: TdxBarButton;
    actGetDebts: TAction;
    qlDecision: TQueryList;
    sqlGetDebts: TsqlOp;
    dsDataDEBTS_SUMMA_S: TFloatField;
    lciDebtsSummaS: TdxLayoutItem;
    edtDebtsSummaS: TcxDBCurrencyEdit;
    srcDebtSum: TDataSource;
    dsDebtSum: TOracleDataSet;
    procedure actSaveUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure edtDeclNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tabPaymentOrdersShow(Sender: TObject);
    procedure tabDocObligationsShow(Sender: TObject);
    procedure dsDataDOC_CODEChange(Sender: TField);
    procedure dsDataDOC_DATEChange(Sender: TField);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure actGetDebtsExecute(Sender: TObject);
    procedure actGetDebtsUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure checkStringFields ;
  protected
    fPaymentOrdersForm  : TForm;
    fDocObligationsForm : TForm;
    function GetPaymentOrdersFormType : string; virtual;
    function GetDocObligationsFormType : string; virtual;
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
    procedure RefreshAssetsReason;
    function CaptionAndAsterix(const aCaption: string; aRequired: boolean ): string;    
  public
    function GetSubjectINN: String;
    function GetSubjectId: Double;
    function GetSubjectKPP: String;
    function GetSubjectName: String;
    function GetDocumentDate: TDateTime;
    procedure GetDebts();
  end;

var
  DecisionForm: TDecisionForm;

implementation

{$R *.dfm}

uses
  FormUtils
 ,MainDM
 ,DictDM
 ,ObjectFrm, fdcUtils
 ,fdcCustomDBDataFrm, fdcMessages;


function TDecisionForm.CaptionAndAsterix(const aCaption: string; aRequired: boolean ): string;
begin
 result := aCaption;
 if aRequired and (pos( '*', aCaption ) <= 0) then
   result := aCaption + ' *' ;

 if (not aRequired) and (pos( '*', aCaption ) > 0) then
   result := Trim( StringReplace( aCaption, '*', '', [rfReplaceAll	] ) );
end;

procedure TDecisionForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  // ��� �������������� ��������� �������� ����������� � �� ������������ �������
  btnStateTransit.Enabled := not dsData.ReadOnly and not actSave.Enabled;
end;

procedure TDecisionForm.dsDataAfterOpen(DataSet: TDataSet);

  procedure UpdateGroupItems(AGroup: TdxLayoutGroup);
    var
      I : Integer;
  begin
    for I := 0 to AGroup.Count - 1 do
      if AGroup.Items[I] is TdxLayoutGroup then
        UpdateGroupItems(TdxLayoutGroup(AGroup.Items[I]))
      else
        if     AGroup.Items[I].Visible
           and ( AGroup.Items[I] <> lciSignBy )
           and ( AGroup.Items[I] <> lciSignDate )
           and ( AGroup.Items[I] <> lciSignByChief )
           and ( AGroup.Items[I] <> lciSignByChiefUDF ) then
          ( AGroup.Items[I] as TdxLayoutItem).Tag := 33;
  end;

begin
  inherited;

//  DecisionSumma := DataSet.FieldByName('SUMMA').AsFloat;
  
  if     not Self.IsNew
     and not DataSet.IsEmpty
     and Assigned( DataSet.FindField('SIGNED_BY') )
     and DataSet.FieldByName('SIGNED_BY').IsNull then
    begin
      DataSet.Edit;
      DataSet.FieldByName('SIGNED_BY').AsString := MainData.GetCurrentUserName;
      Modify(nil);
    end;


  if  odsGetBoss.Active then
      odsGetBoss.Close;

  odsGetBoss.SetVariable('pName',dsData.FieldValues['SIGNED_BY_CHIEF']);
  odsGetBoss.SetVariable('pNameUDS',dsData.FieldValues['SIGNED_BY_CHIEF_UDF']);

  // odsGetBoss.SetVariable('SUSER',DataSet.FieldByName('SIGNED_BY').AsString);
  odsGetBoss.SetVariable('NCUSTOMID', MainData.GetUserCustomsID);

  try
  odsGetBoss.Open;
  except on e: Exception do
   ShowMessage('Error: '+ e.Message);
  end;
  dsData.ReadOnly := False;

  if not DictData.dsSudReason.Active then
    DictData.dsSudReason.Open;

  RefreshAssetsReason;

  // ��������� �������������� �� �� ���� ������
  if     not Self.IsNew
     and not DataSet.IsEmpty
     and ( dsData.FieldByName( 'EXT_SOURCE' ).AsString <> MainData.GetCustomsCode ) then
    UpdateGroupItems( lcGeneral.Items );

  if (    (dsData.FieldByName( 'EXT_SOURCE' ).AsString = MainData.GetCustomsCode)
      and (    dsData.FieldByName( 'SIGNED_BY_CHIEF_UDF' ).IsNull
            or dsData.FieldByName( 'SIGNED_BY_CHIEF' ).IsNull
            or dsData.FieldByName( 'SIGNED_BY' ).IsNull
            or dsData.FieldByName( 'SIGN_DATE' ).IsNull))
      or
      (   dsData.FieldByName( 'EXT_SOURCE' ).AsString <> MainData.GetCustomsCode)
  then
    begin
     if dsData.FieldByName( 'EXT_SOURCE' ).AsString = MainData.GetCustomsCode then
        lciDebtsSumma.Tag:= 11;
     lciDeptsPay.Tag  := 11;
     lciDeptsProc.Tag := 11;
     lciDeptsPeny.Tag := 11;
    end
  else
    begin
     lciDebtsSumma.Tag:= 33;
     lciDeptsPay.Tag  := 33;
     lciDeptsProc.Tag := 33;
     lciDeptsPeny.Tag := 33;
    end;

  UpdateLayoutControl(IsNew, lcGeneral);
end;

function TDecisionForm.GetDocumentDate: TDateTime;
begin
  Result := dsDataDOC_DATE.Value;
end;

function TDecisionForm.GetSubjectId: Double;
begin
  Result := dsDataSUBJECT_ID.Value;
end;

function TDecisionForm.GetSubjectINN: String;
begin
  Result := dsDataDECL_INN.Value;
end;

function TDecisionForm.GetSubjectKPP: String;
begin
  Result := dsDataDECL_KPP.Value;
end;

function TDecisionForm.GetSubjectName: String;
begin
  Result := dsDataDECL_NAME.Value;
end;

procedure TDecisionForm.edtDeclNameBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  Try
    dsData['DECL_INN'] := AObject.FieldValues['INN'];
    dsData['DECL_KPP'] := AObject.FieldValues['KPP'];
  except
  end;
end;

function TDecisionForm.GetPaymentOrdersFormType: string;
begin

end;

function TDecisionForm.GetDocObligationsFormType: string;
begin

end;

procedure TDecisionForm.FormCreate(Sender: TObject);
begin
  inherited;

  fPaymentOrdersForm  := nil;
  fDocObligationsForm := nil;

  edtDebtsPaySumma.Properties.MinValue := 0;
  edtDebtsPenySumma.Properties.MinValue := 0;
  edtDebtsProcSumma.Properties.MinValue := 0;
  
end;

procedure TDecisionForm.tabPaymentOrdersShow(Sender: TObject);
begin
  if not Assigned( fPaymentOrdersForm ) then
    begin
      fPaymentOrdersForm := ShowForm( GetPaymentOrdersFormType, Params, tabPaymentOrders );
      TObjectForm(fPaymentOrdersForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(fPaymentOrdersForm));
    end;
end;

procedure TDecisionForm.tabDocObligationsShow(Sender: TObject);
begin
  if not Assigned( fDocObligationsForm ) then
    begin
      fDocObligationsForm := ShowForm( GetDocObligationsFormType, Params, tabDocObligations );
      TObjectForm(fDocObligationsForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(fDocObligationsForm));
    end;
end;

function TDecisionForm.GetTemplateReportName: string;
begin
  Result := '������� ' + dsData.FieldByName( 'doc_code' ).AsString + '.doc';
end;

procedure TDecisionForm.FillReportParams(AWord: TWordClass);
begin
  if not qryGetNameTO.Active then
    begin
      qryGetNameTO.ParamByName( 'customs_code' ).AsString := dsData.FieldByName( 'EXT_SOURCE' ).AsString;
      qryGetNameTO.Open;
    end;
  AWord.ReplaceRecFromQuery( qryGetNameTO );

  inherited;

  if qryGetNameTO.Active then
    qryGetNameTO.Close;
end;

procedure TDecisionForm.dsDataDOC_CODEChange(Sender: TField);
begin
  inherited;

  RefreshAssetsReason;
end;

procedure TDecisionForm.RefreshAssetsReason;
begin
  dsAssetsReason.SetVariable( 'doc_date', dsData.FieldByName( 'doc_date' ).Value );
  dsAssetsReason.SetVariable( 'doc_code', dsData.FieldByName( 'doc_code' ).Value );
  if dsAssetsReason.Active then
    dsAssetsReason.Refresh
  else
    dsAssetsReason.Open;
end;

procedure TDecisionForm.dsDataDOC_DATEChange(Sender: TField);
begin
  inherited;

  RefreshAssetsReason;
end;

procedure TDecisionForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if     Assigned( DataSet.FindField('SIGNED_BY') )
     and DataSet.FieldByName('SIGNED_BY').IsNull then
    DataSet.FieldByName('SIGNED_BY').AsString := MainData.GetCurrentUserName;
end;

procedure TDecisionForm.actGetDebtsExecute(Sender: TObject);
begin
  inherited;
   try
    sqlGetDebts.ParamValues['result']     := 0.0;
  	sqlGetDebts.ParamValues['pdocid']     := dsDataID.Value;
    sqlGetDebts.Exec;

    sqlGetDebts.QueryList.Session.Commit;
   except
      sqlGetDebts.QueryList.Session.Rollback;
      raise;
   end;
end;

procedure TDecisionForm.actGetDebtsUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled :=  (
                                   (   dsData.FieldByName('SIGN_DATE').IsNull
                                    or dsData.FieldByName('SIGNED_BY_CHIEF_UDF').IsNull
                                    or dsData.FieldByName('SIGNED_BY_CHIEF').IsNull
                                    or dsData.FieldByName('SIGNED_BY').IsNull
                                    )
                                    and ( dsData.FieldByName( 'EXT_SOURCE' ).AsString = MainData.GetCustomsCode )
                                  )
                                  or
                                  (    (dsData.FieldByName( 'EXT_SOURCE' ).AsString <> MainData.GetCustomsCode)
                                   and (MainData.GetCustomsLevel < 2)
                                   );

end;

procedure TDecisionForm.FormShow(Sender: TObject);
begin
  inherited;
  lciDebtsSummaS.Visible := not IsNew and not (dsData.FieldByName( 'EXT_SOURCE' ).AsString = MainData.GetCustomsCode);

  // ����------------------------------------------------
  if IsNew then
  begin
   edtDocNumberFull.Text := MainData.GetUserCustomsCode;
   edtCustomsCode.Text := MainData.GetUserCustomsCode;
   edtDocNumberFull.Properties.ReadOnly := True;
   edtCustomsCode.Properties.ReadOnly := True;
  end;
  //-----------------------------------------------------
  edtDebtsPaySumma.Properties.ReadOnly := True;
  edtDebtsProcSumma.Properties.ReadOnly := True;
  edtDebtsPenySumma.Properties.ReadOnly := True;
  edtDebtsSumma.Properties.ReadOnly := True;
  edtDebtsSummaS.Properties.ReadOnly := True;
end;

procedure TDecisionForm.dsDataBeforePost(DataSet: TDataSet);
begin
 if edtDocDate.Enabled and (GreaterThanValue = compareDate( edtDocDate.Date, Now ))
    and ( mrYes <> fdcMessages.MessageDlg( '���� ��������� �� ����� ���� ������ �������!',
                     '���������� ��������� �������',
                     '���������� ���������� ���� ��������� ������ ���� ������ ������� ����!',
                     mtConfirmation, [mbOk], 0 )  )
 then begin
   edtDocDate.SetFocus;
   abort;
 end;
 inherited;
 checkStringFields;
end;

// ������� �.�. 04.02.2015
procedure TDecisionForm.GetDebts;
begin
  // ��������� ���� ����
  dsDebtSum.SetVariable('DECL_INN', dsDataDECL_INN.Value);
  dsDebtSum.SetVariable('DECL_KPP', dsDataDECL_KPP.Value);  
  dsDebtSum.Open;
  if not dsDebtSum.FieldByName('PAY_SUMMA').IsNull then
    dsDataDEBT_PAY_SUMMA.AsFloat := dsDebtSum.FieldByName('PAY_SUMMA').AsFloat;
  if not dsDebtSum.FieldByName('PROC_SUMMA').IsNull then
    dsDataDEBT_PROC_SUMMA.AsFloat := dsDebtSum.FieldByName('PROC_SUMMA').AsFloat;
  if not dsDebtSum.FieldByName('PENY_SUMMA').IsNull then
    dsDataDEBT_PENY_SUMMA.AsFloat := dsDebtSum.FieldByName('PENY_SUMMA').AsFloat;
  dsDebtSum.Close;
end;


procedure TDecisionForm.checkStringFields;
const
 cUserHint = '���������� ������ ������������ ��������!';
 cUserWarn =
 '��������! � ��������� ����� ������� ��������� ������������ �������!'#13#10+
 '�������� � ������ ������ �� ������� �� ������ ����� ������� ����� ���������� �� ������ ������������ ��������!';
var msgList: TStrings;
begin
 msgList:= nil;
 fdcUtils.checkIllegalChars( dsData, msgList );

 if assigned(msgList) and (msgList.Count > 0) then
   ShowMessage( cUserWarn, cUserHint, msgList.Text );

 if assigned(msgList) then
   freeAndNil(msgList);
end;

initialization
  RegisterClass( TDecisionForm );

end.
