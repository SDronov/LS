unit PersonFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, SubjectFrm, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCheckBox;

type
  TPersonForm = class(TSubjectForm)
    dsDataLAST_NAME: TStringField;
    dsDataFIRST_NAME: TStringField;
    dsDataMIDDLE_NAME: TStringField;
    dsDataDOC_TYPE: TStringField;
    dsDataDOC_NO: TStringField;
    dsDataSER_NO: TStringField;
    dsDataCOUNTRY_CODE: TStringField;
    dsDataISSUED_BY: TStringField;
    dsDataISSUED_DATE: TDateTimeField;
    lcMainGroup1: TdxLayoutGroup;
    lcMainItem1: TdxLayoutItem;
    edtLastName: TcxDBTextEdit;
    lcMainItem2: TdxLayoutItem;
    edtFirstName: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    edtMiddleName: TcxDBTextEdit;
    lcMainGroup3: TdxLayoutGroup;
    lcMainItem4: TdxLayoutItem;
    cmbxCountryCode: TfdcObjectLookupEdit;
    lcMainGroup2: TdxLayoutGroup;
    lcMainItem5: TdxLayoutItem;
    edtDocType: TcxDBTextEdit;
    lcMainItem6: TdxLayoutItem;
    cmbxPassportType: TfdcObjectLookupEdit;
    lcMainGroup4: TdxLayoutGroup;
    lcMainItem7: TdxLayoutItem;
    edtSerNo: TcxDBTextEdit;
    lcMainGroup5: TdxLayoutGroup;
    lcMainItem8: TdxLayoutItem;
    edtDocNo: TcxDBTextEdit;
    lcMainItem9: TdxLayoutItem;
    edtIssuedBy: TcxDBTextEdit;
    lcMainGroup6: TdxLayoutGroup;
    lcMainItem10: TdxLayoutItem;
    edtIssuedDate: TcxDBDateEdit;
    lcMainGroup7: TdxLayoutGroup;
    edtPRIVATEOWNER: TcxDBCheckBox;
    lcMainItem11: TdxLayoutItem;
    lcMainGroup8: TdxLayoutGroup;
    dsDataPRIVATE_OWNER: TStringField;
    tabChecks: TcxTabSheet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabChecksShow(Sender: TObject);
  private
    FPChecksForm : TForm;
  public
  end;

var
  PersonForm: TPersonForm;

implementation

uses
  StrUtils, fdcCustomObjectFrm, DictDm, DeclarantChecksGridFrm;

{$R *.dfm}

procedure TPersonForm.FormShow(Sender: TObject);
var
  Param: TParam;
  procedure ParseFIO(const S: string);
  var
    I: Integer;
    P: Integer;
  begin
    dsDataLAST_NAME.Value := S;
    I := 1;
    P := PosEx(' ', S, I);
    if P > 0 then
    begin
      dsDataLAST_NAME.Value := MidStr(S, I, P - 1);
      I := P + 1;
    end;

    P := PosEx(' ', S, I);
    if P > 0 then
      dsDataFIRST_NAME.Value := MidStr(S, I, P - I);

    if P > 0 then
       dsDataMIDDLE_NAME.Value := Copy(S, P + 1, MaxInt);
  end;
begin
  TObjectForm(Self).FormShow(Sender);
  Param := Params.FindParam('new name');
  if assigned(Param) then
     ParseFIO(Param.AsString);

  Param := Params.FindParam('new inn');
  if assigned(Param) then
     dsDataINN.Value := Param.AsString;
end;

procedure TPersonForm.FormCreate(Sender: TObject);
begin
  inherited;
  tabBroker.TabVisible := False;
end;

procedure TPersonForm.tabChecksShow(Sender: TObject);
var
  lv_Params: TfdcParams;
begin
  inherited;

  ParamsHolder.Params.ParamByName('SUBJECT_ID').Value :=dsData.FieldValues['ID'];

  if not Assigned(FPChecksForm) then
  begin
    lv_Params := TfdcParams.Create(nil);
    try
      FPChecksForm := ShowForm('TDeclarantChecksGridForm', lv_Params, tabChecks);
     finally
      lv_Params.Free;
    end;
  end;
  (FPChecksForm as TDeclarantChecksGridForm).ParamsHolder.Params.ParamByName('SUBJECT_ID').Value := dsData.FieldValues['ID'];
  (FPChecksForm as TDeclarantChecksGridForm).ParamsHolder.Params.ParamByName('ID').Value := dsData.FieldValues['ID'];//?
  (FPChecksForm as TDeclarantChecksGridForm).actRefreshExecute(FPChecksForm);

end;

initialization
  RegisterClass(TPersonForm);


end.
