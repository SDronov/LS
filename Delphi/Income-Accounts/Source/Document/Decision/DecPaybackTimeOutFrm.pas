unit DecPaybackTimeOutFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionPayBackFrm, cxGraphics, OracleData, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxTextEdit, cxCheckBox, cxDBEdit, cxCurrencyEdit,
  fdcObjectLookupEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxPC, cxControls, fdcWord, QueryList, cxLabel,
  cxDBLabel, fdcObjectCore;

type
  TDecPaybackTimeOutForm = class(TDecisionPayBackForm)
    edtKBK: TfdcObjectLookupEdit;
    lciKBK: TdxLayoutItem;
    odsKBK: TOracleDataSet;
    odsKBKID: TFloatField;
    odsKBKCODE: TStringField;
    odsKBKCODE2: TStringField;
    odsKBKNAME: TStringField;
    odsKBKSDATE: TDateTimeField;
    odsKBKEDATE: TDateTimeField;
    dsKBK: TDataSource;
    lciPrevDecision: TdxLayoutItem;
    edtPrevDecision: TfdcObjectLinkEdit;
    dsDataPREV_DECISION_ID: TFloatField;
    dsDataPREV_DECISION_NAME: TStringField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure dsDataBeforePost(DataSet: TDataSet);
    procedure cbDecisionValueChange(Sender: TObject);
    procedure edtPrevDecisionBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure edtPrevDecisionPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  protected
    function GetTemplateReportName : string; override;
    procedure FillReportParams(AWord: TWordClass); override;
  public
    { Public declarations }
  end;

var
  DecPaybackTimeOutForm: TDecPaybackTimeOutForm;

implementation

{$R *.dfm}

uses
  FormUtils,
  fdcMessages;

{ TDecPaybackTimeOutForm }

function TDecPaybackTimeOutForm.GetTemplateReportName: string;
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime >= StrToDate( '01.04.2011' ) then
    Result := inherited GetTemplateReportName
  else
    Result := 'РЕШЕНИЕ_О_ВОЗВРАТЕ_ПРОЦЕНТОВ.doc';
end;

procedure TDecPaybackTimeOutForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if     not dsDataSIGN_DATE.IsNull
     and not dsDataSIGNED_BY.IsNull
     and not dsDataSIGNED_BY_CHIEF.IsNull
     and not dsDataSIGNED_BY_CHIEF_UDF.IsNull then
    lciKBK.Tag := 33;
  lciReasonPayback.Tag := 33;
  if (cbDecision.ItemIndex > 0) then
    lciPrevDecision.Enabled := true
  else
    lciPrevDecision.Enabled := false;

  UpdateLayoutControl(IsNew, lcGeneral);
end;

procedure TDecPaybackTimeOutForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'doc_code' ).AsString := 'ВПр';
end;

procedure TDecPaybackTimeOutForm.FillReportParams(AWord: TWordClass);
begin
  if dsData.FieldByName( 'doc_date' ).AsDateTime < StrToDate( '01.04.2011' ) then
    begin
      if not qryGetNameTO.Active then
        begin
          qryGetNameTO.ParamByName( 'customs_code' ).AsString := dsData.FieldByName( 'EXT_SOURCE' ).AsString;
          qryGetNameTO.Open;
        end;
      AWord.ReplaceText( '@CUSTOMSCODE', StringReplace( qryGetNameTO.FieldByName( 'NAME_TO' ).AsString, 'KNP', '000', [rfReplaceAll] ) );
    end;
  inherited;
end;

procedure TDecPaybackTimeOutForm.dsDataBeforePost(DataSet: TDataSet);
begin
  if (cbDecision.ItemIndex <> 0) and (dsDataPREV_DECISION_ID.IsNull) then
  showmessage('Не заполнено поле "Основное решение"!');
      {   and ( MessageDlg( 'Не заполнено поле "Основное решение"!'
                          ,'Невозможно сохранить решение'
                          ,'Необходимо указать Основное решение!'
                          ,mtConfirmation
                          ,[mbOk]
                          ,0 ) <> mrYes )
                          then begin
                            edtPrevDecision.SetFocus;
                            abort;
                          end;    }
  inherited;
end;

procedure TDecPaybackTimeOutForm.cbDecisionValueChange(
  Sender: TObject);
begin
  if (cbDecision.ItemIndex <> 0) then
      lciPrevDecision.Enabled := true
  else
    begin
      lciPrevDecision.Enabled := false;
      dsDataprev_decision_id.Clear;
      dsDataPrev_Decision_Name.Clear;
    end;
end;

procedure TDecPaybackTimeOutForm.edtPrevDecisionBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  if AObject = nil then
    begin
      dsDataPREV_DECISION_ID.Clear;
      dsDataPREV_DECISION_NAME.Clear;
    end
  else
  begin
    if (AObject.FieldValues['TYPESYSNAME'] = 'DecPaybackTimeOut') then
      begin
        dsDataPREV_DECISION_ID.Clear;
        dsDataPREV_DECISION_NAME.Clear;
        showmessage('Нельзя выбрать основным решение о возврате процентов за нарушение сроков возврата!');
        Accept := false;
      end
    else
      dsData['PREV_DECISION_ID;PREV_DECISION_NAME'] := AObject.FieldValues['ID;NAME'];
  end;
  Modify(nil);
end;

procedure TDecPaybackTimeOutForm.edtPrevDecisionPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if (dsDataDECL_NAME.Value = '') or (dsDataDECL_NAME.Value = null)
    then
    begin
    showmessage('Заполните поле "Участник ВЭД"!');
    edtDeclName.SetFocus;
                            abort;
                            end
  else
    begin
      with TfdcParam(edtPrevDecision.ParamsHolder.Params.Add) do
      begin
        Name := 'DECL_NAME';
        Value := VarToStr(dsDataDECL_NAME.Value);
      end;
      with TfdcParam(edtPrevDecision.ParamsHolder.Params.Add) do
      begin
        Name := 'DECL_INN';
        Value := VarToStr(dsDataDECL_INN.Value);
      end;
      with TfdcParam(edtPrevDecision.ParamsHolder.Params.Add) do
      begin
        Name := 'DECL_KPP';
        Value := VarToStr(dsDataDECL_KPP.Value);
      end;
    end;
  inherited;
end;
initialization

  RegisterClass(TDecPaybackTimeOutForm);

end.
