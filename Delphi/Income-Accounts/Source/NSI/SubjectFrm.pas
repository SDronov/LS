{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15515 $
  $Author: adavletyarov $
  $Date: 2012-10-02 15:16:21 +0400 (Р’С‚, 02 РѕРєС‚ 2012) $
}
unit SubjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, SubjIntf, cxMaskEdit,
  SubjectFilialGridFrm;

type
  TSubjectForm = class(TObjectForm, ISubjectHolder)
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataADDRESS: TStringField;
    dsDataFULL_NAME: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataOGRN: TStringField;
    dsDataSOATO: TStringField;
    dsDataPHONE: TStringField;
    dsDataFAX: TStringField;
    dsDataTELEX: TStringField;
    dsDataTELEGRAPH: TStringField;
    dsDataTELETYPE: TStringField;
    dsDataKPP: TStringField;
    tabDocList: TcxTabSheet;
    pcDocList: TcxPageControl;
    lcMain: TdxLayoutControl;
    cxDBTextEdit1: TcxDBTextEdit;
    edtOKPO: TcxDBMaskEdit;
    edtINN: TcxDBMaskEdit;
    edtOGRN: TcxDBMaskEdit;
    edtAddress: TcxDBTextEdit;
    edtPhone: TcxDBTextEdit;
    edtFax: TcxDBTextEdit;
    edtTelex: TcxDBTextEdit;
    edtSOATO: TcxDBMaskEdit;
    edtTeletype: TcxDBTextEdit;
    edtKPP: TcxDBMaskEdit;
    dxLayoutGroup3s: TdxLayoutGroup;
    dxLayoutGroup2s: TdxLayoutGroup;
    lcMainGroup1s: TdxLayoutGroup;
    lcMainGroup3s: TdxLayoutGroup;
    lcMainGroup4s: TdxLayoutGroup;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralItem11: TdxLayoutItem;
    lcMainGroup5s: TdxLayoutGroup;
    lcGeneralItem1: TdxLayoutItem;
    lcGeneralItem9: TdxLayoutItem;
    lciNames: TdxLayoutItem;
    lcGeneralItem4: TdxLayoutItem;
    lcMainGroup2s: TdxLayoutGroup;
    lcMainGroup6s: TdxLayoutGroup;
    lcGeneralItem5: TdxLayoutItem;
    lcGeneralItem8: TdxLayoutItem;
    lcMainGroup7s: TdxLayoutGroup;
    lcGeneralItem6: TdxLayoutItem;
    lcGeneralItem10: TdxLayoutItem;
    dxLayoutAlignmentConstraint1: TdxLayoutAlignmentConstraint;
    lcMainAlignmentConstraint2: TdxLayoutAlignmentConstraint;
    lcGeneralItem12: TdxLayoutItem;
    edtTeleGraph: TcxDBTextEdit;
    lcMainGroup8s: TdxLayoutGroup;
    tabBroker: TcxTabSheet;
    tabFilial: TcxTabSheet;
    dsDataPARENT_ID: TFloatField;
    procedure dsDataValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure tabDocListShow(Sender: TObject);
    procedure pcDocListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabBrokerShow(Sender: TObject);
    procedure tabFilialShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    fBrokerForm : TForm;
    FFilialForm : TSubjectFilialGridForm;
    procedure BuildDocumentTabs;
  public
    function GetSubjectINN: String;
    function GetSubjectId: Double;
    function GetSubjectKPP: String;
    function GetSubjectName: String;
  end;

var
  SubjectForm: TSubjectForm;

implementation

uses
  MainDm, IaccUtils, CheckUtils, fdcMessages, Math, StrUtils,
  fdcCustomObjectFrm, fdcObjectCore, fdcCustomGridFrm, BrokerGridFrm,
  fdcCustomObjectGridFrm, FormUtils;

{$R *.dfm}

{ TSubjectForm }

procedure TSubjectForm.dsDataValidate(Sender: TField);
var
  I: Integer;

