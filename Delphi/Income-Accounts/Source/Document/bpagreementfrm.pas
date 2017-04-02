unit BPAgreementFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, fdcObjectCore;

type
  TBPAgreementForm = class(TObjectForm)
    dsDataDOC_NO: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    dsDataFROM_DATE: TDateTimeField;
    dsDataTO_DATE: TDateTimeField;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBDateEdit3: TcxDBDateEdit;
    lcGeneralItem6: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    lcGeneralGroup4: TdxLayoutGroup;
    edtDocNo: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    lcGeneralItem8: TdxLayoutItem;
    lcGeneralGroup6: TdxLayoutGroup;
    lcgSubject: TdxLayoutGroup;
    edtSUBJECT_ID: TfdcObjectLinkEdit;
    lciSUBJECT_ID: TdxLayoutItem;
    edtINN: TcxDBMaskEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtKPP: TcxDBMaskEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    procedure edtSUBJECT_IDBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TBPAgreementForm.edtSUBJECT_IDBeforeAcceptObject(Sender: TObject;
  AObject: TfdcObject; var Accept: Boolean);
begin
  inherited;
  if AObject = nil then
    begin
      dsDataSUBJ_INN.Clear;
      dsDataSUBJ_KPP.Clear;
    end
  else
    begin
      dsData['SUBJ_INN'] := AObject.FieldValues['INN'];
      dsData['SUBJ_KPP'] := AObject.FieldValues['KPP'];
    end;
end;

initialization
  RegisterClass(TBPAgreementForm);

end.
