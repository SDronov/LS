unit DocRManagementFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxDropDownEdit, cxCalendar, cxMaskEdit, fdcObjectCore, QueryList, fdcWord, SubjIntf,
  cxCheckBox;

type
  TDocRManagementForm = class(TObjectForm, ISubjectHolder, IDocumentHolder)
    edtDocDate: TcxDBDateEdit;
    edtDeclarant: TfdcObjectLinkEdit;
    lciDeclarant: TdxLayoutItem;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    lciDocDate: TdxLayoutItem;
    tabPaymentOrder: TcxTabSheet;
    tabDecl: TcxTabSheet;
    edtDeclINN: TcxDBMaskEdit;
    lciDeclInn: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lciDeclKPP: TdxLayoutItem;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    lcgDeclarant: TdxLayoutGroup;
    QueryList1: TQueryList;
    sqlCheckINN: TsqlOp;
    lcgDeclarantInnKpp: TdxLayoutGroup;
    actPrint: TAction;
    btnPrint: TdxBarButton;
    dsDataDECL_OKPO: TStringField;
    dsDataDECL_ADDRESS: TStringField;
    dsPaymentOrderList: TfdcQuery;
    dsDeclList: TfdcQuery;
    dsPaymentOrderListNAME: TStringField;
    dsDeclListNAME: TStringField;
    dsReport: TfdcQuery;
    dsArticleList: TfdcQuery;
    edtDocNUmber: TcxDBTextEdit;
    lciDocNumber: TdxLayoutItem;
    lcDoc: TdxLayoutGroup;
    dsDataIS_TS: TStringField;
    lciIsTS: TdxLayoutItem;
    cxDBIsTS: TcxDBCheckBox;
    dsDataIS_ACTIVE: TStringField;
    lcTemp: TdxLayoutItem;
    lciIsActive: TdxLayoutItem;
    edtIsActive: TcxDBCheckBox;
    lciActivationDate: TdxLayoutItem;
    edtActivationDate: TcxDBDateEdit;
    lcActiveDoc: TdxLayoutGroup;
    lcDocTS: TdxLayoutGroup;
    dsDataACTIVATION_DATE: TDateTimeField;
    procedure tabPaymentOrderShow(Sender: TObject);
    procedure tabDeclShow(Sender: TObject);
    procedure edtDeclarantBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtDeclINNPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edtDeclKPPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actPrintExecute(Sender: TObject);
    procedure actPrintUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
  protected
    FPaymentOrderGridForm : TForm;
    FPaymentOrderPayBackGridForm : TForm;
    FCDeclGridForm        : TForm;
    function GetTemplateReportName : String; virtual; abstract;
    procedure AddParamsToReport(Word: TWordClass); virtual;
  public
    function GetSubjectINN: String;
    function GetSubjectId: Double;
    function GetSubjectKPP: String;
    function GetSubjectName: String;
    function GetDocumentDate: TDateTime;
  public

  end;

implementation

uses CheckUtils, fdcCustomDBDataFrm, fdcCustomCardFrm;

{$R *.dfm}

procedure TDocRManagementForm.tabPaymentOrderShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FPaymentOrderGridForm) then begin
    FPaymentOrderGridForm := ShowForm('TRManPaymentOrderGridForm', Params, tabPaymentOrder);
    TObjectForm(FPaymentOrderGridForm).RegisterWaiter(Self);
  end;
end;

procedure TDocRManagementForm.tabDeclShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FCDeclGridForm) then
    FCDeclGridForm := ShowForm('TRManCDeclGridForm', Params, tabDecl);
end;

procedure TDocRManagementForm.edtDeclarantBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
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
  Modify(nil);
end;

procedure TDocRManagementForm.edtDeclINNPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  S: String;
begin
  inherited;
  try
    S := VarToStr(DisplayValue);
    if S <> '' then
      CheckINN(S);
    sqlCheckINN.Exec('INN;KPP', [S, dsDataDECL_KPP.Value]);
  except
   on E: Exception do
   begin
     Error := True;
     ErrorText := E.Message;
   end;
  end;
end;

procedure TDocRManagementForm.edtDeclKPPPropertiesValidate(Sender: TObject;
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

procedure TDocRManagementForm.actPrintExecute(Sender: TObject);
var
  Word : TWordClass;
begin
  Word := TWordClass.Create;
  Word.CreateApp;
  Word.Open(ExtractFilePath(Application.ExeName) + 'Report\' + GetTemplateReportName);
  AddParamsToReport(Word);
  Word.AppVisible := True;
//  Word.SaveAs('c:\1.doc');
//  Word.CloseApp;
  Word.Free;
end;

procedure TDocRManagementForm.AddParamsToReport(Word: TWordClass);
begin
  dsReport.Open;
  Word.ReplaceRecFromQuery(dsReport);
  dsReport.Close;
  dsPaymentOrderList.Open;
  Word.GetArrayFromDataSet(dsPaymentOrderList, 'NAME', 'PO_LIST', '; ');
  dsPaymentOrderList.Close;
  dsDeclList.Open;
  Word.GetArrayFromDataSet(dsDeclList, 'NAME', 'DECL_LIST', '; ');
  dsDeclList.Close;
end;

procedure TDocRManagementForm.actPrintUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := not IsNew;
end;

function TDocRManagementForm.GetDocumentDate: TDateTime;
begin
  Result := dsDataDOC_DATE.Value;
end;

function TDocRManagementForm.GetSubjectId: Double;
begin
  Result := dsDataSUBJECT_ID.Value;
end;

function TDocRManagementForm.GetSubjectINN: String;
begin
  Result := dsDataDECL_INN.Value;
end;

function TDocRManagementForm.GetSubjectKPP: String;
begin
  Result := dsDataDECL_KPP.Value;
end;

function TDocRManagementForm.GetSubjectName: String;
begin
  Result := dsDataDECL_NAME.Value;
end;

procedure TDocRManagementForm.FormShow(Sender: TObject);
var
  Param: TParam;
begin
  inherited;

  dsDataIS_TS.ReadOnly   := not dsDataIS_TS.IsNull;

  if dsDataIS_TS.ReadOnly then begin
    cxDBIsTS.Tag := 33;
  end;

  Param := Params.FindParam('new SubjName');
  if assigned(Param) then
     dsDataDecl_Name.Value := Param.AsString;

  Param := Params.FindParam('new SubjInn');
  if assigned(Param) then
    dsDataDecl_Inn.Value := Param.AsString;

  Param := Params.FindParam('new SubjKpp');
  if assigned(Param) then
    dsDataDecl_Kpp.Value := Param.AsString;

  Param := Params.FindParam('new SubjId');
  if assigned(Param) then
    dsDataSubject_Id.Value := Param.AsFloat;
end;

procedure TDocRManagementForm.actSaveExecute(Sender: TObject);
begin
  inherited;

  dsDataIS_TS.ReadOnly   := not dsDataIS_TS.IsNull;

  if dsDataIS_TS.ReadOnly then begin
    cxDBIsTS.Tag := 33;
  end;

end;

initialization
  RegisterClass(TDocRManagementForm);

end.