const
  cMaxLen = 2;
  cRequisitNames: array [0..cMaxLen * 2 - 1] of string = ('SOATO', 'СОАТО', 'KPP', 'КПП');
  cRequisitLengths: array [0..cMaxLen - 1] of Integer = (4, 9);
  cMaxLen2 = 2;
  cRequisitNames2: array [0..cMaxLen2 * 2 - 1] of string = ('OKPO', 'ОКПО', 'OGRN', 'ОГРН');
  cRequisitLengths2: array [0..cMaxLen2 * 2 - 1] of Integer = (8, 10, 13, 15);

begin
  with Sender do
  begin
    if Length(Trim(Text)) > 0 then
    begin
      if SameText(FieldName, 'INN') and not (Length(Text) in [10,12]) then
        raise Exception.Create('ИНН должен состоять из 10 цифр для юридического лица и 12 цифр для физического');

      for I := 0 to cMaxLen - 1 do
        if SameText(FieldName, cRequisitNames[I shl 1]) and (Length(Text) <> cRequisitLengths[I]) then
          raise Exception.Create(Format('%s должен состоять из %d цифр', [cRequisitNames[I shl 1 + 1], cRequisitLengths[I]]));

      for I := 0 to cMaxLen2 - 1 do
        if SameText(FieldName, cRequisitNames2[I shl 1]) and not (Length(Text) in [cRequisitLengths2[I shl 1], cRequisitLengths2[I shl 1 + 1]]) then
          raise Exception.Create(Format('%s должен состоять из %d или %d цифр', [cRequisitNames2[I shl 1 + 1], cRequisitLengths2[I shl 1], cRequisitLengths2[I shl 1 + 1]]));
    end;

    if SameText(FieldName, 'INN') or
       SameText(FieldName, 'OKPO') and (Length(Text) = 8) or
       SameText(FieldName, 'OGRN') and (Length(Text) = 13) then
    begin
      I := IfThen(SameText(FieldName, 'INN'), 0, IfThen(SameText(FieldName, 'OKPO'), 1, 2));
      if (Text <> '') and not cReqCheckFuncs[I](Text) then
        raise Exception.Create(IfThen(DisplayLabel <> '', DisplayLabel, FieldName)
          + ': контрольная сумма неверна');
    end;
  end;
end;

procedure TSubjectForm.FormShow(Sender: TObject);
var
  Param: TParam;
begin
  inherited;
  Param := Params.FindParam('new name');
  if assigned(Param) then
     dsDataNAME.Value := Param.AsString;

  Param := Params.FindParam('new inn');
  if assigned(Param) then
     dsDataINN.Value := Param.AsString;

  Param := Params.FindParam('new kpp');
  if assigned(Param) then
     dsDataKPP.Value := Param.AsString;
end;

procedure TSubjectForm.tabDocListShow(Sender: TObject);
begin
  inherited;
  if pcDocList.TabCount = 0 then
       BuildDocumentTabs;
end;

const
  ObjectNames = 'CustomDecl,TPO,TR,PaymentOrder,Debt,Payment_Order_Payback,SubjectFee';

procedure TSubjectForm.BuildDocumentTabs;
var
  aTabSheet: TcxTabSheet;
  ObjType: TfdcObjectType;
  I: Integer;
  ObjList: TStrings;
begin
  ObjList := TStringList.Create;
  try
    ObjList.CommaText := ObjectNames;
    for I := 0 to ObjList.Count - 1 do    // Iterate
    begin
      ObjType := ObjectServices.GetObjectTypeFactory.Find(ObjList[I]);
      if ObjType <> nil then
      begin
        aTabSheet := TcxTabSheet.Create(pcDocList);
        aTabSheet.PageControl := pcDocList;
        aTabSheet.Caption := ObjType.TypeName;
        aTabSheet.Tag := Integer(ObjType);
      end;
    end;    // for
  finally
    ObjList.Free;
  end;
  if pcDocList.TabCount > 0 then
     pcDocListChange(pcDocList);
