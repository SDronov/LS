unit DecisionDebtsPayFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DecisionDebtsFrm, cxGraphics, OracleData, DB, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxCheckBox, cxDBEdit, cxCurrencyEdit, fdcObjectLookupEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxButtonEdit, fdcObjectLinkEdit, fdcObjectCore, cxMaskEdit, cxMemo,
  cxTextEdit, cxPC, cxControls, fdcWord, QueryList;

type
  TDecisionDebtsPaysForm = class(TDecisionDebtsForm)
    dsPaymentOrderList: TfdcQuery;
    dsPaymentOrderListNAME: TStringField;
    dsReportDECL_LIST: TStringField;
    dsReportARTICLE_LIST: TStringField;
    dsReportCASH_ASSETS_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dsStateAfterOpen(DataSet: TDataSet);
    procedure edtDeclNameBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
    procedure actSaveUpdate(Sender: TObject);
    procedure CurrencyOrDateChange(Sender: TObject);
    procedure tabNoticePaysShow(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
  private
    fDeductionForm : TForm;
    fMaxSum : Currency;  // сумма в рублях!!!
    fCurRate : Currency;
  protected
    function GetDecisionTypeForReport : String; override;
    procedure FillReportParams(AWord: TWordClass); override;
  public
    function SubjectHasDebt(ASubjectID: integer): boolean;
    function GetAmountDebt(ASubjectID, ACurrencyId: Integer; AIsTS : string): Currency;  //Double;
  end;

var
  DecisionDebtsPaysForm: TDecisionDebtsPaysForm;

implementation

{$R *.dfm}

uses
  fdcObjectServices
 ,fdcCustomDataFrm
 ,MainDM
 ,Oracle
 ,Math
 ,fdcMessages
 ,DecisionFrm
 ,DocumentFrm
 ,fdcCustomCardFrm
 ,ObjectFrm, StrUtils;

{ TDecisionDebtsPaysForm }


procedure TDecisionDebtsPaysForm.FormCreate(Sender: TObject);
begin
  inherited;
  fDeductionForm := nil;
  fCurRate := 1;
  fMaxSum := 0;
end;

procedure TDecisionDebtsPaysForm.dsStateAfterOpen(DataSet: TDataSet);
  var
     vReadOnly : boolean;
begin
  vReadOnly := (dsStateSYSNAME.Value = 'State.DecisionDebts.Signed');
  Params.ParamByName('DeductionsReadOnly').AsBoolean := vReadOnly;
  if Assigned(fDeductionForm) then
    (fDeductionForm as TfdcCustomDataForm).ParamByName('DeductionsReadOnly').AsBoolean := vReadOnly;
end;

function TDecisionDebtsPaysForm.GetAmountDebt(ASubjectID,
  ACurrencyId: Integer; AIsTS : string): Currency;
  var
    vLockedSum : Currency;
begin
  with MainData do
    begin
      pkgCommon.PackageName := 'p_decision_debts';
      // всегда в рублях!!!!!

      Result := pkgCommon.CallFloatFunction('GetAmountDebt', [ASubjectID, Null, IfThen((AIsTS = ''),'N',AIsTS)]);
      if Result > 0 then
        begin
          // Заблокировано по курсу в рублях!!!
          vLockedSum := pkgCommon.CallFloatFunction('GetLockedAmount', [ASubjectID, Null, IfThen((AIsTS = ''),'N',AIsTS)]);
          Result := Result - vLockedSum;
          if Result < 0 then
            Result := 0;
        end;
    end;
end;

function TDecisionDebtsPaysForm.SubjectHasDebt(
  ASubjectID: integer): boolean;
begin
  with MainData do
    begin
      pkgCommon.PackageName := 'p_decision_debts';
      Result := (pkgCommon.CallIntegerFunction('SubjectHasDebt', [ASubjectID]) = 1);
    end;
end;

procedure TDecisionDebtsPaysForm.edtDeclNameBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  if not Self.IsNew  then
    begin
      Accept := False;
      exit;
    end;
  {if not SubjectHasDebt( trunc(AObject.ID) ) then
    begin
      Accept := False;
      ErrorDlg( Exception.Create('Выбранный участник ВЭД не имеет задолженности!'));
    end
  else}
    begin
      inherited;
      // в рублях
      fMaxSum := GetAmountDebt(trunc(AObject.ID), -1, dsData.FieldByName( 'is_ts' ).AsString);
      if fMaxSum > 0 then
        begin
          edtSumma.Properties.MaxValue :=  RoundTo( fMaxSum / fCurRate, -4);
          edtSumma.EditValue := edtSumma.Properties.MaxValue;
          edtSumma.PostEditValue;
          if (fCurRate = 1) and dsDataCURRENCY_ID.IsNull then // выставим рубли по умолчанию
           cmbxCurrency.Text := '643';
        end;
    end;
  cxDBIsTS.Enabled := False;
end;

procedure TDecisionDebtsPaysForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  if Self.IsNew then
    edtSumma.Enabled := (edtSumma.Properties.MaxValue > 0);
end;

function TDecisionDebtsPaysForm.GetDecisionTypeForReport: String;
begin
  Result := 'авансовых платежей';
end;

procedure TDecisionDebtsPaysForm.CurrencyOrDateChange(
  Sender: TObject);
  var
    vCurDate : TDateTime;
begin
  if not VarIsNull( cmbxCurrency.EditValue ) then
    with MainData do
      begin
        if VarIsNull(edtDocDate.EditValue) then
          vCurDate :=  GetServerDate
        else
          vCurDate := edtDocDate.EditValue;
        pkgCommon.PackageName := 'p_nsi_currency';
        fCurRate := pkgCommon.CallFloatFunction('GetRate', [ cmbxCurrency.EditValue,
                                                             vCurDate,
                                                             0 ]) ;
        if fMaxSum > 0 then
          begin
            edtSumma.Properties.MaxValue :=  RoundTo( fMaxSum / fCurRate, -2);
            if (edtSumma.EditValue = Null) or (edtSumma.EditValue > edtSumma.Properties.MaxValue) then
            begin
              edtSumma.EditValue := edtSumma.Properties.MaxValue;
              edtSumma.PostEditValue;
            end;  
          end;
      end;
  Modified := True;
end;

procedure TDecisionDebtsPaysForm.FillReportParams(AWord: TWordClass);
begin
  inherited;
  dsPaymentOrderList.Open;
  AWord.GetArrayFromDataSet(dsPaymentOrderList, 'NAME', 'PO_LIST', '; ');
  dsPaymentOrderList.Close;
end;

procedure TDecisionDebtsPaysForm.tabNoticePaysShow(Sender: TObject);
begin
  if not Assigned(NoticesForm) then
    begin
      NoticesForm := ShowForm('TDecisionDebtsPaysNoticeGridForm', Params, tabNoticePays);
      TObjectForm(NoticesForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(NoticesForm));
    end;
end;

procedure TDecisionDebtsPaysForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName( 'doc_code' ).AsString := 'ЗАвЗ';
end;

initialization
  RegisterClass(TDecisionDebtsPaysForm);

end.
