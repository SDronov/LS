unit CorrectionPOSubjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionPOFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, cxGraphics,
  cxCurrencyEdit, OracleData, ObjectFrm, fdcObjectCore, QueryList;

type
  TCorrectionPOSubjectForm = class(TCorrectionPOForm)
    lcgDeclarant: TdxLayoutGroup;
    lciDeclName: TdxLayoutItem;
    edtDeclarant: TfdcObjectLinkEdit;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    lciDeclInn: TdxLayoutItem;
    edtDeclINN: TcxDBMaskEdit;
    lciDeclKpp: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lcGeneralGroup3: TdxLayoutGroup;
    procedure edtDeclarantBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionPOSubjectForm: TCorrectionPOSubjectForm;

implementation

{$R *.dfm}

procedure TCorrectionPOSubjectForm.edtDeclarantBeforeAcceptObject(
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

initialization
  RegisterClass(TCorrectionPoSubjectForm);
end.
