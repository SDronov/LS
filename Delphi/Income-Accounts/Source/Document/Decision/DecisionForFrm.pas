unit DecisionForFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionFrm, cxGraphics, OracleData, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCheckBox, cxDBEdit, fdcObjectLookupEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, cxButtonEdit,
  fdcObjectLinkEdit, cxMaskEdit, cxMemo, cxTextEdit, cxPC, cxControls,
  cxCurrencyEdit, ExtCtrls, cxGroupBox, cxRadioGroup, fdcObjectCore,
  QueryList;

type
  TDecisionForForm = class(TDecisionForm)
    lcgDeclarantDest: TdxLayoutGroup;
    lciDeclInnDest: TdxLayoutItem;
    edtDeclINNDest: TcxDBMaskEdit;
    lciDeclKppDest: TdxLayoutItem;
    edtDeclKppDest: TcxDBMaskEdit;
    lciDeclNameDest: TdxLayoutItem;
    edtDeclNameDest: TfdcObjectLinkEdit;
    lcGeneralGroup6: TdxLayoutGroup;
    lcgSumma: TdxLayoutGroup;
    lciSumma: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    lciCurrency: TdxLayoutItem;
    edtCurrID: TfdcObjectLookupEdit;
    dsDataREASON: TIntegerField;
    dsDataSUB_ID_DEST: TFloatField;
    dsDataSUB_NAME_DEST: TStringField;
    dsDataSUB_INN_DEST: TStringField;
    dsDataSUB_KPP_DEST: TStringField;
    dsDataCURRENCY_ID: TFloatField;
    cxDBRadioGroup1: TcxDBRadioGroup;
    lcGeneralItem3: TdxLayoutItem;
    dsDataSUMMA: TFloatField;
    tabPaymentOrder1: TcxTabSheet;
    procedure edtDeclNameDestBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsInsertAfterPost(DataSet: TDataSet);
    procedure tabPaymentOrder1Show(Sender: TObject);
    procedure cxDBRadioGroup1PropertiesChange(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure dsDataBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FPaymentOrderGridForm : TForm;
  public
    { Public declarations }
    vPoID         : INTEGER;
  end;

var
  DecisionForForm: TDecisionForForm;

implementation

uses
  ObjectFrm, fdcCustomCardFrm, fdcCustomDataFrm, DocRManagementFrm, FormUtils,
  fdcCustomObjectFrm, MainFrm,TRGridFrm, fdcObjectServices, fdcCustomObjectGridFrm,
  CancelDecisionPaybackFrm;

{$R *.dfm}
procedure TDecisionForForm.edtDeclNameDestBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  if AObject = nil then
  begin
     dsDataSUB_INN_DEST.Clear;
     dsDataSUB_KPP_DEST.Clear;
  end
  else
  begin
    dsData['SUB_INN_DEST'] := AObject.FieldValues['INN'];
    dsData['SUB_KPP_DEST'] := AObject.FieldValues['KPP'];
  end;
  Modify(nil);
end;

procedure TDecisionForForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsDataSUMMA.ReadOnly        := not dsDataSUMMA.IsNull;
  dsDataSUBJECT_ID.ReadOnly   := not dsDataSUBJECT_ID.IsNull;
  dsDataDECL_INN.ReadOnly     := not dsDataSUBJECT_ID.IsNull;
  dsDataDECL_KPP.ReadOnly     := not dsDataSUBJECT_ID.IsNull;
  dsDataSUB_ID_DEST.ReadOnly  := not dsDataSUB_ID_DEST.IsNull;
  dsDataSUB_INN_DEST.ReadOnly := not dsDataSUB_INN_DEST.IsNull;
  dsDataSUB_KPP_DEST.ReadOnly := not dsDataSUB_KPP_DEST.IsNull;
  edtSignDate.Enabled         := not dsDataSUMMA.IsNull;
  edtSignBy.Enabled           := not dsDataSUMMA.IsNull;
  edtSignByChief.Enabled      := not dsDataSUMMA.IsNull;
  If dsDataREASON.IsNull then
       dsDataREASON.Value:=0;

  if dsDataREASON.Value = 1 then begin
     lciAppDate.Enabled        := False;
     lciAppDateIncome.Enabled  := False;
     lciAppNumber.Enabled      := False;
  end;
  if dsDataSUMMA.ReadOnly then begin
    lciSumma.Tag    := 33;
    lciCurrency.Tag := 33;
  end;
  if dsDataSUBJECT_ID.ReadOnly then begin
    lciDeclName.Tag  := 33;
    lciDeclINN.Tag   := 33;
    lciDeclKPP.Tag   := 33;
  end;
  if dsDataSUB_ID_DEST.ReadOnly then begin
    lciDeclNameDest.Tag  := 33;
    lciDeclINNDest.Tag   := 33;
    lciDeclKPPDest.Tag   := 33;
  end;
  UpdateLayoutControl(not dsData.ReadOnly, lcGeneral);
end;

procedure TDecisionForForm.dsInsertAfterPost(DataSet: TDataSet);
begin
  inherited;
    edtSignDate.Enabled       :=True;
    edtSignBy.Enabled         :=True;
end;

procedure TDecisionForForm.tabPaymentOrder1Show(Sender: TObject);
begin
  if not Assigned(FPaymentOrderGridForm) then begin
    Params.ParamValues['Form'] := Integer(Self);
    Params.ParamValues['pDecID'] := self.dsDataID.Value;
    FPaymentOrderGridForm := ShowForm('TDecisionForPaymentOrderGridForm', Params, tabPaymentOrders);
    TObjectForm(FPaymentOrderGridForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FPaymentOrderGridForm));
//    TfdcCustomObjectGridForm(FPaymentOrderGridForm).actAdd.Visible:= False;
//    TfdcCustomObjectGridForm(FPaymentOrderGridForm).actDelete.Visible:= False;
  end;
end;

procedure TDecisionForForm.cxDBRadioGroup1PropertiesChange(
  Sender: TObject);
begin
   if cxDBRadioGroup1.ItemIndex = 0 then
   begin
     lciAppDate.Enabled       := True;
     lciAppDateIncome.Enabled := True;
     lciAppNumber.Enabled     := True;
   end
   else
   begin
     lciAppDate.Enabled       := False;
     lciAppDateIncome.Enabled := False;
     lciAppNumber.Enabled     := False;
   end;
   modify(nil);
end;

procedure TDecisionForForm.actSaveExecute(Sender: TObject);
begin
  dsInsert.ParamByName('PO_ID').AsInteger  := vPoID;
  inherited;
end;

procedure TDecisionForForm.dsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
    If dsDataREASON.IsNull then
       dsDataREASON.Value:=0;
end;

initialization
  RegisterClass( TDecisionForForm );

end.
