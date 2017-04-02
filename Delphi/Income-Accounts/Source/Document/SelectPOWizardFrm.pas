unit SelectPOWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxImage, ExtCtrls,
  dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, dxmdaset, Menus,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, QueryList,
  fdcObjectCore, Oracle, cxDBEdit, OracleData, FDCCustomDataset, fdcQuery;

type
  TSelectPOWizardForm = class(TBaseWizardForm)
    dxLayoutControl2Item1: TdxLayoutItem;
    grdPO: TcxGrid;
    grdPODBTableView1: TcxGridDBTableView;
    grdPOLevel1: TcxGridLevel;
    dxLayoutControl2Item3: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutControl2Group1: TdxLayoutGroup;
    dxLayoutControl2Item4: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl2Group2: TdxLayoutGroup;
    actAdd: TAction;
    actDelete: TAction;
    dsPayments: TdxMemData;
    dsPaymentsID: TFloatField;
    dsPaymentsNAME: TStringField;
    dsPaymentsSUMMA: TFloatField;
    srcPayments: TDataSource;
    grdPODBTableView1NAME: TcxGridDBColumn;
    grdPODBTableView1SUMMA: TcxGridDBColumn;
    chbxDebt: TcxCheckBox;
    dxLayoutControl2Item5: TdxLayoutItem;
    dsPaymentsCURR_CODE: TStringField;
    dsPaymentsCURR_SUMMA: TCurrencyField;
    grdPODBTableView1CURR_SUMMA: TcxGridDBColumn;
    grdPODBTableView1CURR_CODE: TcxGridDBColumn;
    edtPayDate: TcxDateEdit;
    dxLayoutControl2Item6: TdxLayoutItem;
    QueryList: TQueryList;
    sqlAddPayment: TsqlOp;
    sqlRemovePayment: TsqlOp;
    dsPaymentsTRANS_KEY: TStringField;
    sqlFinish: TsqlOp;
    sqlSetDate: TsqlOp;
    sqlGetPOInfo: TsqlOp;
    lciEditCharge: TdxLayoutItem;
    btnEditCharge: TcxButton;
    actEdit: TAction;
    dsPaymentsRATE: TFloatField;
    dsPaymentsREST_SUMM: TCurrencyField;
    dsPaymentsCURR_ID: TFloatField;
    dsPaymentsPAYER_NAME: TStringField;
    dsPaymentsKBK_ID: TFloatField;
    sqlGetOstPOKbk: TsqlOp;
    tabDoc: TcxTabSheet;
    dxLayoutControl3: TdxLayoutControl;
    chBDocShow: TcxCheckBox;
    cxLabel6: TcxLabel;
    lcgDoc: TdxLayoutGroup;
    lciDocTypeNotice: TdxLayoutItem;
    dxLayoutControl3Item3: TdxLayoutItem;
    sqlAddDept: TsqlOp;
    dsetNotice: TOracleDataSet;
    dsNotice: TDataSource;
    sqlGetDeclID: TsqlOp;
    edtDocNumber: TcxTextEdit;
    dxLayoutControl3Item1: TdxLayoutItem;
    edtDocDate: TcxDateEdit;
    dxLayoutControl3Item4: TdxLayoutItem;
    sqlCreateInteractPayFines: TsqlOp;
    dxLayoutControl2Item7: TdxLayoutItem;
    cxLabel3: TcxLabel;
    dxLayoutControl2Group3: TdxLayoutGroup;
    sqlGetCodeKbk: TsqlOp;
    sqlPinaltyIs: TsqlOp;
    sqlKBK_IsTS: TsqlOp;
    sqlGetTypeSysName: TsqlOp;
    sqlAddError: TsqlOp;
    dsPaymentsTR_ID: TFloatField;
    sqlAddPaymentInList: TsqlOp;
    sqlParseTR: TsqlOp;
    sqlSignDecision: TsqlOp;
    sqlGetPaymentId: TsqlOp;
    sqlCheckActivate: TsqlOp;
    sqlObjectTypeIsSubtype: TsqlOp;
    sqlGetTypeSysNameByID: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNextUpdate(Sender: TObject);
    procedure actPrevUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure edtPayDatePropertiesEditValueChanged(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure grdPODBTableView1DblClick(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
    procedure tabDocPrevExecute(Sender: TObject);
  private
    { Private declarations }
    FCurCode		: string;
    FTotalSumma	: Currency;
    FSelCurrency	: Currency;
    FDateReadOnly	: Boolean;
    FSubjectId		: integer;
    FKbkId 			: integer;
    FSumKbk 		: Currency;
    FSearchCount	: Integer;
    FAllowPartPay	: Boolean; // позволить частичную оплату
    FDocId        : Integer;
    fKBK_IsTS     : Boolean;
    fActivateDoc  : Integer;
    fTypeName     : String;
    FTRId         : Double;
    fDeclId       : String;
    FFlag         : Integer;

    procedure UpdateLabel;
    function GetSelectedSumma: Currency;
    function GetPaymentsAsString: String;
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
    function EditPayment : Boolean;

    function GetSession : TOracleSession;
  protected
    property Session : TOracleSession read GetSession;
  public
    { Public declarations }
    IsDebt : Integer; // признак того, что оплачивается задолженность
  end;

function ShowPaymentWizard(
    TotalSumma   : Currency;
    CurrId       : double;
    AllowDebt    : Boolean = False;
    PayDate      : TDateTime = 0;
    SubjectId    : integer = 0;
    AllowPartPay : Boolean = True;
    KBK_ID       : integer = 0;
    ActivateDoc  : Integer = 1;
    DeclId       : String = '';
    IsDebt       : Integer = -1
  ) : Boolean;

implementation

{$R *.dfm}

uses
  SelectPOFrm
 ,MainDm
 ,fdcParamsHolder
 ,DictDm
 ,PaymentOrderWzGridFrm
 ,PaymentOrderGridFrm
 ,fdcCustomObjectGridFrm
 ,fdcObjectServices
 ,Math
 ,StrUtils
 ;

const
  spName_POW_BeforeAdd  = 'POW_BeforeAdd';
  spName_POW_BeforeEdit = 'POW_BeforeEdit';

function ShowPaymentWizard(
    TotalSumma   : Currency;
    CurrId       : double;
    AllowDebt    : Boolean = False;
    PayDate      : TDateTime = 0;
    SubjectId    : integer = 0;
    AllowPartPay : Boolean = True;
    KBK_ID       : integer = 0;
    ActivateDoc  : Integer = 1;
    DeclId       : String = '';
    IsDebt       : Integer = -1
  ): Boolean;
var
  F: TSelectPOWizardForm;
begin
  F := TSelectPOWizardForm.Create(nil);
  try
    F.fDeclId := DeclId;
    F.FTotalSumma := TotalSumma;
    F.FKbkId      := KBK_ID;
    F.IsDebt := IsDebt;

    if KBK_ID <> 0 then
      begin
        f.cxLabel3.caption := 'КБК: '+f.sqlGetCodeKbk.Exec('pID', [KBK_ID]);
        f.cxLabel3.Visible := True;
      end
      else
        f.cxLabel3.Visible := false;
    F.FSelCurrency     := CurrId;
    F.sqlGetTypeSysName.Exec;
    F.fTypeName := f.sqlGetTypeSysName.ParamValues['result'];
    if F.fTypeName = 'SubjectFeeFine' then
    begin
      F.chbxDebt.Visible := False;
      F.fActivateDoc := f.sqlCheckActivate.Exec;
    end
    else
    begin
      F.chbxDebt.Visible := AllowDebt;
      F.fActivateDoc := ActivateDoc;
    end;
    F.FDateReadOnly    := (PayDate <> 0);
    F.edtPayDate.Date  := PayDate;
    F.FSubjectId       := SubjectId;
    F.FAllowPartPay    := AllowPartPay;
    F.fKBK_IsTS        := F.sqlKBK_IsTS.Exec( 'kbk_id', [KBK_ID] ) = 'Y';
    Result := F.ShowModal  = mrOk;
  finally
    F.Free;
  end;
end;

procedure TSelectPOWizardForm.actAddExecute(Sender: TObject);
var
  F : TPaymentOrderGridForm;
begin
  inherited;

  FSearchCount := 0;
  if ( ( fTypeName <> 'TR' ) and ( fTypeName <> 'TrDuplicate' ) ) then
    begin
      F := TPaymentOrderWzGridForm.Create(Self);
      F.ParamsHolder.Params.ParamByName('declid').AsString := fDeclId;
    end
  else
    begin
      F := TPaymentOrderGridForm.Create(Self);
    end;
  F.SearchMode := True;
  F.SearchMultiple := True;
  F.SearchTypeSysName := 'PaymentOrder';

  // Запретить выбирать ПП других участников ВЭД (кроме прочих списаний)
  if ( ( fTypeName <> 'TR' ) and ( fTypeName <> 'TrDuplicate' ) ) then
  begin
    if ( fTypeName <> 'SubjectFeeFine' )
        and ( fTypeName <> 'SubjectFeeDebt' )
        and ( sqlPinaltyIs.Exec('pId',[FKbkId]) = 0 ) then
    begin
      F.lcSearchCriteriaItem1.Enabled  := False;
      F.lcSearchCriteriaItem10.Enabled := False;
    end;
  end;

  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;

  if ( ( fTypeName <> 'TR' ) and ( fTypeName <> 'TrDuplicate' ) ) then
   (F as TPaymentOrderWzGridForm).PayerID := FSubjectId;

  F.ShowModal;
  F.Free;
  if FSearchCount = 1 then
    if not EditPayment then
      dsPayments.Delete;

  UpdateLabel;
end;

procedure TSelectPOWizardForm.OnSearchFinished(const ADragObject: TfdcDragObject);
var
  i : Integer;
begin
  for i := 0 to ADragObject.Objects.Count - 1 do begin
    dsPayments.Append;
    // Инициализация
    dsPaymentsID.Value := ADragObject.Objects[i].Id;
    // Если вернулась платежка с ТР, то переопределяем
    if ((fTypeName <> 'TR') and (fTypeName <> 'TrDuplicate')) then
    begin
      // Сразу проверять нельзя, ибо лезет в простой грид
      if ( sqlObjectTypeIsSubtype.Exec('DOC_TYPE;BASE_TYPE',
                                           [ sqlGetTypeSysNameByID.Exec( 'ID', [ ADragObject.Objects[i].id ] )
                                           , 'PaymentDeduction' ]) = 1
         )
        and not VarIsNull(ADragObject.Objects[i].FieldValues['TR_ID']) then
      begin
        FTRId := VarAsType(ADragObject.Objects[i].FieldValues['TR_ID'], varInteger);
        dsPaymentsID.Value := sqlGetPaymentID.Exec('DED_ID',[ ADragObject.Objects[i].Id ]);
        dsPaymentsTR_ID.Value := FTRId;
      end;
    end;
    // КБК начисления
    if (FKbkId <> 0) and (FTRId = 0) then
    begin
      sqlGetOstPOKbk.ParamValues['result']     := 0.0;
  		sqlGetOstPOKbk.ParamValues['kbkcode_id'] := FKbkId;
  		sqlGetOstPOKbk.ParamValues['id']         := dsPaymentsID.Value;
      sqlGetOstPOKbk.ParamValues['PayTypeSysName'] := Self.fTypeName;
      sqlGetOstPOKbk.ParamValues['IsDebt'] := Self.IsDebt;

  		sqlGetOstPOKbk.Exec;
  		FSumKbk := sqlGetOstPOKbk.ParamValues['result'];
      FFlag := sqlGetOstPOKbk.ParamValues['p_flag'];
    end
    else
      FSumKbk := VarAsType(ADragObject.Objects[i].FieldValues['AVAIL_SUMMA'], varDouble);
    try
      // Если ТР указана, то доступная сумма - сумма оплаты ТР
      sqlGetPOInfo.Exec('SUMM_CURR_ID;SUBJECT_ID;TOTAL_SUMMA;TR_ID', [FSelCurrency, FSubjectId, FTotalSumma - GetSelectedSumma, dsPaymentsTR_ID.Value]);

      dsPayments.Post;
    except
      dsPayments.Cancel;
    end;
    if FTotalSumma - GetSelectedSumma = 0 then
      break;
  end;
  //UpdateLabel;
  FSearchCount := ADragObject.Objects.Count;
end;

procedure TSelectPOWizardForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdPODBTableView1.Controller.SelectedRowCount > 0;
end;

procedure TSelectPOWizardForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  grdPODBTableView1.Controller.DeleteSelection;
  UpdateLabel;
end;

procedure TSelectPOWizardForm.UpdateLabel;
var
  VarSumma: Variant;
  SumValue: double;
begin
  dsPayments.CheckBrowseMode;

  VarSumma := grdPODBTableView1.DataController.Summary.FooterSummaryValues[0];

  if VarIsNull(VarSumma) or VarIsEmpty(VarSumma) then SumValue := 0.0
    else SumValue := VarSumma;

  cxLabel1.Caption := Format('Сумма для погашения: %s (%s)',
          [FormatFloat(',0.00', FTotalSumma), FCurCode]);
  cxLabel2.Caption := Format('Набрано на сумму: %s',
                              [FormatFloat(',0.00', SumValue)]);
end;

procedure TSelectPOWizardForm.actOkUpdate(Sender: TObject);
begin
   if chbxDebt.Visible then
     TAction(Sender).Enabled := (    (    (PageControl.ActivePageIndex = 1)
                                      and chbxDebt.Checked
                                      and (GetSelectedSumma < FTotalSumma)
                                      and ( not VarIsNull( edtDocNumber.EditValue ) )
                                      and ( not VarIsNull( edtDocDate.EditValue   ) )
                                       )
                                   or (GetSelectedSumma = FTotalSumma)
                                   or  (fTypeName = 'SubjectFeeFine'))
   else
     TAction(Sender).Enabled := (     FAllowPartPay
                                 //and (GetSelectedSumma > 0)
                                 )
                                 or (GetSelectedSumma = FTotalSumma);
end;

procedure TSelectPOWizardForm.actAddUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled :=  not VarIsNull(edtPayDate.EditValue) and (FTotalSumma > GetSelectedSumma);
 edtPayDate.Enabled := (not FDateReadOnly) and (grdPO.ActiveView.ViewData.DataController.RecordCount = 0);
end;

procedure TSelectPOWizardForm.FormShow(Sender: TObject);
begin
  inherited;
  FCurCode := VarToStr(DictData.dsCurrency.Lookup('ID', FSelCurrency ,'CODE'));
  srcPayments.DataSet.Active := True;
  if Not FDateReadOnly then
   edtPayDate.Date := Date
  else
   edtPayDate.Enabled := False;
  UpdateLabel;
end;

procedure TSelectPOWizardForm.tabGeneralNextExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabDoc;
  // Откроем НД с требованием
  sqlGetDeclID.ParamValues['result'] := 0.0;
  dsetNotice.SetVariable( 'decl_id', sqlGetDeclID.Exec );
  with dsetNotice do
    begin
      if Active then
        Close;
      Open;
      If not IsEmpty then
      if edtDocNumber.Text = '' then
        begin
         edtDocNumber.Text := FieldValues['doc_number'];
         edtDocDate.Date   := FieldValues['doc_date'];
        end;
      Close;
    end;
end;

procedure TSelectPOWizardForm.tabDocPrevExecute(Sender: TObject);
begin
  PageControl.ActivePage := tabGeneral;
end;

procedure TSelectPOWizardForm.actNextUpdate(Sender: TObject);
begin
     TAction(Sender).Enabled := (PageControl.ActivePageIndex = 0) and (chbxDebt.Checked) and  (GetSelectedSumma <> FTotalSumma);
end;

procedure TSelectPOWizardForm.actPrevUpdate(Sender: TObject);
begin
     TAction(Sender).Enabled := (PageControl.ActivePageIndex = 1);
end;

function TSelectPOWizardForm.GetSelectedSumma: Currency;
var
  V: Variant;
begin
  V := grdPODBTableView1.DataController.Summary.FooterSummaryValues[0];
  if VarIsNull(V) then Result := 0.0
    else Result := V;
end;

function TSelectPOWizardForm.GetPaymentsAsString: String;
var
  FS: TFormatSettings;
begin
  FS.ThousandSeparator := #0;
  FS.DecimalSeparator := '.';
  dsPayments.First;
  while not dsPayments.Eof do
  begin
    Result := Format('%s%s/%s;', [Result, dsPaymentsID.AsString, FormatFloat('0.00', dsPaymentsSUMMA.Value, FS)]);
    dsPayments.Next;
  end;
end;

procedure TSelectPOWizardForm.FormCreate(Sender: TObject);
begin
  inherited;
  chbxDebt.Visible := False;
  DictData.dsCurrency.Active := True;
end;

procedure TSelectPOWizardForm.actOkExecute(Sender: TObject);
var
  DoDebt: integer;
  NeedCreateDecision : Boolean;
begin
  // создать списания
  try
    if not dsPayments.IsEmpty Then
    begin
      // Читаем ТР
      NeedCreateDecision := false;
      dsPayments.First;
      while not dsPayments.Eof do
      begin
        if not dsPayments.FieldByName('tr_id').IsNull then
        begin
          NeedCreateDecision := true;
          sqlAddPaymentInList.Exec(
              'ID;SUMMA;KBKCODE_ID;TR_ID'
             ,[ dsPayments.FieldByName('id').AsInteger
               ,dsPayments.FieldByName('summa').AsFloat
               ,FKbkId
               ,dsPayments.FieldByName('tr_id').AsFloat
              ]);
        end;
        dsPayments.Next;
      end;
      // Создаем решения
      if NeedCreateDecision then
        sqlParseTR.Exec;
      // Создаем оплата или создание резервов по решениям при оплате с ТР
      dsPayments.First;
      while not dsPayments.Eof do
      begin
        sqlAddPayment.Exec(
            'ID;SUMMA;CURR_SUMMA;TR_ID;ACTIVATE_DOC'
             ,[ dsPayments.FieldByName('id').AsInteger
               ,dsPayments.FieldByName('summa').AsFloat
               ,dsPayments.FieldByName('curr_summa').AsFloat
               ,dsPayments.FieldByName('tr_id').AsInteger
               ,fActivateDoc
              ]);
        dsPayments.Next;
      end;
//    MainDm.MainData.Session.Commit;
      // Подпись решений
      if NeedCreateDecision then
        sqlSignDecision.Exec;
    end;
  // создать задолжность
    if chbxDebt.Visible and chbxDebt.Checked
    then DoDebt := 1
    else DoDebt := 0;
    sqlAddDept.Exec('debt;pDocNumber;pDocDate', [DoDebt,edtDocNumber.Text,edtDocDate.Date]);
    fDocID := sqlAddDept.ParamValues['result'];
    sqlGetDeclID.Exec;
    sqlCreateInteractPayFines.Exec('pDeclId',sqlGetDeclID.ParamValues['result']);
    //MainDm.MainData.Session.Commit;
    if (fTypeName = 'SubjectFeeFine')  then
        sqlAddError.Exec;
  except
    //MainDm.MainData.Session.Rollback;
    raise;
  end;
  ModalResult := mrOk;
end;

procedure TSelectPOWizardForm.edtPayDatePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if edtPayDate.Date <> 0 then
  begin
    sqlSetDate.Exec('pdate', edtPayDate.Date);
  end;
end;

procedure TSelectPOWizardForm.actEditExecute(Sender: TObject);
begin
  inherited;

  if not (dsPayments.State in [dsEdit]) then
     dsPayments.Edit;

  if EditPayment then
  if (dsPayments.State in [dsEdit]) then
      dsPayments.Post
  else
      dsPayments.Cancel;

  UpdateLabel;
end;

procedure TSelectPOWizardForm.grdPODBTableView1DblClick(Sender: TObject);
begin
  inherited;
  if (grdPO.ActiveView.GetHitTest(grdPO.ScreenToClient(Mouse.CursorPos)).HitTestCode = htCell) then
    actEdit.Execute;
end;

procedure TSelectPOWizardForm.actEditUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdPODBTableView1.Controller.SelectedRowCount = 1;
end;

function TSelectPOWizardForm.EditPayment: Boolean;
var
  P      : TfdcParams;
  MaxSum : Currency;
begin
  P := TfdcParams.Create(nil);
  P.FillBy(dsPayments);
  if FKbkId <> 0 then
     begin
  		P.ParamByName('KBK_ID').Value 	:= FKbkId;
      P.ParamByName('REST_SUMM').Value := FSumKbk;
     end;
  if dsPayments.State = dsInsert	then
    MaxSum := FTotalSumma - GetSelectedSumma
  else
    MaxSum := FTotalSumma - GetSelectedSumma + dsPaymentsSUMMA.Value;

  Result := EditPaymentOrder(P, FSelCurrency, MaxSum, 0.01, Self.FFlag);
  if Result then
    begin
       if not (dsPayments.State in [dsEdit,dsInsert]) then
          dsPayments.Edit;
       dsPayments['SUMMA;CURR_SUMMA'] := P.ParamValues['CHARGE_SUMMA;SUMMA;'];
       dsPayments.Post;
    end;
  P.Free;
end;

function TSelectPOWizardForm.GetSession: TOracleSession;
begin
   Result := sqlAddPayment.Query.Session;
end;

procedure TSelectPOWizardForm.FormDestroy(Sender: TObject);
begin
  inherited;
  if chBDocShow.Checked and (fDocID > 0) then
    GetObjectServices.OpenObject( fDocID, nil );
end;


end.