end;

procedure TSubjectForm.pcDocListChange(Sender: TObject);
var
  F: TfdcCustomGridForm;
  TypeName: string;
  Params: TfdcParams;
begin
  inherited;
  if TObject(pcDocList.ActivePage.Tag) is TfdcObjectType then
  begin
    TypeName := TfdcObjectType(pcDocList.ActivePage.Tag).SysName;
    if TypeName = 'Debt' then
         TypeName := 'DeclDebt';
    Params := TfdcParams.Create(nil);
    try
      with TfdcParam(Params.Add) do
      begin
        Name := 'GL_SUBJECT_ID';
        Value := dsDataID.Value;
      end;
      F := TfdcCustomGridForm(ObjectServices.ShowForm(Format('T%sGridForm', [TypeName])
           ,Params, pcDocList.ActivePage));
      if assigned(F) and F.dsData.Active then
          pcDocList.ActivePage.Tag := 0;
    finally
       Params.Free;
    end;
  end;
end;

function TSubjectForm.GetSubjectId: Double;
begin
  Result := dsDataID.Value;
end;

function TSubjectForm.GetSubjectINN: String;
begin
  Result := dsDataINN.Value;
end;

function TSubjectForm.GetSubjectKPP: String;
begin
  Result := dsDataKPP.Value;
end;

function TSubjectForm.GetSubjectName: String;
begin
     Result := dsDataName.Value;
end;

procedure TSubjectForm.FormCreate(Sender: TObject);
begin
  inherited;
  tabFilial.TabVisible := False;
end;

procedure TSubjectForm.tabBrokerShow(Sender: TObject);
var
  lv_Params: TfdcParams;
begin
  inherited;

  if not Assigned(fBrokerForm) then
  begin
    lv_Params := TfdcParams.Create(nil);
    try
      with TfdcParam(lv_Params.Add) do
      begin
        Name := 'ID';
        if dsData.FieldByName('typesysname').AsString = 'Broker' then
           Value := dsData.FieldValues['subject_id']
        else
           Value := dsData.FieldValues['id'];
      end;
      fBrokerForm := ShowForm('TBrokerGridForm', lv_Params, tabBroker);
    finally
      lv_Params.Free;
    end;

{      if dsData.FieldByName('typesysname').AsString = 'Broker' then
         Params.ParamByName('ID').AsInteger := dsData.FieldValues['subject_id']
      else
         Params.ParamByName('ID').AsInteger := dsData.FieldValues['id'];
      fBrokerForm := ShowForm('TBrokerGridForm', Params, tabBroker);}
  end;
end;

procedure TSubjectForm.tabFilialShow(Sender: TObject);
var
  lv_Params: TfdcParams;
  l_subject_id: Variant;
begin
  inherited;
  if not Assigned(FFilialForm) then
  begin
    lv_Params := TfdcParams.Create(nil);
    try
      with TfdcParam(lv_Params.Add) do
      begin
        Name := 'INN';
        Value := dsData.FieldValues['INN'];
      end;

      FFilialForm := ShowForm('TSubjectFilialGridForm', lv_Params, tabFilial) as TSubjectFilialGridForm;
      if dsData.FieldByName('typesysname').AsString = 'Broker' then begin
        l_subject_id := dsData.FieldValues['SUBJECT_ID'];
      end else begin
        l_subject_id := dsData.FieldValues['ID'];
      end;
      
      FFilialForm.ParamsHolder.Params.ParamByName('ID').Value :=  l_subject_id;
      FFilialForm.actRefreshExecute(FFilialForm);
    finally
      lv_Params.Free;
    end;
  end;
end;

procedure TSubjectForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if dsData.FieldByName('typesysname').AsString = 'Broker' then
     tabBroker.TabVisible := False;
  UpdateLayoutControl(IsNew, lcMain, GetReadOnly);
end;

initialization
  RegisterClass(TSubjectForm);

end.
