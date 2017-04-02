unit PaymentOrderNonIDFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit, cxGraphics,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit,
  cxCurrencyEdit, fdcObjectCore;

type
  TPaymentOrderNonIDForm = class(TDocumentForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataEXEC_DATE: TDateTimeField;
    dsDataPAYER_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDOC_SUMMA: TFloatField;
    dsDataDOC_NO2: TStringField;
    dsDataDOC_DATE2: TDateTimeField;
    dsDataNREF: TStringField;
    dsDataNAME_K: TStringField;
    dsDataINN_K: TStringField;
    dsDataKPP_K: TStringField;
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataNOTE: TStringField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataPAYMENT_ORDER_TYPE_ID: TFloatField;
    dsDataPAYMENT_ORDER_ID: TFloatField;
    dsDataPO_TYPE_NAME: TStringField;
    lcgPayer: TdxLayoutGroup;
    edtPayerINN: TcxDBTextEdit;
    lciPayerINN: TdxLayoutItem;
    edtPayerKPP: TcxDBTextEdit;
    lciPayerKPP: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    edtPayerName: TfdcObjectLinkEdit;
    lciPayerName: TdxLayoutItem;
    lcgPay: TdxLayoutGroup;
    edtCurrency: TfdcObjectLookupEdit;
    lciCurrency: TdxLayoutItem;
    edtPayType: TfdcObjectLookupEdit;
    lcyPayType: TdxLayoutItem;
    edtDocSumma: TcxDBCurrencyEdit;
    lciDocSumma: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    edtSumma: TcxDBCurrencyEdit;
    lciSumma: TdxLayoutItem;
    lcGeneralGroup5: TdxLayoutGroup;
    edtExecDate: TcxDBDateEdit;
    lciExecDate: TdxLayoutItem;
    lcGeneralGroup6: TdxLayoutGroup;
    edtIncomeDate: TcxDBDateEdit;
    lciIncomingDate: TdxLayoutItem;
    lcGeneralGroup7: TdxLayoutGroup;
    edtPayTypeName: TcxDBTextEdit;
    lciPayTypeName: TdxLayoutItem;
    lcGeneralGroup8: TdxLayoutGroup;
    actCreateSubj: TAction;
    barBtnCreateSubj: TdxBarButton;
    tabErrors: TcxTabSheet;
    dsDataNAME_P: TStringField;
    dsDataINN_P: TStringField;
    dsDataKPP_P: TStringField;
    dsDataRECIPIENT_ID: TFloatField;
    dsDataKBK: TStringField;
    edtKBK: TcxDBTextEdit;
    lciKBK: TdxLayoutItem;
    dsDataDESTCUSTOMSCODE: TStringField;
    tabDocPack: TcxTabSheet;
    dsDataBIK_P: TStringField;
    dsDataACCOUNT_P: TStringField;
    edtPayerBIK: TcxDBTextEdit;
    lciGeneralPayerBIK: TdxLayoutItem;
    edtPayerAccount: TcxDBTextEdit;
    lciGeneralPayerAccount: TdxLayoutItem;
    lcGeneralGroup9: TdxLayoutGroup;
    lcgGeneralRecepient: TdxLayoutGroup;
    dsDataBIK_K: TStringField;
    dsDataACCOUNT_K: TStringField;
    edtRecepientINN: TcxDBTextEdit;
    lciGeneralRecepientINN: TdxLayoutItem;
    edtRecepientKPP: TcxDBTextEdit;
    lciGeneralRecepientKPP: TdxLayoutItem;
    edtRecepientName: TcxDBTextEdit;
    lciGeneralRecepientName: TdxLayoutItem;
    lcGeneralGroup10: TdxLayoutGroup;
    edtRecepientBIK: TcxDBTextEdit;
    lciGeneralRecepientBIK: TdxLayoutItem;
    edtRecepientAccount: TcxDBTextEdit;
    lciGeneralRecepientAccount: TdxLayoutItem;
    lcGeneralGroup11: TdxLayoutGroup;
    lcgGeneralVals: TdxLayoutGroup;
    edtValPaymentReason: TcxDBTextEdit;
    lciGeneralValPaymentReason: TdxLayoutItem;
    dsDataVAL_PAYMENT_REASON: TStringField;
    dsDataVAL_DOC_NUMBER: TStringField;
    dsDataVAL_DOC_DATE: TDateTimeField;
    dsDataVAL_PAYMENT_TYPE: TStringField;
    edtValPaymentType: TcxDBTextEdit;
    lciGeneralValPaymentType: TdxLayoutItem;
    edtValDocNumber: TcxDBTextEdit;
    lciGeneralValDocNumber: TdxLayoutItem;
    lcGeneralGroup12: TdxLayoutGroup;
    edtValDocDate: TcxDBDateEdit;
    lciGeneralValDocDate: TdxLayoutItem;
    lcGeneralGroup13: TdxLayoutGroup;
    dsDataCUSTOMS_ID: TFloatField;
    lcGeneralGroup14: TdxLayoutGroup;
    edtDestCustomsCode: TfdcObjectLinkEdit;
    lciDestCustoms: TdxLayoutItem;
    lcgDestCustomsCode: TdxLayoutGroup;
    edtDestCustomsName: TcxTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    lciUIN: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataUIN: TStringField;
    EdtUIN: TcxDBTextEdit;
    lcUIN: TdxLayoutItem;
    edtUIN2: TcxDBTextEdit;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actCreateSubjExecute(Sender: TObject);
    procedure actCreateSubjUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure dsDataChange(Sender: TField);
    procedure dsStateAfterOpen(DataSet: TDataSet);
    procedure tabErrorsShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabDocPackShow(Sender: TObject);
    procedure edtPayerNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtDestCustomsCodeBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtDestCustomsCodeAfterAcceptObject(Sender: TObject);
  private
    fErrorForm : TForm;
    FDocPackGridForm : TForm;
    function IsSubjectNonId: Boolean;
  public
    { Public declarations }
  end;

var
  PaymentOrderNonIDForm: TPaymentOrderNonIDForm;

implementation

{$R *.dfm}

uses
  MainDM
 ,DictDM
 ,ObjectFrm, fdcCustomObjectFrm, fdcCustomCardFrm, fdcCustomDBDataFrm;

procedure TPaymentOrderNonIDForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  if IsSubjectNonId and dsDataPAYER_ID.IsNull then
    lciPayerName.Tag := 21
  else
    lciPayerName.Tag := 23;
  if (dsDataTYPESYSNAME.Value = 'PaymentOrderNonIDDest') and dsDataPAYMENT_ORDER_ID.IsNull then
    lciDestCustoms.Tag := 21
  else
    lciDestCustoms.Tag := 33;
  edtDestCustomsCode.Properties.Buttons[0].Visible := (lciDestCustoms.Tag <> 33);
  inherited;
  dsData.ReadOnly := False;
  tabErrors.TabVisible := not DataSet.IsEmpty and
                         (dsDataTYPESYSNAME.Value = 'PaymentOrderNonID');
end;

type
  TApplication_ = class(TComponent)
  protected
    FHandle: HWnd;
    FBiDiMode: TBiDiMode;
    FBiDiKeyboard: string;
    FNonBiDiKeyboard: string;
    FObjectInstance: Pointer;
    FMainForm: TForm;
    FMouseControl: TControl;
    FHelpSystem : IInterface;
    FHelpFile: string;
    FHint: string;
    FHintActive: Boolean;
    FUpdateFormatSettings: Boolean;
    FUpdateMetricSettings: Boolean;
    FShowMainForm: Boolean;
    FHintColor: TColor;
    FHintControl: TControl;
    FHintCursorRect: TRect;
    FHintHidePause: Integer;
    FHintPause: Integer;
    FHintShortCuts: Boolean;
    FHintShortPause: Integer;
    FHintWindow: THintWindow;
    FShowHint: Boolean;
    FTimerMode: TTimerMode;
    FTimerHandle: Word;
    FTitle: string;
    FTopMostList: TList;
    FTopMostLevel: Integer;
    FIcon: TIcon;
    FTerminate: Boolean;
    FActive: Boolean;
    FAllowTesting: Boolean;
    FTestLib: THandle;
    FHandleCreated: Boolean;
    FRunning: Boolean;
    FWindowHooks: TList;
    FWindowList: Pointer;
    FDialogHandle: HWnd;
    FAutoDragDocking: Boolean;
    FModalLevel: Integer;
  end;

function AddParam(AParams: TParams; const Name: string; const Value: Variant): TParam;
begin
  Result := TParam(AParams.Add);
  try
    Result.ParamType := ptInputOutput;
    Result.Name := Name;
    Result.Value := Value;
  except
    Result.Free;
    raise;
  end;
end;

procedure TPaymentOrderNonIDForm.actCreateSubjExecute(Sender: TObject);
var
  AForm      : TObjectForm;
  Params     : TfdcParams;
  fINN, fKPP : TField;
begin
  inherited;
  Params := TfdcParams.Create(nil);
  try
    AddParam(Params, 'new name', dsData.FieldByName( 'NAME_P' ).Value);
    AddParam(Params, 'new inn',  dsData.FieldByName( 'INN_P' ).Value );
    AddParam(Params, 'new kpp',  dsData.FieldByName( 'KPP_P' ).Value );
    Inc(TApplication_(Application).FModalLevel);
    try
      AForm := ObjectServices.CreateObject('Subject', True, Params) as TObjectForm;
      if assigned(AForm) and not AForm.IsNew then
      begin
        fINN := AForm.dsData.FindField('INN');
        fKPP := AForm.dsData.FindField('KPP');
        if     Assigned( fINN )
           and Assigned( fKPP )
           and ( fINN.AsString = dsData.FieldByName( 'INN_P' ).AsString )
           and ( fKPP.AsString = dsData.FieldByName( 'KPP_P' ).AsString ) then
          begin
            dsData.FieldByName( 'PAYER_ID' ).Value := AForm.ID;
            dsData.FieldByName( 'Name_P' ).Clear;
            dsData.FieldByName( 'Name_P' ).Value := AForm.dsDataNAME.Value;
          end;
      end;
    finally
       Dec(TApplication_(Application).FModalLevel);
    end;
  finally
     Params.Free;
  end;
end;

procedure TPaymentOrderNonIDForm.actCreateSubjUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := not IsNew
                         and IsSubjectNonId
                         and ( dsState.FieldByName( 'SysName' ).AsString <> 'State.PaymentOrderNonID.Identified' );
end;

procedure TPaymentOrderNonIDForm.actSaveExecute(Sender: TObject);
begin
  inherited;

  // Откроем форму с созданным п/п
  ObjectServices.OpenObject( dsData.FieldByName( 'payment_order_id' ).AsFloat, nil );

  // Закроем неидентифицированный платёж
  Close;
end;

procedure TPaymentOrderNonIDForm.dsDataChange(Sender: TField);
begin
  inherited;

  Modify( Sender );
end;

procedure TPaymentOrderNonIDForm.dsStateAfterOpen(DataSet: TDataSet);
begin
  inherited;

  lciPayerName.Enabled := not IsNew
                      and IsSubjectNonId
                      and not dsState.IsEmpty
                      and ( dsState.FieldByName( 'SysName' ).AsString <> 'State.PaymentOrderNonID.Identified' );
end;

procedure TPaymentOrderNonIDForm.tabErrorsShow(Sender: TObject);
begin
  if not Assigned( fErrorForm ) then
    fErrorForm := ShowForm( 'TPaymentOrderErrorGridForm', Params, tabErrors );
end;

procedure TPaymentOrderNonIDForm.FormCreate(Sender: TObject);
begin
  inherited;
  fErrorForm := nil;
  FDocPackGridForm := nil;
end;

procedure TPaymentOrderNonIDForm.tabDocPackShow(Sender: TObject);
begin
  if not Assigned( FDocPackGridForm ) then
    FDocPackGridForm := ShowForm( 'TDocPackByPOGridForm', Params, tabDocPack );
end;

procedure TPaymentOrderNonIDForm.edtPayerNameBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
  begin
     dsDataINN_P.Clear;
     dsDataKPP_P.Clear;
  end
  else
  begin
    dsData['INN_P'] := AObject.FieldValues['INN'];
    dsData['KPP_P'] := AObject.FieldValues['KPP'];
  end;
  Modify(nil);
end;

function TPaymentOrderNonIDForm.IsSubjectNonId: Boolean;
begin
  Result := not dsData.IsEmpty and
            (dsDataTYPESYSNAME.Value <> 'PaymentOrderNonIDDest') and
            (dsDataTYPESYSNAME.Value <> 'PaymentOrderNonIDKBK');
end;

procedure TPaymentOrderNonIDForm.edtDestCustomsCodeBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  // Запретить очищать поле, если ReadOnly,  [ WM_CLEAR ]
  Accept := (lciDestCustoms.Tag <> 33);
  if Accept and Assigned(AObject) then
    begin
      edtDestCustomsCode.Hint := AObject.FieldValues['CUSTOMS_CODE_8'];
      edtDestCustomsName.Text := AObject.FieldValues['NAME'];
    end;
end;

procedure TPaymentOrderNonIDForm.edtDestCustomsCodeAfterAcceptObject(
  Sender: TObject);
begin
  inherited;
  dsData['DESTCUSTOMSCODE'] := edtDestCustomsCode.Hint;
  edtDestCustomsCode.Hint := '';
end;

initialization
  RegisterClass( TPaymentOrderNonIDForm );

end.
