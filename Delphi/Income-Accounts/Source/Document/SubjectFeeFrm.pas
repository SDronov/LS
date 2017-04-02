unit SubjectFeeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxButtonEdit, fdcObjectLinkEdit, cxMaskEdit, QueryList, fdcObjectCore, SubjIntf,
  cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit;

type
  TSubjectFeeForm = class(TObjectForm, ISubjectHolder, IDocumentHolder)
    dsDataMODIFY_DATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataACT_NO: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_NAME: TStringField;
    lcGeneralItem1: TdxLayoutItem;
    edtPayerINN: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    edtKPP: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtPayerName: TfdcObjectLinkEdit;
    lcGeneralGroup1: TdxLayoutGroup;
    DocNumber: TcxDBMaskEdit;
    lciDocNumber: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    lciDocDate: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    tabCharge: TcxTabSheet;
    tabPayments: TcxTabSheet;
    QueryList1: TQueryList;
    sqlCheckINN: TsqlOp;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    lcGeneralItem4: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    dsDataCURRENCY_ID: TFloatField;
    tabErrors: TcxTabSheet;
    dsDataerr_count: TIntegerField;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    actGroundsRemoveFines: TAction;
    actActivate: TAction;
    sqlCheckActivate: TsqlOp;
    sqlActivate: TsqlOp;
    barBtnActivate: TdxBarButton;
    procedure tabChargeShow(Sender: TObject);
    procedure tabPaymentsShow(Sender: TObject);
    procedure edtPayerNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtPayerINNPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edtKPPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabErrorsShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGroundsRemoveFinesExecute(Sender: TObject);
    procedure actGroundsRemoveFinesUpdate(Sender: TObject);
    procedure dsDataAfterRefresh(DataSet: TDataSet);
    procedure actActivateUpdate(Sender: TObject);
    procedure actActivateExecute(Sender: TObject);
  private
    { Private declarations }
    FChargeForm: TForm;
    FPayForm: TForm;
    FErrorForm: TForm;
    fIsActive : Boolean;
  protected
    procedure HandleRefresh; override;
  public
    function GetSubjectINN: String;
    function GetSubjectId: Double;
    function GetSubjectKPP: String;
    function GetSubjectName: String;
    function GetDocumentDate: TDateTime;
    function GetDocumentNumber: String;
  end;

var
  SubjectFeeForm: TSubjectFeeForm;

implementation

uses MainDm, FormUtils, ObjectGridFrm, CheckUtils, GroundRemoveFinesFrm,
  fdcCustomCardFrm, DictDm;

{$R *.dfm}

procedure TSubjectFeeForm.HandleRefresh;
begin
  inherited;
  if Assigned(FChargeForm) then
      TObjectGridForm(FChargeForm).RefreshData;
  if Assigned(FPayForm) then
      TObjectGridForm(FPayForm).RefreshData;
end;

procedure TSubjectFeeForm.tabChargeShow(Sender: TObject);
begin
  inherited;
  ShowTabForm(FChargeForm, 'TDeclChargeGridForm', Params, TWinControl(Sender), Self);
end;

procedure TSubjectFeeForm.tabPaymentsShow(Sender: TObject);
begin
  inherited;
  ShowTabForm(FPayForm, 'TDeclPaymentGridForm', Params, TWinControl(Sender), Self);
end;

procedure TSubjectFeeForm.edtPayerNameBeforeAcceptObject(Sender: TObject;
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

procedure TSubjectFeeForm.edtPayerINNPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S: String;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
        CheckINN(S);
    sqlCheckINN.Exec('INN;KPP', [S, dsDATADecl_KPP.Value]);
  except
   on E: Exception do
   begin
     Error := True;
     ErrorText := E.Message;
   end;
  end;
end;

procedure TSubjectFeeForm.edtKPPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S: String;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
        CheckKPP(S);
    sqlCheckINN.Exec('INN;KPP', [dsDataDECL_INN.Value, S]);
  except
   on E: Exception do
   begin
     Error := True;
     ErrorText := E.Message;
   end;
  end;
end;

procedure TSubjectFeeForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsDataSUBJECT_ID.ReadOnly := not dsDataSUBJECT_ID.IsNull;
  fIsActive := sqlCheckActivate.Exec <> 0;
  //--
  if (IsNew) then
    begin
      dsDataCURRENCY_ID.Value := DictData.dsCurrency.Lookup( 'CODE', '643', 'ID' );
    end;
  //--
end;

function TSubjectFeeForm.GetSubjectId: Double;
begin
  Result := dsDataSUBJECT_ID.Value;
end;

function TSubjectFeeForm.GetSubjectINN: String;
begin
  Result := dsDataDECL_INN.Value;
end;

function TSubjectFeeForm.GetSubjectKPP: String;
begin
  Result := dsDataDECL_KPP.Value;
end;

function TSubjectFeeForm.GetSubjectName: String;
begin
  Result := dsDataDECL_NAME.Value;
end;

function TSubjectFeeForm.GetDocumentDate: TDateTime;
begin
  Result := dsDataDOC_DATE.AsDateTime;
end;

function TSubjectFeeForm.GetDocumentNumber: String;
begin
  Result := dsDataDOC_NUMBER.AsVariant;
end;

procedure TSubjectFeeForm.tabErrorsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FErrorForm) then
  begin
     FErrorForm := ObjectServices.ShowForm('TCustomDeclErrorGridForm', Params, TWinControl(Sender));
     TObjectForm(FErrorForm).RegisterWaiter(Self);
  end;
end;

procedure TSubjectFeeForm.FormShow(Sender: TObject);
begin
  inherited;
    tabErrors.TabVisible := dsDataERR_COUNT.Value > 0;
end;

procedure TSubjectFeeForm.actGroundsRemoveFinesExecute(Sender: TObject);
begin
  inherited;
  with ObjectServices.CreateObject( 'GroundRemoveFines', False, nil ) as TGroundRemoveFinesForm do
    begin
      dsData.FieldByName( 'DECL_ID' ).AsFloat := Self.dsData.FieldByName( 'id' ).AsFloat;
    end;
  RefreshData;
end;

procedure TSubjectFeeForm.actGroundsRemoveFinesUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty
                             and (dsData.FieldByName( 'TYPESYSNAME' ).AsString = 'SubjectFeeFine')
                             and (dsData.FieldByName( 'ERR_COUNT' ).AsInteger > 0);

end;

procedure TSubjectFeeForm.dsDataAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  fIsActive := sqlCheckActivate.Exec <> 0;
end;

procedure TSubjectFeeForm.actActivateUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Enabled := not IsNew
                             and not fIsActive;
end;

procedure TSubjectFeeForm.actActivateExecute(Sender: TObject);
begin
  inherited;

  if MessageDlg( 'Провести документ?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    begin
      sqlActivate.Exec;

      RefreshData;
      HandleRefresh;
    end;
end;

initialization
     RegisterClass(TSubjectFeeForm);

end.
