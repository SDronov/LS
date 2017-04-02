{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 14300 $
  $Author: adavletyarov $
  $Date: 2012-02-06 20:40:16 +0400 (РџРЅ, 06 С„РµРІ 2012) $
}
unit DeclarantFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectFrm, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxMemo, cxTextEdit, cxPC, cxControls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, fdcObjectLookupEdit, cxCheckBox, ComCtrls;

type
  TDeclarantForm = class(TSubjectForm)
    dsDataCATEGORY: TStringField;
    dsDataCUSTOM_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsCheckAcc: TfdcQuery;
    dxBarButton1: TdxBarButton;
    acAddAccount: TAction;
    acDelAccount: TAction;
    acEditAccount: TAction;
    acRefreshAccounts: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    tsAccounts: TcxTabSheet;
    dsDataIS_BIG: TFloatField;
    dsDataIS_NSI: TFloatField;
    dsDataPOST9: TStringField;
    dsDataALFA2: TStringField;
    lcMainItem1: TdxLayoutItem;
    edtCategory: TcxDBTextEdit;
    lcMainItem2: TdxLayoutItem;
    edtRegDate: TcxDBDateEdit;
    lcMainGroup2: TdxLayoutGroup;
    lcMainItem4: TdxLayoutItem;
    edtCustomCode: TcxDBMaskEdit;
    lcMainGroup4: TdxLayoutGroup;
    lcMainItem5: TdxLayoutItem;
    cmbxCountryCode: TfdcObjectLookupEdit;
    lcMainItem6: TdxLayoutItem;
    edtPost9: TcxDBTextEdit;
    lcMainItem7: TdxLayoutItem;
    edtAlfa2: TcxDBTextEdit;
    lcMainGroup6: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    cxDBCheckBox1: TcxDBCheckBox;
    lcMainItem3: TdxLayoutItem;
    dsDataRESIDENT: TStringField;
    lcglcMainGroup1: TdxLayoutGroup;
    tabChecks: TcxTabSheet;
    procedure tsAccountsShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsDataValidate(Sender: TField);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabChecksShow(Sender: TObject);
  private
    FAccountForm: TForm;
    FChecksForm : TForm;
  end;

var
  DeclarantForm: TDeclarantForm;

implementation

uses
  MainDm, CheckUtils, IaccUtils, StrUtils, fdcMessages, fdcDbUtils,
  DeclarantAccountFrm, DictDm, DeclarantChecksGridFrm;

{$R *.dfm}

{ TDeclarantForm }

procedure TDeclarantForm.tsAccountsShow(Sender: TObject);
begin
  if not Assigned(FAccountForm) then
    FAccountForm := ObjectServices.ShowForm('TDeclarantAccountGridForm', Params,
      TWinControl(Sender));
end;

procedure TDeclarantForm.FormCreate(Sender: TObject);
begin
  inherited;
  tsAccounts.PageIndex := 1;
  pcMain.ActivePage := tabGeneral;
end;

procedure TDeclarantForm.dsDataValidate(Sender: TField);
begin
  if dsDataRESIDENT.AsString = 'Y' then
    inherited;
  // almost the same as on CustomsFrm
  if AnsiSameText(Sender.FieldName, 'CUSTOM_CODE') and (Trim(Sender.Text) <> '')
    and (Length(Sender.Text) <> 5) then
      raise Exception.Create('Код таможни должен состоять из 5 символов');
end;

procedure TDeclarantForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  tabFilial.TabVisible :=  (dsDataRESIDENT.AsString = 'Y')
                            {and
                           (dsDataPARENT_ID.Value = null)};
  dsData.ReadOnly := dsDataIS_NSI.Value = 1;
  if dsData.ReadOnly then
  begin
    edtName.Style.Color := clSilver; //clInactiveCaptionText;
    edtOKPO.Style.Color := clSilver; //clInactiveCaptionText;
    edtINN.Style.Color := clSilver; //clInactiveCaptionText;
    edtOGRN.Style.Color := clSilver; //clInactiveCaptionText;
    edtAddress.Style.Color := clSilver; //clInactiveCaptionText;
    edtPhone.Style.Color := clSilver; //clInactiveCaptionText;
    edtFax.Style.Color := clSilver; //clInactiveCaptionText;
    edtTelegraph.Style.Color := clSilver; //clInactiveCaptionText;
    edtTelex.Style.Color := clSilver; //clInactiveCaptionText;
    edtSOATO.Style.Color := clSilver; //clInactiveCaptionText;
    edtKPP.Style.Color := clSilver; //clInactiveCaptionText;
    edtCustomCode.Style.Color := clSilver; //clInactiveCaptionText;
    edtCategory.Style.Color := clSilver; //clInactiveCaptionText;
    edtRegDate.Style.Color := clSilver; //clInactiveCaptionText;
    cxDBTextEdit1.Style.Color := clSilver; //clInactiveCaptionText;
    edtPost9.Style.Color := clSilver; //clInactiveCaptionText;
    edtAlfa2.Style.Color := clSilver; //clInactiveCaptionText;
    cmbxCountryCode.Style.Color := clSilver; //clInactiveCaptionText;
  end;
  inherited;
end;

procedure TDeclarantForm.tabChecksShow(Sender: TObject);
var
  lv_Params: TfdcParams;
begin
  inherited;
  if not Assigned(FChecksForm) then
  begin
    lv_Params := TfdcParams.Create(nil);
    try
      FChecksForm := ShowForm('TDeclarantChecksGridForm', lv_Params, tabChecks);
     finally
      lv_Params.Free;
    end;
  end;
  (FChecksForm as TDeclarantChecksGridForm).ParamsHolder.Params.ParamByName('SUBJECT_ID').Value :=  dsData.FieldValues['ID'];
  (FChecksForm as TDeclarantChecksGridForm).actRefreshExecute(FChecksForm);

end;

initialization
   RegisterClass(TDeclarantForm);

end.

