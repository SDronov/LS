unit NSISubjectPaysFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls, fdcObjectCore;

type
  TNSISubjectPaysForm = class(TNSIDictForm)
    lcGeneralItem8: TdxLayoutItem;
    fdcDeclarant: TfdcObjectLinkEdit;
    lcGeneralGroup1: TdxLayoutGroup;
    lcGeneralItem7: TdxLayoutItem;
    edtDeclINN: TcxDBMaskEdit;
    lcGeneralItem9: TdxLayoutItem;
    edtDeclKPP: TcxDBMaskEdit;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralItem10: TdxLayoutItem;
    fdcDestSubAdr: TfdcObjectLinkEdit;
    dsDataSUBJECT_ID: TIntegerField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataADDRESS: TStringField;
    dsDataFULL_NAME: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    procedure fdcDeclarantBeforeAcceptObject(Sender: TObject;
      AObject: TfdcObject; var Accept: Boolean);
  private
    { Private declarations }
  protected
    function IsReadOnly: Boolean; override;
  public
    { Public declarations }
  end;

var
  NSISubjectPaysForm: TNSISubjectPaysForm;

implementation


{$R *.dfm}
procedure TNSISubjectPaysForm.fdcDeclarantBeforeAcceptObject(
  Sender: TObject; AObject: TfdcObject; var Accept: Boolean);
begin
  if AObject = nil then
  begin
     dsDataINN.Clear;
     dsDataKPP.Clear;
     dsDataADDRESS.Clear;
  end
  else
  begin
    dsData['INN'] := AObject.FieldValues['INN'];
    dsData['KPP'] := AObject.FieldValues['KPP'];
    dsData['ADDRESS'] := AObject.FieldValues['ADDRESS'];
  end;
  Modify(nil);
end;

function TNSISubjectPaysForm.IsReadOnly: Boolean;
begin
  Result := False;
end;

initialization
    RegisterClass(TNSISubjectPaysForm);


end.
