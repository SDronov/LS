unit DeclCorrectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, cxLookAndFeelPainters, DB, FDCCustomDataset,
  fdcQuery, StdCtrls, cxRadioGroup, cxCurrencyEdit, cxDBEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxImage, ExtCtrls, dxLayoutControl,
  cxLabel, cxPC, cxButtons, cxControls, fdcParamsHolder, QueryList, Grids,
  DBGrids, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxmdaset, cxMemo, BaseWizardFrm, Menus, cxCalendar, cxGroupBox,
  cxCheckBox, OracleData;

type
  TChargeEditMode = (cemNull, cemAdd, cemChange, cemRemove, cemReturnSalvage);

  TDeclCorrectForm = class(TBaseWizardForm)
    tabCommon: TcxTabSheet;
    lcGeneral: TdxLayoutControl;
    edtSumma: TcxDBCurrencyEdit;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    edtDeclNo: TfdcObjectLinkEdit;
    edtDelta: TcxDBCurrencyEdit;
    dxLayoutGroup3: TdxLayoutGroup;
    lciNameEdit: TdxLayoutItem;
    lciDeclNo: TdxLayoutItem;
    lciCurrency: TdxLayoutItem;
    lciSumma: TdxLayoutItem;
    lciDescriptEdit: TdxLayoutItem;
    lciDelta: TdxLayoutItem;
    tabAdMode: TcxTabSheet;
    dxLayoutControl4: TdxLayoutControl;
    btnFindPayorders: TcxRadioButton;
    btnMakeDebt: TcxRadioButton;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dsData: TfdcQuery;
    dsDataID: TFloatField;
    dsDataNAME: TStringField;
    dsDataSHORTNAME: TStringField;
    dsDataOBJECT_TYPE_ID: TFloatField;
    dsDataACCESSLEVEL: TFloatField;
    dsDataSTATE_ID: TFloatField;
    dsDataSYSNAME: TStringField;
    dsDataDESCRIPT: TStringField;
    dsDataOWNER_OBJECT_ID: TFloatField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    dsDataDECL_NO: TStringField;
    srcData: TDataSource;
    dxLayoutControl4Item1: TdxLayoutItem;
    cxLabel4: TcxLabel;
    dsDataDELTA: TFloatField;
    Params: TfdcParamsHolder;
    dsDataOLD_SUMMA: TFloatField;
    QueryList1: TQueryList;
    dsPayments: TfdcQuery;
    lcGeneralItem1: TdxLayoutItem;
    cmbxPayType: TfdcObjectLookupEdit;
    tabPayments: TcxTabSheet;
    dxLayoutControl5: TdxLayoutControl;
    cxLabel5: TcxLabel;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    srcPayments: TDataSource;
    dsPaymentsID: TFloatField;
    dsPaymentsSUMMA: TFloatField;
    dsPaymentsSUMMA_BACK: TFloatField;
    dsPaymentsNAME: TStringField;
    cxButton1: TcxButton;
    dxLayoutControl5Item2: TdxLayoutItem;
    grdPODBTableView1: TcxGridDBTableView;
    grdPOLevel1: TcxGridLevel;
    grdPO: TcxGrid;
    dxLayoutControl5Item3: TdxLayoutItem;
    grdPODBTableView1NAME: TcxGridDBColumn;
    grdPODBTableView1SUMMA: TcxGridDBColumn;
    grdPODBTableView1SUMMA_BACK: TcxGridDBColumn;
    dsSelected: TdxMemData;
    dsSelectedID: TFloatField;
    dsSelectedNAME: TStringField;
    dsSelectedSUMMA: TFloatField;
    dsSelectedSUMMA_BACK: TFloatField;
    dxLayoutControl5Item1: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl5Group2: TdxLayoutGroup;
    dxLayoutControl5Group1: TdxLayoutGroup;
    actAdd: TAction;
    actDelete: TAction;
    grdPODBTableView1ID: TcxGridDBColumn;
    cmbxCause: TcxLookupComboBox;
    lciCause: TdxLayoutItem;
    edtDescrp: TcxMemo;
    dxLayoutControl2Item3: TdxLayoutItem;
    dsCauseList: TdxMemData;
    dsCauseListID: TFloatField;
    dsCauseListName: TStringField;
    srcCauseList: TDataSource;
    sqlBackPayment: TsqlOp;
    actAddPO: TAction;
    actDelPO: TAction;
    sqlModifyCharge: TsqlOp;
    fdcCauseList: TfdcQuery;
    fdcCauseListID: TFloatField;
    fdcCauseListNAME: TStringField;
    edtDate: TcxDateEdit;
    dxLayoutControl2Item4: TdxLayoutItem;
    dsDataRATE_DATE: TDateTimeField;
    sqlCreateError: TsqlOp;
    cmbxKBK: TfdcObjectLookupEdit;
    lciKBK: TdxLayoutItem;
    dsKBK: TfdcQuery;
    srcKBK: TDataSource;
    dsDataKBKCODE_ID: TFloatField;
    dsDataCHARGE_MONTH: TDateTimeField;
    sqlGetSubject: TsqlOp;
    sqlIsKNP: TsqlOp;
    sqlPayKNP: TsqlOp;
    dsSubject: TfdcQuery;
    QueryList2: TQueryList;
    sqlAdvice_AddChargeForDecl: TsqlOp;
    sqlAdvice_AddCharge: TsqlOp;
    sqlNoticePay_AddChargeForDecl: TsqlOp;
    sqlNoticePay_AddCharge: TsqlOp;
    tabDoc: TcxTabSheet;
    lcgDoc: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    rgDocType: TcxRadioGroup;
    lciDocTypeAdvice: TdxLayoutItem;
    chBDocShow: TcxCheckBox;
    dxLayoutControl3Item3: TdxLayoutItem;
    cxLabel6: TcxLabel;
    lciDocTypeNotice: TdxLayoutItem;
    dsetAdvice: TOracleDataSet;
    dsAdviceOrNotice: TDataSource;
    edtDocNumber: TcxDBTextEdit;
    dxLayoutControl3Item1: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    dxLayoutControl3Item2: TdxLayoutItem;
    sqlAdvicePayAdd: TsqlOp;
    sqlAdviceLevyAdd: TsqlOp;
    sqlAdviceUpd: TsqlOp;
    dsetNotice: TOracleDataSet;
    sqlNoticePayAdd: TsqlOp;
    sqlNoticePayUpd: TsqlOp;
    dsSelectedRESERVE_ID: TFloatField;
    sqlAdvice_AddReserve: TsqlOp;
    sqlAdvice_AddDeduction: TsqlOp;
    dsSelectedNEW_ID: TFloatField;
    sqlGetDeclTypeSysName: TsqlOp;
    sqlModifyCharge1: TsqlOp;
    sqlGetKBK: TsqlOp;
    sqlGetCurrencyID: TsqlOp;
    sqlAdviceKNPAdd: TsqlOp;
    sqlGetKNPDeduction: TsqlOp;
    sqlActivateBuffer: TsqlOp;
    dxLayoutControl3Item4: TdxLayoutItem;
    edtDeclarant: TfdcObjectLinkEdit;
    dsSelectedSubject_ID: TIntegerField;
    dsSelectedsubject_name: TStringField;
    dsPaymentsPAYMENT_ID: TIntegerField;
    dsPaymentsPAYER_ID: TIntegerField;
    dsPaymentsPAYER_NAME: TStringField;
    sqlGetSubjectName: TsqlOp;
    dsDataIS_TS: TStringField;
    sqlGetIsTS: TsqlOp;
    sqlActivateBuffer1: TsqlOp;
    sqlDelDocBufferActivate: TsqlOp;
    fdcCauseListCODE: TStringField;
    sqlGetOthersCauseId: TsqlOp;
    sqlActivateBufferFull: TsqlOp;
    sqlGetSubjectParams: TsqlOp;
    sqlLinkWithAdvice: TsqlOp;
    sqlCreateDecisionPay: TsqlOp;
    sqlAdviceDecisionAuto: TsqlOp;
    procedure FormShow(Sender: TObject);
    procedure dsPaymentsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cmbxPayTypePropertiesEditValueChanged(Sender: TObject);
    procedure btnMakeReconningClick(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrevUpdate(Sender: TObject);
    procedure edtSummaPropertiesChange(Sender: TObject);
    procedure edtDeltaPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnDoNothingClick(Sender: TObject);

    procedure tabGeneralNextUpdate(Sender: TObject);
    procedure tabGeneralNextExecute(Sender: TObject);

    procedure tabCommonNextExecute(Sender: TObject);
    procedure tabCommonNextUpdate(Sender: TObject);
    procedure tabCommonFinishExecute(Sender: TObject);
    procedure tabCommonFinishUpdate(Sender: TObject);

    procedure tabPaymentsFinishUpdate(Sender: TObject);
    procedure tabPaymentsNextUpdate(Sender: TObject);
    procedure tabPaymentsNextExecute(Sender: TObject);
    procedure tabPaymentsPrevExecute(Sender: TObject);

    procedure tabAdModeNextUpdate(Sender: TObject);
    procedure tabAdModeNextExecute(Sender: TObject);
    procedure tabAdModeFinishUpdate(Sender: TObject);
    procedure tabAdModeFinishExecute(Sender: TObject);

    procedure tabDocFinishUpdate(Sender: TObject);
    procedure tabDocNextUpdate(Sender: TObject);
    procedure tabDocPrevUpdate(Sender: TObject);
    procedure tabDocPrevExecute(Sender: TObject);
    procedure tabDocFinishExecute(Sender: TObject);

    function  CreateNoticePay: Double;
    function  CreateAdvice: Double;
    function  CheckAdvice: boolean;
    function  CheckNoticePay: boolean;
    procedure dsetAdviceApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure dsetAdviceAfterOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure dsKBKBeforeOpen(DataSet: TDataSet);
    procedure tabAdModeShow(Sender: TObject);
    procedure rgDocTypePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FLimitSumma  : Currency;
    FNewChargeId : Double;
    FDebtSumma   : Currency;
    FBackMethod  : String;
    FSubjectId   : integer;
    FIsKNP       : integer;
    FIsTS        : String;
    FChargeEditMode  : TChargeEditMode;   // Режим формы

    fDeclTypeSysName : string;
    fDocID : Double;

    procedure InitBackSumma;
    procedure ModifyKNP;
    procedure SetChargeEditMode( Value : TChargeEditMode ); // Установка режима формы
  public
    { Public declarations }

    procedure LoadLayout; override;
    procedure SaveLayout; override;
    property ChargeEditMode : TChargeEditMode read FChargeEditMode write SetChargeEditMode;
    { TODO : property DeclID }
    { TODO : property ChargeId }
    { TODO : property SubjectId }
  end;

  function AddCharge(DeclId: double; SubjectID: integer): Boolean;
  function AddChargeTPO(DeclId: double; SubjectID: integer): Boolean;
  function AddChargeEx(DeclId: double; SubjectID: integer): Boolean;
  function RemoveCharge(ChargeId, DeclId: double; SubjectID: integer): Boolean;
  function ChangeCharge(ChargeId, DeclId: double; SubjectID: integer): Boolean;
  function ReturnSalvage(ChargeId, DeclId: double; SubjectID: integer): Boolean;
  { TODO : Убрать инициализацию формы из Add, Remove, Change и т.п. в метод Set режима формы }

var
  DeclCorrectForm: TDeclCorrectForm;


implementation

uses MainDm, FormUtils, DictDm, fdcCustomTabDlgFrm, POAssignFrm, DictFrm,
  SelectPOFrm, SelectPOWizardFrm, FMTBcd, Math,
  AdviceFrm, NoticePayFrm, ObjServices, SubjIntf, DecisionPayBackFrm;

{$R *.dfm}

function AddCharge(DeclId: double; SubjectID: integer): Boolean;
var
  F: TDeclCorrectForm;
begin
  F := TDeclCorrectForm.Create(nil);
  try
    F.ChargeEditMode := cemAdd;
    F.dsData.Open;
    F.dsData.Insert;
    F.dsDataDECL_ID.Value     := DeclId;
    F.dsDataSUMMA.Value       := 0;
    F.dsDataCURRENCY_ID.Value := F.sqlGetCurrencyID.Exec;
    //F.lciCurrency.Enabled     := F.dsDataCURRENCY_ID.IsNull;
    F.tabGeneral.TabVisible   := False;
    F.lciDelta.Visible        := False;
    F.lciDeclNo.Visible       := False;
    F.btnMakeDebt.Visible     := False;
    F.FSubjectId              := SubjectID; //F.sqlGetSubject.Exec('DECL_ID',[DeclId]);
    F.FIsKNP                  := F.sqlIsKNP.Exec('DECL_ID',[DeclId]);
    F.fDeclTypeSysName        := F.sqlGetDeclTypeSysName.Exec( 'DECL_ID', [DeclId] );

    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

function AddChargeTPO(DeclId: double; SubjectID: integer): Boolean;
var
  F: TDeclCorrectForm;
begin
  F := TDeclCorrectForm.Create(nil);
  try
    F.ChargeEditMode := cemAdd; // тип документа начисления передается
    F.dsData.Open;
    F.dsData.Insert;
    F.dsDataDECL_ID.Value     := DeclId;
    F.dsDataSUMMA.Value       := 0;
    F.dsDataCURRENCY_ID.Value := F.sqlGetCurrencyID.Exec;
    F.lciCurrency.Enabled     := F.dsDataCURRENCY_ID.IsNull;
    F.tabGeneral.TabVisible   := False;
    F.lciDelta.Visible        := False;
    F.lciDeclNo.Visible       := False;
    F.btnMakeDebt.Visible     := False;
    F.FSubjectId              := SubjectID; //F.sqlGetSubject.Exec('DECL_ID',[DeclId]);
    F.FIsKNP                  := F.sqlIsKNP.Exec('DECL_ID',[DeclId]);
    F.fDeclTypeSysName        := F.sqlGetDeclTypeSysName.Exec( 'DECL_ID', [DeclId] );
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

{ TODO : Разобраться ?? Чем отличается метод -Ex от простого ?? }
function AddChargeEx(DeclId: double; SubjectID: integer): Boolean;
var
  F: TDeclCorrectForm;
begin
  F := TDeclCorrectForm.Create(nil);
  try
    F.ChargeEditMode := cemAdd;
    F.dsData.Open;
    F.dsData.Insert;
    F.dsDataDECL_ID.Value     := DeclId;
    F.dsDataSUMMA.Value       := 0;
    F.dsDataCURRENCY_ID.Value := F.sqlGetCurrencyID.Exec;
    F.lciCurrency.Enabled     := F.dsDataCURRENCY_ID.IsNull;
    F.tabGeneral.TabVisible   := False;
    F.lciDelta.Visible        := False;
    F.lciDeclNo.Visible       := False;
    F.FSubjectId              := SubjectID; //F.sqlGetSubject.Exec('DECL_ID',[DeclId]);
    F.FIsKNP                  := F.sqlIsKNP.Exec('DECL_ID',[DeclId]);
    F.fDeclTypeSysName        := F.sqlGetDeclTypeSysName.Exec( 'DECL_ID', [DeclId] );

    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

function RemoveCharge(ChargeId, DeclId: double; SubjectID: integer): Boolean;
var
  F: TDeclCorrectForm;
begin
  F := TDeclCorrectForm.Create(nil);
  try
    F.ChargeEditMode := cemRemove;
    F.dsData.ParamByName('ID').Value     := ChargeId;
    F.dsData.ParamByName('DECL_ID').Value  := DeclId;
    F.dsData.Open;
    F.dsData.Edit;
    F.dsDataSUMMA.Value    := 0;
    F.lciSumma.Tag         := 13;
    F.tabCommon.TabVisible := False;
    F.FSubjectId           := SubjectID; //F.sqlGetSubject.Exec('DECL_ID',[F.dsDataDECL_ID.Value]);
    F.FIsKNP               := F.sqlIsKNP.Exec('DECL_ID',[F.dsDataDECL_ID.Value]);
    F.fDeclTypeSysName     := F.sqlGetDeclTypeSysName.Exec( 'DECL_ID', [F.dsDataDECL_ID.Value] );

    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

function ChangeCharge(ChargeId, DeclId: double; SubjectID: integer): Boolean;
var
  F: TDeclCorrectForm;
begin
  F := TDeclCorrectForm.Create(nil);
  try
    F.ChargeEditMode := cemChange;
    F.dsData.ParamByName('ID').Value       := ChargeId;
    F.dsData.ParamByName('DECL_ID').Value  := DeclId;
    F.FIsTS            := F.sqlGetIsTS.exec('pChargeId',[ChargeId]) ;
    F.dsData.Open;
    F.dsData.Edit;
    F.btnMakeDebt.Visible     := False;
    F.FSubjectId       := SubjectID; //F.sqlGetSubject.Exec('DECL_ID',[F.dsDataDECL_ID.Value]);
    F.FIsKNP           := F.sqlIsKNP.Exec('DECL_ID',[F.dsDataDECL_ID.Value]);
    F.fDeclTypeSysName := F.sqlGetDeclTypeSysName.Exec( 'DECL_ID', [F.dsDataDECL_ID.Value] );

    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

function ReturnSalvage(ChargeId, DeclId: double; SubjectID: integer): Boolean;
var
  F: TDeclCorrectForm;
begin
  F := TDeclCorrectForm.Create(nil);
  try
    F.ChargeEditMode := cemReturnSalvage;
    F.dsData.ParamByName('ID').Value       := ChargeId;
    F.dsData.ParamByName('DECL_ID').Value  := DeclId;
    F.FIsTS            := F.sqlGetIsTS.exec('pChargeId',[ChargeId]) ;
    F.dsData.Open;
    F.dsData.Edit;
    F.btnMakeDebt.Visible     := False;
    F.FSubjectId       := SubjectID; //F.sqlGetSubject.Exec('DECL_ID',[F.dsDataDECL_ID.Value]);
    F.FIsKNP           := F.sqlIsKNP.Exec('DECL_ID',[F.dsDataDECL_ID.Value]);
    F.fDeclTypeSysName := F.sqlGetDeclTypeSysName.Exec( 'DECL_ID', [F.dsDataDECL_ID.Value] );

    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TDeclCorrectForm.SetChargeEditMode( Value : TChargeEditMode ); // Установка режима формы
begin
  FChargeEditMode := Value;
  case FChargeEditMode of
    cemAdd:
      begin
        Caption := 'Новое начисление';
        dsKBK.ParamByName('ALL_KBK').Value := 0;
      end;
    cemRemove:
      begin
        Caption := 'Удаление начисления';
        dsKBK.ParamByName('ALL_KBK').Value := 1;
      end;
    cemChange:
      begin
        Caption := 'Корректировка начисления';
        dsKBK.ParamByName('ALL_KBK').Value := 2;
      end;
    cemReturnSalvage :
      begin
        Caption := 'Возврат утилизационных сборов';
        dsKBK.ParamByName('ALL_KBK').Value := 2;
        cmbxCause.EditValue := sqlGetOthersCauseId.Exec;
        lciCause.Enabled := False;
      end;
  end;

end;

procedure TDeclCorrectForm.tabCommonNextExecute(Sender: TObject);
begin
  dsPayments.Session.Rollback;

  if FIsKNP = 1 then
    begin
      ModifyKNP;
      tabAdMode.TabVisible   := False;
      tabPayments.TabVisible := False;
      tabDoc.TabVisible      := dsData.FieldByName( 'DELTA' ).AsFloat < 0;

      if tabDoc.TabVisible then
        begin
          // Откроем НД с уведомлением
          dsetAdvice.SetVariable( 'decl_id', dsData.FieldByName( 'decl_id' ).AsFloat );
          dsetAdvice.SetVariable( 'subject_id', FSubjectId );
          if dsetAdvice.Active then
            dsetAdvice.Refresh
          else
            dsetAdvice.Open;
          if dsetAdvice.IsEmpty then
            begin
              dsetAdvice.Append;
              dsetAdvice.FieldByName('subject_id').AsInteger := FSubjectId;
              dsetAdvice.FieldByName('decl_name').AsString   := sqlGetSubjectName.Exec('ID',[FSubjectId]);
            end
          else
            dsetAdvice.Edit;
          dsAdviceOrNotice.DataSet := dsetAdvice;

          lciDocTypeNotice.Visible := False;
          lciDocTypeAdvice.Visible := True;

          rgDocType.Enabled   := False;
          rgDocType.ItemIndex := -1;
        end;
    end
  else if dsDataDelta.Value > 0 then
    begin
       tabAdMode.TabVisible   := True;
       tabPayments.TabVisible := False;
    end
  else
    begin
       tabAdMode.TabVisible   := False;
       tabPayments.TabVisible := True;

       dsPayments.Close;
       dsPayments.Open;
       dsSelected.Close;
       dsSelected.Open;
       FLimitSumma := -dsDataDELTA.AsCurrency;
       InitBackSumma;
    end;
  PageControl.SelectNextPage( True );
end;

procedure TDeclCorrectForm.InitBackSumma;
begin
   sqlModifyCharge.QueryList.Session.Rollback;
   sqlModifyCharge['RESULT'] := 0;
   FNewChargeId := sqlModifyCharge.Exec(
       'cause_id;descrip;pdate;debt;is_ts'
      ,[ cmbxCause.EditValue
        ,edtDescrp.Lines.Text
        ,edtDate.EditValue
        ,0
        ,FIsTS]
     );
end;

procedure TDeclCorrectForm.tabAdModeFinishUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := btnFindPayorders.Checked;
end;

procedure TDeclCorrectForm.tabAdModeNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not btnFindPayorders.Checked;
end;

procedure TDeclCorrectForm.tabAdModeFinishExecute(Sender: TObject);
  var
    d               : Double;
    lv_Activate_Doc : Integer;
begin
  sqlModifyCharge1.QueryList.Session.Savepoint( 'tabAdModeFinish' );

  if Pos( 'SubjectFee', fDeclTypeSysName ) > 0 then
    lv_Activate_Doc := 0
  else
    lv_Activate_Doc := 1;

  // Изменения в начисления
  try
    if fDeclTypeSysName = 'SubjectFeeFine' then
      begin
        sqlModifyCharge1['result']     := 0.0;
        sqlModifyCharge1['debt_summa'] := 0.0;
        FNewChargeId := sqlModifyCharge1.Exec(
            'cause_id;descrip;pdate;is_ts'
           ,[ cmbxCause.EditValue
             ,edtDescrp.Lines.Text
             ,edtDate.EditValue
             ,FIsTS
              ]
          );
      end
    else
      begin
        sqlModifyCharge1['result'] := 0.0;
        FNewChargeId := sqlModifyCharge1.Exec(
            'cause_id;descrip;pdate;is_ts;PayObjectType'
           ,[ cmbxCause.EditValue
             ,edtDescrp.Lines.Text
             ,edtDate.EditValue
             ,FIsTS
             ,'PayDebt' ]
          );

        if  not (btnMakeDebt.Visible and btnMakeDebt.Enabled) then
        begin
           with dsetNotice do
            begin
              SetVariable( 'decl_id', dsData.FieldByName( 'decl_id' ).AsFloat );
              if Active then
                Refresh
              else
                Open;
            end;

          if dsetNotice.FieldByName( 'id' ).IsNull then
          begin
            // Получить ID участника ВЭД
            dsSubject.ParamByName('Id').Value := dsData.FieldByName( 'Decl_Id' ).Value;
            dsSubject.Open;

            // Создаём требование
            fDocID := sqlNoticePayAdd.Exec(
                         'doc_date;subject_id',
                         [ date()
                          ,dsSubject.FieldByName( 'Subject_Id' ).AsFloat ]
              );

            dsSubject.Close;
          end
          else
            fDocID := dsetNotice.FieldByName( 'id' ).AsFloat;
          // Привяжем начисления к требованию
          sqlNoticePay_AddCharge.Exec(
            'pID;pChargeId'
           ,[ fDocID
             ,FNewChargeId ]
          );
         end;
         sqlDelDocBufferActivate.Exec('pDocId',[fDocID]);
      end;

    // Ищем платёжные документы
    if not ShowPaymentWizard(
               dsData['delta']
              ,dsDataCURRENCY_ID.Value
              ,btnMakeDebt.Visible and btnMakeDebt.Enabled
              ,dsDataRATE_DATE.AsDateTime
              ,FSubjectId
              ,true
              ,dsDataKBKCODE_ID.AsInteger
              ,lv_Activate_Doc
              ,dsDataDECL_ID.AsString
              ) then
      begin
        sqlModifyCharge1.QueryList.Session.RollbackToSavepoint( 'tabAdModeFinish' );
        Exit;
      end;

  except
    sqlModifyCharge1.QueryList.Session.RollbackToSavepoint( 'tabAdModeFinish' );
    raise;
  end;

  if lv_Activate_Doc = 1 then
    sqlActivateBuffer.Exec;

  sqlModifyCharge1.QueryList.Session.Commit;

  ModalResult := mrOk;
end;

procedure TDeclCorrectForm.FormShow(Sender: TObject);
begin
  inherited;
  if not tabGeneral.TabVisible then
      PageControl.ActivePageIndex := 1;

//  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
//  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth +  Panel1.Width;
  UpdateLayoutControl(dsData.State = dsInsert, lcGeneral);
end;

procedure TDeclCorrectForm.tabCommonNextUpdate(Sender: TObject);
  var
    EditValue: Variant;
    KBKValue: Variant;
begin
  inherited;
  try
    edtDelta.PrepareEditValue(edtDelta.Text, EditValue, edtDelta.Focused);
    cmbxPayType.PostEditValue;
    cmbxKBK.PostEditValue;
    TAction(Sender).Enabled := (    ( FIsKNP = 1 )
                                and ( dsDataSUMMA.Value >= 0 )
                                and not VarIsNull( EditValue )
                                and ( EditValue < 0 )
                               )
                            or (    ( FIsKNP <> 1 )
                                and ( not dsDataPAY_TYPE_ID.IsNull )
                                and ( not dsDataCURRENCY_ID.IsNull )
                                and ( not dsDataKBKCODE_ID.IsNull or dsKBK.IsEmpty )
                                and ( dsDataSUMMA.Value >= 0 )
                                and not VarIsNull( EditValue )
                                and (    ( EditValue <> 0 )
                                     and ( ChargeEditMode <> cemReturnSalvage )
                                      or ( EditValue < 0 )
                                    )
                               );
  except
    TAction(Sender).Enabled := False;
  end;
end;

procedure TDeclCorrectForm.dsPaymentsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := dsPaymentsSUMMA_BACK.Value = 0;
end;

procedure TDeclCorrectForm.actAddUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := FLimitSumma > 0;
end;

procedure TDeclCorrectForm.actAddExecute(Sender: TObject);
var
  Id, Summa: double;
begin
  inherited;
  if SelectPayment(dsPayments, FLimitSumma, Id, Summa) then
    begin
      dsPayments['SUMMA_BACK'] := Summa;
      dsSelected.Append;
      dsSelected['ID;NAME;SUMMA;SUMMA_BACK;SUBJECT_ID;SUBJECT_NAME'] := dsPayments['ID;NAME;SUMMA;SUMMA_BACK;PAYER_ID;PAYER_NAME'];
      dsSelected.Post;
      FLimitSumma := FLimitSumma - Summa;
    end;
end;

procedure TDeclCorrectForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := grdPODBTableView1.DataController.GetSelectedCount > 0;
end;

procedure TDeclCorrectForm.actDeleteExecute(Sender: TObject);
var
  Id : double;
begin
  inherited;
  Id := grdPODBTableView1.DataController.Values[
     grdPODBTableView1.DataController.RecNo - 1, grdPODBTableView1ID.Index];
  dsPayments.Filtered := False;
  dsPayments.Locate('ID', Id, []);
  FLimitSumma := FLimitSumma + dsPayments['SUMMA_BACK'];

  dsPayments.Edit;
  dsPayments['SUMMA_BACK'] := 0;
  dsPayments.Post;
  dsPayments.Filtered := True;

  grdPODBTableView1.DataController.DeleteSelection;
end;

procedure TDeclCorrectForm.tabPaymentsFinishUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := False;
end;

procedure TDeclCorrectForm.tabPaymentsNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FLimitSumma = 0;
end;

procedure TDeclCorrectForm.tabGeneralNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not VarIsNull(cmbxCause.EditValue);
end;

procedure TDeclCorrectForm.LoadLayout;
begin
//  inherited;
end;

procedure TDeclCorrectForm.SaveLayout;
begin
//  inherited;
end;

procedure TDeclCorrectForm.tabAdModeNextExecute(Sender: TObject);
  var
    lv_DebtFlag : Integer;
begin
  // Установим точку отката
  sqlModifyCharge.QueryList.Session.Savepoint( 'tabAdModeNext' );

  // Изменения в начисления
  try
    if btnMakeDebt.Checked then
      lv_DebtFlag := 1
    else
      lv_DebtFlag := 0;
    if Copy( fDeclTypeSysName, 1, 10 ) = 'SubjectFee' then
      begin
        sqlModifyCharge1['result']     := 0.0;
        sqlModifyCharge1['debt_summa'] := 0.0;
        FNewChargeId := sqlModifyCharge1.Exec(
            'cause_id;descrip;pdate;debt;is_ts'
           ,[ cmbxCause.EditValue
             ,edtDescrp.Lines.Text
             ,edtDate.EditValue
             ,lv_DebtFlag
             ,FIsTS ]
          );
      end
    else
      begin
        sqlModifyCharge['result'] := 0.0;
        FNewChargeId := sqlModifyCharge.Exec(
            'cause_id;descrip;pdate;debt;is_ts'
           ,[ cmbxCause.EditValue
             ,edtDescrp.Lines.Text
             ,edtDate.EditValue
             ,lv_DebtFlag
             ,FIsTS ]
          );
      end;

  except
    sqlModifyCharge.QueryList.Session.RollbackToSavepoint( 'tabAdModeNext' );
    raise;
  end;

  // Откроем НД с требованием
  with dsetNotice do
    begin
      SetVariable( 'decl_id', dsData.FieldByName( 'decl_id' ).AsFloat );
      if Active then
        Refresh
      else
        Open;
      if IsEmpty then
        Append
      else
        Edit;
    end;
  dsAdviceOrNotice.DataSet := dsetNotice;

  // Переход на закладку с требованием
  lciDocTypeNotice.Visible := True;
  lciDocTypeAdvice.Visible := False;
  dxLayoutControl3Item4.Visible := false;
  
  PageControl.ActivePage := tabDoc;
end;

procedure TDeclCorrectForm.actPrevUpdate(Sender: TObject);
var
  I: Integer;
begin
//  inherited;
  for I := PageControl.ActivePageIndex - 1 downto 0 do
    if PageControl.Pages[I].TabVisible then
    begin
      TAction(Sender).Enabled := True;
      Exit;
    end;
  TAction(Sender).Enabled := False;
end;

procedure TDeclCorrectForm.edtSummaPropertiesChange(Sender: TObject);
var
  EditValue: Variant;
begin
  inherited;
  try
    if edtSumma.Focused then
    begin
       edtSumma.PrepareEditValue(edtSumma.Text, EditValue, True);
       if VarIsNull(EditValue) then
                 dsDataDELTA.Clear
      else  dsDataDELTA.AsCurrency :=  RoundTo(EditValue, -2)  - dsDataOLD_SUMMA.AsCurrency;
    end;
  except
    dsDataDELTA.Clear;
  end;
end;

procedure TDeclCorrectForm.edtDeltaPropertiesChange(Sender: TObject);
var
  EditValue: Variant;
begin
  inherited;
  try
    if edtDelta.Focused then
    begin
       edtDelta.PrepareEditValue(edtDelta.Text, EditValue, True);
       if VarIsNull(EditValue) then
                 dsDataSUMMA.AsCurrency := dsDataOLD_SUMMA.AsCurrency
      else dsDataSUMMA.AsCurrency :=  RoundTo(EditValue, -2) + dsDataOLD_SUMMA.AsCurrency;
    end;
  except
    dsDataDELTA.Clear;
  end;
end;

procedure TDeclCorrectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if QueryList1.Session.InTransaction then
      QueryList1.Session.Rollback;
end;

procedure TDeclCorrectForm.tabGeneralNextExecute(Sender: TObject);
begin
  if tabCommon.TabVisible then
    PageControl.ActivePage := tabCommon
  else
    begin
      dsDataDelta.Value := -dsDataOLD_SUMMA.Value;
      tabCommonNextExecute(Sender);
    end;
end;

procedure TDeclCorrectForm.FormCreate(Sender: TObject);
begin
  inherited;
  fdcCauseList.Open;
  edtDate.Date := Date;
end;


procedure TDeclCorrectForm.tabPaymentsPrevExecute(Sender: TObject);
begin
  FLimitSumma := -dsDataDelta.AsCurrency;
  PageControl.ActivePage := tabCommon;
end;

procedure TDeclCorrectForm.btnDoNothingClick(Sender: TObject);
begin
  inherited;
  FBackMethod := 'P';
end;

procedure TDeclCorrectForm.btnMakeReconningClick(Sender: TObject);
begin
  inherited;
  FBackMethod := 'U';
end;

procedure TDeclCorrectForm.cmbxPayTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cmbxKBK.Properties.BeginUpdate;
  dsKBK.Close;
  dsKBK.ParamByName('PAY_TYPE_ID').Value := cmbxPayType.EditValue;
  dsKBK.Open;
  if dsKBK.RecordCount = 1 then
    dsDataKBKCODE_ID.AsFloat := dsKBK.FieldByName( 'ID' ).AsFloat
  else
    if dsDataID.IsNull then // если новое начисление, то КБК выбирается пользователем
      dsDataKBKCODE_ID.Clear;
  cmbxKBK.Properties.EndUpdate(False);
end;

procedure TDeclCorrectForm.tabCommonFinishExecute(Sender: TObject);
begin
  ModifyKNP;
  sqlActivateBuffer.Exec;
  sqlModifyCharge.QueryList.Session.Commit;

  ModalResult := mrOK;
end;

procedure TDeclCorrectForm.tabCommonFinishUpdate(Sender: TObject);
  var
    EditValue: Variant;
begin
  try
    edtDelta.PrepareEditValue(edtDelta.Text, EditValue, edtDelta.Focused);
    TAction(Sender).Enabled := ( FIsKNP = 1 )
                           and (EditValue > 0)
                           and (dsDataSUMMA.Value >= 0);
  except
    TAction(Sender).Enabled := False;
  end;
end;


function  TDeclCorrectForm.CreateNoticePay: Double;
var
  Params : TfdcParams;
  Form   : TNoticePayForm;
begin
  Result := -1;
  try
    dsSubject.ParamByName('Id').Value := dsDataDecl_Id.Value;
    dsSubject.Active := True;
    Params := TfdcParams.Create(nil);
    Params.CreateParam(ftFloat,  'new SubjId',   ptUnknown).Value := dsSubject.FieldByName('Subject_Id').Value;
    Params.CreateParam(ftString, 'new SubjName', ptUnknown).Value := dsSubject.FieldByName('Decl_Name').Value;
    Params.CreateParam(ftString, 'new SubjInn',  ptUnknown).Value := dsSubject.FieldByName('Decl_Inn').Value;
    Params.CreateParam(ftString, 'new SubjKpp',  ptUnknown).Value := dsSubject.FieldByName('Decl_Kpp').Value;
    Form := (GetObjectServices.CreateObject('NoticePay', True, Params) as TNoticePayForm);
    if (Form <> nil) then
      Result := Form.dsDataID.Value;
  finally
    dsSubject.Active := False;
  end;
end;


function  TDeclCorrectForm.CreateAdvice: Double;
var
  Params : TfdcParams;
  Form   : TAdviceForm;
begin
  Result := -1;
  try
    dsSubject.ParamByName('Id').Value := dsDataDecl_Id.Value;
//    dsSubject.Active := True;
    dsSubject.Open;
    Params := TfdcParams.Create(nil);
    Params.CreateParam(ftFloat,  'new SubjId',   ptUnknown).Value := dsSubject.FieldByName('Subject_Id').Value;
    Params.CreateParam(ftString, 'new SubjName', ptUnknown).Value := dsSubject.FieldByName('Decl_Name').Value;
    Params.CreateParam(ftString, 'new SubjInn',  ptUnknown).Value := dsSubject.FieldByName('Decl_Inn').Value;
    Params.CreateParam(ftString, 'new SubjKpp',  ptUnknown).Value := dsSubject.FieldByName('Decl_Kpp').Value;
    Params.CreateParam(ftString, 'new TypeSysName',  ptUnknown).Value := 'AdvicePay';
    Form := (GetObjectServices.ShowForm('TAdvicePayForm', Params, nil) as TAdviceForm);
    //Form := (GetObjectServices.CreateObject('Advice', True, Params) as TAdviceForm);
    if (Form <> nil) then
      Result := Form.dsDataID.Value;
  finally
//    dsSubject.Active := False;
    dsSubject.Close;
  end;
end;


function  TDeclCorrectForm.CheckAdvice: boolean;
var
  v : variant;
begin
  v := sqlAdvice_AddChargeForDecl.Exec('pDeclID;pChargeID',[dsDataDecl_Id.AsFloat, FNewChargeId]);
  Result := (v = 1);
end;


function  TDeclCorrectForm.CheckNoticePay: boolean;
var
  v : variant;
begin
  v := sqlNoticePay_AddChargeForDecl.Exec('pDeclID;pChargeID',[dsDataDecl_Id.AsFloat, FNewChargeId]);
  Result := (v = 1);
end;


procedure TDeclCorrectForm.tabPaymentsNextExecute(Sender: TObject);
begin
  lciDocTypeNotice.Visible := False;
  lciDocTypeAdvice.Visible := True;
  rgDocType.ItemIndex := 0;
  lciDocTypeAdvice.Enabled :=  ( ChargeEditMode <> cemReturnSalvage );

  dxLayoutControl3Item4.Visible := True;

  // Установим точку отката
  sqlModifyCharge.QueryList.Session.Savepoint( 'tabPaymentsNext' );

  // Создадим блокировки
  dsSelected.First;
  while not dsSelected.Eof do
    begin
      dsSelected.Edit;
      dsSelected['new_id'] := sqlBackPayment.Exec(
          'id;summa;date;charge_id'
         ,[ dsSelected['ID']
           ,- dsSelected['summa_back']
           ,edtDate.Date
           ,dsData.ParamByName('ID').Value]
        );
      dsSelected['reserve_id'] := sqlBackPayment.ParamValues['reserve_id'];

      dsSelected.Post;
      dsSelected.Next;
    end;

     // Откроем НД с уведомлением
    dsSelected.First;
    with dsetAdvice do
       begin
         SetVariable( 'decl_id', dsData.FieldByName( 'decl_id' ).AsFloat );
         SetVariable( 'subject_id', dsSelected['subject_id'] );
        if Active then
           Refresh
        else
           Open;
        if IsEmpty then
         begin
           Append;
           FieldByName('subject_id').AsInteger := dsSelected['subject_id'];
           FieldByName('decl_name').AsString   := dsSelected['subject_name'];
         end
        else
           Edit;
   end;

   dsAdviceOrNotice.DataSet := dsetAdvice;

   PageControl.ActivePage := tabDoc;
end;

procedure TDeclCorrectForm.tabDocFinishUpdate(Sender: TObject);
begin
  edtDocDate.PostEditValue;
  edtDocNumber.PostEditValue;
  TAction(Sender).Enabled := not edtDocDate.DataBinding.DataLink.Field.IsNull
                             and not edtDocNumber.DataBinding.DataLink.Field.IsNull;
end;

procedure TDeclCorrectForm.tabDocNextUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := False;
end;

procedure TDeclCorrectForm.tabDocPrevUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := True;
end;

procedure TDeclCorrectForm.tabDocPrevExecute(Sender: TObject);
begin
  if lciDocTypeAdvice.Visible then
    // В разбивку по платёжкам
    begin
      sqlModifyCharge.QueryList.Session.RollbackToSavepoint( 'tabPaymentsNext' );

      PageControl.ActivePage := tabPayments;
    end

  else
    // В перевод в задолженность
    begin
      sqlModifyCharge.QueryList.Session.RollbackToSavepoint( 'tabAdModeNext' );

      PageControl.ActivePage := tabAdMode;
    end;
end;

procedure TDeclCorrectForm.tabDocFinishExecute(Sender: TObject);
  var
    lv_Sql   : TsqlOp;
    lv_DedId : Integer;
    lv_DecisionForm : TForm;
    lv_DecisionID : Double;
begin
  sqlModifyCharge.QueryList.Session.Savepoint( 'tabDocFinish' );

  try
    if lciDocTypeAdvice.Visible then
      // Уведомление
      begin
        dsetAdvice.CheckBrowseMode;
        // Добавим в уведомление списания и резервы
        if FIsKNP = 1 then
          begin
            if dsetAdvice.FieldByName( 'id' ).IsNull then
              begin
              lv_Sql := sqlAdviceKNPAdd;
              // Создаём уведомление
              fDocID := lv_Sql.Exec(
                         'doc_number;doc_date;subject_id',
                         [ dsetAdvice.FieldByName( 'doc_number' ).AsString
                          ,dsetAdvice.FieldByName( 'doc_date' ).AsDateTime
                          ,dsetAdvice.FieldByName( 'Subject_Id' ).AsFloat ]
              );
              dsetAdvice.FieldByName( 'id' ).AsFloat := fDocID;
              end
            else
            begin
               // Обновим уведомление
               fDocID := dsetAdvice.FieldByName( 'id' ).AsFloat;

               sqlAdviceUpd.Exec(
                    'id;doc_number;doc_date'
                    ,[ fDocID
                    ,dsetAdvice.FieldByName( 'doc_number' ).AsString
                    ,dsetAdvice.FieldByName( 'doc_date' ).AsDateTime ]
               );
            end;
            // Добавим в уведомление начисление
            sqlAdvice_AddCharge.Exec(
                   'ID;pChargeID'
                  ,[ fDocID
                  ,FNewChargeId ]
                );
            sqlGetKNPDeduction['result'] := 0.0;
            sqlAdvice_AddDeduction.Exec(
                'pAdviceID;pDeductionID'
               ,[ fDocID
                 ,sqlGetKNPDeduction.Exec(
                      'charge_id'
                     ,[ FNewChargeId ]
                    ) ]
              );
          end
        else
          begin
            while not dsSelected.Eof do
              begin
                if dsetAdvice.FieldByName( 'Subject_Id' ).AsFloat<>
                   dsSelected['subject_id'] then
                   begin
                      with  dsetAdvice do
                        begin
                           SetVariable( 'decl_id', dsData.FieldByName( 'decl_id' ).AsFloat );
                           SetVariable( 'subject_id', dsSelected['subject_id'] );
                           Refresh;
                           if IsEmpty then
                           begin
                              Append;
                              FieldByName('subject_id').AsInteger := dsSelected['subject_id'];
                              FieldByName('decl_name').AsString   := dsSelected['subject_name'];
                           end
                           else
                              Edit;
                       end;
                     exit;
                   end;
                if dsetAdvice.FieldByName( 'id' ).IsNull then
                begin
                  case rgDocType.ItemIndex of
                    0 : lv_Sql := sqlAdvicePayAdd;
                    1 : lv_Sql := sqlAdviceLevyAdd;
                  end;
                  // Создаём уведомление
                  fDocID := lv_Sql.Exec(
                       'doc_number;doc_date;subject_id',
                       [ dsetAdvice.FieldByName( 'doc_number' ).AsString
                        ,dsetAdvice.FieldByName( 'doc_date' ).AsDateTime
                        ,dsetAdvice.FieldByName( 'Subject_Id' ).AsFloat ]
                   );
                  dsetAdvice.FieldByName( 'id' ).AsFloat := fDocID;
                end
                else
               // Обновим уведомление
                begin
                  fDocID := dsetAdvice.FieldByName( 'id' ).AsFloat;

                  sqlAdviceUpd.Exec(
                      'id;doc_number;doc_date'
                     ,[ fDocID
                     ,dsetAdvice.FieldByName( 'doc_number' ).AsString
                     ,dsetAdvice.FieldByName( 'doc_date' ).AsDateTime ]
                     );

                end;

                // Добавим в уведомление начисление
                sqlAdvice_AddCharge.Exec(
                     'ID;pChargeID'
                    ,[ fDocID
                    ,FNewChargeId ]
                );
                sqlAdvice_AddDeduction.Exec(
                    'pAdviceID;pDeductionID'
                   ,[ fDocID
                     ,dsSelected['new_id'] ]
                  );

                sqlAdvice_AddReserve.Exec(
                    'pAdviceID;pReserveID'
                   ,[ fDocID
                     ,dsSelected['reserve_id'] ]
                  );

                // Выполним автоматическое подписание решения (проверки внутри)
                sqlAdviceDecisionAuto.Exec(
                   'pAdviceId;pFromClient'
                  , [fDocID, 1]
                );

                dsSelected.Next;
              end;
          end;
      end

    else
      // Требование
      begin
        dsetNotice.CheckBrowseMode;
        if dsetNotice.FieldByName( 'id' ).IsNull then
          begin
            // Получить ID участника ВЭД
            dsSubject.ParamByName('Id').Value := dsData.FieldByName( 'Decl_Id' ).Value;
            dsSubject.Open;

            // Создаём требование
            fDocID := sqlNoticePayAdd.Exec(
                         'doc_number;doc_date;subject_id',
                         [ dsetNotice.FieldByName( 'doc_number' ).AsString
                          ,dsetNotice.FieldByName( 'doc_date' ).AsDateTime
                          ,dsSubject.FieldByName( 'Subject_Id' ).AsFloat ]
              );

            dsSubject.Close;
          end

        else
          // Обновим требование
          begin
            fDocID := dsetNotice.FieldByName( 'id' ).AsFloat;

            sqlNoticePayUpd.Exec(
                'id;doc_number;doc_date'
               ,[ fDocID
                 ,dsetNotice.FieldByName( 'doc_number' ).AsString
                 ,dsetNotice.FieldByName( 'doc_date' ).AsDateTime ]
              );
          end;

        sqlNoticePay_AddCharge.Exec(
            'pID;pChargeId'
           ,[ fDocID
             ,FNewChargeId ]
          );
      end;

    if ChargeEditMode = cemReturnSalvage then
    begin
      // провести все созданные документы (включая уведомление)
      sqlActivateBufferFull.Exec;
//      MainData.RegisterEvent('RET','00018',FloatToStr(fDocID));

      // создать новое (!) решение, независимо от наличия неподписанного
      lv_DecisionID := sqlCreateDecisionPay.Exec('SubjectId;Summa',[FSubjectId,dsDataDelta.Value]);
      sqlLinkWithAdvice.Exec( 'Id;pDecisionID', [fDocId,lv_DecisionID] );
    end
    else
      begin
        // провести все созданные документы (исключая уведомление)
        sqlActivateBuffer1.Exec('pDocId',[fDocID]);
      end;

  except
    sqlModifyCharge.QueryList.Session.RollbackToSavepoint( 'tabDocFinish' );
    raise;
  end;

  sqlModifyCharge.QueryList.Session.Commit;

  ModalResult := mrOK;
end;

procedure TDeclCorrectForm.dsetAdviceApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

procedure TDeclCorrectForm.dsetAdviceAfterOpen(DataSet: TDataSet);
  var
    i : Integer;
begin
  for i := 0 to DataSet.FieldCount - 1 do
    DataSet.Fields[i].Required := False;
end;

procedure TDeclCorrectForm.FormDestroy(Sender: TObject);
begin
  inherited;

  if chBDocShow.Checked and (fDocID > 0) then
    GetObjectServices.OpenObject( fDocID, nil );
end;

procedure TDeclCorrectForm.dsKBKBeforeOpen(DataSet: TDataSet);
begin
  dsKBK.ParamByName( 'kbk_id'   ).Value := dsData.FieldByName( 'kbkcode_id' ).Value;
  dsKBK.ParamByName( 'doc_date' ).Value := GetActiveDocumentDate;
end;

procedure TDeclCorrectForm.ModifyKNP;
begin
  try
    dsData.CheckBrowseMode;
    sqlModifyCharge['result'] := 0.0;
    FNewChargeId := sqlModifyCharge.Exec(
        'cause_id;descrip;pdate;debt;is_ts'
       ,[ cmbxCause.EditValue
         ,edtDescrp.Lines.Text
         ,edtDate.EditValue
         ,0
         ,FIsTS ]
      );
    sqlPayKNP.Exec('ID',[FNewChargeId]);
 //   sqlModifyCharge.QueryList.Session.Commit;
  except
    sqlModifyCharge.QueryList.Session.Rollback;
    raise;
  end;
end;

procedure TDeclCorrectForm.tabAdModeShow(Sender: TObject);
begin
  inherited;

  btnMakeDebt.Enabled := fDeclTypeSysName <> 'SubjectFeeFine';
end;

procedure TDeclCorrectForm.rgDocTypePropertiesChange(Sender: TObject);
begin
  if not(FIsKNP = 1) then
    begin
      dsetAdvice.Close;
      if rgDocType.ItemIndex = 0 Then
        dsetAdvice.SetVariable('TypeSysName','AdvicePay')
      else
        dsetAdvice.SetVariable('TypeSysName','AdviceLevy');
      dsetAdvice.Open;
     if dsetAdvice.IsEmpty then
       begin
         dsetAdvice.Append;
         dsetAdvice.FieldByName('subject_id').AsInteger := dsSelectedSubject_ID.AsInteger;
         dsetAdvice.FieldByName('decl_name').AsString   := dsSelectedsubject_name.AsString;
       end;
    end;
end;

end.

