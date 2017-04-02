unit CorrectionGTDSubjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionGTDFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, Oracle,
  OracleData, QueryList;

type
  TCorrectionGTDSubjectForm = class(TCorrectionGTDForm)
    edtSubjectName: TfdcObjectLinkEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcgSubject: TdxLayoutGroup;
    edtSubjectInn: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtSubjectKpp: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralGroup5: TdxLayoutGroup;
    dsDataSUBJECT_ID: TFloatField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    edtSerDocNo: TcxDBTextEdit;
    lcGeneralItem5: TdxLayoutItem;
    dsDataPERSON_SER_DOC_NO: TStringField;
    dsPassport: TOracleDataSet;
    lcgSubjectOld: TdxLayoutGroup;
    lcGeneralItem4: TdxLayoutItem;
    edtSubjectInnOld: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    edtSubjectKppOld: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    edtSubjectNameOld: TfdcObjectLinkEdit;
    lcGeneralGroup4: TdxLayoutGroup;
    dsDataSUBJECT_ID_OLD: TFloatField;
    dsDataSUBJECT_NAME_OLD: TStringField;
    dsDataSUBJECT_INN_OLD: TStringField;
    dsDataSUBJECT_KPP_OLD: TStringField;
    procedure edtSubjectNameAfterAcceptObject(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  fdcObjectServices;

procedure TCorrectionGTDSubjectForm.edtSubjectNameAfterAcceptObject(
  Sender: TObject);
begin
  dsPassport.SetVariable('Subject_ID', dsDataSubject_Id.Value);
  try
    dsPassport.Open;
    dsDataPerson_Ser_Doc_No.Value := dsPassport.FieldByName('Person_Ser_Doc_No').AsString;
    dsDataSubject_Inn.Value := dsPassport.FieldByName('Inn').AsString;
    dsDataSubject_Kpp.Value := dsPassport.FieldByName('Kpp').AsString;
  finally
    dsPassport.Close;
  end;
end;

initialization
  RegisterClass(TCorrectionGTDSubjectForm);


end.
